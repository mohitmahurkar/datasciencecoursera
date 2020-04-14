## the first function, makeCaacheMatrix creates a special "matrix", which is really a list containing a function to

# 1.set the value of the matrix
# 2.get the value of the matrix
# 3.set the value of the inverse
# 4.get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}





## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. 


cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- inverse(data, ...)
  x$setinverse(m)
  m
        
}
