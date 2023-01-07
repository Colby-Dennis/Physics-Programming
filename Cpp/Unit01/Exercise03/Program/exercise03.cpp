#include<iostream>
#include<fstream>

int main() {
    std::ifstream indata;
    float num;
    indata.open("../Unit01/Exercise03/Inputs/input.txt");

    indata>>num;
    std::cout<< (num*num);

    return 0;
}