#include<iostream>
#include<fstream>
#include<string>
#include<cmath>

using namespace std;

int main() {
    float a, b;
    string str;

    // Reading in the values
    ifstream indata;
    indata.open("../Unit01/Exercise05/Inputs/input.txt");
    indata >> str >> a;
    indata >> str >> b;
    indata.close();

    // writing out the result
    ofstream outdata;
    outdata.open("../Unit01/Exercise05/Outputs/output.txt");
    outdata<<sqrt((a*a) + (b*b));
    outdata.close();

    return 0;
}