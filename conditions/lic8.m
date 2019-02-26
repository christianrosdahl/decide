function fulfilled = lic8(x, y, k_pts, length1)
% LIC8 Checks if there exists at least one set of two data points separated
% by exactly k_pts consecutive intervening points that are a distance
% greater than the length length1 apart.
% The condition is not met when numpoints < 3.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * k_pts = condition parameter (1 <= k_pts <= numpoints - 2)
%   * length1 = condition parameter (lenght1 >= 0)

fulfilled = 0;
end