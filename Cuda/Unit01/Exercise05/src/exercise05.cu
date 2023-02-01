#include <iostream>
#include <fstream>
#include <cmath>
#include <string>

using namespace std;

// Code to get hypotenuse of a triangle
// The parts of the array are [a, b, c]
__global__
void hypotenuse(float *sides) {
    sides[2] = sqrt((sides[0]*sides[0])+(sides[1]*sides[1]));
}

int main() {
    // Setting up an array to hold the values
    float *sides;
    string str;

    // Allocating memory on the GPU
    cudaMallocManaged(&sides, 3*sizeof(float));

    // Reading in the values
    ifstream indata;
    indata.open("../Unit01/Exercise05/Inputs/input.txt");
    for (int i = 0; i < 2; i++) {
    indata >> str >> sides[i];
    }
    indata.close();

    // Getting the hypotenuse
    hypotenuse<<<1,1>>>(sides);

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();

    // Writing out the result
    ofstream outdata;
    outdata.open("../Unit01/Exercise05/Outputs/output.txt");
    outdata << "c: " << sides[2] << endl;
    outdata.close();

    // Free memory
    cudaFree(sides);

    return 0;


}