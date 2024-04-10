#!/bin/bash
#SBATCH -p test
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=00:30:00

likwid-perfctr -m -g "MEM_DP" -C 0 ./num_crunch_likwid 40000
likwid-perfctr -m -g "FLOPS_DP" -C 0 ./num_crunch_likwid 40000