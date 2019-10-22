% Plotting a rotating radial with a sin wave amplitude matching the sin(R)
t = [0:2:722] .* pi/180;
R1 = 5;
R2 = 12;
x1 = R1 * cos(t);
y1 = R1 * sin(t);
x2 = R2 * cos(t);
y2 = R2 * sin(t);
R1z = zeros(1,length(t));

figure('units','normalized','outerposition',[0 0 1 1]);
set(gcf, 'Position', [.2, .2, .3, .3])
while(1)
subplot(1,2,1)
hold on;

title('Polar', 'FontSize',22)
set(gca, 'xlim', [-R1*1.25, R1*1.25]);
set(gca, 'ylim', [-R1*1.25, R1*1.25]);
grid on

    AX1 = subplot(1,2,1);
    % set(AX1, 'Position', [.1, .1, .4, .8])
    anno11 = '{\fontsize{24}\pi\fontsize{18}/2}';
    text(-.3, 5.25, anno11);
    anno11 = '{\fontsize{24}\pi}';
    text(-5.5, 0, anno11);
    anno11 = '{\fontsize{18}3\fontsize{24}\pi\fontsize{18}/2}';
    text(-.3, -5.25, anno11);
    anno11 = '{\fontsize{18}2\fontsize{24}\pi}';
    text(5.3, 0, anno11);
    plot(x1, y1, 'Color', 'b', 'LineWidth', 2);
    L1 = line([R1z(1), x1(1)],[R1z(1), y1(1)], 'Color', 'r', 'LineWidth', 3);
    L2 = line([x1(2), R1*1.25],[y1(2), y1(2)], 'Color', 'k', 'LineWidth', 1);

    AX2 = subplot(1,2,2);
    % set(AX2, 'Position', [.5, .1, .4, .8])
    line([t(1), t(2)],[y1(1),y1(2)], 'Color', 'r', 'LineWidth', 2);
    LS2 = line([0, t(2)], [y1(2), y1(2)],  'Color', 'k', 'LineWidth', 1);
    title('Sine Wave', 'FontSize',22 )
    set(gca, 'xlim', [0, t(end)]);
    set(gca, 'ylim', [-R1*1.25, R1*1.25]);
    grid on

    for L = 2:length(t)-1
        subplot(1,2,1)
        rotate(L1, [0, 0, 1], 2)
        set(L2, 'xdata', [x1(L), R1*1.25], 'ydata', [y1(L), y1(L)])
        drawnow()
        
        subplot(1,2,2)
        line([t(L-1), t(L)],[y1(L-1), y1(L)], 'Color', 'r', 'LineWidth', 2);
        set(LS2, 'xdata', [0, t(L)], 'ydata', [y1(L), y1(L)])
        pause(.02);
        drawnow()
    end
    pause;
    axesHandlesToChildObjects = findobj(gca, 'Type', 'line');
	if ~isempty(axesHandlesToChildObjects)
		delete(axesHandlesToChildObjects);
    end
    subplot(1,2,1);
    axesHandlesToChildObjects = findobj(gca, 'Type', 'line');
	if ~isempty(axesHandlesToChildObjects)
		delete(axesHandlesToChildObjects);
    end
end