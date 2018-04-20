function I = Simpson(x,y)
%Please provide a vector of independent variable values 'x' and dependent
%values 'y'.  This function will estimate the integral of y over the 
%provided area of x utilizing the Simpson's 1/3 rule.

%Checks to verify number of arg. inputs
if nargin ~= 2
    error('Please provide two horizontal vectors.')
end

%Finds length of two vectors
l = length(x);
m = length (y);
format long

%Verifies vectors are same length
if l ~= m
    error('The input vectors must be the same length')
end

%Finds the distance that would separate each point if it was consistent
space = (x(1,l) - x(1,1))/(l-1);

%Verifies that all spacing values follow the above parameter
for n = 1:l-1
    p = x(1,n+1)-x(1,n);
    if p ~= space
        error('Spacing is not consistent for the provided x values')
    end
end

%Fills space to make MatLab happy
old = 0;

%Checks to see if num. of intervals is odd (num. of points is even)
if rem(l,2) == 0
    
    %Notifies user that trap. rule will be utilized
    fprintf('Since there are an odd number of intervals in your data set, \n the trapezoidal rule will be used on the last interval')
    
    %Runs Simpson's 1/3 Rule for all but last interval
    for j = 1:2:l-3
        save = (x(1,j+2)-x(1,j))*(y(1,j)+4*y(1,j+1)+y(1,j+2))/6;
        old = save + old;
    end
    
    %Runs trap rule for last interval
    trap = (x(1,l)-x(1,l-1)) * (y(1,l) + y(1,l-1))/2;
    
    %Finds total integral
    I = trap + old;

%Runs if num. of intervals is even (num. of points odd)
else
    
    %Runs Simpson's 1/3 Rule for all intervals
    for j = 1:2:l-2
        save = (x(1,j+2)-x(1,j))*(y(1,j)+4*y(1,j+1)+y(1,j+2))/6;
        old = save + old;
    end
    
    %Declares integral value based on previously determined value
    I = old;
end