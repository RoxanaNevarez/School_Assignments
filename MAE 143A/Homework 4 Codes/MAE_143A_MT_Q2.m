clear, close all
%Lines 3-24 answer question 2c of midterm
%For F2a(s) and F2b(s), we're assuming w_c = 1
F2a = RR_tf([1],[1 0.77 1]); % Define Fap1 using num and den polynomials
figure(1), RR_bode(F2a);
title('Bode Plot for F_2_a(s)'); hold on;
xlabel('For both x-axes: log(\omega/\omega_c)'); hold on;

F2b = RR_tf([1],[1 1.85 1]);
figure(2), RR_bode(F2a);
title('Bode Plot for F_2_b(s)'); hold on;
xlabel('For both x-axes: log(\omega/\omega_c)'); hold on;

%To find F4 = F2a*F2b
%Output: num:     1
%den:    1.0000    2.6200    3.4245    2.6200    1.0000
%Continuous-time transfer function
%  m=0, n=4, n_r=n-m=4, strictly proper, K=     1
%  z:  p:  -0.3850 - 0.9229i  -0.3850 + 0.9229i  -0.9250 - 0.3800i  -0.9250 + 0.3800i

F4 = RR_tf([1],[1 2.62 3.4245 2.62 1]);
figure(3), RR_bode(F4);
title('Bode Plot for F4'); hold on;
xlabel('For both x-axes: log(\omega/\omega_c)'); hold on;

%Lines 27-32 answer question 2e of midterm
% Z = F4(s) * Y(s) where Y(s) = 1/s
Z = RR_tf([1],[1 2.62 3.4245 2.62 1 0]);
figure(4), RR_step(Z);
title('Step Response of F_4(s)'); hold on;
xlabel('time (t)'); hold on;
ylabel('z'); hold on;