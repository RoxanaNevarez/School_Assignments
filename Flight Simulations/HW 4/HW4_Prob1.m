%% Homework 4 Problem 1 - 2D Interpolation

% Given Values
x1 = 0.4; % 1st mach value
x2 = 0.6; % 2nd mach value
y1 = 0; % 1st altitude value 
y2 = 2000; % 2nd altitude value
t11 = 83487; % 1st thrust value at mach 1 and altitude 1
t12 = 68952; % 2nd thrust value at mach 1 and altitude 2
t21 = 86328; % 3rd thrust value at mach 2 and altitude 1
t22 = 71665; % 4th thrust value at mach 2 and altitude 2

x3 = 0.44; % 3rd mach value
y3 = 900; % 3rd altitude value

% Thrust at mach 3 with altitude 1
t31 = ((x2-x3) / (x2-x1))*t11 + ((x3-x1) / (x2-x1))*t21;
% Thrust at mach 3 with altitude 2
t32 = ((x2-x3) / (x2-x1))*t12 + ((x3-x1) / (x2-x1))*t22;

% Thrust at mach 3 with altitude 3
t33 = ((y2-y3) / (y2-y1))*t31 + ((y3-y1) / (y2-y1))*t32;
disp('Interpolated Thrust [N]:');
disp(t33)