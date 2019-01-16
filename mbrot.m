% mandelbrot
% close
% plotWindow

% lineStyle = {'Color', 'y', 'LineWidth', 3};
% seg = [];
% seg(1) = line([20, 50], [20, 60], lineStyle{:});

function seg = mbrot(seg, n)
    lineStyle = {'Color', 'y', 'LineWidth', .1};
    lenSeg = length(seg);
    [X12] = get(seg(n), 'Xdata');
    x1 = X12(1);
    x2 = X12(2);
    [Y12] = get(seg(n), 'Ydata');
    y1 = Y12(1);
    y2 = Y12(2);
    nx13 = (x2-x1)/3+x1;
    nx23 = 2*(x2-x1)/3+x1;
    ny13 = (y2-y1)/3+y1;
    ny23 = 2*(y2-y1)/3+y1;

    lineStyle{2} = 'b';
    set(seg(n), 'Xdata', [x1, nx13], 'Ydata', [y1, ny13], lineStyle{:})
    % seg(1) = line([x1, nx13], [y1, ny13], lineStyle{:});
    lineStyle{2} = 'r';
    seg(lenSeg+1) = line([nx13, nx23], [ny13, ny23], lineStyle{:});
    % lineStyle{2} = 'r';
    seg(lenSeg+2) = line([nx13, nx23], [ny13, ny23], lineStyle{:});
    lineStyle{2} = 'b';
    seg(lenSeg+3) = line([nx23, x2], [ny23, y2], lineStyle{:});

    rotate(seg(lenSeg+1), [0,0,1], 60, [nx13, ny13, 0])
    rotate(seg(lenSeg+2), [0,0,1], -60, [nx23, ny23, 0])
end

% seg = mbrot(seg, 1);

