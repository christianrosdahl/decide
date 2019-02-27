function fulfilled = lic1(x, y, length1)
% LIC1 Checks if there exists at least one set of two consecutive
% data points that are a distance greater than the length length1 apart.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * length1 = condition parameter (length1 >= 0)

if length1 < 0
    error('length1 must satisfy length1 >= 0')
end

fulfilled = 0;

for i = 1:length(x)-1 % Iterate through data points
    if norm([x(i+1) y(i+1)] - [x(i) y(i)]) > length1
        fulfilled = 1;
    end
end
end