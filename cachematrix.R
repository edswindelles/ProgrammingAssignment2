# Functions to compute the inverse of a matrix with caching.

# Example usage:

# > m <- matrix(rnorm(25), 5)     # Create a 5x5 matrix of random numbers
# > cache <- makeCacheMatrix(m)   # Create the cache list
# > cache$get()                   # Returns the original matrix
# > cacheSolve(cache)             # Computes the matrix inverse
# > cacheSolve(cache)             # Again, but from cache.  Will see output
#                                 #    "getting cached data"

# Demonstrate caching performance:

# > x <- 2000
# > m <- matrix(rnorm(x^2), x)
# > c <- makeCacheMatrix(m)
# > t <- system.time(cacheSolve(c))
# > t
#    user  system elapsed 
#  23.930   0.073  24.122 
# > t <- system.time(cacheSolve(c))
# getting cached data
# > t
#    user  system elapsed 
#       0       0       0 


# Caching function for a matrix argument.  Returns a vector 
# of getters and setters for the matrix itself, as well as 
# placeholders for the matrix inverse calculation.

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) m <<- inverse
	getinverse <- function() m
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


# Calculates the inverse of an assumed square matrix, or retrieves
# a previously calculated inverse from cache, given a list argument
# from the function makeCacheMatrix().

cacheSolve <- function(x, ...) {
	m <- x$getinverse()
	if(!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- solve(data) %*% data
	x$setinverse(m)
	m
}

# @rdpeng: Best viewed with a tab size of 3.  :-)