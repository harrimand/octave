## Author: Darrell Harriman <harrimand@gmail.com>
## Created: 2018-10-07

function randomStars(fig, n)
    % randomStars plots randomly colored stars at random points.
    % fig = figure #. You can use 1 if no other figures are open.
    % n = number of stars to plot.  large numbers take time to plot.
    %    Try a reasonable number like 100 to start with.
    %  numbers over 5000 take significant time and don't look as well.
    % this function requires the following functions to work
    %       makeStar.m
    %       randColor.m
    %       fillComplexLine.m
    % Matlab will create links to the following files when you type 
    %    help randomStars
    %
    % See also: makeStar, randColor, fillComplexLine
    
    St = makeStar();
    % Randomly placing stars on an 18 x 18 plot.
    for m = 1:n
        x = rand(1) * 16;
        y = rand(1) * 16;
        fillComplexLine(fig, St + (x + y * 1i));
    end;
    
