## The functions create an inertible matrix object with the feature to cache its inverse and 


## The makeCacheMatrix function creates a function that creates an invertible matrix and cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
   
  i <- NULL
  set <- function(y) {
        x <<- y
        i <<- NULL
  }
  get <- function() x
  setinverse <- function(inv){
    
    i <<-inv
    
  } 
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

  }


## The cacheSolve matrix function checks if the inverse of the matrix exists in the cache and if it does not, it computes an inverse for the matrix and sets the inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
  
  }
