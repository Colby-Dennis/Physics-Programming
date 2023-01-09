#include<iostream>
#include<string>
#include<fstream>

using namespace std;

int main(int argc, char** argv) {
    // Getting the path to the Input/Output folders
    string fs(argv[1]);
    string inputPath = "../Unit01/Exercise09/Inputs/" + fs;
    string outputPath = "../Unit01/Exercise09/Outputs/output.txt";

    // Getting the number from the input file
    float n;
    ifstream inFile;
    inFile.open(inputPath);
    inFile >> n;
    inFile.close();

    // Writing out the cube of the number
    ofstream outFile;
    outFile.open(outputPath);
    outFile << n*n*n;
    outFile.close();

    return 0;
}