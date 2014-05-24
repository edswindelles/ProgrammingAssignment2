### Introduction

This repository contains the solution to Programming Assignment 2 from the
R Programming course in the Data Science track from Johns Hopkins Bloomberg
School of Public Health, offered through Coursera.
https://www.coursera.org/specialization/jhudatascience/1

### Example Usage

#### Basic usage

    > m <- matrix(rnorm(25), 5)     # Create a 5x5 matrix of random numbers
    > cache <- makeCacheMatrix(m)   # Create the cache list
    > cache$get()                   # Returns the original matrix
    > cacheSolve(cache)             # Computes the matrix inverse
    > cacheSolve(cache)             # Again, but from cache.  Will see output
                                    #    "getting cached data"

#### Demonstrate caching performance:

    > x <- 2000
    > m <- matrix(rnorm(x^2), x)
    > c <- makeCacheMatrix(m)
    > t <- system.time(cacheSolve(c))
    > t
       user  system elapsed 
     23.930   0.073  24.122 
    > t <- system.time(cacheSolve(c))
    getting cached data
    > t
       user  system elapsed 
          0       0       0 