%% Problem 1.2 - Ralston Integration

% Definition Equation of Motion (EOM) Function
function xdot = EOMS(x) % xdot is what gets returned, x is the state vector
    I1 = 182; % first constant variable
    I2 = 187; % second constant variable
    I3 = 194; % third constant variable

    % Establishing state vector
    t = x(1); % time
    w1= x(2); % 1-axis rotation rate (omega_1 - rad/s)
    w2 = x(3); % 2-axis rotation rate (omega_2 - rad/s)
    w3 = x(4); % 3-axis rotation rate (omega_3 - rad/s)

    dw1_dt = (1/I1) * (I2 - I3) * w3 * w2; % first equation of motion
    dw2_dt = (1/I2) * (I3 - I1) * w3 * w1; % second equation of motion
    dw3_dt = 0; % third equation of motion

    xdot = zeros(4,1); % generates 4x1 matrix and forces output to have same dimensions
    xdot(1) = 1; % value of 1 because time is included in state vector
    xdot(2) = dw1_dt; % derivative is the same as first equation of motion
    xdot(3) = dw2_dt; % derivative is the same as second equation of motion
    xdot(4) = dw3_dt; % derivative is the same as third equation of motion
end

% Simulation Set-Up
h = 0.05; % step size
nsteps = 600; % will result in a total elapsed time of 30 seconds with the given step size

% Initial Conditions in State Vector Form
x0 = [0; % start time
    0.1; % initial omega_1 value - rad/s
    0.01; % initial omega_2 value - rad/s
    6.2832]; % initial omega_3 value - rad/s

x = zeros(4,nsteps); % establishes matrix of 4 x 601 (4 variables, 601 time steps) of all zeros

x(:,1) = x0; % stores the initial state vector in the first column of the 4 x 601 matrix 

% Running Ralston Integration Simulation
for i = 1:nsteps % runs Ralston Integration until a total elapsed time of 30 seconds
    xold = x(:,i);
    r1 = EOMS(xold); 
    r2 = EOMS(xold + (2/3)*h*r1);
    x(:,i+1) = xold + (h/4)*(r1 + 3*r2);
end

plot(x(2,:) * (180/pi), x(3,:) * (180/pi)); % converts rad/s --> deg/s and plots outputs for elapsed time
grid on;
xlabel('1-Axis Rotational Rate \omega_1 (deg/s)')
ylabel('2-Axis Rotational Rate \omega_2 (deg/s)')
title('Problem 1.2 - Helios Spacecraft Simulation Plot')

![Image](https://github.com/user-attachments/assets/2d573c89-6694-4e5c-bb45-d705e8749ed4) 
