#include <iostream>
#include <fstream>

// Trying the use of a pointer to see what happens
__global__
void square(float *n) {
    n[0] = n[0]*n[0];
}

int main() {
    // Setting the variable
    float *num;

    // Allocating memory on GPU
    cudaMallocManaged(&num, sizeof(float));

    // Reading in the value
    std::ifstream indata;
    indata.open("../Unit01/Exercise03/Inputs/input.txt");
    indata >> num[0];
    indata.close();

    // Squaring the value
    square<<<1,1>>>(num);

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();

    // Writing out the result
    std::cout << num[0] << std::endl;

    // Freeing memory
    cudaFree(num);

    return 0;
}