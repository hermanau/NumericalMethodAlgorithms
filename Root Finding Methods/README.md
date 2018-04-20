## Root Finding Methods
This folder contains algorithms that can be employed to find the root of a function.

### Functions

#### Closed Methods
- These methods provide a safe and relatively low risk way to iterate to a root on a
desired interval for a provided function.

##### False Position Method
- This function uses a simple equation involving an estimation of an equations value to 
iterate around and find a root on a provided interval.

###### Inputs
- func is the function that is being examined given in @(x) f(x) format
- xl is the lower bound for the interval where a root is being looked for
- xu is the upper bound for the interval where a root is being looked for
- es is the maximum error as designated by the user
- maxiter is the maximum number of iterations that the user wants the function to perform

###### Outputs
- root is the location of the root as found by the function
- fx is the value of the function at the root that was found
- ea is the estimated error at the given point
- iter is the number of iterations required to reach the output provided

###### Function Processes
- The function begins by performing error checks and inputing default values if the
user opted not to choose a specific error or iteration max.
- Then the function begins an iterative loop that 
  - Guesses the root location using the false position equation
  - Checks which side of the root the equation missed on using sign changes
  - Checks error approximation based on previously found root value
  - Will break out of loop if error or iterative requirements are met or root is hit
- The function then displays the values that it found
