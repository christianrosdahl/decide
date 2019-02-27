function fulfilled = lic12(x, y, g_pts)
% LIC12 Checks if there exists at least one set of two data points, 
% (x(i), y(i)) and (x(j), y(j)), separated by exactly g_pts consecutive
% intervening points, such that x(j) - x(i) < 0, where j > i.
% The condition is not met when numpoints < 3.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * g_pts = condition parameter (1 <= g_pts <= numpoints - 2)

fulfilled = 0;
end