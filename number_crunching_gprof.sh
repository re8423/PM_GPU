#!/bin/bash
#SBATCH -p test
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=00:30:00

./number_crunching 40000
gprof -zb number_crunching gmon.out

# gprof -zb number_crunching gmon.out > number_crunching_gprof.out