%% Problem 1.1 - Euler Integration

% Defining Equation of Motion (EOM) Function
function xdot = EOM(x) % xdot is what gets returned; x is the state vector
% Creating state vector x
    t = x(1); % time
    v = x(2); % velocity
    rho = x(3); % density
    m = x(4); % mass
    nabla = x(5); % volume
    cd = x(6); % drag coefficient

    dv_dt = (-1/(2*m)) * rho * (v)^(2) * (nabla)^(2/3) * cd; % equation of motion

    xdot = zeros(6,1); % generates a matrix of 6 rows, 1 column - forces output to have the same dimensions
    xdot(1) = 1; % time (equal to 1 because it's included in state vector)
    xdot(2) = dv_dt; % derivative of velocity is equal to equation of motion
    xdot(3) = 0; % constant density
    xdot(4) = 0; % constant mass
    xdot(5) = 0; % constant volume
    xdot(6) = 0; % constant drag coefficient
end

% Implementing Euler Integration
function xnew = Euler(xold,h) % xnew is what gets returned; Euler integration is used with an initial velocity value xold and timestep h
    xdot = EOM(xold); % xdot is the resulting equation of motion value using xold (initial velocity value)
    xnew = xold + h*xdot; % Euler integration (xold = previous value; xdot = result from above; h = constant timestep)
end

% Simulation Set-Up
dt = 0.1; % integration time step 
nsteps = 300; % 300 timesteps for a coasting time of 30 seconds (final velocity value we want)

% Initial Conditions in State Vector Form
x = [0;% start time
    70; % initial velocity
    0.002377; % density
    200; % mass
    89300; % volume
    0.044]; % drag coefficient

% Running Simulation
for i = 1:nsteps % Euler integration will repeat until time = 30 seconds
    x = Euler(x, dt); % this will run Euler integration using state vector (constantly updated) and time step provided
end

v_30 = x(2); % keeps the final, 2nd value of the state vector (the velocity at 30 seconds)
fprintf('Final Velocity at 30 seconds: %.4f [ft/s]\n', v_30);
