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
%   * lmc = logical connector matrix: 0 = notused, 1 = or, 2 = and
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

x = points(:,1); % x-coordinates of data points
y = points(:,2); % y-coordinates of data points

% Compute Conditions Met Vector (cmv):
addpath('conditions')
cmv = zeros(15,1);
cmv(1) = lic1(x, y, length1);
cmv(2) = lic2(x, y, radius1);
cmv(3) = lic3(x, y, epsilon);
cmv(4) = lic4(x, y, area1);
cmv(5) = lic5(x, y, q_pts, quads);
cmv(6) = lic6(x, y);
cmv(7) = lic7(x, y, n_pts, dist);
cmv(8) = lic8(x, y, k_pts, length1);
cmv(9) = lic9(x, y, a_pts, b_pts, radius1);
cmv(10) = lic10(x, y, c_pts, d_pts, epsilon);
cmv(11) = lic11(x, y, e_pts, f_pts, area1);
cmv(12) = lic12(x, y, g_pts);
cmv(13) = lic13(x, y, k_pts, length1, length2);
cmv(14) = lic14(x, y, a_pts, b_pts, radius1, radius2);
cmv(15) = lic15(x, y, e_pts, f_pts, area1, area2);

% Compute Preliminary Unlocking Matrix (pum):
pum = zeros(15,15);
% In lcm: 0 = not used, 1 = or, 2 = and
for i = 1:15
    for j = 1:15
        if lcm(i,j) == 2 % The logical connector is 'and'
            if cmv(i) == 1 && cmv(j) == 1
                pum(i,j) = 1;
            end
        elseif lcm(i,j) == 1 % The logical connector is 'or'
            if cmv(i) == 1 || cmv(j) == 1
                pum(i,j) = 1;
            end
        else % The logical connector is 'notused'
            pum(i,j) = 1;
        end
    end
end

% Compute Final Unlocking Vector (fuv): 
fuv = zeros(15,1);
for i = 1:15
    if puv(i) == 0 % The LIC should not be considered.
        fuv(i) = 1;
    end
    if sum(pum(i,:)) == 15 % All entries of row i in pum are true.
        fuv(i) = 1;
    end
end

% Final launch/no launch decision:
if sum(fuv) == 15 % If all entries in fuv are true
    launch = 'YES';
else
    launch = 'NO';
end
end

