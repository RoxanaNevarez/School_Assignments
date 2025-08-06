%% Homework 4 Problem 2 - Pitch Rate Plots
clear;clc
% Load the CSV files
data_sas = readmatrix('T38_output_SAS_On.csv', 'NumHeaderLines', 1);
data_no_sas = readmatrix('T38_output_SAS_Off.csv', 'NumHeaderLines', 1);

% Extract time and pitch rate
time_sas = data_sas(:, 1);
pitch_rate_sas = data_sas(:, 8);

time_no_sas = data_no_sas(:, 1);
pitch_rate_no_sas = data_no_sas(:, 8);

% Plot the pitch rate responses
figure;
plot(time_sas, rad2deg(pitch_rate_sas), 'b-', 'LineWidth', 1);
hold on;
plot(time_no_sas, rad2deg(pitch_rate_no_sas), 'r-', 'LineWidth', 1);
grid on;
xlabel('Time [sec]');
ylabel('Pitch Rate [deg/sec]');
title('Pitch Rate Responses');
legend('SAS Enabled', 'SAS Disabled');
