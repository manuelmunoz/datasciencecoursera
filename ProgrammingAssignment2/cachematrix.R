## Matrix inversion caching procedure 
## Manuel Jose Munoz Calero (manuelj.munoz@gmail) 
## 04/08/2016

## Execution example:
## > z <- matrix(c(1, 0, 1, 2, 4, 0, 3, 5, 6), 3, 3)
## > j <- makeCacheMatrix(z)
## > cacheSolve(j)
## [,1]        [,2]        [,3]
## [1,]  1.0909091 -0.54545455 -0.09090909
## [2,]  0.2272727  0.13636364 -0.22727273
## [3,] -0.1818182  0.09090909  0.18181818

## Creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  ## Inicialization
  m <- NULL

  ## Set
  set <- function(y) {
    x <<- y
    m <<- NULL
  }

  ## Get
  get <- function() x

  ## Set inverse
  setinverse <- function(val) m <<- val

  ## Get inverse
  getinverse <- function() m
  
  ## To be returned...
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Computes the inverse of the special "matrix" returned by makeCacheMatrix
cacheSolve <- function(x, ...) {

  ## Getting value
  m <- x$getinverse()
  
  ## If result was previously cached...
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }

  ## If not, it caculates
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)

  ## Returns a matrix that is the inverse of x
  m
}
