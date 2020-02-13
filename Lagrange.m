clc;
close all;
x= [6.54 6.58 6.59 6.61 6.64]; % Write the values of independent variable x.
y = [2.8156 2.8182 2.8189 2.8202 2.8222]; % Write the values of dependent variable y.
% x=[0 1 3 4];
% y=[5 6 50 105];
n=length(x); % Number of terms of X or Y
x0=input('Enter the value of x where we want to find the value of f(x): ');
L=zeros(1,n);% For Lagrange's function.
p=1;q=1;
for i=1:n %Finding Lagrangian coefficients.
    for k=1:n
       if i~=k
        p= p*(x0-x(k));
        q=q*(x(i)-x(k));        
       end      
    end
     L(i)=p/q*y(i);
     p=1;q=1;
end
sol=0;
for i=1:n %Finding final result.
   sol=sol+L(i); 
end
fprintf('The required value is f(%f)= %5.5f',x0,sol);