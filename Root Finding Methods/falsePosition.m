function falsePosition(func, xl, xu, es, maxiter)
%Please provide the function in the format " '@(x)(x^2)' "
%The first three inputs are required for the function to work

%HW 9: Austin Herman
%Check to see if number of inputs is correct, change values accordingly
if nargin < 5, maxiter = 200; end
if nargin < 4, es = .0001; end
if nargin < 3, error('Please provide at least three arguments'); end

%Change format so that calculations are more accurate
format long;

%Provide beginning value for xr so xrs has something to save
xr = xu;

%Begin loop set to go to max amount of iterations
for n = 1:maxiter
    %Use count to keep track of # of iterations
    count = n;
    %Use xrs, xus, and xls to save xr, xl, xu for error calculations
    xrs = xr;
    xls = xl;
    xus = xu;
    %Calculate root estimation
    xr = xu - (func(xu)*(xu-xl))/(func(xu)-func(xl));
    %End loop if you hit the root
    if func(xr) == 0
        break
    end
    %Make sure root that is found makes sense
    if xr<xls
        error('The resulting root was not within the parameters you provided, please try new brackets')
    end
    if xr>xus
        error('The resulting root was not within the parameters you provided, please try new brackets')  
    end
    %End loop if you have satisfied the error requirement
    err = abs((xr-xrs)/xr)*100;
    if err<es
        break
    end
    %Determine which side you missed on and adjust brackets accordingly
    if func(xr)*func(xl) < 0
        xu=xr;
    else
        xl=xr;
    end
end
%Display function outputs
X = ['The found root is: ',num2str(xr)];
disp(X)
Y = ['The function evaluated at said root is: ',num2str(func(xr))];
disp(Y)
T = ['The approximate relative error here is: ',num2str(err)];
disp(T)
V = ['The iterations required to reach this root was: ',num2str(count)];
disp(V)