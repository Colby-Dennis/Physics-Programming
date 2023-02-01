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
    

    // Writing out the result in a tab delimited text file and csv
    ofstream outdataTab, outdataCsv;
    outdataTab.open("../Unit01/Exercise06/Outputs/output.txt");
    outdataCsv.open("../Unit01/Exercise06/Outputs/output.csv");
    outdataTab << "Number \t Square" << endl;
    outdataCsv << "Number,Square" << endl;
    for (int i = 0; i < n; i++) {
        outdataTab << x[i] << "\t" << y[i] << endl;
        outdataCsv << x[i] << "," << y[i] << endl;
    }
    outdataTab.close();
    outdataCsv.close();

    // Free memory
    cudaFree(x);
    cudaFree(y);

    return 0;
}