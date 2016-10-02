#define EPOCHS_BETWEEN_TEST 1000
typedef double* arrayrow;
const double beta = 1;

class neuralnet {
  double alpha;//learning rate
  size_t inputs;
  size_t hidden;
  size_t outputs;
  arrayrow* inputtohidden;
  arrayrow* hiddentooutput;
  double* hiddenacti;
  double* sum;
  double sumout;
  double* I;
  double* T;
  double* O;
  double* delta;
  double* deltaout;
  int epoch;
  int maxepochs;
  double convergence;
  size_t i, j, k;
  
  double g(double x);
  double gprime(double x);
  
  public:
    neuralnet(size_t inputs, size_t hidden, size_t outputs, double alpha, \
    int maxepochs, double convergence);
    void save(string filename);
    void load(string filename);
    void train(dataset * training, dataset * tester, bool verbose, double \
    &seconds, size_t &epochsUsed);
    void setRandom();
    double test(dataset * testset, bool verbose);
    ~neuralnet();
};

neuralnet::neuralnet(size_t i, size_t h, size_t o, double a, int m, \
double c){
  inputs = i;
  hidden = h;
  outputs = o;
  alpha = a;
  maxepochs = m;
  convergence = c;
  inputtohidden = new arrayrow[inputs+1];
  hiddentooutput = new arrayrow[hidden+1];
  hiddenacti = new double[hidden+1];
  hiddenacti[0] = -1;
  sum = new double[hidden+1];
  I = new double[inputs+1];
  I[0] = -1;  // bias node  
  T = new double[outputs];
  O = new double[outputs];
  delta = new double[hidden+1];
  deltaout = new double[outputs];
  for ( k = 0; k < inputs+1; k++ )
    inputtohidden[k] = new double[hidden+1];
  for ( j = 0; j < hidden+1; j++ )
    hiddentooutput[j] = new double[outputs];
}

// g-function (sigmoid)
double neuralnet::g (double x) {
  return 1 / ( 1 + exp ( - beta * x ) );
}//g

// derivative of g
double neuralnet::gprime (double x) {
  return beta * g (x) * ( 1 - g (x));
}//gprime

void neuralnet::save(string filename){
  ofstream out;
  out.open(filename.c_str());
  if(out.fail()){
    cout << "Error opening file: " << filename;
    return;
  }
  //inputtohidden[0-inputs+1][0-hidden+1]
  for(i = 0; i < inputs+1; i++){
    for(j = 0; j < hidden+1; j++){
      out << inputtohidden[i][j] << endl;
    }
  }
  //hiddentooutput[0-hidden+1][0-outputs]
  for(i = 0; i < hidden+1; i++){
    for(j = 0; j < outputs; j++){
      out << hiddentooutput[i][j] << endl;
    }
  }
}

void neuralnet::load(string filename){
  ifstream in;
  in.open(filename.c_str());
  if(in.fail()){
    cout << "Error opening file: " << filename;
    return;
  }
  string currentLine;
  
  //inputtohidden[0-inputs+1][0-hidden+1]
  for(i = 0; i < inputs+1; i++){
    for(j = 0; j < hidden+1; j++){
      getline(in, currentLine);
      stringstream a(currentLine);
      a >> inputtohidden[i][j];
    }
  }
  //hiddentooutput[0-hidden+1][0-outputs]
  for(i = 0; i < hidden+1; i++){
    for(j = 0; j < outputs; j++){
      getline(in, currentLine);
      stringstream a(currentLine);
      a >> hiddentooutput[i][j];
    }
  }
}

void neuralnet::setRandom(){
  // random initialization of weights
  for ( k = 0; k <= inputs; k++ )
    for ( j = 1; j <= hidden; j++ )
      inputtohidden[k][j] = -1 + 2 * ( (double) rand ( ) / RAND_MAX );
  for ( j = 0; j <= hidden; j++ )
    for ( i = 0; i < outputs; i++ )
      hiddentooutput[j][i] = -1 + 2 * ( (double) rand ( ) / RAND_MAX );
}

void neuralnet::train(dataset * training, dataset * tester, bool verbose\
, double &seconds, size_t &epochsUsed){
  int begin = clock();
  epoch = 0;
  double current_convergence = test(tester, false);
  //The (epoch < maxepochs or maxepochs == -1) clause makes sure either 
  //there are still epochs to be run, or maxepochs was not specified
  //current_convergence will always be higher than 0 if training can have
  //any use, that's why we init convergence to 0
  while ( (epoch < maxepochs or maxepochs == -1) and current_convergence\
  > convergence) {
    // now fill I[1]..I[inputs] with input vector
    // note that I[0] is always -1, being the bias node
    // also fill T[0]..T[outputs-1] with the corresponding output vector
    I[0] = -1;
    for( i = 0; i < inputs; i++){
      I[i+1] = training->data[epoch%training->examples][i];
    }
    T[0] = training->data[epoch%training->examples][inputs];
    
    //forward first layer
    for ( j = 1; j <= hidden; j++ ) {
      sum[j] = -inputtohidden[0][j];
      for ( k = 1; k <= inputs; k++ )
        sum[j] += inputtohidden[k][j] * I[k];
      hiddenacti[j] = g (sum[j]);
    }//for

    //forward second layer, and get delta for it too
    for ( i = 0; i < outputs; i++ ) {
      sumout = -hiddentooutput[0][i];
      for ( j = 1; j <= hidden; j++ )
        sumout += hiddentooutput[j][i] * hiddenacti[j];
      O[i] = g (sumout);
      deltaout[i] = gprime (sumout) * ( T[i] - O[i] );
    }//for

    //get deltas first layer
    for ( j = 1; j <= hidden; j++ ) { 
      delta[j] = 0;
      for ( i = 0; i < outputs; i++ )
        delta[j] += hiddentooutput[j][i] * deltaout[i]; 
      delta[j] *= gprime (sum[j]);
    }//for

    // update the weights
    for ( j = 0; j <= hidden; j++ ) 
      for ( i = 0; i < outputs; i++ )
        hiddentooutput[j][i] += alpha * hiddenacti[j] * deltaout[i];
    for ( k = 0; k <= inputs; k++ )
      for ( j = 1; j <= hidden; j++ )
        inputtohidden[k][j] += alpha * I[k] * delta[j];

    epoch++;
    if(epoch%EPOCHS_BETWEEN_TEST == 0){
      current_convergence = test(tester, false);
    }
  }//while
  
  seconds = (double)(clock() - begin)/1000.0;
  if(verbose){
    cout << "Trained " << epoch << " runs in " << seconds << " seconds." 
    << endl;
  }
  epochsUsed = epoch;
}

double neuralnet::test(dataset * testset, bool verbose){
  double totalDelta = 0;
  for( int example = 0; example < (int)testset->examples; example++){
    I[0] = -1;
    for( i = 0; i < inputs; i++){
      I[i+1] = testset->data[example][i];
      if(verbose){
        cout << I[i+1];
        if(i < inputs-1){
          cout << ",";
        }else{
          cout << ":";
        }
      }
    }
    T[0] = testset->data[example][inputs];
    
    //forward first layer
    for ( j = 1; j <= hidden; j++ ) {
      sum[j] = -inputtohidden[0][j];
      for ( k = 1; k <= inputs; k++ )
        sum[j] += inputtohidden[k][j] * I[k];
      hiddenacti[j] = g (sum[j]);
    }//for

    //forward second layer
    for ( i = 0; i < outputs; i++ ) {
      sumout = -hiddentooutput[0][i];
      for ( j = 1; j <= hidden; j++ )
        sumout += hiddentooutput[j][i] * hiddenacti[j];
      O[i] = g (sumout);
      totalDelta += abs(O[i] - T[i]);
      if(verbose){
        cout << O[i];
        if(i < outputs-1)
          cout << ",";
        else
          cout << endl;
      }
    }//for
  }
  if(testset->examples != 0){
    totalDelta /= testset->examples;
  }
  return totalDelta;
}

neuralnet::~neuralnet(){
  // and delete the arrays ...
  for ( k = 0; k < inputs+1; k++ )
    delete [ ] inputtohidden[k];
  for ( j = 0; j < hidden+1; j++ )
    delete [ ] hiddentooutput[j];
  delete[ ] inputtohidden;
  delete [ ] hiddentooutput;
  delete [ ] I;
  delete [ ] T;
  delete [ ] O;
  delete [ ] delta;
  delete [ ] deltaout;
  delete [ ] sum;
  delete [ ] hiddenacti;
}