CXX = nvc++
CXXFLAGS = -fopenmp -mp=gpu 

loopgpu: number_crunching_loop.cpp
	     $(CXX) $(CXXFLAGS) -o loopgpu number_crunching_loop.cpp

clean:
	rm loopgpu
