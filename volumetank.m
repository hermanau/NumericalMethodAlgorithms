%Austin Herman Homework 3
%%Input
h = input('Please input the height of water in the tank in meters: ');
%%Determining Data Makes Sense
tf = isnumeric(h);
if tf == 1
    if h > 0
%%Calculations
        if h <= 19
            v = pi*(25/2)^2*h;
        elseif h <= 33
            v = (pi*12.5^2*19)+(1/3*pi*(h-19)*(12.5^2+(3/4*(h-19)+12.5)*12.5+(3/4*(h-19)+12.5)));
        else 
            error('Function Must Be Less than 33.')
        end 
    else 
        error('Function must be positive.')
    end
else error('Function must be a number.')
end
%%Displaying Final Value
disp(v) 