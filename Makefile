CXX = g++
CXXFLAGS = -O3 -march=native -pg -g

number_crunching: number_crunching.cpp
	     $(CXX) $(CXXFLAGS) -o number_crunching number_crunching.cpp

clean:
	rm number_crunching
