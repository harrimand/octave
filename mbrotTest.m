% mbrotTest

numSides = 6;
numProcesses = 4;

close
clear seg
%plotWindow
figure
axis
set(gca, 'Xlim', [0, 100])
set(gca, 'Ylim', [0, 100])

set(gcf, 'Position', [860, 1, 1048, 960])
pause(.5)
set(gca, 'Units', 'normalized')
set(gca, 'Position', [0, 0, 1, 1])
grid off
hold on
pause(.5)
set(gcf, 'Position', [860, 1, 1052, 968])
pause(1)
lineStyle = {'Color', 'b', 'LineWidth', .1};
%{
cX = [40, 60, 60, 60, 80, 80, 60, 60, 40, 40, 20, 20, 40, 40, 40];
cY = [10, 10, 30, 50, 50, 70, 70, 90, 90, 70, 70, 50, 50, 30, 10];
for L = 1:length(cX)-1
    seg(L) = line([cX(L), cX(L+1)], [cY(L), cY(L+1)], lineStyle{:});
end
%}

hxTh = [0:2*pi/numSides:2*pi];% -pi/6;
r = 40;
hxX = r * cos(hxTh) + 50;
hxY = r * sin(hxTh) + 50;

for s = 1:length(hxTh)-1
    indx = mod(s, length(hxTh))+1;
    seg(s) = line([hxX(s), hxX(indx)], [hxY(s), hxY(indx)], lineStyle{:});
end


drawnow
pause(3)
% seg(1) = line([10, 85], [20, 20], lineStyle{:});

for n = 1:numProcesses
    for m = 1:length(seg);
        seg = mbrot(seg, m);
        drawnow
        % pause(.05)
    end
    fprintf('\nSegments: %d\n', length(seg))
end

%{
% Fill Mandelbrot shape after sorting line sequence
fill(sXm, sYm, [255, 215, 0]./255)
sY = get(seg, 'Ydata');
[sYm] = cell2mat(sY);
sX = get(seg, 'Xdata');
[sXm] = cell2mat(sX);
fill(sXm, sYm, [255, 215, 0]./255);
%}
