function [color] = colorPick(varargin)
% colorPick(varargin) Will return a varargin x 3 matrix with selected colors.
% Parameters:
%     varargin: Number of desired colors.
%       Color selection window will open and close when varargin colors have
%           been selected.
    % disp(varargin) 
    if length(varargin) == 0
        numcolors = 1;
    else
        numcolors = varargin{1};
        % fprintf(' Number of colors: ')
        % disp(numcolors)
    end
    
    figure()
    set(gcf, 'Position', get(0, 'Screensize'));

    hold on
    cc = colorcube();
    for y = 1:8
        for x = 1:8
            rectangle('Position', [x, y, 1, 1], 'FaceColor', cc((y-1)*8+x,:));
        end
        text(y +.4, .5, int2str(y), 'fontsize', 14)
        text(.5, y +.5, int2str(y), 'fontsize', 14)
    end

    titleStr = sprintf('Choose %d colors', numcolors);
    title(titleStr, 'fontsize', 28, 'Color', 'k');
    
    axis off;
    
    color = zeros(numcolors, 3);
    for n = 1:numcolors
        [mx, my, button] = ginput(1);
        color(n,1:3) = cc((floor(my)-1)*8 + floor(mx),:);
        titleStr = sprintf('%d more colors to select', numcolors - n);
        title(titleStr, 'fontsize', 28, 'Color', color(n,:));
    end
    title('Thanks for using colorPick',  'fontsize', 28, 'Color', color(n,:));
    pause(1)
    close;
end
