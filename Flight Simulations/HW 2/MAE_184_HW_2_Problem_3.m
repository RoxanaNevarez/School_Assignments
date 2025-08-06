%% Problem 2.3 - Finding Bank Angle for Standard Rate Turn at Constant Altitude

% Given Values
V = 33; % airspeed
dchi_dt = pi/60; % turn rate [rad/s]
g = 9.8; % gravity [m/s^2]

% Solving for Bank Angle
mu_rad = atan((V/g)*dchi_dt); % bank angle equation [rad/s]
mu = (180/pi)*mu_rad; % converting anwer from [rad] -> [deg]
fprintf('Bank Angle: %.2f [deg]\n', mu);
