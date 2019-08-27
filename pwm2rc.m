# PWM to analog generator
# Pulse to analog output on a series RC circuit.

close all

R = 4.7E3;
C = 1E-6;
V = 5;

# pulse width to voltage
pw2v = @(pw) V * (1 - exp(-pw/(R * C)));

# voltage to pulse width
v2pw = @(Vc) -R * C * log(-Vc/V + 1);

#-----------------------------------------------------------------------------
# Plotting evenly distributed pulse widths.

t = linspace(0, 5 * R * C, 128);
figure()
plot(t, pw2v(t))

for n = 1:length(t)
    line([t(n), t(n)], [0, pw2v(t(n))], 'color', 'r', 'linewidth', 2)
end

labelX = '\fontsize{24}\bf Pulse Duration';
labelY = '\fontsize{24}\bf Capacitor Voltage';
titleStr1 = sprintf('\\fontsize{24}\\bf 128 Samples. Constant delta T = %s',...
     num2str(t(2)));
set(gca, 'Xlabel', labelX, 'Ylabel', labelY,...
     'fontsize', 24, 'title', titleStr1)
     
pause(.1)
set(gcf, 'Position', [1765, 1025, 1948, 790])

#-----------------------------------------------------------------------------
# Plotting evenly distributed voltages.

vt = linspace(0, pw2v(t(end)), 128);
figure(2)
plot(t, pw2v(t))

pw = arrayfun(v2pw, vt);

for n = 1:length(vt)
    line([pw(n), pw(n)], [0, vt(n)], 'color', 'r', 'linewidth', 2)
end

labelX = '\fontsize{24}\bf Pulse Duration';
labelY = '\fontsize{24}\bf Capacitor Voltage';
titleStr2 = sprintf('\\fontsize{24}\\bf 128 Samples. Constant delta V = %s',...
    num2str(vt(2)));
set(gca, 'Xlabel', labelX, 'Ylabel', labelY,...
    'fontsize', 24, 'title', titleStr2)

pause(.1)
set(gcf, 'Position', [1765, 144, 1948, 790])

#-----------------------------------------------------------------------------
# Plotting pulse duration vs. Capacitor Voltage.
figure(3)
plot(vt, pw, 'color', 'r', 'linewidth', 3)
hold on
stem(vt, pw, 'color', 'b', 'linewidth', 2)

labelX = '\fontsize{24}\bf Capacitor Voltage';
labelY = '\fontsize{24}\bf Pulse Duration';
titleStr = '\fontsize{24}\bf Pulse Duration vs. Capacitor Voltage';
set(gca, 'XLabel', labelX, 'YLabel', labelY, 'fontsize', 24,...
    'title',titleStr, 'XTick', 0:.25:5, 'YTick', 0:.00125:.025)

pause(.2)
set(gcf, 'Position', [1765, 228, 2000, 1510])
pause(.2)
set(gcf, 'Position', [1765, 228, 2000, 1500])
grid on

