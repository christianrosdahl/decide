function [launch, cmv, pum, fuv] = decide(points, parameters, lcm, puv)
% DECIDE Decides whether an interceptor should be launched
% based on input radar tracking information.

% OUTPUTS:
%   * launch = true if an interceptor should be launched
%   * cmv = conditions met vector
%   * pum = preliminary unlocking matrix
%   * fuv = final unlocking vector
% INPUTS:
%   * points = matrix containing the coordinates of data points (xi,yi)
%       on the format [x1 y1; x2 y2; ...]
%   * parameters = struct containing parameters for LICs (see below)
%   * lmc = logical connector matrix
%   * puv = preliminary unlocking vector

% Parameters:
length1 = parameters{1}; % Length in LICs 1, 8, 13
radius1 = parameters{2}; % Radius in LICs 2, 9, 14
epsilon = parameters{3}; % Deviation from pi in LICs 3, 10
area1 = parameters{4}; % Area in LICs 4, 11, 15
q_pts = parameters{5}; % Nbr of consecutive points in LIC 5
quads = parameters{6}; % Nbr of quadrants in LIC 5
dist = parameters{7}; % Distance in LIC 7
n_pts = parameters{8}; % Nbr of consecutive points in LIC 7
k_pts = parameters{9}; % Nbr of int. points in LICs 8, 13
a_pts = parameters{10}; % Nbr of int. points in LICs 9, 14
b_pts = parameters{11}; % Nbr of int. points in LICs 9, 14
c_pts = parameters{12}; % Nbr of int. points in LIC 10
d_pts = parameters{13}; % Nbr of int. points in LIC 10
e_pts = parameters{14}; % Nbr of int. points in LICs 11, 15
f_pts = parameters{15}; % Nbr of int. points in LICs 11, 15
g_pts = parameters{16}; % Nbr of int. points in LIC 12
length2 = parameters{17}; % Max. length in LIC 13
radius2 = parameters{18}; % Max. radius in LIC 14
area2 = parameters{19}; % Maximum area in LIC 15

end

