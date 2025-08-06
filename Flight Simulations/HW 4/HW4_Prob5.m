%% Homework 4 Problem 5 - Elevator Hinge Moment

% Known Information
q = 30; % dynamic pressure [lb/ft^2]
Sh = 38.5; % horizontal tail area [ft^2]
cbar_h = 3.4; % horizontal tail chord [ft]
Ch0 = 0;
Ch_alpha = -0.06; % [1/rad]
Ch_delE = -0.6; % [1/rad]
alpha = deg2rad(1.8); % angle of attack
delta = deg2rad(2); % deflection of elevator

% Solving for Ch
Ch = Ch0 + Ch_alpha*alpha + Ch_delE*delta;

% Solving for HM
HM = q*Sh*cbar_h*Ch;
disp('HM [ft-lb]:')
disp(HM)
