CXX = nvc++
CXXFLAGS = -fopenmp -mp=gpu 

loopgpu: number_crunching_loop2.cpp
	     $(CXX) $(CXXFLAGS) -o loopgpu number_crunching_loop2.cpp

clean:
	rm loopgpu
