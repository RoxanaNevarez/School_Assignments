%% Problem 1.3  - Geodesy
% Constants provided
a = 6378.137; % semi-major axis [km]

% Matrix of (latitude, longitude) [deg] values provided
lat_long = [
    32.7335556, -117.1896667; % KSAN
    30.2858333, -131.6361111; % ETECO
    28.7016667, -139.4266667; % DIALO
    26.0061111, -146.1675000; % DUSAC
    23.0241667, -152.5777778; % DRAYK
    21.3178275, -157.9202627  % PHNL
    ]; 

% Converting Matrix Values to [rad]
lat = lat_long(:,1) * (pi/180);
long = lat_long(:,2) * (pi/180);

% Great Circle Path Equation - **Does NOT Require Iterations; it only depends on start point and finalmost point**
d_gc_result= a*acos(sin(lat(1))*sin(lat(6)) + cos(lat(1))*cos(lat(6))*cos(long(6) - long(1)));

% Rhumb Line Equations - **DOES Require Iterations; start point and final point of EACH segment**
for i = 1:5 % loop will find the distance difference between each segment (5 segments total)
    tau(i) = log(sec(lat(i)) + tan(lat(i))); % start point of each segment
    tau(i+1) = log(sec(lat(i+1)) + tan(lat(i+1))); % final point of each segment

    si(i) = atan((long(i+1) - long(i))/(tau(i+1) - tau(i))); % for each segment
    
    d_rh(i,:) = a*abs(lat(i+1) - lat(i))*abs(sec(si(i))); % for each segment

    d_rh_result = sum(d_rh); % adds previous distance diff to new distance diff every loop - final output is total difference from start point to finalmost point
end

mag_trip_distance = abs(d_rh_result - d_gc_result); % finds magnitude of trip distance difference between both methods
fprintf('Magnitude of Trip Distance Difference: %.4f [km]\n', mag_trip_distance);
