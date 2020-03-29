function [finalx,finaly] = LA3Function2(x2,y2,Stepper2)
%Function That Plugs The Current X Into The Deriver 
%   Takes The X Value At The Location We Are Looking At And Passes It To
%   This Equation Which Then Runs It Through The Given Slope Equation And
%   Returns The Slope Value Along With The Change in Y, Allowing A New
%   Point To Be Plotted By Adding This Change In Y Onto The Current Y That
%   Was Passed To The Function. The Change In Y Is Determined By
%   Multiplying The Determined Slope By The Change In X Passed To The
%   Function Via Stepper.


finalx = x2+Stepper2;

yprime = y2 - .5*exp(x2./2)*sin(5.*x2) + 5*exp(x2./2)*cos(5.*x2);

finaly = yprime.*Stepper2 + y2;

end

