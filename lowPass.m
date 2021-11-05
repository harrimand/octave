
# Analyze Low Pass Filter design.  Inductor in series with parallel R-C.  

F = [100:100:24000];
C = .022E-6;
L = 56E-3;
R = 1E3;
V = sqrt(2);
Rp = @(r1, r2) 1 ./ (1./r1 + 1./r2);        # Parallel Resistance/Impedance
Xc = @(F, C) -i * 1 ./ (2 * pi .* F .* C);     # Capacative Reactance
Xl = @(F, L) i .* 2 .* pi .* F .* L;           # Inductive Reactance
KVL = @(v, r1, r2) v .* (r1 ./ (r1 + r2));  # Kirchoff's Voltage Divider rule
Vout = KVL(V, Rp(R, Xc(F, C)), Xl(F, L) + Rp(R, Xc(F, C)));  # Voltage outputs
VoMag = abs(Vout);                          # Magnitude of complex numbers
VoTh = rad2deg(arg(Vout));                  # Degree angle of complex numbers
Adb = 20 .* log10(VoMag);                   # Gain in deciBells
# semilogx(F, Adb, 'linewidth', 3, 'color', 'r');  # Plot with logarithmic X axis

ax = plotyy (F,Adb, F,VoTh, @semilogx, @semilogx);

set(gca, 'fontsize', 20, 'fontweight', 'bold');
grid on;
set(gca, 'gridalpha', .8);
hold on;
