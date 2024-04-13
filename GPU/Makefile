CXX = nvc++
CXXFLAGS = -fopenmp -mp=gpu 

loopgpu: number_crunching_loop.cpp
	     $(CXX) $(CXXFLAGS) -o loopgpu number_crunching_loop.cpp

loopgpu2: number_crunching_loop2.cpp
	     $(CXX) $(CXXFLAGS) -o loopgpu2 number_crunching_loop2.cpp

clean:
	rm loopgpu
	rm loopgpu2
