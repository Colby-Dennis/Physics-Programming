#include <iostream>
#include <fstream>

using namespace std;

// Program to make the square of the input (store to second array)
__global__
void square(int n, float *in, float *out) {
    int index = threadIdx.x;
    int stride = blockDim.x;
    for (int i = index; i < n; i += stride) {
        out[i] = in[i] * in[i];
    }
}

int main() {
    // Setting the variables
    float *x, *y;
    int n = 25;

    cudaMallocManaged(&x, n*sizeof(float));
    cudaMallocManaged(&y, n*sizeof(float));

    // Initialize the x array
    for (int i = 0; i < n; i++) {
        x[i] = float(i+1);
    }

    // Getting the squares using n threads
    square<<<1,n>>>(n, x, y);

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();
    

    // Writing out the result
    ofstream outdata;
    outdata.open("../Unit01/Exercise06/Outputs/output.txt");
    for (int i = 0; i < n; i++) {
        outdata << x[i] << " " << y[i] << endl;
    }
    outdata.close();

    // Free memory
    cudaFree(x);
    cudaFree(y);

    return 0;
}