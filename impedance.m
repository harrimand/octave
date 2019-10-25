% R-L-C Impedance Calculator and Plotter
close
data = getData();
[R, X, Th, Z, XMax] = calcs(data);
drawPlot(data)
plotText(data, XMax)

while(not(isempty(data)))
    data = getData(data);
    if(not(isempty(data)))
        [R, X, Th, Z, XMax] = calcs(data);
        drawPlot(data)
        plotText(data, XMax)
    end
end

function data = getData(Defaults)
    Title = 'Circuit Data';
    Prompts = {'Frequency', 'R: Ohms', 'L: Henrys', 'C: Farads'};
    RowsCols = [1, 15; 1, 15; 1, 15; 1, 15];
    if not(exist('Defaults', 'var'))
        Defaults = {'1000', '100', '.033', '1E-6'};
    end
    data = inputdlg(Prompts, Title, RowsCols, Defaults);
end

function plotText(data, XMax)
    F = str2double(data{1}());
    R = str2double(data{2}());
    L = str2double(data{3}());
    C = str2double(data{4}());
    XL = 2 * pi * F * L;
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
    txtF = sprintf('F: %d Hz', F);
    txtR = [sprintf('R: %d', R), ' \Omega'];
    txtX = [sprintf('X: %.2f', X), ' \Omega'];
    txtTh = ['Th \theta:', sprintf(' %.2f', Th), '\bf{^\circ}'];
    txtZ = [sprintf('Z: %.2f',Z), ' \angle', sprintf(' %.2f',Th)];
    text(tqx, tqy, {txtF, txtR, txtX, txtTh, txtZ},...
        'fontsize', 20, 'fontweight', 'bold');
end

function [R, X, Th, Z, XMax] = calcs(data)
    F = str2double(data{1}());
    R = str2double(data{2}());
    L = str2double(data{3}());
    C = str2double(data{4}());

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

function drawPlot(data)
    [R, X, ~, ~, XMax] = calcs(data);
    figure(1)
    cla;
    set(gca, 'XLim', [-10, XMax], 'YLim', [-XMax, XMax])
    set(gca, 'fontsize', 20, 'fontweight', 'bold')
    set(gcf, 'Position', [180, 150, 600, 800])
    hold on
    grid on
    line([0, 0], [-XMax, XMax], 'color', 'k', 'linewidth', 2)
    line([-10, XMax], [0, 0], 'color', 'k', 'linewidth', 2)
    line([0, R], [0, X], 'color', 'b', 'linewidth', 2);
    stem(R, X, 'r-.', 'linewidth', 2);
end