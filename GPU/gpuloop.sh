#!/bin/bash
#SBATCH -p tpg-gpu-small
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --gres=gpu
#SBATCH --time=00:15:00
source /etc/profile

module load nvidia-hpc
nvc++ -fopenmp -mp=gpu -o loopgpu2 number_crunching_loop2.cpp
OMP_NUM_THREADS=1 time ./loopgpu2 100000

# OMP_NUM_THREADS=50 time ./loopgpu2 90000

# OMP_NUM_THREADS=50 time ./loopgpu2 80000

# OMP_NUM_THREADS=50 time ./loopgpu2 70000

# OMP_NUM_THREADS=50 time ./loopgpu2 60000

# OMP_NUM_THREADS=50 time ./loopgpu2 50000

# OMP_NUM_THREADS=50 time ./loopgpu2 40000

# OMP_NUM_THREADS=50 time ./loopgpu2 30000

# OMP_NUM_THREADS=50 time ./loopgpu2 20000

# OMP_NUM_THREADS=1 time ./loopgpu2 10000