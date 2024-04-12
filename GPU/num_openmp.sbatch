#!/bin/bash

# Request resources:
#SBATCH -N 10		# number of compute nodes. 
#SBATCH -c 50		# number of CPU cores, one per thread, up to 128
#SBATCH --mem=1G	# memory required, up to 250G on standard nodes
#SBATCH --time=0:15:0	# time limit for job (format:  days-hours:minutes:seconds)

# Run in the 'shared' queue (job may share node with other jobs)
#SBATCH -p test

module purge
module load nvidia-hpc

nvc++ -fopenmp -mp=gpu number_crunching_loop.cpp -o num_par_batch
OMP_NUM_THREADS=50 OMP_NUM_TEAMS=10 time ./num_par_batch 200000

