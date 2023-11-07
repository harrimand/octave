% Cartesian Plot plotting with labels
Zcalc = @(opp, adj) sqrt(opp^2 + adj^2);

figure
set(gca, 'xlim', [-1, 30])
set(gca, 'ylim', [-1, 30])
set(gca, 'Color', 'y')
line([-1, 30], [0, 0], 'Color', 'k', 'LineWidth', 2)
hold on
line([0, 0], [-1, 30], 'Color', 'k', 'LineWidth', 2)

R = 20;
XL = 25;

plot([0, R], [0, XL], 'Color', 'b', 'LineWidth', 2)
stem([R, R], [0, XL], 'Color', 'm')

Ohms = '\fontsize{12} \Omega';
Deg = '\fontsize{16}^\circ';

Rlabel = sprintf('R %d', R);
text(R/2, 1, [Rlabel, Ohms], 'fontsize', 12)

XLlabel = sprintf('XL %d', XL);
text(R+1, XL/2, [XLlabel, Ohms], 'fontsize', 12)

Zeq = '\fontsize{12}Z = \surd(R^2 + XC^2)'
text(1, 27, [Zeq, Ohms], 'fontsize', 12); 

Z = Zcalc(XL, R);
Zlabel = sprintf('Z = %.2f', Z); 
text( 1, 24, [Zlabel, Ohms], 'fontsize', 12); 

ThEq = '\fontsize{12}\Theta = atan(^{XL}/_{R}) * ^{180}/_{\pi}';
text(1, 21, ThEq)

Th = atan(XL / R) * 180/pi;
Thlabel = '\fontsize{12}\angle\Theta';
Thlabel2 = sprintf(' = %.2f', Th);
text( 1, 18, [Thlabel, Thlabel2, Deg] , 'fontsize', 12); 

txt = '\fontsize{12}\Theta';
txt2 = sprintf("=%.2f", Th);
text(1, 1, [txt, txt2, Deg], 'fontsize', 12)

title([Rlabel, Ohms, '  |  ', XLlabel, Ohms], 'fontsize', 12, 'fontweight', 'bold')

