% ELCT131Final_Prob2

% rpar(R1, R2[, ...]) return parallel resistance of multiple resistiors.

R1 = 150;
R2 = 400;
R3 = 250;
R4 = 750;
% R4 = rpar(750, 242.83)
V1 = 20;
V2 = 12;
I1 = 1;

Rth = rpar(R4, R3 + rpar(R1, R2))

% Calculate Voltage on R2 from V1
V1R2 = V1 * (rpar(R2, R3 + R4)/(R1 + rpar(R2, R3 + R4)))

% Calculate Voltage on R4 from V1
V1R4 = V1R2 * R4/(R4 + R3)

% Calculate Voltage on R4 from V2
V2R4 = V2 * R4/(R4 + R3 + rpar(R1, R2))

% Voltage on R4 from I1 = I1 * Rth
VI1R4 = I1 * Rth

% Calculating Voltage on R4 from I1 with kirchoffs current divider rule
IR4kcl = kcl(I1, R4, R3 + rpar(R1, R2))
VR4kcl = IR4 * R4

% Vth = Sum of voltages on R4
Vth = V1R4 + V2R4 + VI1R4

% RL = Rth for maximum power transfer
% VRL = Vth * RL/(RL + Rth)
% IRL = VRL / RL Or IRL = Vth/(Rth + RL)

RL = Rth
VRL = Vth * RL / (RL + Rth)
IRL = Vth / (Rth + RL)

%------------------------------------------------------------------------------
% Extra Analysis for varying RL
RLvar = linspace(100, 400, 31);
PLvar = (Vth ./ (Rth + RLvar)).^2 .* RLvar;

% Resistance with max power dissipation.
RmaxP = RLvar(find((PLvar == max(PLvar))))

printf("\n\nThevinin Resistance: %d\n", Rth)
printf("Thevinin Voltage: %d\n", Vth)
printf("Calculating Power on 31 R Loads from 100 to 400\n")
printf(sprintf("Resistance %d has max power dissipation\n\n", RmaxP))

figure()
plot(RLvar, PLvar, 'linewidth', 3)
grid on
set(gca, 'xtick', [100:20:400])
title('Power dissipation vs. RLoad', 'fontsize', 20)
xlabel('R Load', 'fontsize', 20)
ylabel('Power', 'fontsize', 20)
