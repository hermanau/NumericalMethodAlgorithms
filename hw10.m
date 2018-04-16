%Austin Herman HW 10
%I just adjusted my false position algorithm for the purposes of solving
%the equation

format long
xu = .1;
xl = .00000001;
xr = xu;
%Begin loop set to go to max amount of iterations
for n = 1:300
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
    %End loop if you have satisfied the error requirement
    err = abs((xr-xrs)/xr)*100;
    if err<.00001
        break
    end
    %Determine which side you missed on and adjust brackets accordingly
    if func(xr)*func(xl) < 0
        xu=xr;
    else
        xl=xr;
    end
end
disp(xr)