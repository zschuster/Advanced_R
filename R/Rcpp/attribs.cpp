#include <Rcpp.h>
using namespace Rcpp;


// [[Rcpp::export]]
NumericVector attribs() {
  NumericVector out = NumericVector::create(1, 2, 3);
  
  out.names() = CharacterVector::create("a", "b", "c");
  out.attr("my-attr") = "my-value";
  out.attr("my-class") = "my-class";
  
  return out;
}

// note the use of the ::create (class) method to instantiate an object
// .attr allows you to set attributes


/*** R
attribs()
*/
