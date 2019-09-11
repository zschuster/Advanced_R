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
  
// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R
bool_vec = 1:10 > 0
allC(bool_vec)

x = sample(1:100, 5)
cumprod(x)
cumprodC(x)

cummin(x)
cumminC(x)

*/
  