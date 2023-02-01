#include <iostream>
#include <string>
#include <fstream>

using namespace std;

// Program to square input
__global__
void square(float *n) {
    n[0] = n[0] * n[0];
}

int main (int argc, char** argv) {
    // c++ way to convert strings.
    float *n;
    cudaMallocManaged(&n, sizeof(float));
    n[0] = std::stof(argv[1]);

    // Squaring the value
    square<<<1,1>>>(n);

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();

    // Writing out the result
    ofstream outdata;
    outdata.open("../Unit01/Exercise07/Outputs/output.txt");
    outdata << n[0] << endl;
    outdata.close();

    // Free memory
    cudaFree(n);

    return 0;
}