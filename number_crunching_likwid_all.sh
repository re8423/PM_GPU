#!/bin/bash
#SBATCH -p test
#SBATCH --mem-per-cpu=30G
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -c 1
#SBATCH --time=00:15:00

module load gcc/12.2 likwid/5.2.0

g++ -mfma -O1 -DLIKWID_PERFMON -fno-inline -march=native -o num_crunch_likwid_all number_crunching_likwid_all.cpp -llikwid

likwid-perfctr -m -g "MEM_DP" -C 0 ./num_crunch_likwid_all 10000
likwid-perfctr -m -g "MEM_DP" -C 0 ./num_crunch_likwid_all 40000
likwid-perfctr -m -g "MEM_DP" -C 0 ./num_crunch_likwid_all 70000
likwid-perfctr -m -g "MEM_DP" -C 0 ./num_crunch_likwid_all 100000