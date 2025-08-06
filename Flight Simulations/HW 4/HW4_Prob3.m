%% Homework 4 Problem 3 - Estimating Aerodynamic Derivative Values
% Load Provided T38 Data
data = readtable('T38_aileron.csv');

% Extract Data Columns
time = data{:,1};            % seconds
aileron = data{:,2};         % radians
roll_rate = data{:,3};       % rad/s

% Computing dp/dt (needed for First EOM)
dpdt = gradient(roll_rate, time);

% Known constants
Ixx = 7850; % MoI [slug-ft^2]
qbar = 200; % dynamic pressure [lbf/ft^2]
S = 170; % wing area [ft^2]
b = 25.5; % wingspan [ft]
V = 830; % airspeed [ft/s]

% Isolating Cl from 1st EOM
Cl1 = Ixx * dpdt ./ (qbar * S * b);

% Cl terms from 2nd EOM
% First Term of Cl equation (would be multiplied by Clp)
Cl21 = (b / (2 * V)) * roll_rate; % roll_rate extracted from data
% Second Term of Cl equation (would be multiplied by Clda)
Cl22 = aileron;

% Matrix for Linear Regression
Cl = [Cl21, Cl22]; % extracted from data

% Perform linear regression: rhs = X * [Clp; Clda]
Cl_coeffs = Cl \ Cl1;

% Extract Clp and Clda
Clp = Cl_coeffs(1);
Clda = Cl_coeffs(2); % adjusted but not needed

% Display Clp
fprintf('Estimated Clp: %.5f\n', Clp);
