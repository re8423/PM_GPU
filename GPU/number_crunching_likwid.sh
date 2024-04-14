#!/bin/bash
#SBATCH -p shared
#SBATCH --mem-per-cpu=30G
#SBATCH -N 10		# number of compute nodes. 
#SBATCH -c 50		# number of CPU cores, one per thread, up to 128
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:15:00

nvc++ -fopenmp -mp=gpu -o loopgpu number_crunching_loop.cpp
OMP_NUM_THREADS=50 time ./loopgpu 100000

OMP_NUM_THREADS=50 time ./loopgpu 90000

OMP_NUM_THREADS=50 time ./loopgpu 80000

OMP_NUM_THREADS=50 time ./loopgpu 70000

OMP_NUM_THREADS=50 time ./loopgpu 60000

OMP_NUM_THREADS=50 time ./loopgpu 50000

OMP_NUM_THREADS=50 time ./loopgpu 40000

OMP_NUM_THREADS=50 time ./loopgpu 30000

OMP_NUM_THREADS=50 time ./loopgpu 20000

OMP_NUM_THREADS=50 time ./loopgpu 10000