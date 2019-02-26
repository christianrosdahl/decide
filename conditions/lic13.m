function fulfilled = lic13(x, y, k_pts, length1, length2)
% LIC13 Checks if there exists at least one set of two data points, 
% separated by exactly k_pts consecutive intervening points, which are a
% distance greater than the length length1 apart. In addition, there exists
% at least one set of two data points (which can be the same of different 
% from the two data points just mentioned), separated by exactly k_pts
% consecutive intervening points, that are a distance less than the length
% length2 apart. Both parts must be true for the LIC to be true.
% The condition is not met when numpoints < 3.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * k_pts = condition parameter (1 <= k_pts <= numpoints - 2)
%   * length1 = condition parameter (length1 >= 0)
%   * length2 = condition parameter (length2 >= 0)

fulfilled = 0;
end