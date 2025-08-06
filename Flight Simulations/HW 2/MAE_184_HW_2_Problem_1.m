%% Problem 2.1 - Estimating Maximum Airspeed of an Aircraft 
syms V
% Inputing Variables
M = V/322; % mach number in terms of velocity and speed of sound
h = 4.5; % altitude provided [km]
rho = 0.78; % density [kg/m^3]
S = 29; % wing reference area [m^2]
m = 12000; % mass [kg]
g = 9.8; % gravity [m/s^2]
W = m*g; % weight [N]

% Given Equations
Cdo = 0.04 + 0.02*tanh(5*(M - 0.95)); % zero-lift drag coefficient function
K = 0.7 + 0.2*tanh(5*(M - 0.95)); % induced drag factor equation

% Max Thrust Equation
T1 = 1000*(78.7 + 13.3*M - 6.3*h + 0.13*h*h + 7.3*M*M - h*M); % output will be in [N]

% Steady, Level Flight Thrust Equation
T2 = (1/2) * rho * (V^2) * S * Cdo + (2 * K * (W^2))/(rho * (V^2) * S); % output will be in [N]

% Finding where thrust equations intersect
intersect = T1==T2; % velocity where they intersect is the maximum airspeed possible
max_airspeed = vpasolve(intersect, V);
fprintf('Maximum airspeed = %.2f m/s\n',max_airspeed);
