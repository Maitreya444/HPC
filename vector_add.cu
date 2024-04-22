#include <iostream>
#include <cuda_runtime.h>

using namespace std;

const int N = 4;

__global__ void add(int* A, int* B, int* C, int size) 
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid < size) 
    {
        C[tid] = A[tid] + B[tid];
    }
}

int main() {
    int A[N] = {3, 6, 7, 5};
    int B[N] = {3, 5, 6, 2};
    int C[N] = {0};

    int *d_A, *d_B, *d_C;
    int size = N * sizeof(int);

    // Allocate memory on device
    cudaMalloc((void**)&d_A, size);
    cudaMalloc((void**)&d_B, size);
    cudaMalloc((void**)&d_C, size);

    // Copy data from host to device
    cudaMemcpy(d_A, A, size, cudaMemcpyHostToDevice);
    cudaMemcpy(d_B, B, size, cudaMemcpyHostToDevice);

    // Launch kernel
    add<<<1, N>>>(d_A, d_B, d_C, N);

    // Copy result back to host
    cudaMemcpy(C, d_C, size, cudaMemcpyDeviceToHost);

    std::cout << "Vector A: ";
    for (int i = 0; i < N; ++i) {
        std::cout << A[i] << " ";
    }
    std::cout << std::endl;

    std::cout << "Vector B: ";
    for (int i = 0; i < N; ++i) {
        std::cout << B[i] << " ";
    }
    std::cout << std::endl;

    std::cout << "Addition: ";
    for (int i = 0; i < N; ++i) {
        std::cout << C[i] << " ";
    }
    std::cout << std::endl;

    // Free device memory
    cudaFree(d_A);
    cudaFree(d_B);
    cudaFree(d_C);

    return 0;
}
