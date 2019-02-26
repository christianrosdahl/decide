function fulfilled = lic7(x, y, n_pts, dist)
% LIC7 Checks if there exists at least one set of n_pts consecutive
% data points such that at least one of the points lies a distance greater
% than dist from the line joining the first and last of these n_pts points.
% If the first and last points of these n_pts are identical, then the
% calculated distance to compare with dist will be the distance from the
% coincident point to all other points of the n_pts consecutive points.
% The condition is not met when numpoints < 3.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * n_pts = condition parameter (3 <= n_pts <= numpoints)
%   * dist = condition parameter (dist >= 0)

fulfilled = 0;
end