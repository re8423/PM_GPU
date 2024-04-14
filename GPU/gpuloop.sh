#!/bin/bash
#SBATCH -p tpg-gpu-small
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --gres=gpu
#SBATCH --time=00:15:00
source /etc/profile

nvc++ -fopenmp -mp=gpu -o loopgpu number_crunching_loop.cpp
# OMP_NUM_THREADS=50 time ./loopgpu 100000

# OMP_NUM_THREADS=50 time ./loopgpu 90000

# OMP_NUM_THREADS=50 time ./loopgpu 80000

# OMP_NUM_THREADS=50 time ./loopgpu 70000

# OMP_NUM_THREADS=50 time ./loopgpu 60000

# OMP_NUM_THREADS=50 time ./loopgpu 50000

# OMP_NUM_THREADS=50 time ./loopgpu 40000

# OMP_NUM_THREADS=50 time ./loopgpu 30000

# OMP_NUM_THREADS=50 time ./loopgpu 20000

OMP_NUM_THREADS=1 time ./loopgpu 10000