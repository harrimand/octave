function sliderSin
% Author Darrell Harriman
% Demonstrate adding sin wave with phase shifted sin wave.
% Using Slider control to adjust phase shift
    F = 1000;
    T = 1/F;
    A = 5;
    A2 = 5;
    th = 0;
    w = 2 * pi * F;
    x = linspace(0, 3 * T, 300);
    y1 = A * sin(w * x);
    y2 = A2 * sin(w * x + th * pi / 180);
    Y = y1 + y2;
    
    FigH = figure('position',[360 500 800 800]);
    axes('XLim', [0, 3 * T], 'YLim', [-10, 10], 'units','pixels', ...
         'position',[100 160 600 600], 'NextPlot', 'add');
    
    LineH1 = plot(x,y1, 'color', 'b');
    LineH2 = plot(x, y2, 'color', 'm');
    LineHsum = plot(x, Y, 'color', 'r');
    
    TextH = uicontrol('style','text',...
        'position',[170 30 80 15]);
    
    SliderH = uicontrol('style','slider','position',[100 60 400 20],...
        'min', -180, 'max', 180);
    addlistener(SliderH, 'Value', 'PostSet', @callbackfn);
    
    movegui(FigH, 'center')
    
    function callbackfn(source, eventdata)
        num = get(eventdata.AffectedObject, 'Value');
        LineH2.YData = (A * sin(w * x + num * pi / 180));
        LineHsum.YData  = A * sin(w * x) + (A * sin(w * x + num * pi / 180));
        TextH.String = num2str(num);
    end
end