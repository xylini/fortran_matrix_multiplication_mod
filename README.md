# Matrix Multiplication in Fortran
A project for Fortran 2008 course.<br>
If your main purpose is to see the resuls just open solutions.ipynb

## Requirements
To compile or view the project you will need:
* ifort
* pFUnit
* Python 3
* Jupyter Notebook
<br>


## Ex1
Contains:
* Matrix Multiplication Module, 
* Makefile, 
* tests 



**To run, type:**

```
cd ./ex1/
make clean test
./test
```
<br>

## Ex2
Contains:
* Matrix Multiplication Module with DOT or CACHE optimalization,
* Makefile, 
* tests 

**IMPORTANT:** this module needs two preprocessor definitions: `DOT` and `CACHE`. <br>
If you want to compile it by your own, look first to Makefile.



**To run, type:**
```
cd ./ex2/
make clean tests
make run_tests
```
<br>

## Ex3
Contains:
* Matrix Multiplication Module with DOT or CACHE optimalization + O2 flag,
* Main, Mainmatmul
* Makefile

Main purpose of this exercise is to compare time of execution using different size matrixes and DOT or CACHE optimalization.

**IMPORTANT:** this module needs two preprocessor definitions: `DOT` and `CACHE`. <br>
If you want to compile it by your own, look first to Makefile.

**To run, type:**
```
# N - size of matrix
# Two last digits in ex. main00 stands for (main%d%d, DOT, CACHE)
# mainmatmul - multiplies matrixes using build in function: matmul()

cd ./ex3/
make clean main00 main10 main01 main11 mainmatmul
./main00 N
./main01 N
./main10 N
./main11 N
./mainmatmul N
```
