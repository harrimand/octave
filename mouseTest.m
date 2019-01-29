
numCircs = 20;
np = 30;
cr = .5;
c =  0: 2*pi/np: 2*pi;
cx = cr * cos(c);
cy = cr * sin(c);

figure

LR = 1;
hold on

color = {'r', 'g', 'b', 'm', 'c', 'y', 'w'};

set(gcf, 'Color', 'k');
set(gca, 'Color', 'k');
set(gcf, 'Position', [1304, 299, 560, 421])

addproperty('Pause', gcf, 'boolean', 'off') 

set(gca, 'buttondownfcn', {@mouseTestClick, '1'})

set(gca, 'xlim', [0,10]);
set(gca, 'xtick', [0:1:10]);
set(gca, 'ylim', [0,10]);
set(gca, 'ytick', [0:1:10]);

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

stop = false;
tic()
loops = 0;
while(!stop)
    if (toc() > .05)
        tic()
        
        X0 = cell2mat(get(Hcirc(1:20,1), 'Xdata'))(1:31:620);
        Xsn = (((X0 >= 10) | (X0 <= 1)) .* 2 - 1) .* -1;
        Y0 = cell2mat(get(Hcirc(1:20,1), 'Ydata'))(1:31:620);
        Ysn = (((Y0 >= 9.5) | (Y0 <= .5)) .* 2 - 1) .* -1;
        
        if ~all(Xsn+1)
            Hcirc(:,2) = Hcirc(:,2) .* Xsn;
        end
        if ~all(Ysn+1)
            Hcirc(:,3) = Hcirc(:,3) .* Ysn;
        end

%         set(Hcirc(:,1), 'Xdata', get(Hcirc(:,1), 'Xdata'){1} + Hcirc(:,2))
%         set(Hcirc(:,1), 'Ydata', get(Hcirc(:,1), 'Ydata'){1} + Hcirc(:,3))

        for h = 1:length(Hcirc)
            set(Hcirc(h,1), 'Xdata', get(Hcirc(h,1), 'Xdata') + Hcirc(h,2))
            set(Hcirc(h,1), 'Ydata', get(Hcirc(h,1), 'Ydata') + Hcirc(h,3))
        end
        
        
%{        
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

            set(Hcirc(h,1), 'Xdata', get(Hcirc(h,1), 'Xdata') + Hcirc(h,2))
            set(Hcirc(h,1), 'Ydata', get(Hcirc(h,1), 'Ydata') + Hcirc(h,3))
        end
%}
        
        loops = loops + 1;
        drawnow
        if (str2num(get(gcf, 'Tag')) == 1)
            fprintf(':::::: Left Button Clicked ::::::\n')
            set(gcf, 'Tag', '0')
            stop = true;
        elseif(strcmp(get(gcf, 'Pause'), 'on'))
            fprintf(':::::: Right Button Clicked ::::::\n')
            fprintf('*** PAUSED ***\n')
            while(strcmp(get(gcf, 'Pause'), 'on'))
                pause(.1)
            end
            fprintf('*** RUN ***\n')
        end
    end
    if (loops > 3000)
        stop = true;
    end
end

%{
maxX = reshape(cell2mat(get(Hcirc(:,1), 'Xdata')), 31, 20)(1,:);
minX = reshape(cell2mat(get(Hcirc(:,1), 'Xdata')), 31, 20)(16,:);
maxY = reshape(cell2mat(get(Hcirc(:,1), 'Ydata')), 31, 20)(8,:);
minY = reshape(cell2mat(get(Hcirc(:,1), 'Ydata')), 31, 20)(23,:);
%}
