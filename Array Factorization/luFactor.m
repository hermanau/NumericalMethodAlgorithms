function [L,U,P] = luFactor(A)
% This function provides an L matrix 
% and U matrix such that L*U = P*A.
% It does this using partial pivoting 
% and Gaussian elimination.

%This obtains the number of rows and columns in the matrix
[s,m] = size(A);

%Checks if matrix is square
if s ~= m
    error('The matrix provided was not square, please provide a square matrix')
end

%Creates an identity matrix to be used to store pivoting
P = eye(s);

%Creates an identity matrix for L values to be stored in
L = eye(s);

%Performs pivoting and then calculations for each column
for k = 1:s
    
    %Determines where the highest value is in the column of interest
    [val,loc] = max(abs(A(k:s,k)));
    
    %Corrects location value if it's not in the first column
    loc = loc + k - 1;
    
    %Pivoting: if the max value is not already in the current point of 
    %interest, cond. isn't met, pivoting occurs.
    if loc ~= k
        
        %Performs the actual pivot; i.e. switches rows
        save = A(k,:);
        A(k,:) = A(loc,:);
        A(loc,:) = save;
        
        %Pivots P matrix to save change
        save = P(k,:);
        P(k,:) = P(loc,:);
        P(loc,:) = save;
        
        %Error check to make sure values are correct
        if min(abs(A(k:s,k)))/val > 1
            error('Something has gone wrong, please retry')
        end
        
        %Pivots L matrix to keep L matrix in line with U matrix values
        if k > 1
            save = L(k,1:k-1);
            L(k,1:k-1) = L(loc,1:k-1);
            L(loc,1:k-1) = save;
        end
    end
    
    %Performs actual calculations for Gaussian elimination
    for l = 1+k:s
        L(l,k) = A(l,k)/A(k,k);
        A(l,:) = A(l,:)-L(l,k)*A(k,:);
    end
end

%Creates U from augmented A matrix
U = A;
    
            