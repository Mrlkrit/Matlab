clear all
clc

% boundaries

xLeft = input("Left boundary: ");
xRight = input("Right boundary: ");

% define precision of estimation 
tolerance = input("Tolerance: ");

lText = input("Title of the graph: ",'s');

% start error at infinite
error = inf;

% calculate golden ratio 
Ratio = 0.5*(sqrt(5) - 1); % = 0.61.....

% calculate distance between points
distance = abs(Ratio*(xRight - xLeft)); 

% calculate first approximation points(x1 and x2)
x1 = xRight - distance;
x2 = xLeft + distance;

% calculate function values at x1 and x2
f1 = f(x1);
f2 = f(x2);

% count number of iterations(not used for calculations)
if f1 == f2
    iteration = 0;
else
    iteration = 1;
end

% Visualization 
xL = xLeft;
xR = xRight;

% while loop
while error > tolerance

    % Visualize
    fplot(@(x) f(x),[xL-5 xR+5],'-b')
    xlabel('x')
    ylabel('f(x)')
    title(lText)
    hold on;

        xline(xLeft,'Color','blue')
        xline(xRight,'Color','red')
        xline(x1,'Color','red','LineStyle', '--')
        xline(x2,'Color','blue','LineStyle','--')

    hold off;
    drawnow;
    pause(1)

    % iteration
    iteration = iteration + 1;
    % if f1 < f2 the minimum is to the left 
    if f1 < f2
        
        % move upper bound to x2
        xRight = x2;

        % change values: x2 becomes x1 
        x2 = x1;
        f2 = f1;

        % calculate new lower bound
        distance = abs(Ratio*(xRight - xLeft));
        x1 = xRight - distance;

        % calculate function at x1
        f1 = f(x1);

    %if f1 > f2 the minimum is to the right
    elseif f1 > f2

        % move lower bound to x1
        xLeft = x1;

        % change values: x1 becomes x2
        x1 = x2;
        f1 = f2;

        % calculate new upper bound
        distance = abs(Ratio*(xRight - xLeft));
        x2 = xLeft + distance;

        % calculate function at x2
        f2 = f(x2);

    % if f1 = f2 symetric function, extremum in the middle
    else
        % make error = 0
        xLeft = 0;
        xRight = xLeft;
    end

    % calculate error
    error = abs(xRight - xLeft);
    
end

% estimate final result as he middle between x1 and x2
xMinimum = (x1+x2)/2;

% display result
text = ['The answer is: ',num2str(xMinimum),'. Number of iterations: ',num2str(iteration)];
disp(text)


% type equation here
function y = f(x)
%y = x.^3 + 3*x.^2 - 5*x + 2; 
%y = x.^2 - 6*x + 15;
y = x.^2 -6*x - 15;
%y = sin(x);
%y = x.^2;
%y = x.^2 + 5*x;
end
