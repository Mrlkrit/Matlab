close all
clear all
clc

syms x;
%functions to calculate
f(x) = x.^2 - 2*x;

%calculate gradient
gradx = diff(f,x);
%specify start point
x = input("Enter x value: ");
% parameter
a = input("Enter alpha parameter: ");
%tolerance
tolerance = input("Enter tolerance: ");
maxi = input("Enter max iteration: ");
%display function plot boundaries
xL = input("Left boundary: ");
xR = input("Right boundary: ");

i=1;
vecx = [x];
vecy = [f(x)];
while gradx(x)>=tolerance && i <= maxi
%visualization
fplot( f,[xL-5 xR+5],'-b');
xlabel('x');
ylabel('f(x)');

hold on;
plot(vecx,vecy,'r*');
plot(x,f(x),'g*');
hold off;

drawnow;
pause(1)

%calculate new x value
x=x-a.*gradx(x);
%display calculated values (17 digits)
fprintf('i=%i, x=%1.17f, f(x)=%1.17f \n', i, x, f(x));

i = i + 1;
vecx(i)=x;
vecy(i)=f(x);
end


