function fulfilled = lic14(x, y, a_pts, b_pts, radius1, radius2)
% LIC14 Checks if there exists at least one set of three data points, 
% separated by exactly a_pts and b_pts consecutive intervening points, 
% respectively, that cannot be contained within or on a circle of radius
% radius1. In addition, there exists at least one set of three data points
% (which can be the same or different from the three data points just
% mentioned) separated by exactly a_pts and b_pts consecutive intervening
% points, respectively, that can be contained in or on a circle of radius
% radius2. Both parts must be true for the LIC to be true.
% The condition is not met when numpoints < 5.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * a_pts = condition parameter 
%       (a_pts >= 1, a_pts + b_pts <= numpoints - 3)
%   * b_pts = condition parameter
%       (b_pts >= 1, a_pts + b_pts <= numpoints - 3)
%   * radius1 = condition parameter (radius1 >= 0)
%   * radius2 = condition parameter (radius2 >= 0)

fulfilled = 0;
end