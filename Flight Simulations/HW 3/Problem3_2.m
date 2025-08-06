% Problem 3.2 - BSFC Calculation for Cessna 182
% Data from Problem 3.1 & Specified Parameter
man_fuel_flow = [9.4, 10, 10.6, 11.3, 11.9, 12.6, 13.3, 14]; % [gal/hr]
man_brake_horsepower = [113 122 131 140 147 156 166 175]; % [hp]
jsbsim_brake_horsepower = [116.14 124.32 133.56 141.65 150.26 157.17 164.47 172.17];
avgas = 6.0; % [lbs/gal]

% Convert fuel flow from gal/hr to lbs/hr
man_dW_dt = - man_fuel_flow * avgas; % [lbs/hr]
% Calculate c_p (BSFC) directly from the equation
c_p_1 = -man_dW_dt ./ man_brake_horsepower; %[lbs/(hp*hr)]
c_p_2 = -man_dW_dt ./ jsbsim_brake_horsepower;

% Display results
disp('Brake Horsepower P (hp):');
disp(man_brake_horsepower);
disp('Fuel Flow (gal/hr):');
disp(man_fuel_flow);
disp('Fuel Flow (lbs/hr):');
disp(man_dW_dt);
disp('Manufacturer BSFC (lbs/(hp·hr)):');
disp(c_p_1);
disp(['Manufacturer Average BSFC: ', num2str(mean(c_p_1)), ' lbs/(hp·hr)']);
fprintf('\n')

disp('JSBSim Brake Horsepower P (hp):');
disp(jsbsim_brake_horsepower);
disp('Manufacturer Fuel Flow (gal/hr):');
disp(man_fuel_flow);
disp('Manufacturer Fuel Flow (lbs/hr):');
disp(man_dW_dt);
disp('JSBSIM BSFC (lbs/(hp·hr)):');
disp(c_p_2);
disp(['JSBSIM Average BSFC: ', num2str(mean(c_p_2)), ' lbs/(hp·hr)']);

