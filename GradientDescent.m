clear all
clc

% parameters

x0 = 10;
y0 = 10;
%f = @(x,y) -2*x*y - 2*x + x.^2 + 2*y.^2;
f = @(x,y) x.^2 + y.^2;
%f=@(x,y) 2.5*(x.^2-y.^2).^2 + (1-x).^2;
%f=@(x,y) (1-x)^2 + 100*(y-x^2)^2;
dx = 0.001;
dy = 0.001;
alpha = 0.1;
tolerance = 1e-1;
g = [inf;inf];

%Vizualization
fsurf(f,[-15 15 -15 15]);
pause(5);

iteration = 0;

while norm(g)>tolerance
    %Visualize
    hold on;
    plot3(x0,y0,f(x0,y0),'ok','linewidth',3,'Color','green');
    hold off;
    pause(0.1);
    %iterator
    iteration = iteration + 1;

    %gradient

     f1 = f(x0-dx/2,y0);
     f2 = f(x0+dx/2,y0);
     xGradient = (f2-f1)/dx;
 
     f1 = f(x0,y0-dy/2);
     f2 = f(x0,y0+dy/2);
     yGradient = (f2-f1)/dy;

    g =[xGradient;yGradient];

    %calculate next point
    x0 = x0 - alpha*xGradient;
    y0 = y0 - alpha*yGradient;


end

%result
[x0 y0]