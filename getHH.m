% Get Handles for objects with given Tags or get all Handles if Tag is not given

function [HH] = getHH(t)
    obsH = findobj(gcf, "-depth", 5);
    obsT = get(obsH, 'Tag');
    szObs = size(obsH);
    HH = [];
    for n = 1:szObs(1)
%        printf("\tH = %f\tTag = %s\n", obsH(n), obsT{n});
        if(not(exist('t')))
            HH = [HH, obsH(n)];
        elseif(strcmp(t, obsT{n}))
            HH = [HH, obsH(n)];    
        end
    end
end

%{
H = 1.000000    Tag =
H = -3.783099   Tag = p3
H = -2.394383   Tag = p2
H = -1.840188   Tag = p1
H = -7.335223   Tag = ax1
H = -6.197551   Tag = T3
H = -5.911647   Tag = T2
H = -4.798440   Tag = T1
H = -13.364784  Tag = c2
H = -12.628871  Tag = c1
%}
