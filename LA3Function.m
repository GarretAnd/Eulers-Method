function [finalx,finaly] = LA3Function(x,y,Stepper)
%Function That Plugs The Current X Into The Deriver 
%   Takes The X Value At The Location We Are Looking At And Passes It To
%   This Equation Which Then Runs It Through The Given Slope Equation And
%   Returns The Slope Value Along With The Change in Y, allowing a new
%   point to be plotted. 


finalx = x+Stepper;

yprime = 2 - exp(-4.*x) - 2.*y;

finaly = yprime.*Stepper + y;



end

