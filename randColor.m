function rcolor = randColor()
% randColor  Return short name for randomly selected color.
% Parameters:  None

    colors = ['y', 'm', 'c', 'r', 'g', 'b', 'w', 'k'];
    C = round(rand * 7) + 1;
    rcolor = colors(C);
end