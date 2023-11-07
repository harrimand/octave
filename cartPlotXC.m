% Cartesian Plot plotting with labels
Zcalc = @(opp, adj) sqrt(opp^2 + adj^2);

figure
set(gca, 'xlim', [-1, 30])
set(gca, 'ylim', [-30, 1])

line([-1, 30], [0, 0], 'Color', 'k', 'LineWidth', 2)
hold on
line([0, 0], [1, -30], 'Color', 'k', 'LineWidth', 2)

R = 20;
XC = -25;

plot([0, R], [0, XC], 'Color', 'b', 'LineWidth', 2)
stem([R, R], [0, XC], 'Color', 'm')

Ohms = '\fontsize{12} \Omega';
Deg = '\fontsize{16}^\circ';

Rlabel = sprintf('R %d', R);
text(R/2, -1, [Rlabel, Ohms], 'fontsize', 12)

XClabel = sprintf('XC %d', XC);
text(R+1, XC/2, [XClabel, Ohms], 'fontsize', 12)

Z = Zcalc(XC, R);
Th = atan(XC / R) * 180/pi;


txt = '\fontsize{12}\Theta';
txt2 = sprintf(" = %.2f", Th);
text(2, -1, [txt, txt2, Deg], 'fontsize', 12)

ThEq = '\fontsize{12}\Theta = atan(^{XC}/_{R}) * ^{180}/_{\pi}';
text(1, -20, ThEq)

Thlabel = '\fontsize{12}\angle\Theta';
Thlabel2 = sprintf(' = %.2f', Th);
text( 1, -22, [Thlabel, Thlabel2, Deg] , 'fontsize', 12); 

Zeq = '\fontsize{12}Z = \surd(R^2 + XC^2)'
text(1, -25, [Zeq, Ohms], 'fontsize', 12)

Zlabel = sprintf('Z = %.2f', Z); 
text( 1, -28, [Zlabel, Ohms], 'fontsize', 12)

set(gca, 'XAxisLocation', 'top')
set(gca, 'Color', 'y')
set(gcf, 'Color', 'g')

title([Rlabel, Ohms, '  |  ', XClabel, Ohms], 'fontsize', 12, 'fontweight', 'bold')

