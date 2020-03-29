function [finalx,finaly] = LA3Function1(x,y,Stepper)
%Function That Plugs The Current X Into The Deriver 
%   Takes The X Value At The Location We Are Looking At And Passes It To
%   This Equation Which Then Runs It Through The Given Slope Equation And
%   Returns The Slope Value Along With The Change in Y, Allowing A New
%   Point To Be Plotted By Adding This Change In Y Onto The Current Y That
%   Was Passed To The Function. The Change In Y Is Determined By
%   Multiplying The Determined Slope By The Change In X Passed To The
%   Function Via Stepper.


finalx = x+Stepper;

yprime = 2 - exp(-4.*x) - 2.*y;

finaly = yprime.*Stepper + y;



end

