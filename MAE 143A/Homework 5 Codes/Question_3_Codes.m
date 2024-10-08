%Code for MAE 143A Homework 5 Question 3
%%

%For Question 3 - Part 3a

%%
%code for sine wave with h = 0.1
omega = pi; 
t = 0:0.001:5; %time interval [0,5] with delta t = 0.001
y = sin(omega*t); 

figure(1), plot(t, y, 'LineWidth',1); %plots sine function
hold on;

% Plot title and labels
xlabel('Time (s)');
ylabel('Amplitude');
title('Continuous Sine Wave with h=0.1');

%For h = 0.1
t_k = 0:0.1:5;
y_k = sin(omega*t_k);  % Sampled sine wave
% Samples y_k drawn as x symbols
figure(1), plot(t_k, y_k, 'x', 'MarkerSize', 10, 'DisplayName', sprintf('h = %.1f', h)); 
hold on;
%Stair-step like function y_zoh
stairs([t_k(1:end-1); t_k(2:end)], [y_k(1:end-1); y_k(2:end)], 'r', 'LineWidth', 1, 'DisplayName', sprintf('ZOH (h = %.1f)', h));
hold on;
%%
%code for sine wave with h = 0.2
omega = pi; 
t = 0:0.001:5; %time interval [0,5] with delta t = 0.001
y = sin(omega*t); 

figure(2), plot(t, y, 'LineWidth',1); %plots sine function
hold on;
% Plot title and labels
xlabel('Time (s)');
ylabel('Amplitude');
title('Continuous Sine Wave with h=0.2');
%For h = 0.2
t_k = 0:0.2:5;
y_k = sin(omega*t_k);  % Sampled sine wave
% Samples y_k drawn as x symbols
figure(2), plot(t_k, y_k, 'x', 'MarkerSize', 10, 'MarkerEdgeColor','g','DisplayName', sprintf('h = %.1f', h)); 
hold on;
%Stair-step like function y_zoh
stairs([t_k(1:end-1); t_k(2:end)], [y_k(1:end-1); y_k(2:end)], 'g', 'LineWidth', 1, 'DisplayName', sprintf('ZOH (h = %.1f)', h));
hold on;

%%
%Code for sine wave with h = 0.4
omega = pi; 
t = 0:0.001:5; %time interval [0,5] with delta t = 0.001
y = sin(omega*t); 

figure(3), plot(t, y, 'LineWidth',1); %plots sine function
hold on;
% Plot title and labels
xlabel('Time (s)');
ylabel('Amplitude');
title('Continuous Sine Wave with h=0.4');
%For h = 0.4
t_k = 0:0.4:5;
y_k = sin(omega*t_k);  % Sampled sine wave
% Samples y_k drawn as x symbols
figure(3),plot(t_k, y_k, 'x', 'MarkerSize', 10, 'MarkerEdgeColor','c','DisplayName', sprintf('h = %.1f', h)); 
hold on;
%Stair-step like function y_zoh
stairs([t_k(1:end-1); t_k(2:end)], [y_k(1:end-1); y_k(2:end)], 'c', 'LineWidth', 1, 'DisplayName', sprintf('ZOH (h = %.1f)', h));
hold on;

%%

%Code for Question 3 - Part 3b

%%
%code for sine wave with h = 0.1
omega = pi; 
t = 0:0.001:5; %time interval [0,5] with delta t = 0.001
y = sin(omega*t); 

figure(4), plot(t, y, 'LineWidth',1); %plots sine function
hold on;

% Plot title and labels
xlabel('Time (s)');
ylabel('Amplitude');
title('Continuous Sine Wave with h=0.1');
%For h = 0.1
t_k = 0:0.1:5;
y_k = sin(omega*t_k);  % Sampled sine wave
% Samples y_k drawn as x symbols
figure(4), plot(t_k, y_k, 'x', 'MarkerSize', 10,  'MarkerEdgeColor', 'r', 'DisplayName',sprintf('h = %.1f', h)); 
hold on;
% Plot FOH output
t_foh = t_k(1):0.001:t_k(end);  % Time steps for FOH output
y_foh = zeros(size(t_foh));
for k = 1:length(t_k)-1
 indices = find(t_foh >= t_k(k) & t_foh <= t_k(k+1));
 t_int = t_foh(indices);
 y_foh(indices) = y_k(k) + (t_int - t_k(k)) * (y_k(k+1) - y_k(k)) / 0.1;
end
plot(t_foh, y_foh, 'r', 'LineWidth', 1, 'DisplayName', 'FOH Output');
hold on;

%%
%code for sine wave with h = 0.2
omega = pi; 
t = 0:0.001:5; %time interval [0,5] with delta t = 0.001
y = sin(omega*t); 

figure(5), plot(t, y, 'LineWidth',1); %plots sine function
hold on;

% Plot title and labels
xlabel('Time (s)');
ylabel('Amplitude');
title('Continuous Sine Wave with h=0.2');
%For h = 0.2
t_k = 0:0.2:5;
y_k = sin(omega*t_k);  % Sampled sine wave
% Samples y_k drawn as x symbols
figure(5), plot(t_k, y_k, 'x', 'MarkerSize', 10, 'MarkerEdgeColor', 'g', 'DisplayName', sprintf('h = %.1f', h)); 
hold on;
% Plot FOH output
t_foh = t_k(1):0.001:t_k(end);  % Time steps for FOH output
y_foh = zeros(size(t_foh));
for k = 1:length(t_k)-1
 indices = find(t_foh >= t_k(k) & t_foh <= t_k(k+1));
 t_int = t_foh(indices);
 y_foh(indices) = y_k(k) + (t_int - t_k(k)) * (y_k(k+1) - y_k(k)) / 0.2;
end
plot(t_foh, y_foh, 'g', 'LineWidth', 1, 'DisplayName', 'FOH Output');
hold on;

%%
%code for sine wave with h = 0.4
omega = pi; 
t = 0:0.001:5; %time interval [0,5] with delta t = 0.001
y = sin(omega*t); 

figure(6), plot(t, y, 'LineWidth',1); %plots sine function
hold on;

% Plot title and labels
xlabel('Time (s)');
ylabel('Amplitude');
title('Continuous Sine Wave with h=0.4');

%For h = 0.4
t_k = 0:0.4:5;
y_k = sin(omega*t_k);  % Sampled sine wave
% Samples y_k drawn as x symbols
figure(6), plot(t_k, y_k, 'x', 'MarkerSize', 10, 'MarkerEdgeColor', 'c', 'DisplayName', sprintf('h = %.1f', h)); 
hold on;
% Plot FOH output
t_foh = t_k(1):0.001:t_k(end);  % Time steps for FOH output
y_foh = zeros(size(t_foh));
for k = 1:length(t_k)-1
 indices = find(t_foh >= t_k(k) & t_foh <= t_k(k+1));
 t_int = t_foh(indices);
 y_foh(indices) = y_k(k) + (t_int - t_k(k)) * (y_k(k+1) - y_k(k)) / 0.4;
end
plot(t_foh, y_foh, 'c', 'LineWidth', 1, 'DisplayName', 'FOH Output');
hold on;

%%

%Code for Question 3 - Part 3c

%%
%code for sine wave with h = 0.1 *Did not work*
omega = pi; 
t = 0:0.001:5; %time interval [0,5] with delta t = 0.001
y = sin(omega*t); 

figure(7), plot(t, y, 'LineWidth',1); %plots sine function
hold on;

% Plot title and labels
xlabel('Time (s)');
ylabel('Amplitude');
title('Continuous Sine Wave with h=0.1');
%For h = 0.1
t_k = 0:0.1:5;
y_k = sin(omega*t_k);  % Sampled sine wave
% Samples y_k drawn as x symbols
figure(7), plot(t_k, y_k, 'x', 'MarkerSize', 10,  'MarkerEdgeColor', 'r', 'DisplayName',sprintf('h = %.1f', h)); 
hold on;
% SOH output
t_soh = t_k(1):0.001:t_k(end);
y_soh = lagrangeInterpolation(t_k, y_k);
% Lagrange equations
L0 = ((t_k - t_k(2)).*(t_k - t_k(3))) / ((t_k(1) - t_k(2))*(t_k(1) - t_k(3)));
L1 = ((t_k - t_k(1)).*(t_k - t_k(3))) / ((t_k(2) - t_k(1))*(t_k(2) - t_k(3)));
L2 = ((t_k - t_k(1)).*(t_k - t_k(2))) / ((t_k(3) - t_k(1))*(t_k(3) - t_k(2)));

for k = 1:length(t_k)-1
 indices = find(t_soh >= t_k(k) & t_soh <= t_k(k+1));
 t_int = t_soh(indices);
 y_LagInt = L0 * y(1) + L1 * y(2) + L2 * y(3);
end
figure (7), plot(t_soh, y_soh, 'r', 'LineWidth', 1, 'DisplayName', 'SOH Output with h = 0.1');
hold on;
