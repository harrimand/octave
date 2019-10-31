% latexAnnnotation
% Example: Using Latex Annotations on a plot.

figure()
set(gcf, 'Position', [207, 624, 1466, 1117]);

x = linspace(0,3);
y = x.^2.*sin(x);
plot(x,y, 'color', 'b', 'linewidth', 3)
line([2,2],[0,2^2*sin(2)], 'color', 'r', 'linewidth', 3)

str2 = '\fontsize{48}\angle \theta \pi \omega \mu \Omega';
text(0.1, 3.75, str2);

str_Theta = '\fontsize{24}\bf\angle\rm  angle \rightarrow Angle ^{\circ}';
text(0.1, 3.25, str_Theta);

str_Theta = '\fontsize{24}\bf\theta\rm  theta \rightarrow Angle';
text(0.1, 2.75, str_Theta);

str_pi = '\fontsize{24}\bf\pi\rm  pi \rightarrow 3.14';
text(0.1, 2.25, str_pi);

str_omega = '\fontsize{24}\bf\omega\rm  omega \rightarrow 2 \pi F';
text(0.1, 1.75, str_omega);

str_mu = '\fontsize{24}\bf\mu\rm  mu \rightarrow micro';
text(0.1, 1.25, str_mu);

str_ohm = '\fontsize{24}\bf\Omega\rm  Omega \rightarrow ohms';
text(0.1, .75, str_ohm);

strL = '\fontsize{64}\int\fontsize{48}{_0^2}\fontsize{32}{x^2sin(x) dx}';
text(1.1, 0.5, strL);

strR = '\fontsize{36}V_{\fontsize{24}sub}    V^{\fontsize{24}super}';
text(2.1, 0.5, strR);

titleStr = '\fontsize{24}Plot Annotations \angle \theta \pi \omega \mu \Omega';
title({titleStr})

set(gca, 'Position', [.05, .1, .9, .8], 'units', 'normalized')
set(gca, 'XLabel', '\fontsize{24}X_{\fontsize{16}\it{axis}}')
set(gca, 'YLabel', '\fontsize{24}Y_{\fontsize{16}\it{axis}}')
set(gca, 'color', 'y')
set(gcf, 'color', 'g')
set(gca, 'fontsize', 16, 'fontweight', 'bold')

legend('\fontsize{24} X^{2} * sin(X)', '\fontsize{24} 2^{2} * sin(2)',...
    'location', 'north')
legend boxoff

%{
\fontsize{24} % Set Font size for following text to 24.
\bf           % Following text is BOLD
\it           % Following Text is itallic
\rm           % Following text has normal. (Not Bold or italic)
\angle \theta \pi \omega \mu \rightarrow   % Special Characters
\int{_0^2}    % Integral symbol with subscript 0 and superscript 2
_{text}       % text in brackets is subscripted
^{text}       % text in brackets is superscripted
_Text         % Letter T is subscripted.  ext is normal
^Text         % Letter T is superscripted  ext is normal

text(x, y, 'some text', 'color', 'r') % Place red text at coordinates (x, y)
colors:
'k' = black
'r' = red
'g' = green
'b' = blue
'y' = yellow
'c' = cyan
'm' = magenta
'w' = white

%}
