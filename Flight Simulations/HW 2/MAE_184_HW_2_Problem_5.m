%% Problem 2.5 - Simulating Pure Rolling Motion
syms bx b0 p 
% General Quaternion Matrix
b = [
    -bx -by -bz;
    b0 -bz by;
    bz b0 -bx;
    -by bx b0
    ];

% Motion Matrix 
m = [p;q;r];

% Conditions for Pure Rolling Motion
by = 0;
bz = 0;
q = 0;
r = 0;

% Diff Eqn Matrix
bdot = (1/2)*b*m;

disp('Differential Equation Matrix')
disp(bdot)