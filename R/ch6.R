# Chapter 6: Functions

library(pryr)

#

# 6.1.2 -------------------------------------------------------------------

my_fun = function(x, y) {
  x + y
}

# 1
is.function(my_fun)
is.primitive(my_fun)

# 2

objs <- mget(ls("package:base"), inherits = TRUE)
funs <- Filter(is.function, objs)

## a
num_args = function(fun){
  length(formals(fun))
}

names(funs)[which.max(sapply(funs, num_args))]

## b
sum(vapply(funs, FUN = function(x) is.null(formals(x)),
           FUN.VALUE = logical(1)))

# 226 primitive functions

## c
# funs <- Filter(is.primitive, objs)

# 3

# formals, body, environmentenvironment

# 4

# when function is in global environment


# 6.2.5 -------------------------------------------------------------------

# 1

c <- 10
c(c = c)

# returns names vector length 1. In order, c's mean 1. function combine, 2.
# character name c, 3. variable c

# 2

# name masking, functions vs variables, a fresh start, dynamic lookup

# 3

f <- function(x) {
  f <- function(x) {
    f <- function(x) {
      x ^ 2
    }
    f(x) + 1
  }
  f(x) * 2
}

# f(10) will return 202
f(10)