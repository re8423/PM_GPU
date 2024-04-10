#!/bin/bash
#SBATCH -p shared
#SBATCH --mem=1G
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -c 1
#SBATCH --time=00:35:00

likwid-perfctr -m -g "MEM_DP" -C 0 ./num_crunch_likwid 40000
likwid-perfctr -m -g "FLOPS_DP" -C 0 ./num_crunch_likwid 40000