% Find result of the Newton interpolating polynomial at a point.

% Example usage:
% station4x = [7, 14, 21, 28];
% station4y = [32, 34, 36, 35];
% pointToSolve = 10;
% station4Newton = NewtonInterpolation(station4x, station4y, pointToSolve)

function [ output ] = NewtonInterpolation( xValues, yValues, point )

    % Create the output variable for leter, and get number of data points.
    output = 0;
    dataPointCount = length(xValues);
    
    % Setup blank matrix to store the output of iterations.
    q = zeros(dataPointCount, dataPointCount+1);
    
    % Keep track of iteration number, and the iteration limit.
    iteration = 0;
    maxIteration = dataPointCount - 1;
    
    % Store the x values as the first column, and y values in second.
    while iteration <= maxIteration  
        q(iteration+1, 0+1) = xValues(iteration + 1);
        q(iteration+1, 1+1) = yValues(iteration + 1); 
        iteration = iteration + 1;
    end
    
    % Fill in the matrix with the correct values.
    j = 3;
    k = 1;
    while j <= dataPointCount+1
        i = 1;
        while i <= dataPointCount+2-j
            q(i, j) = (q(i+1, j-1) - q(i, j-1)) / (q(i+k, 1) - q(i, 1));
            i = i + 1;
        end
        j = j + 1;   
        k = k + 1;
    end
    
    % Find the output using the matrix.
     l = 2;
     m = 1;
     while l <= maxIteration + 2
        ddProduct = q(1, l);
        n = 1;
        while n < m
            ddProduct = ddProduct * (point - q(n, 1));
            n = n + 1;
        end
        output = output + ddProduct;
        m = m + 1;
        l = l + 1;
     end
     
     return    
end


station4x = [7, 14, 21, 28];
station4y = [32, 34, 36, 35];
pointToSolve = 10;
station4Newton = NewtonInterpolation(station4x, station4y, pointToSolve)
