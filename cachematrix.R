##There are two functions here.  
##The first creates a special "matrix" object than can cache its inverse.
## The second function computes the inverse of the special "matrix" returned by the first function.


## This function creates a special "matrix" object that can cache its inverse.



makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

## This function computes the inverse of the special "matrix" returned by the first function. 
##If the inverse has already been calculated (and the matrix has not changed), then this function retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
