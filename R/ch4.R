
# basic math

10.5 / 2
class(10.5 %/% 2) # round to "integer" but still class numeric
class(10L %/% NA)

# Function to do with functions
?missing

tmp = function(x, y) {
  if(missing(y)) warning("no argument specified for y")
  x + 5
}
tmp(x = 3)

?on.exit
?invisible

# logical
?xor
xor(c(TRUE, TRUE, FALSE), c(TRUE, FALSE, FALSE))

# vectors and matrices
?sweep

# making vectors
?combn
combn(1:5, 3)

# lists
?split

# dates
?julian

# text
?chartr
x = "apple tree"
chartr("app", "dog", x)

# factors
?findInterval

?interaction
a <- gl(2, 4, 8)
b <- gl(2, 2, 8, labels = c("ctrl", "treat"))
s <- gl(2, 1, 8, labels = c("M", "F"))
interaction(a, b)

# ordering and tabulating
?duplicated
?ftable

x = rep(letters[1:5], each = 5)
y = rep(1:5, each = 5)
table(x, y)
ftable(x, y)
identical(table(x, y), ftable(x, y))


# linear models
?influence.measures
?contrasts
utils::example(factor)
fff <- ff[, drop = TRUE]  # reduce to 5 levels.
contrasts(fff) # treatment contrasts by default

# matrix algebra
?crossprod
?qr
?`%o%`
x <- 1:9; names(x) <- x

# Multiplication & Power Tables
x %o% x
x %*% t(x)

# power table
y <- 2:8; names(y) <- paste(y,":", sep = "")
outer(y, x, "^")

?rcond


# workspace
?q

# Debugging
?recover

# I/O
?dput
?sink

# reading/writing
?count.fields
count.fields("BAC.GTA-EconIndicators/data/oxEconAPIPullData.csv", sep = ',')
head(read.csv("BAC.GTA-EconIndicators/data/oxEconAPIPullData.csv"))

?read.fwf

#files and directories
?tools::file_ext
?path.expand
path.expand("~/foo")

?normalizePath()
?file.choose()
?download.file()
