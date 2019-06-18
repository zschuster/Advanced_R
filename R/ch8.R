
# Environments ------------------------------------------------------------

## 8.2.1

# 1. Modify where() to find all environments that contain a binding for name.
where <- function(name, env = parent.frame()) {
  envs = character(0)
  while(!identical(env, emptyenv())) {
    if (exists(name, envir = env, inherits = FALSE)) {
      envs = c(envs, env)
    }
    env = parent.env(env)
  }
  
  envs
}

x = "dog"

rando_env = new.env()
rando_env$x = 12

where("x", env = rando_env)

# 2. Write your own version of get() using a function written in the style of where().

get = function(name, env = parent.frame()) {
  if (identical(env, emptyenv())) {
    # Base case
    stop("Can't find ", name, call. = FALSE)
    
  } else if (exists(name, envir = env, inherits = FALSE)) {
    # Success case
    env[[name]]
    
  } else {
    # Recursive case
    where(name, parent.env(env))
    
  }
}

get("x")
get("x", env = rando_env)

# 3. Write a function called fget() that finds only function objects. It should
# have two arguments, name and env, and should obey the regular scoping rules
# for functions: if there’s an object with a matching name that’s not a
# function, look in the parent. For an added challenge, also add an inherits
# argument which controls whether the function recurses up the parents or only
# looks in one environment.

fget = function(name, env = parent.frame()) {
  
  if (identical(env, emptyenv())) {
    # Base case
    stop("Can't find ", name, call. = FALSE)
    
  } else if (exists(name, envir = env, inherits = FALSE)) {
    # Success case
    if (is.function(env[[name]])) {
      return(env[[name]])
    } else {
      where(name, parent.env(env))
    }
    
  } else {
    # Recursive case
    where(name, parent.env(env))
    
  }
}

fget("joe_schmoe")
fget("mean")
fget("alarm")
fget("fget")

# 4. Write your own version of exists(inherits = FALSE) (Hint: use ls().) Write
# a recursive version that behaves like exists(inherits = TRUE)

exists = function(name, env = parent.frame()) {
  if (identical(env, emptyenv())) {
    # Base case
    return(FALSE)
  } 
  
  objects = ls(env)
  
  if (name %in% objects) {
    # Success case
    return(TRUE)
  } else {
    # Recursive case
    return(FALSE)
  }
}

recursive_exists = function(name, env = parent.frame()) {
  if (identical(env, emptyenv())) {
    # Base case
    return(FALSE)
  } 
  
  objects = ls(env)
  
  if (name %in% objects) {
    # Success case
    return(TRUE)
  } else {
    # Recursive case
    recursive_exists(name, env = parent.env(env))
  }
}

exists("name")

exists("mean")
recursive_exists("mean")

