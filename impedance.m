
close

function data = getData(Defaults)
    Title = 'Circuit Data';
    Prompts = {'Frequency', 'R: Ohms', 'L: Henrys', 'C: Farads'};
    RowsCols = [1, 10; 1, 5; 1, 5; 1, 5];
    if !exist('Defaults')
        Defaults = {'1000', '100', '.033', '1E-6'};
    end
    data = inputdlg(Prompts, Title, RowsCols, Defaults);
end

function plotText(data, XMax)
    F = str2num(data{1}());
    R = str2num(data{2}());
    L = str2num(data{3}());
    C = str2num(data{4}());
    XL = 2 * pi * F * L
    if(C > 0)
        XC = -1 / (2 * pi * F * C);
    else
        XC = 0;
    end
    X = XL + XC;
    Th = atan(X / R) * 180 / pi;
    Z = sqrt(X^2 + R^2);
    if(X > 0)
        tqy = -.4 * XMax;
    else
        tqy = .6 * XMax;
    end
    tqx = .2 * XMax;
    txtF = sprintf("F: %d Hz", F);
    txtR = [sprintf("R: %d", R), ' \Omega'];
    txtX = [sprintf("X: %d", X), ' \Omega'];
    txtTh = ['Th ', '\theta', sprintf(": %d", Th), '\bf{^\circ}'];
    txtZ = [sprintf('Z: %.2f',Z), ' \angle', sprintf(' %.2f',Th)];
    text(tqx, tqy, {txtF, txtR, txtX, txtTh, txtZ},...
        'fontsize', 20, 'fontweight', 'bold')
end

function [R, X, Th, Z, XMax] = calcs(data)
    F = str2num(data{1}());
    R = str2num(data{2}());
    L = str2num(data{3}());
    C = str2num(data{4}());

    XL = 2 * pi * F * L;
    if(C > 0)
        XC = -1 / (2 * pi * F * C);
    else
        XC = 0;
    end
    X = XL + XC;
    Th = atan(X / R) * 180 / pi;
    Z = sqrt(X^2 + R^2);
    XMax = ceil(Z / 10) * 12;
end

function drawPlot(data, XMax)
    [R, X, Th, Z, XMax] = calcs(data);
    figure(1)
    cla;
    set(gca, 'XLim', [-10, XMax], 'YLim', [-XMax, XMax])
    set(gca, 'fontsize', 20, 'fontweight', 'bold')
    set(gcf, 'Position', [180, 150, 800, 1200])
    hold on
    grid on
    line([0, 0], [-XMax, XMax], 'linewidth', 2)
%    hold on
    line([-10, XMax], [0, 0], 'linewidth', 2)
    line([0, R], [0, X], 'color', 'b', 'linewidth', 2);
    St = stem(R, X, 'r-.', 'linewidth', 3);
end


% data = getData();
% disp(data)

% printf('\n\n');
%{
F = str2num(data{1}());
R = str2num(data{2}());
L = str2num(data{3}());
C = str2num(data{4}());

% printf('\n\n');

XL = 2 * pi * F * L;
XC = -1 / (2 * pi * F * C);
X = XL + XC;
Th = atan(X / R) * 180 / pi;
Z = sqrt(X^2 + R^2);
XMax = ceil(Z / 10) * 12;
%}

%{
[R, X, Th, Z, XMax] = calcs(data);
figure()
set(gca, 'XLim', [-10, XMax], 'YLim', [-XMax, XMax])
set(gca, 'fontsize', 20, 'fontweight', 'bold')
set(gcf, 'Position', [180, 150, 800, 1200])
hold on
grid on
line([0, 0], [-XMax, XMax], 'linewidth', 2)
line([-10, XMax], [0, 0], 'linewidth', 2)
line([0, R], [0, X], 'color', 'b', 'linewidth', 2);
St = stem(R, X, 'r-.', 'linewidth', 3);
%}

data = getData();

[R, X, Th, Z, XMax] = calcs(data);

drawPlot(data, XMax)

plotText(data, XMax)


while(length(data) > 0)
    data = getData(data);
    if(length(data) > 0)
        [R, X, Th, Z, XMax] = calcs(data);
        drawPlot(data, XMax)
        plotText(data, XMax)
    end
end


% disp(data)
% printf("Data Length: %d", length(data))

%{
if(X > 0)
    tqy = -.4 * XMax;
else
    tqy = .6 * XMax;
end
tqx = .2 * XMax;
txtF = sprintf("F: %d Hz", F);
txtR = [sprintf("R: %d", R), ' \Omega'];
txtX = [sprintf("X: %d", X), ' \Omega'];
txtTh = ['Th ', '\theta', sprintf(": %d", Th), '\bf{^\circ}'];
txtZ = [sprintf('Z: %.2f',Z), ' \angle', sprintf(' %.2f',Th)];
text(tqx, tqy, {txtF, txtR, txtX, txtTh, txtZ},...
    'fontsize', 20, 'fontweight', 'bold')
%}

    
    
    
    
    
    
    
    
    
    
    
    