## The following two functions are used to create a matrix and cash its inverse by 
## storing them in a special object aswell as retreiving the invers of the matrix
## from the cash.



## The following function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  + inv <- NULL
  + set <- function(y) {
    +  x <<- y
    + inv <<- NULL
    + }
  + get <- function() x
  + setInverse <- function(inverse) inv <<- inverse
  + getInverse <- function() inv
  + list(set = set,
         + get = get,
         + setInverse = setInverse,
         + getInverse = getInverse)
}


## The following function computes the inverse of the special
## matrix" returned by the first function `makeCacheMatrix`. If the inverse has
## already been calculated (and the matrix has not changed), then
## `cacheSolve` should retrieve the inverse from the cache.
## This function assumes that the matrix is always invertible.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    +     inv <- x$getInverse()
    +     if (!is.null(inv)) {
      +         message("getting cached data")
      +         return(inv)
      +     }
    +     mat <- x$get()
    +     inv <- solve(mat, ...)
    +     x$setInverse(inv)
    +     inv
}
