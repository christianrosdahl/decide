function fulfilled = lic6(x, y)
% LIC6 Checks if there exists at least one set of two consecutive data
% points (x(i), y(i)) and (x(i+1), y(i+1)) such that x(i+1) - x(i) < 0.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points

fulfilled = 0;

for i = 1:length(x)-1 % Iterate through data points
    if x(i+1) - x(i) < 0
        fulfilled = 1;
    end
end
end