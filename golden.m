format long
f = @(x) -x^2+8*x-12;
gr = (1+sqrt(5))/2;
xl = 2; xu = 6;
for n = 1:100
    d = (xu-xl)/gr;
    x1 = xl + d;
    x2 = xu - d;
    if f(x1)>f(x2)
        xl = x2;
    else
        xu = x1;
    end
end
    