CXX = nvc++
CXXFLAGS = -fopenmp -mp=gpu -fopenmp-targets=nvptx-none

number_crunching_loop: number_crunching_loop.cpp
	     $(CXX) $(CXXFLAGS) -o number_crunching_loop number_crunching_loop.cpp

clean:
	rm number_crunching_loop
