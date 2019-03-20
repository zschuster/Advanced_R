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


# 6.4.6 -------------------------------------------------------------------

# 1
x <- sample(replace = TRUE, 20, x = c(1:10, NA))
xx = sample(c(1:10, NA), size = 20, replace = TRUE)

y <- runif(min = 0, max = 1, 20)
yy = runif(20, min = 0, max = 1)

cor(m = "k", y = y, u = "p", x = x)
cor(x, y, use = "pairwise.complete.obs",
    method = "kendall")

# 2
f1 <- function(x = {y <- 1; 2}, y = 0) {
  x + y
}

# f1() will return 3 because of the lazy evaluation of y
f1()


# 3
f2 <- function(x = z) {
  z <- 100
  x
}

# This function will return 100 as x evaluates to z which is defined inside the
# function body
f2()