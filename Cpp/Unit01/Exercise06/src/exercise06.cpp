#include<iostream>
#include<fstream>
#include<string>
#include<cmath>

using namespace std;

int main() {
    float f;

    // writing out the result
    ofstream outcsv;
    ofstream outtab;
    outcsv.open("../Unit01/Exercise06/Outputs/output.csv");
    outtab.open("../Unit01/Exercise06/Outputs/output.txt");
    outcsv << "Number, Square\n";
    outtab << "Number \t Square\n";
    for (int i = 1; i <= 25; i++) {
        f = (float) i;
        outcsv << to_string(i) + ", " + to_string(f) + "\n";
        outtab << to_string(i) + "\t" + to_string(f) + "\n";
    }
    outcsv.close();
    outtab.close();

    return 0;
}