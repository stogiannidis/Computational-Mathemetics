function  L = Cholesky(A)
  n = length(A);
  %Decombosition cholesky can be completed if and only if the matrix is real, 
  %symmetric and positive definite. Positive definite means x'Ax > 0 for each x.
  
 
 L = zeros(size(A));
 
 for j = 1 : n                                         %for each collumn of A
                                                       %see Lectures or Akrivis-Dougalis
   L(j,j) = A(j,j);                                    %Cholesky column version
   for k = 1 : j - 1
     L(j,j) = L(j,j) - L(j,k)^2;
   end
   if L(j,j) <= 0 
     disp('Cholesky decomposition failed')
     return
   end
   L(j,j) = sqrt(L(j,j));
   for i = j + 1 : n
     L(i,j) = A(i,j);
     for k = 1 : j - 1 
       L(i,j) = L(i,j) - L(i,k) * L(j,k);
     end
     L(i,j) = L(i,j) / L(j,j);
   end
   
 end
    
end %function