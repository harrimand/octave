%phaseCalc

close all

F1 = 1E3;     % Frequency (Cycles per second)
V1 = 24;      % Amplitude (voltage)
s1to = 0E-3;  % Sin Wave 1 time offset

F2 = 1E3;    % Frequency for Sin Wave 2;
V2 = 18;     % Sin Wave 2 Amplitude (Voltage)
s2to = -.25E-3;  % Sin Wave 2 time offset

nC = 3;      % Number of cycles to plot

T1 = 1/F1;     % Period for 1 cycle
T2 = 1/F2;
dt1 = T1 / 30; % Delta t (time between samples)
dt2 = T2 / 30; % Delta t (time between samples)
w1 = 2 * pi * F1;  % omega convert cycles per second to radians per second
w2 = 2 * pi * F2;
ph1 = s1to / T1 * 2 * pi;
ph2 = s2to / T2 * 2 * pi;

% Calculate t points for x axis.
t1 = 0:dt1:nC * T1;
t2 = 0:dt2:nC * T2;

% Calculate Sin wave points.
S1 = V1 * sin(w1 * t1 + ph1);
S2 = V2 * sin(w2 * t2 + ph2);

figure()

plot(t1, S1, 'color', 'r', 'linewidth', 3, t2, S2, 'color', 'b', 'linewidth', 3)
grid on
set(gca, 'xtick', [0:T1/4:(nC*T1)])


