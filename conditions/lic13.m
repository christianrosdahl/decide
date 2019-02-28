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

if length1 < 0
    error('length1 must satisfy length1 >= 0')
end
if length2 < 0
    error('length2 must satisfy length2 >= 0')
end
if k_pts < 1 || k_pts > length(x) - 2
    error('k_pts must satisfy 1 <= k_pts <= numpoints - 2')
end

fulfilled = 0;
condition1 = 0;
condition2 = 0;

for i = 1:length(x)-1-k_pts % Iterate through data points
    if norm([x(i+k_pts+1) y(i+k_pts+1)] - [x(i) y(i)]) > length1
        condition1 = 1;
    end
end

for i = 1:length(x)-1-k_pts % Iterate through data points
    if norm([x(i+k_pts+1) y(i+k_pts+1)] - [x(i) y(i)]) < length2
        condition2 = 1;
    end
end

if condition1 && condition2
    fulfilled = 1;
end

% Not fulfilled when numpoints < 3.
if length(x) < 3
    fulfilled = 0;
end
end