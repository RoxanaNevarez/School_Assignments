%% Problem 1.5 - Atmospheric Density Ratio

% Establishing parameters
g = 32.2; % gravity [ft/s^2]
R = 1716; % air constant [ft•lb/slug•R]
a = -7/2000; % lapse rate for non-standard hot day
T_5280 = 540; % temperature at 5280ft [R]
T_base = 560; % temperature at base 0ft [R]

T_ratio = T_5280/T_base; % temperature ratio component of density ratio
exp_comp = -(1 + (g/(a*R))); % exponential component of density ratio

rho_ratio = T_ratio^exp_comp; % density ratio

fprintf('Density Ratio: %.2f\n', rho_ratio);
