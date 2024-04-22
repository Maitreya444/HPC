For running openmp programs run commands:-
Compile: g++ path/to/file/file_name.cpp -fopenmp

Execute: ./a.out [Linux] or ./a.exe [Windows]

Steps to run CUDA programs on Google Collab:
Go to Google Collab
Create a new Notebook(.ipynb file).
Click on Runtime and change runtime type to GPU.
Now run !pip install git+https://github.com/afnan47/cuda.git in a cell.
On a new cell run %load_ext nvcc_plugin
Test the following code
