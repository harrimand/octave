# PWM to analog generator
# Pulse to analog output on a series RC circuit.

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

#-----------------------------------------------------------------------------
# Plotting evenly distributed voltages.

vt = linspace(0, pw2v(t(end)), 128);
figure(2)
plot(t, pw2v(t))

for n = 1:length(vt)
    line([v2pw(vt(n)), v2pw(vt(n))], [0, vt(n)], 'color', 'r', 'linewidth', 2)
end

