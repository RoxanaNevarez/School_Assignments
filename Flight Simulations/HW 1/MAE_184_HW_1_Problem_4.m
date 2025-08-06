%% Problem 1.4 - Flight Time Estimate

% Given values
a = 6378137/1852; % semi-major axis general value [m] -> [nmi]
w_e = 20/60; % wind speed [nmi/hr] -> [nmi/min]
v = 180/60 ; % air speed [nmi/hr] -> [nmi/min]

% Storing (latitude,longitude) coordinates [deg]
lat_long = [
    32.7336, -117.1897;
    37.6167, -122.3750
    ];

lat = lat_long(:,1) * (pi/180); % converts latitude values to [rad]
long = lat_long(:,2) * (pi/180); % converts longitude values to [rad]

% Tau equations needed to find si
tauA = log(sec(lat(1)) + tan(lat(1)));
tauB = log(sec(lat(2)) + tan(lat(2)));

% Si equation needed to find rhumb distance
si = atan((long(2) - long(1))/(tauB - tauA));

d_rh = a*abs(lat(2) - lat(1))*abs(sec(si)); % outputs rhumb distance

chi_chiG = asin(-(w_e/v)*cos(d_rh)); % chi - chi_G equation

v_g = v*cos(chi_chiG) + w_e*sin(d_rh); % outputs estimated ground speed

flight_duration = d_rh/v_g; % outputs flight duration [min]

fprintf('Flight Time Duration: %.4f [min]\n', flight_duration);