%% Problem 2.2 - Rocket Trajectory

%%%%%%%%%%%%%%%%% Everything Below is For Reported Airspeed %%%%%%%%%%%%%%%%% 

% Importing data from reported airspeed trajectory
reported_data = readmatrix('ng1.csv');
time_data = reported_data(:,1); % time [s]
speed_data = reported_data(:,2)/1000; % airspeed [km/s]

% Plot Reported Airspeed Results
figure;
plot(time_data, speed_data, 'r');
hold on;

%%%%%%%%%%%%%%%%% Everything Below is For Simulated Airspeed %%%%%%%%%%%%%%%%% 

% Runge-Kutta Integration
function xnew = RK4(xold, h)
    r1 = h*EOMS(xold);
    r2 = h*EOMS(xold + 0.5*r1);
    r3 = h*EOMS(xold + 0.5*r2);
    r4 = h*EOMS(xold + r3);
    xnew = xold + (r1 + 2.0*r2 + 2.0*r3 + r4)/6.0;
end

% Equations of Motions Function
function dxdt = EOMS(x)
    % Constants
    g0 = 9.8; % sea-level gravity [m/s^2]
    RE = 6378000.0; % Earth radius [m]
    tau = 120.0; % guidance time constant [s]
    Isp1 = 340; % specific impulse at stage 1
    Isp2 = 445; % specific impulse at stage 2

    % Creating State Vector
    time = x(1); % time [s]
    V = x(2); % airspeed [m/s]
    gamma = x(3); % flight path angle [rad]
    h = x(4); % altitude [m]
    m = x(5); % mass [kg]
    T = x(6); % thrust [N]

    % Specific Impulse [Isp] at Given Stage
    if time < 180
        Isp = Isp1; % specific impulse right before stage 1 ends
    elseif time >= 180 && time < 780
        Isp = Isp2; % specific impulse at stage 2
    else 
        Isp = Isp2; % assuming specific impulse remains constant beyond 780 seconds
    end

    dxdt = zeros(6,1); % preallocating for computational speed

    % Equations of Motion
    dxdt(1) = 1.0; % time derivative - included because it's part of the state vector
    dxdt(2) = (T/m) - g0*(RE/(RE+h))^2 * sin(gamma); % dV/dt
    dxdt(3) = -gamma/tau; % dgamma/dt
    dxdt(4) = V*sin(gamma); % dh/dt
    dxdt(5) = -abs(T)/(g0*Isp); % dm/dt
    dxdt(6) = 0; % dT/dt - thrust remains constant between flight phase changes
end


% Initial Conditions at Launch
x = zeros(6,1); % state vector
x(1) = 45.0; % initial time [sec]
x(2) = 45.0; % airspeed [m/s]
x(3) = 90.0*(pi/180.0); % vertical flight path angle [rad]
x(4) = 1600; % altitude [m]
x(5) = 1200000; % mass [kg]
x(6) = 7 * 2400000; % stage 1 thrust
dt = 1; % time step of 1 second [sec]
RE = 6378000.0; % Earth radius [m]
flight_phase = 1; % mission phase

xs = zeros(6,800); % state vector preallocation

for i = 1:800 % Simulation will run for 800 seconds
% Save State vector for plotting
xs(:,i) = x;
    if (x(1) < 45.0)
        x(6) = 0;
    elseif (x(1) >= 45 && x(1) < 180.0)
         x(6) = 7 * 2400000; % stage 1 thrust
    elseif (x(1) >= 180.0 && x(1) < 780.0)
         if flight_phase ~= 2
            x(5) = x(5) - 240000; % first stage structure dropped
            flight_phase = 2;
         end
         x(6) = 2 * 770000; % stage 2 motors ignited
    else
         x(6) = 0; % stage 2 motors cut off
    end     

% Next Step Using Runge-Kutta
x = RK4(x,dt);
end

times = xs(1,:); % time [sec] - first row includes time values
v_sim = xs(2,:)/1000.0; % airspeed [km/s]

% plotting
plot(times,v_sim, 'b')
xlabel('Time [s]');
ylabel('Airspeed [km/s]');
legend('Reported Airspeed', 'Simulated Airspeed', 'Location','northwest')
title('Airspeed Against Time')
grid on;