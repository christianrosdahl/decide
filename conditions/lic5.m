function fulfilled = lic5(x, y, q_pts, quads)
% LIC5 Checks if there exists at least one set of q_pts consecutive
% data points that lie in more than quads quadrants.
% When there is ambiguity as to which quadrant contains a given point,
% priority of decision will be by quadrant number, i.e., I, II, III, IV.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * q_pts = condition parameter (2 <= q_pts <= numpoints)
%   * quads = condition parameter (1 <= quads <= 3)

fulfilled = 0;
end