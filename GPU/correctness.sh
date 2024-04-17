#!/bin/bash

module load nvidia-hpc
nvc++ -fopenmp -mp=gpu -o loopgpu2 number_crunching_loop2.cpp

OMP_NUM_TEAMS=10 OMP_NUM_THREADS=10 ./loopgpu2 100000
./serial 100000
diff serial_results.out partial_results.out

OMP_NUM_TEAMS=10 OMP_NUM_THREADS=10 ./loopgpu2 123456
./serial 123456
diff serial_results.out partial_results.out

OMP_NUM_TEAMS=10 OMP_NUM_THREADS=10 ./loopgpu2 78345 
./serial 78345
diff serial_results.out partial_results.out

OMP_NUM_TEAMS=10 OMP_NUM_THREADS=10 ./loopgpu2 5
./serial 5
diff serial_results.out partial_results.out

OMP_NUM_TEAMS=10 OMP_NUM_THREADS=10 ./loopgpu2 1002
./serial 1002
diff serial_results.out partial_results.out

OMP_NUM_TEAMS=10 OMP_NUM_THREADS=10 ./loopgpu2 89456
./serial 89456
diff serial_results.out partial_results.out