##this func to store a new  inverse 
makeCacheMatrix <- function(x = matrix()) {
## initialize the values
  inverse <-NULL
  set<- function(y){
  x<<-y
  m<<-NULL
}
##get the current value of x
get<-function() x
##cache the x 
setinv<-function(solve) inverse<<- solve
##reterive teh cached  value
getinv<-function() inverse
##update teh list for current values
list(set=set, get=get,
   setinv=setinv,
   getinv=getinv)
}
##compute the inverse only if not there 
cacheSolve <- function(x, ...) {
##update the existing values 
	inverse<-x$getinv()
##check if the inverse is empty if not use the current value of inverse
	if(!is.null(inverse)){
      message("getting cached data")
      return(inverse)
    }
##use data from get	
    data<-x$get()
    inverse<-solve(data)
##cache inverse    
	x$setinv(inverse)
    inverse
}
