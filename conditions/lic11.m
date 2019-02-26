function fulfilled = lic11(x, y, e_pts, f_pts, area1)
% LIC11 Checks if there exists at least one set of three data points 
% separated by exactly e_pts and f_pts consecutive intervening points, 
% respectively, that are the vertices of a triangle with area greater than
% area1.
% The condition is not met when numpoints < 5.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * e_pts = condition parameter 
%       (e_pts >= 1, e_pts + f_pts <= numpoints - 3)
%   * f_pts = condition parameter
%       (f_pts >= 1, e_pts + f_pts <= numpoints - 3)
%   * area1 = condition parameter (area1 >= 0)

fulfilled = 0;
end