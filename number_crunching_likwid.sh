#!/bin/bash
#SBATCH -p shared
#SBATCH --mem=1G
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -c 1
#SBATCH --time=00:35:00

module load gcc/12.2 likwid/5.2.0

g++ -mfma -O1 -DLIKWID_PERFMON -fno-inline -march=native -o num_crunch_likwid number_crunching_likwid.cpp -llikwid

likwid-perfctr -m -g "MEM_DP" -C 0 ./num_crunch_likwid 40000
likwid-perfctr -m -g "FLOPS_DP" -C 0 ./num_crunch_likwid 40000