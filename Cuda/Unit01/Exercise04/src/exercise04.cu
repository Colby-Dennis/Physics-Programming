#include <iostream>
#include <fstream>

// Don't want to keep writing std::
using namespace std;

// Function to square a number using the GPU
__global__
void square(float *n) {
    n[0] = n[0]*n[0];
}

int main() {
    // Setting the variable to get and manipulate
    float *num;

    // Allocating memory on the GPU
    cudaMallocManaged(&num, sizeof(float));

    // Reading in the value
    ifstream indata;
    indata.open("../Unit01/Exercise04/Inputs/input.txt");
    indata >> num[0];
    indata.close();

    // Squaring the value
    square<<<1,1>>>(num);

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();

    // Writing out the result
    ofstream outdata;
    outdata.open("../Unit01/Exercise04/Outputs/output.txt");
    outdata << num[0];
    outdata.close();

    // Freeint memory
    cudaFree(num);

    return 0;
}