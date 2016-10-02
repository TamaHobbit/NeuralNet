#include<fstream>
#include<sstream>
#include<vector>
using namespace std;

class dataset {
  string fileName;
  ifstream in;
  
  string getNextLine();
  vector<double> process(string currentLine);
  
  public:
    vector<vector<double> > data;
    size_t examples;
    dataset(char * filename, int &inputs, int &outputs, bool verbose);
};

dataset::dataset(char * filename, int &inputs, int &outputs, bool verbose){
  examples = 0;
  in.open(filename);
  if(in.fail())
    cout << "Error opening file: " << filename << endl;
  if(verbose){
    cout << "Loading dataset: " << filename << " ..." << endl;
  }
  string currentLine = getNextLine();
  inputs = atoi(currentLine.c_str());//inputs on first line
  currentLine = getNextLine();
  outputs = atoi(currentLine.c_str());//outputs on second
  currentLine = getNextLine();//third line starts dataset
  while(!in.eof() and !in.fail() and !currentLine.empty()){
    data.push_back(process(currentLine));
    examples++;
    currentLine = getNextLine();
  }
}

string dataset::getNextLine(){
  string line;
  getline(in, line);
  return line;
}

vector<double> dataset::process(string currentLine){
  vector<double> processed;
  size_t place = 0;
  for(size_t index = 0; index < currentLine.size(); index++){
    if(currentLine[index] == ',' or currentLine[index] == ' '){
      place++;
    } else {
      int nextComma = currentLine.find(',', index);
      if(nextComma == -1){
        nextComma = currentLine.size();
      }
      double number;
      stringstream ss (currentLine.substr(index,(nextComma-index)));
      ss >> number;
      processed.push_back(number);
      index = nextComma;
      place++;
    }
  }
  return processed;
}
