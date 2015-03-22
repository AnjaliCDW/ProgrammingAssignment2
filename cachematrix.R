##There are two functions here.  
##The first creates a special "matrix" object than can cache its inverse.
##The second function computes the inverse of the special "matrix" returned by the first function.


##This function creates a special "matrix" object that can cache its inverse.



makeCacheMatrix <- function(x = matrix()) {  ##x is a square invertible matrix  and teturns a list containing  a function to set the value of the matrix, get the value of the matrix, set the value of the inverse, get the value of the inverse
  invrs <- NULL
  set <- function(y) {
    x <<- y
    invrs <<- NULL
  }
  get <- function() x
  setinvrs <- function(inverse) invrs <<- inverse
  getinvrs<- function() invrs
  list(set=set, get=get,
       setinvrs=setinvrs,
       getinvrs=getinvrs)
}

## This function computes the inverse of the special "matrix" returned by the first function. 
##If the inverse has already been calculated (and the matrix has not changed), then this function retrieves the inverse from the cache and skips the computation.

cacheSolve <- function(x, ...) {        ##x is the output of the first function and this function returns the inverse of the original matrix  
  invrs<- x$getinvrs()
  if(!is.null(invrs)) {                ##if the inverse has already been calculated then get it from cache instead
    message("getting cached data")
    return(invrs)
  }
  data <- x$get()                      ##if not, then calculate the inverse
  invrs <- solve(data,...)
  x$setinvrs(invrs)             
  invrs                                ##sets the value of the inverse in the cache using the setinvrs funtcion
}