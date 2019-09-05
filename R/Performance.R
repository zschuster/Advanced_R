library(microbenchmark)


# 16.2 Exrcises

# 1
# system.time
x = runif(100)
n = 1:1e6

system.time(for (i in n) sqrt(x)) / length(n)
system.time(for (i in n) x ^ .5) / length(n)

# microbenchmark
microbenchmark(
  built_in = sqrt(x),
  carat = x ^ .5,
  times = 1e6
)

# system.time reports in seconds which is cumbersom to read and does not provide
# nearly as much detail


# 2

# x ^ (1 / 2) will be slower than the prior 2, but faster than exp(log(x) / 2)

microbenchmark(
  built_in = sqrt(x),
  carat = x ^ .5,
  carat_frac = x ^ (1 / 2),
  exp = exp(log(x) / 2),
  times = 1e5
)

# Interestingly the exponential expression is faster than the carat. This now
# makes sense becuase exp and log are both implemented n C


# 3

# basic operators

microbenchmark(
  plus = 2 + 2,
  minus = 2 - 2,
  div = 2 / 2,
  mult = 2 * 2,
  exp = 2 ^ 2,
  times = 1e6
)

# we can see that +, -, *, / are all very similar

microbenchmark(
  int = 2L + 2L,
  doub = 2.5 + 2.987,
  times = 1e6
)

# here we see that adding integer and double are very similar time wise


# 4

# This will show that performance for the above tests show miniscule differences




