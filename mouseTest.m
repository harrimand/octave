
numCircs = 20;
np = 30;
cr = .5;
c =  0: 2*pi/np: 2*pi;
cx = cr * cos(c);
cy = cr * sin(c);

figure

LR = 1;

% fill(cx + 3.5, cy + 2.5, 'm', 'EdgeColor', 'm', 'Tag', '1')
hold on

%fill(cx + 6.5, cy + 7.5, 'g', 'EdgeColor', 'g', 'Tag', '2')
%fill(cx + 7.5, cy + 8.5, 'r', 'EdgeColor', 'r', 'Tag', '3')
%fill(cx + 8.5, cy + 9.5, 'r', 'EdgeColor', 'r', 'Tag', '3')
%fill(cx + 2.5, cy + 3.5, 'r', 'EdgeColor', 'r', 'Tag', '3')

color = {'r', 'g', 'b', 'm', 'c', 'y', 'w'};

set(gcf, 'Color', 'k');
set(gca, 'Color', 'k');

set(gcf, 'Position', [1304, 299, 560, 421])

% set(gcf, 'buttondownfcn', {@mouseTestClick, '1'})
set(gca, 'buttondownfcn', {@mouseTestClick, '1'})

Hcirc = zeros(1:numCircs, 3);
for p = 1:numCircs
    xp = rand(1) * 9 + .5;
    yp = rand(1) * 9 + .5;
    yc = int32(round(rand(1) * (length(color)-1)) + 1);
    Hcirc(p,1) = fill(cx + xp, cy + yp, color{yc},...
             'EdgeColor', 'none', 'Tag', num2str(p),...
             'buttondownfcn', {@mouseTestClick, '1'});
    Hcirc(p, 2) = rand(1) * .2 - .1;
    Hcirc(p, 3) = rand(1) * .2 -.1;
end

set(gca, 'xlim', [0,10]);
set(gca, 'xtick', [0:1:10]);
set(gca, 'ylim', [0,10]);
set(gca, 'ytick', [0:1:10]);

stop = 0;
tic()
loops = 0;
while(!stop)
    if (toc() > .05)
        tic()
        stop = true;
        for h = 1:length(Hcirc)
            hmaxX = max(get(Hcirc(h,1), 'Xdata'));
            if hmaxX >= 10
                Hcirc(h,2) = -1 * Hcirc(h, 2);
            end
            hminX = min(get(Hcirc(h,1), 'Xdata'));
            if hminX <= 0
                Hcirc(h,2) = -1 * Hcirc(h, 2);
            end
            hmaxY = max(get(Hcirc(h,1), 'Ydata'));
            if hmaxY >= 10
                Hcirc(h,3) = -1 * Hcirc(h, 3);
            end
            hminY = min(get(Hcirc(h,1), 'Ydata'));
            if hminY <= 0
                Hcirc(h,3) = -1 * Hcirc(h, 3);
            end
            % if(hmaxX < 10 && hmaxY < 10 && hminX > 0 && hminY > 0)
                set(Hcirc(h,1), 'Xdata', get(Hcirc(h,1), 'Xdata') + Hcirc(h,2))
                set(Hcirc(h,1), 'Ydata', get(Hcirc(h,1), 'Ydata') + Hcirc(h,3))
                stop = false;
            % end
        end
        loops = loops + 1;
        drawnow
    end
    if (loops > 30000)
        stop = true;
    end
end



% grid on



% lastLine = findobj(gca, 'Type', 'line');
% delete(lastLine(1));
