#include<iostream>
#include<string>
#include<fstream>

using namespace std;

int main(int argc, char** argv) {
    
    // c++ way to convert strings.
    float n = std::stof(argv[1]);

    // Writing out the square
    ofstream outfile;
    outfile.open("../Unit01/Exercise07/Outputs/output.txt");
    outfile << n*n;
    outfile.close();

    return 0;

}