%% Homework 4 Problem 4 - Body Positions
% Known Information
p1 = sqrt(5);
p2 = p1;
p3 = p1;
L1 = 2;
L2 = sqrt(2);
L3 = L2;
gamma = pi/2;
x1 = 4;
x2 = 0;
y2 = 4;

% Governing Equations
syms theta
A2 = L3*cos(theta) - x1;
A3 = L2*cos(theta + gamma) - x2;
B2 = L3*sin(theta);
B3 = L2*sin(theta + gamma) - y2;

% Corrected denominators
denominator = 2*(A2*B3 - B2*A3);

% Numerators
N1_num = B3*(p2^2 - p1^2 - A2^2 - B2^2) - B2*(p3^2 - p1^2 - A3^2 - B3^2);
N2_num = A2*(p3^2 - p1^2 - A3^2 - B3^2) - A3*(p2^2 - p1^2 - A2^2 - B2^2);

% N1 and N2
N1 = N1_num / denominator;
N2 = N2_num / denominator;

% Governing equation
eqn = N1^2 + N2^2 == p1^2;

% Solve for theta
theta_sol = solve(eqn, theta, 'Real', true);

disp('Theta Solution(s) [deg]:')
disp(rad2deg(theta_sol))

