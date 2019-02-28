%% Main program for running the decide function

% Parameters:
length1 = 2; % Length in LICs 1, 8, 13
radius1 = 10; % Radius in LICs 2, 9, 14
epsilon = 3*pi/4; % Deviation from pi in LICs 3, 10
area1 = 7; % Area in LICs 4, 11, 15
q_pts = 3; % Nbr of consecutive points in LIC 5
quads = 2; % Nbr of quadrants in LIC 5
dist = 10; % Distance in LIC 7
n_pts = 4; % Nbr of consecutive points in LIC 7
k_pts = 1; % Nbr of int. points in LICs 8, 13
a_pts = 1; % Nbr of int. points in LICs 9, 14
b_pts = 1; % Nbr of int. points in LICs 9, 14
c_pts = 1; % Nbr of int. points in LIC 10
d_pts = 1; % Nbr of int. points in LIC 10
e_pts = 1; % Nbr of int. points in LICs 11, 15
f_pts = 1; % Nbr of int. points in LICs 11, 15
g_pts = 1; % Nbr of int. points in LIC 12
length2 = 1; % Max. length in LIC 13
radius2 = 2; % Max. radius in LIC 14
area2 = 10; % Maximum area in LIC 15

parameters = {};
parameters{1} = length1;
parameters{2} = radius1;
parameters{3} = epsilon;
parameters{4} = area1;
parameters{5} = q_pts;
parameters{6} = quads;
parameters{7} = dist;
parameters{8} = n_pts;
parameters{9} = k_pts;
parameters{10} = a_pts;
parameters{11} = b_pts;
parameters{12} = c_pts;
parameters{13} = d_pts;
parameters{14} = e_pts;
parameters{15} = f_pts;
parameters{16} = g_pts;
parameters{17} = length2;
parameters{18} = radius2;
parameters{19} = area2;

% Logical Connector Matrix (lcm)
lcm = zeros(15,15);
lcm(1,1) = 2; lcm(1,2) = 2; lcm(1,3) = 1; lcm(1,4) = 2;
lcm(2,1) = 2; lcm(2,2) = 2; lcm(2,3) = 1; lcm(2,4) = 1;
lcm(3,1) = 1; lcm(3,2) = 1; lcm(3,3) = 2; lcm(3,4) = 2;
lcm(4,1) = 2; lcm(4,2) = 1; lcm(4,3) = 2; lcm(4,4) = 2;

% Preliminary Unlocking Vector (puv)
% The elements of puv indicate whether the corresponding LIC is to be
% considered as a factor in signaling interceptor launch.
puv = zeros(15,1);
puv(1) = 1;
puv(2) = 1;

% Data points (on format [x1 y1; x2 y2; ...])
points = [0 0; 1 1; 2 2; 3 3; 4 4];

% Run the decide function
[launch, cmv, pum, fuv] = decide(points, parameters, lcm, puv)