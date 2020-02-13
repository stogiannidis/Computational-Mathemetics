clc;
clear all;
f=@(x)cos(x)-log(x)+exp(x); %Change here for different function
 a=input('Enter lower limit a: '); % exmple a=1
 b=input('Enter upper limit b: ');  % exmple b=2
 n=input('Enter the  number of sub-intervals n: '); % exmple n=16
 h=(b-a)/n;
if rem(n,2)==1
   fprintf('\n Enter valid n!!!'); 
   n=input('\n Enter n as even number ');
end
for k=1:1:n
  x(k)=a+k*h;
  y(k)=f(x(k));
end
 so=0;se=0;
for k=1:1:n-1
    if rem(k,2)==1
       so=so+y(k);%sum of odd terms
     else
       se=se+y(k); %sum of even terms
    end
end
% Formula:  (h/3)*[(y0+yn)+2*(y3+y5+..odd term)+4*(y2+y4+y6+...even terms)]
answer=h/3*(f(a)+f(b)+4*so+2*se);
fprintf('\n The value of integration is %f',answer); % exmple The value of integration is 0.408009