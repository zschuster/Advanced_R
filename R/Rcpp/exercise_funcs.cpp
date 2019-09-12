#include <Rcpp.h>
using namespace Rcpp;

// all()
// [[Rcpp::export]]
bool allC(LogicalVector x) {
  
  int n = x.size();
  int total = 0;
  
  for (int i = 0; i < n; ++i) {
    if (x[i]) total += 1;
  }
  
  if (total == n) return true;
  return false;
}

// cumprod()
// [[Rcpp::export]]
NumericVector cumprodC(NumericVector x) {
  
  int n = x.size();
  NumericVector out(n);
  out[0] = x[0];
  
  for (int i = 1; i < n; ++i) {
    out[i] = x[i] * out[i - 1];
  }
  
  return out;
}

//cummin()
// [[Rcpp::export]]
NumericVector cumminC(NumericVector x) {
  int n = x.size();
  NumericVector out(n);
  out[0] = x[0];
  
  for (int i = 1; i < n; ++i) {
    
    if (x[i] < out[i - 1]) {
      out[i] = x[i];
    } else {
      out[i] = out[i - 1];
    }
  }
  return out;
}

// cummax is the exact same..just switch to max

// dif()
// [[Rcpp::export]]
NumericVector diffC(NumericVector x, int lag = 1) {
  int n = x.size();
  NumericVector out(n - lag);
  
  for (int i = lag; i < n; ++i) {
    out[i - lag] = x[i] - x[i - lag];
  }
  
  return out;
}


// range(). This will mimic R's output
// [[Rcpp::export]]
NumericVector rangeC(NumericVector x) {
  int n = x.size();
  NumericVector out(2);
  out[0] = x[0];
  out[1] = x[0];
  
  // definitely not the most efficient way to do this
  for (int i = 1; i < n; ++i) {
    
    // min
    if (x[i] < out[0]) out[0] = x[i];
    // max
    if (x[i] > out[1]) out[1] = x[i];
  }
  
  return out;
}


// varC() only implementing variance of 1 vector
// [[Rcpp::export]]
double varC(NumericVector x) {
  int n = x.size();
  double sum = 0, sum_sq = 0;
  
  for (int i = 0; i < n; ++i) {
    sum += x[i];
    sum_sq += pow(x[i], 2);
  }
  
  double out = (sum_sq - (pow(sum, 2)) / n) / (n - 1);
  return out;
}


// test functions

/*** R
bool_vec = 1:10 > 0
allC(bool_vec)

set.seed(1776)
x = sample(1:100, 5)

cumprod(x)
cumprodC(x)

cummin(x)
cumminC(x)

diff(x)
diffC(x)

diff(x, lag = 3)
diffC(x, lag = 3)

range(x)
rangeC(x)

# check one of the functions
z = runif(1e6)
microbenchmark::microbenchmark(
  R = diff(z),
  'C++' = diffC(z)
)

var(z)
varC(z)

*/
  