# reactorControl

close

function clicked(varargin)
    mxy = get(gca, 'currentpoint');
    mx = round(mxy(1, 1) + .5); # Calculate integer X Coordinate
    my = 17 - floor(mxy(1, 2)); # Calculate Top-Down Y Coordinate

    TitleT = sprintf('X = %s Y = %s', num2str(mx), num2str(my));
    
    if(mx > 4 && mod(mx, 5) < 4 && my > 4 && my < 14 && mod(my, 5) < 4 )
        cell = floor(my / 5 - 1) * 4 + floor(mx / 5); # Cell Number
        cellStr = ['  ', num2str(cell)];
        TitleT = [TitleT, ' | Reactor', cellStr,' selected'];
        
        # Clear Highlighting and Highlight Selected Reactor.
        Rt = findall('-regexp', 'Tag', '\d');
        set(Rt(1:8), 'EdgeColor', 'k')
        set(Rt(1:8), 'linewidth', 1);
        pause(.1)
        set(findobj('Tag', num2str(cell)), 'EdgeColor', 'r', 'linewidth', 3)
    else
        Rt = findall('-regexp', 'Tag', '\d');
        set(Rt(1:8), 'EdgeColor', 'k')
        set(Rt(1:8), 'linewidth', 1);
        TitleT = [TitleT, ' | No Reactor selected'];    
    end
    disp(TitleT)
    set(get(gca, 'title'), 'string', TitleT, 'fontsize', 24, 'fontweight', 'bold')
end

#-------------------------------------------------------------------------------

figure()
axis();

set(gcf, 'Position', [2050, 600, 1020, 800])
pause(.2)
set(gcf, 'Position', [2050, 600, 1024, 840])

set(gca, 'xlim', [0, 24], 'ylim', [0, 17])
set(gca, 'buttondownfcn', @clicked)
title('Reactor Control Center', 'fontsize', 20, 'fontweight', 'bold')

tagnum = 1;
for r = 1:-1:0
    for c = 0:3
    rectangle('Position', [4 + c * 5, 4 + r * 5, 4, 4], 'Tag', num2str(tagnum))
    tagnum += 1;
    end
end
