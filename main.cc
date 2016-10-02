#include <iostream>
#include <iomanip>
#include <cstdlib>  // rand ( )
#include <cmath>    // exp ( )
#include <cstring>// strcmp()
#include "dataset.h"
#include "neuralnet.h"
using namespace std;

#define MIN_ARGS 4

size_t batchCount = 1;//how many times to run the command, then get average
// of results
double alpha;
int maxepochs = -1;//invalid value used by neuralnet::train to check if the 
//user supplied maxepochs
double convergence = 0.0;//if the user does not overwrite this, 
//it will not make neuralnet::train stop its while loop

static inline bool isFloat(char * arg){
  return (arg[0] == '0' and arg[1] == '.');
}

int main (int argc, char* argv[ ]) {
  if ( argc < MIN_ARGS ) {
    cout << "Usage: " << argv[0] 
	 << " <hidden-nodes> [batch-amount] <alpha> [maxepochs] [convergence] \
   [-verbose] [-noinput] <trainingfile> [testfile]" << endl
	 << "Simple example: " << argv[0] << " 7 0.4 100000 0.1 -verbose data/\
   file.data" << endl
   << "Batch example: " << argv[0] << " 7 200 0.4 10000 0.2 -noinput ../\
   data/file.txt" << endl
   << "Note that convergence and alpha MUST start with \"0.\". It is not \
   advised to use verbose batchmode as it produces "
   << "a lot of output. Similarly, without the -noinput flag, batchmode is\
   very tedious. Either maxepochs or convergence "
   << "must be specified. If you specify both, maxepochs takes precedence.\
   The program will return the hidden nodes, the learning "
   << "rate, the epochs training took (each example takes one epoch), the \
   time it took in seconds, and the convergence achieved, "
   << "in that order." << endl;
    return 1;
  }//if

  //initialise and set node counts
  int inputs;
  int hidden = atoi(argv[1]);
  int outputs;
  
  //get numbers from parameter list
  
  int filePlace = 4;//lowest place in parameter list that the file could be
  if(!isFloat(argv[2])){//batch mode
    batchCount = atoi(argv[2]);
    alpha = atof(argv[3]);
    filePlace++;
  } else {
    alpha = atof(argv[2]);
  }
  if(!isFloat(argv[filePlace-1])){//maxepochs is specified
    maxepochs = atoi(argv[filePlace-1]);
    if(isFloat(argv[filePlace])){//and convergence as well
      convergence = atof(argv[filePlace]);
      filePlace++;
    }
  } else {
    convergence = atof(argv[filePlace-1]);
  }
  
  //handle flags
  bool verbose = false;
  if(strcmp(argv[filePlace],"-verbose")==0){//if -verbose is where the 
  //file should be,
    filePlace++;//the file is obviously one place further
    verbose = true;
  }
  bool input = true;
  if(strcmp(argv[filePlace],"-noinput")==0){
    filePlace++;//idem dito for the second flag
    input = false;
  }

  //handle datasets
  dataset training(argv[filePlace], inputs, outputs, verbose);
  dataset * tester;//testset must be dynamically allocated because it is 
  //an optional parameter
  bool testset = (argc > filePlace+1);//testfile is specified as well
  if(testset){
    tester = new dataset(argv[filePlace+1], inputs, outputs, verbose);
  } else {
    tester = &training;//if no testfile was specified, we test using the 
    //training data
  }
  
  //these are totals over the whole batch
  double c_rate = 0;
  double seconds = 0;
  size_t epochs = 0;
  for(size_t i = 0; i < batchCount; i++){
    //seed to random
    srand(time(NULL));
    
    //initialise the net
    neuralnet NN(inputs, hidden, outputs, alpha, maxepochs, convergence);
    
    string userIn;
    if(input){
      cout << "Enter a string to load a network, or 0 to continue" << endl;
      cin >> userIn;
      if(userIn == "0"){
        NN.setRandom();
      } else {
        if(verbose){
          cout << "Loading network: " << userIn << " ..." << endl;
        }
        NN.load(userIn);
      }
    } else {
      NN.setRandom();
    }

    double s;//seconds for this training session
    size_t e;//epochs for this training session
    NN.train(&training, tester, verbose, s, e);
    seconds += s;
    epochs += e;
    c_rate += NN.test(tester, verbose);
    
    if(input){
      cout << "Enter a string to save the network, or 0 to continue" << endl;
      userIn = "";
      cin >> userIn;
      if(userIn != "0"){
        if(verbose){
          cout << "Saving network: " << userIn << " ..." << endl;
        }
        NN.save(userIn);
      }
    }
  }
  c_rate /= batchCount;
  seconds /= batchCount;
  epochs /= batchCount;
  
  if(verbose){
    cout << "Trained using " << hidden << " hidden nodes and a learning \
    rate of " << alpha << " over " << epochs << " epochs, in " << seconds 
    << " seconds, reaching a convergence of: " << c_rate << endl;
  }else{
    cout << hidden << " " << alpha << " " << epochs << " " << seconds 
    << " " << c_rate << endl;
  }
  
  return 0;
}//main

