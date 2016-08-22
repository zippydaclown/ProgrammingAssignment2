## Create variables, some of which are defined as functions,
## some as nested functions, and others as cached variables, and they use the functions 
## to move these data in and out of the environment

## MakeCacheMatrix receives a matrix variable, and sets variables and functions in memory, 
## and returns a list of functions nested within makeCacheMatrix.

makeCacheMatrix <- function(x = matrix()) {local_m <- NULL                                           
set <- function(y) {                                    
  cache_x <<- y                                   
  cache_m <<- NULL                                          
}
get <- function() cache_x                               
set_cache_m <- function(local_m) cache_m <<- local_m            
get_cache_m <- function() cache_m                       
list(set = set, get = get,
     set_cache_m = set_cache_m,
     get_cache_m = get_cache_m)

}


## cacheSolve returns the inverted form of the submitted matrix

cacheSolve <- function(x, ...) {local_m<- x$get_cache_m()              
if(!is.null(local_m)) {                 
  message("getting cached data")  
}                                       
startingmatrix <- x$get()                                        
endingmatrix <- solve(startingmatrix)   
x$set_cache_m(endingmatrix)            
endingmatrix 
        ## Return a matrix that is the inverse of 'x'
}
