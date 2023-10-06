
### Functions in R

# brief description: R functions are OBJECTS
# they do calculations for you

# R functions structure: name functions (argument) {statements}
# the arguments specify the components to be used in the function

myfirstfn <- function(x) {x+x}
myfirstfn(10)

# stepwise working functions

mysecondfn <- function(t,z) {
  value = z*3
  value = value *t
  print(value)}

t= 5
z= 9

mysecondfn(t,z)

# in this case the object "value" was used stepwise within the function

# triple dots can be used as a place holder, for any argument to be used
# open ended

testfunction <- function(...){
  mydataframe = data.frame(cbind(...))
  print(mydataframe)}

# lets create some vectors
a = (4:7)
b = c("a","g","h","w")

testfunction(a,b)
# as you can see it is a dataframe, every row is numbered

# and you can use the function in any way you want as long as the vectors h
c = c(4.6, 5.5, 8.9, 11.3)
testfunction(c,b)

#IFELSE statement
# is used to incorporate conditions in functions
# is a bit different to the IF statement (loop section)
# Syntax: ifelse (logical condition or test, 
          # calculation if yes, calculation if no)

x=4
ifelse (x<5, "target", NA)

# example no, condition is not met

x=10
ifelse (x<5, "target", NA)

# can even be nested
# watch the correct number of brackets

# lets create our test vector
# the result should be of same length as this vector

x=c(4,5,6)

ifelse(x < 5, "smaller than",
       ifelse(x==5, "equal to", "greater than"))

# this can be used in functions

ifelsefun <- function(y,z){
  ifelse(y<7, y+z, "above target")}

ifelsefun(4,2) # lets test a positive

ifelsefun(40,7) # this one should be a negative



#### Exercises

# 1. Moving Average

# Create the function movingavg.
# this function is supposed to calculate the moving averages form the 
# vector x, take 3 numbers to calculate your moving avg.

# E.g. x=(1:20)
# (1+2+3)/3, (2+3+4)/3 ----- (18+19+20)/3

x=1:20

movingavg = function(x){
  l <- length(x)
  (x[1:(l-2)] + x[2:(l-1)] + x[3:l])/3}

# we need the length for our calculation
# we use box brackets to specify the index position of the value
 ### to use for the calculation
# we need to specify the position within x, to get correct values
 ### for our  moving average

movingavg(1:20)

# 2. Matrix Function

# Create the function matrixfun. This function returns a matrix
# which doubles every ODD number within the initial matrix.
# test your function with matrix (1:4)

matrixfun <- function(mat){
  mat[mat%%2 == 1] <- 2* mat[mat%%2 ==1] # modulo operator for odd numbers
  mat}

mat <- matrix(1:4, ncol=2)
matrixfun(mat)

# 3. Ifelse

# Create the function nestedfun.
# It should take into consideration the following conditions:

# x<9 : y + 9
# x=9 : x
# x=12 : NA
# else : x-y

# test the function with x=5:15, and y=1:11.

nestedfun = function(x,y){
  ifelse(x<9, y+9, ifelse(x==9, x, ifelse(x==12, NA,x-y)))}

x=5:15
y=1:11

nestedfun(x,y)
