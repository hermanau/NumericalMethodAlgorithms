## Integration Techniques
This folder contains functions that can be used to numerically integrate vectors of points rather
than an actual equation or function.  This is very helpful when working with real world values 
for which an equation may not be easily obtained.

### Functions
#### Simpson
- This function will utilize Simpson's 1/3 rule in numerically integrating a vector of dependent
and independent values.  In the case that there are an odd number of intervals, the last interval
will be calculated as a trapezoid and added to the total.

##### Inputs
- x is the vector of independent values, should be evenly spaced
- y is the vector of dependent values that correspond to the independent value in the same location

##### Outputs
- I is the calculated value of the integral for the given values

##### Function Processes
- The function begins by checking for various errors that could exist (vectors aren't the same 
length, wrong number of argumnet inputs)
- The function then determines the spacing between x-values and checks to make sure that the 
spacing is even
- The function proceeds by checking whethere there are an even or odd number of intervals and
proceeds to implement the Simpson's 1/3 Rule and Trapezoidal rule as needed before totaling
the values and outputting the integral total
