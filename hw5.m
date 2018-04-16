function array=hw5(n,m)
%this pre-allocation allows for faster processing
array = ones(n,m);
if isinteger(n) & isinteger(m)
    for r = 1 : n
        for c = 1 : m
%makes first row ascending integers
            if r == 1
                array(r,c) = c;
%makes first column ascending integers
            elseif c == 1
                array(r,c) = r;
            else
                array(r,c) = array(r,c-1) + array(r-1,c);
            end
        end
    end
else
    error('Put in integers')
end