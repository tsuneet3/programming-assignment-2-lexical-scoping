#creating a cache matirx using a function

makeCacheMatrix <- function(x = numeric()) {
        
      
        # initially set it to NULL
        cache <- NULL
        
        # storing a matrix
        setMatrix <- function(newValue) {
                x <<- newValue
                # since the matrix is assigned a new value, flush the cache
                cache <<- NULL
        }

        # getting matrix
        getMatrix <- function() {
                x
        }

        # caching the argument 
        cacheInverse <- function(solve) {
                cache <<- solve
        }

        # getting the value
        getInverse <- function() {
                cache
        }
        
        # returning the value in list
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


# Calculating the inverse of "special" matrix
# makeCacheMatrix
cacheSolve <- function(y, ...) {
        # get the cached value
        inverse <- y$getInverse()
        # if a cached value exists return it
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        # otherwise get the matrix, caclulate the inverse and store it in
        # the cache
        data <- y$getMatrix()
        inverse <- solve(data)
        y$cacheInverse(inverse)
        
        # returning the inverse value
        inverse
}
