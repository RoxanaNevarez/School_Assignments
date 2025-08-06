%% Problem 2.4 - Finding Quaternion Values

% Given attitudes and heading - must be converted from [deg] -> [rad]
% before plugging into quaternion equations
phi = -45*(pi/180); % roll attitude
theta = 10*(pi/180); % pitch attitude
psi = 90*(pi/180); % heading

% Quaternion Equations
b0 = cos(phi/2)*cos(theta/2)*cos(psi/2) + sin(phi/2)*sin(theta/2)*sin(psi/2);
bx = sin(phi/2)*cos(theta/2)*cos(psi/2) - cos(phi/2)*sin(theta/2)*sin(psi/2);
by = cos(phi/2)*sin(theta/2)*cos(psi/2) + sin(phi/2)*cos(theta/2)*sin(psi/2);
bz = cos(phi/2)*cos(theta/2)*sin(psi/2) - sin(phi/2)*sin(theta/2)*cos(psi/2);

Q_values = [b0 bx by bz];

disp('Quaternion Values:')
disp(Q_values)