#include<iostream>
#include<string>
#include<fstream>

using namespace std;

int main(int argc, char** argv) {
    // Getting the path to the Input/Output folders
    string inputPath;
    string outputPath;
    if (argv[1] == NULL) {
        inputPath = "Inputs/input.txt";
        outputPath = "Outputs/output.txt";
    } else {
        string fs(argv[1]);
        inputPath = fs + "Inputs/input.txt";
        outputPath = fs + "Outputs/output.txt";
    }

    // Opening input and output files
    ifstream infile;
    ofstream outfile;
    infile.open(inputPath);
    outfile.open(outputPath);

    string str;
    float n;
    // Looping over the values, squaring them, and writing them out.
    while ( getline (infile,str) )
    {
      n = std::stof(str);
      outfile << n*n << "\n";
    }

    // Closing the files
    infile.close();
    outfile.close();

    return 0;
}