close
figure()
axis();

set(gcf, 'Position', [1226, 230, 560, 650])
set(gca, 'Xlim', [-10, 10], 'Ylim', [-10, 10])
% set(gca, 'Ylim', [-5, 15], 'Ylim', [-5, 15])

set(gca, 'Xtick', -10:1:15)
set(gca, 'Ytick', -10:1:15)
set(gca, 'Units', 'normalized')
set(gca, 'Position', [0, 0, 1, 1])
set(gcf, 'Color', 'k')
set(gca, 'Color', 'k')
hold on
axis off

% grid on
%{
%------------------------------------------------------------------------------
dig = hggroup();
% Rec = rectangle('Position', [-.25, -.35, .5, .7], 'parent', dig);
Rec = rectangle('Position', [-5/14, -.5, 5/7, 1], 'parent', dig,...
    'faceColor', [.7, .7, .7]);
set(Rec, 'edgecolor', 'b')
set(Rec, 'linewidth', 2)
seg(1) = fill([-.2, .2, .3, -.3, -.2], [.35, .35, .45, .45, .35], 'g', 'parent', dig);
seg(2) = fill([.2, .2, .3, .3, .2], [.35, .05, 0, .45, .35], 'g', 'parent', dig);
seg(3) = fill([.2, .2, .3, .3, .2], [-.05, -.35, -.45, 0, -.05], 'g', 'parent', dig);
seg(4) = fill([-.2, .2, .3, -.3, -.2], [-.35, -.35, -.45, -.45, -.35], 'g', 'parent', dig);
seg(5) = fill([-.2, -.2, -.3, -.3, -.2], [-.05, -.35, -.45, 0, -.05], 'g', 'parent', dig);
seg(6) = fill([-.2, -.2, -.3, -.3, -.2], [.35, .05, 0, .45, .35], 'g', 'parent', dig);
seg(7) = fill([-.3, -.2, .2, .3, .2, -.2, -.3], [0, -.05, -.05, 0, .05, .05, 0],...
     'g', 'parent', dig);
seg(8) = rectangle('Position', [.305, -.495, .04, .04], 'Curvature', [1, 1],...
    'Edgecolor', 'none', 'Facecolor', 'r', 'parent', dig);

%------------------------------------------------------------------------------
segSize = 7;
% Set Segment Size
set(Rec, 'Position', get(Rec, 'Position') .* segSize)
set(seg(8), 'position', get(seg(8), 'position') .* segSize)
for n = 1:7
    set(seg(n), 'Xdata', get(seg(n), 'Xdata') .* segSize);
    set(seg(n), 'Ydata', get(seg(n), 'Ydata') .* segSize);
end
%------------------------------------------------------------------------------
%}
pause(.1)
set(gcf, 'Position', [1226, 230, 670, 700])

%{
%------------------------------------------------------------------------------
posX = -5;
posY = 0;
% Set sevSeg Position
OldposX = get(Rec, 'position')(1);
OldposY = get(Rec, 'position')(2);
movX = posX - OldposX;
movY = posY - OldposY;

for n = 1:7
    set(seg(n), 'Xdata', get(seg(n), 'Xdata') + movX);
    set(seg(n), 'Ydata', get(seg(n), 'Ydata') + movY);
    end
set(Rec, 'position', get(Rec, 'position') + [movX, movY, 0, 0])
set(seg(8), 'position', get(seg(8), 'position') + [movX, movY, 0, 0])
%------------------------------------------------------------------------------
%}

if(1)
% Example 2 digit Hex Counter
    sd = sevSeg(-8*5/7, -4, 8);
    sd2 = sevSeg(0, -4, 8);
    for n = 0:35
        sd2.digWr(mod(n, 16));
        if(n < 16)
            sd.digClr();
        else
            sd.digWr(floor(n/16));
        end
        % disp(sd2.getVal)
        pause(.5)
    end
end

% Prompt for a digit to display
% A = newdig.digWr(str2num(inputdlg("Display Number"){}))
