#include<iostream>
#include<fstream>

int main() {
    // Variable to hold the number
    float num;

    // Reading in the data
    std::ifstream indata;
    indata.open("../Unit01/Exercise03/Inputs/input.txt");
    indata>>num;

    // Printing the square of the data
    std::cout<< (num*num);

    return 0;
}