#include <algorithm>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <omp.h> //openmp header file


void function_a(double *y, const double *A, const double *x, const int N) {
  #pragma omp target teams distribute parallel for map(tofrom:y[0:N]) 
  for (unsigned int i = 0; i < N; i++) {
    y[i] = 0;
  }
  // std::cout << "FIRST A FINISHED"
  //       << std::endl;

  #pragma omp target teams distribute parallel for reduction(+:y[0:N]) map(to:A[0:8], x[0:N]) map(tofrom:y[0:N]) 
  for (unsigned int i = 0; i < N; i++) {
    for (unsigned int j = 0; j < N; j++) {
      y[i] += A[(i * N + j)%8] * x[i];
    }
  }
  
  // std::cout << "A FINISHED"
  //       << std::endl;
}

void function_b(double *x, const double a, const double *u, const double *v, const int N) {
  // instead of tofrom, shouldnt from be better?
  #pragma omp target teams distribute parallel for map(to:a, u[0:N], v[0:N]) map(from:x[0:N])
  for (unsigned int i = 0; i < N; i++) {
    x[i] = a * u[i] + v[i];
  }
  // std::cout << "B FINISHED"
  //         << std::endl;
}

void function_c(double *z, const double s, const double *x, const double *y, const int N) {
  #pragma omp target teams distribute parallel for map(to:s, x[0:N], y[0:N]) map(from:z[0:N]) 
  for (unsigned int i = 0; i < N; i++) {
    if (i % 2 == 0) {
      z[i] = s * x[i] + y[i];
    } else {
      z[i] = x[i] + y[i];
    }
  }
  // std::cout << "C FINISHED"
  //       << std::endl;
}

double function_d(double s, const double *u, const double *v, const int N) {
  s = 0;
  #pragma omp target teams distribute parallel for reduction(+:s) map(to:u[0:N], v[0:N]) map(tofrom: s)
  for (unsigned int i = 0; i < N; i++) {
    s += u[i] * v[i];
  }
  // std::cout << "D FINISHED"
  //       << std::endl;
  return s;
}

void init_datastructures(double *u, double *v, double *A, const int N) {
  for (unsigned int i = 0; i < N; i++) {
    u[i] = static_cast<double>(i%2);
    v[i] = static_cast<double>(i%4);
  }

  for (unsigned int i = 0; i < 8; i++) {
    A[i] = static_cast<double>(i%8);
  }
}

void print_results_to_file(const double s, const double *x, const double *y,
                           const double *z, const double *A, const long long n,
                           std::ofstream &File) {
  unsigned int N = std::min(n, static_cast<long long>(30));

  File << "N: "
       << "\n"
       << n << "\n";

  File << "s: "
       << std::fixed
       << std::setprecision(1)
       << "\n"
       << s << "\n";

  File << "x: "
       << "\n";
  for (unsigned int i = 0; i < N; i++) {
    File << x[i] << " ";
  }
  File << "\n";

  File << "y: "
       << "\n";
  for (unsigned int i = 0; i < N; i++) {
    File << y[i] << " ";
  }
  File << "\n";

  File << "z: "
       << "\n";
  for (unsigned int i = 0; i < N; i++) {
    File << z[i] << " ";
  }
  File << "\n";
}

int main(int argc, char **argv) {
  long long N;

  if (argc == 2) {
    N = std::stoi(argv[1]);
  } else {
    std::cout << "Error: Missing problem size N. Please provide N as "
                 "commandline parameter. Usage example for N=10: "
                 "./number_crunching 10"
              << std::endl;
    exit(0);
  }

  double *u = new double[N];
  double *v = new double[N];
  double *A = new double[8];

  double s;
  double *x = new double[N];
  double *y = new double[N];
  double *z = new double[N];

  init_datastructures(u, v, A, N);
  // std::cout << "INIT FINISHED"
  //             << std::endl;
// d and b can be ran concurrently
  #pragma omp parallel
	#pragma omp single
  {
    #pragma omp task depend(in:u, v) depend(out:s)
    {
      s = function_d(s, u, v, N);
        // Task B
        // This task depends on the completion of Task A and produces data stored in 'b'
    }

    #pragma omp task depend(in:u, v) depend(out:x)
    {
      function_b(x, 2, u, v, N);
        // Task B
        // This task depends on the completion of Task A and produces data stored in 'b'
    }
  }

  function_a(y, A, x, N);
  function_c(z, s, x, y, N);
  
  std::ofstream File("partial_results.out");
  print_results_to_file(s, x, y, z, A, N, File);

  // std::cout << "For correctness checking, partial results have been written to "
  //              "partial_results.out"
  //           << std::endl;

  delete[] u;
  delete[] v;
  delete[] A;
  delete[] x;
  delete[] y;
  delete[] z;

  // EXIT_SUCCESS;
}
