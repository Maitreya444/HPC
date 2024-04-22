#include <iostream>
#include <cuda_runtime.h>

int main() {
    int deviceCount;
    cudaGetDeviceCount(&deviceCount);
    
    if (deviceCount == 0) {
        std::cout << "No CUDA devices available" << std::endl;
    } else {
        std::cout << "CUDA devices available: " << deviceCount << std::endl;
    }
    
    return 0;
}
