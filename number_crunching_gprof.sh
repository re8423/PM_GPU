#!/bin/bash
#SBATCH -p test
#SBATCH --mem-per-cpu=40G
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -c 1
#SBATCH --time=00:15:00

./number_crunching 5000
gprof -zb number_crunching gmon.out

# ./number_crunching 20000
# gprof -zb number_crunching gmon.out

# ./number_crunching 30000
# gprof -zb number_crunching gmon.out

# ./number_crunching 40000
# gprof -zb number_crunching gmon.out

# ./number_crunching 50000
# gprof -zb number_crunching gmon.out

# ./number_crunching 60000
# gprof -zb number_crunching gmon.out

# ./number_crunching 70000
# gprof -zb number_crunching gmon.out

# ./number_crunching 80000
# gprof -zb number_crunching gmon.out

# ./number_crunching 1000
# gprof -zb number_crunching gmon.out

# ./number_crunching 100000
# gprof -zb number_crunching gmon.out

# gprof -zb number_crunching gmon.out > number_crunching_gprof.out