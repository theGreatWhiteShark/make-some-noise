CC = gcc
CXX = g++
CPPFLAGS = -fpic
RM = rm -rf

all: noise

noise: voss.o
	./voss.o > voss.noise

voss.o: voss-algorithm.cpp
	$(CXX) $(CPPFLAGS) -o voss.o voss-algorithm.cpp

clean:
	$(RM) voss.o voss.noise
