clear;

f = @(x) -1.5*x^6-2*x^4+12*x; %inputting the function

prompt = 'x0?\n';
x0 = input(prompt); %takes the x0 value as the begining
prompt = 'x1?\n';
x1 = input(prompt); %takes the x1 value as the middle
prompt = 'x2?\n';
x2 = input(prompt); %takes the x2 value as the end
prompt = 'iteration count?\n';
N = input(prompt);  %takes the iteration number
iter =1;    %setting initial iteriation to 1
es = 0.5;   %acceptable error margin

prompt ='positive number for max and negative number for min\n';
a = input(prompt);  %input to decide finding minimum or maximum

if a>0  %initiating maximum algorithm

for i = 1:N     %opening loop for iteration
f0 = f(x0);     %calculating x0 value in function
f1 = f(x1);     %calculating x1 value in function
f2 = f(x2);     %calculating x2 value in function

x3 = (f0*(x1^2-x2^2)+f1*(x2^2-x0^2)+f2*(x0^2-x1^2))/(2*f0*(x1-x2)+2*f1*(x2-...
        x0)+2*f2*(x0-x1));  %iterating function for quadratic interpolation

f3 = f(x3); %calulating x3 value in inputted function

if f3>f1    %comparing f3 with middle value f1
    e = abs((x3-x1)/x1)*100;    %relative error calculating
    x0 = x1;    %setting new begning value 
    x1 = x3;    %setting new middle value
    
    if e<es %compares relative error and acceptable error
        break   %breaks the loop when conditions are met
    end
else   
    if f1>f3 && f3 > f2 && x3 < x2 && x3 > x1 %if f1 bigger than f3, locating x3 place to decide which one to change
        x2 = x3;    %changing x2 with x3
    else
        if f1>f3 && f3 > f0 && x3 > x0 && x3 < x1   %if f1 bigger than f3, locating x3 place to decide which one to change
            x0=x3;  %changing x0 with x0
        end
    end
end
end
iter = iter + 1;   %increases iteration number to see which iteration it stops
end

if a<0 %initializing mininmum algortihm

if a>0  %initiating maximum algorithm

for i = 1:N     %opening loop for iteration
f0 = f(x0);     %calculating x0 value in function
f1 = f(x1);     %calculating x1 value in function
f2 = f(x2);     %calculating x2 value in function

x3 = (f0*(x1^2-x2^2)+f1*(x2^2-x0^2)+f2*(x0^2-x1^2))/(2*f0*(x1-x2)+2*f1*(x2-...
        x0)+2*f2*(x0-x1));  %iterating function for quadratic interpolation

f3 = f(x3); %calulating x3 value in inputted function

if f3<f1    %comparing f3 with middle value f1
    e = abs((x3-x1)/x1)*100;    %relative error calculating
    x0 = x1;    %setting new begning value 
    x1 = x3;    %setting new middle value
    
    if e<es %compares relative error and acceptable error
        break   %breaks the loop when conditions are met
    end
else   
    if f1<f3 && f3 < f2 && x3 < x2 && x3 > x1 %if f1 is lesser than f3, checking x3 place to decide which one to change
        x2 = x3; %changing x2 with x3
    else
        if f1<f3 && f3 < f0 && x3 > x0 && x3 < x1 %if f1 is lesser than f3, checking x3 place to decide which one to change
            x0=x3; %changing x0 with x3
        end
    end
end
end
iter = iter + 1;   %increases iteration number to see which iteration it stops
end
end