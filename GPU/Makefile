CXX = nvc++
CXXFLAGS = -fopenmp -mp=gpu 

loopgpu: number_crunching_loop.cpp
	     $(CXX) $(CXXFLAGS) -o loopgpu number_crunching_loop.cpp
		 OMP_NUM_THREADS=50 OMP_NUM_TEAMS=10 time ./loopgpu 200000

clean:
	rm loopgpu
