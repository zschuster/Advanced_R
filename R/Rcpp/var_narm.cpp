#include <Rcpp.h>
using namespace Rcpp;


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


// [[Rcpp::export]]
double var_narm(NumericVector x, bool na_rm = false) {
  
  // get size of x and number of non missing values
  int n = x.size();
  int non_missings = x.size();
  
  for (int i = 0; i < n; ++i) {
    if (NumericVector::is_na(x[i])) {
      non_missings -= 1;
    }
  }
  
  if (!na_rm && n != non_missings) {
    return NA_REAL;
  }
  
  // no need to deal with removing na values if there are none
  if (n == non_missings) {
    return varC(x);
  }
  
  // now we need to remove mising values
  NumericVector no_miss;

  for (int i = 0; i < n; ++i) {
    if (!NumericVector::is_na(x[i])) {
      no_miss.push_back(x[i]);
    }
  }
  
  return varC(no_miss);
}

// faster solution
// https://advanced-r-solutions.rbind.io/rewriting-r-code-in-c.html#missing-values

// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.

/*** R
x = sample(c(rnorm(1e5), rep(NA_real_, 1e4)))

var_narm(x)
var(x)

y = rnorm(100)
var_narm(y)
var(y)

var_narm(x, na_rm = TRUE)
var(x, na.rm = TRUE)

*/
