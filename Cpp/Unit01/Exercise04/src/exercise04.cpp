#include<iostream>
#include<fstream>

int main() {
    // Creating a variable to hold the number
    float num;

    // reading in the data
    std::ifstream indata;
    indata.open("../Unit01/Exercise04/Inputs/input.txt");
    indata>>num;

    // writing out the data
    std::ofstream outdata;
    outdata.open("../Unit01/Exercise04/Outputs/output.txt");
    outdata<<num*num;
    outdata.close();

    return 0;
}