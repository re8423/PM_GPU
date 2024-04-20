CXX = nvc++
CXXFLAGS = -fopenmp -mp=gpu 

loopgpu: number_crunching_loop.cpp
	     $(CXX) $(CXXFLAGS) -o loopgpu number_crunching_loop.cpp

taskgpu: number_crunching_task.cpp
	     $(CXX) $(CXXFLAGS) -o taskgpu number_crunching_task.cpp

clean:
	rm loopgpu
	rm taskgpu