function [midx,midy] = EulersMid(x,y,Stepper)
% Uses The Midpoint Method To Solve Differential Equations 
%   Takes The X Value At The Location We Are Looking At And Passes It To
%   This Equation Which Then Runs It Through The Given Slope Equation And
%   Returns The Slope Value Along With The Change in Y, This Change In Y Is Then
%   Multiplied By The Derivative Function At The Current Y And Then Added
%   Onto The Current Y Allowing A New Point To Be Plotted.
%   The Change In Y Is Determined By
%   Multiplying The Determined Slope By The Change In X Passed To The
%   Function Via Stepper.

midx = x+Stepper;



end

