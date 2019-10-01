function [t sqW] = sqWave(F, App, Adc, duration)
% sqWave returns vectors t and sqW signal
% [t sqW] = sqWave(F, App, Adc, duration)
% F = frequency
% 
% App = Amplitude peak - peak
% Adc = DC offset
% duration = Signal duration in seconds
%
% See also: TriWave, SinWav

    T = 1/F;
    Amin = -.5 * App + Adc;
    Amax = .5 * App + Adc;
    nc = round(duration * F);  #Number of cycles

    dc = .75;
    
%    sqW = repmat([Amin, Amin, Amax, Amax], 1, nc);
    sqW = repmat([Amax, Amax, Amin, Amin], 1, nc);
    t = [0, [round([1:4*nc] ./ 2)](1:end-1)] ./ F;
%    t = [round([1:4*nc] ./ 2)] ./ F;
    pH_L = [0, repmat([dc, dc, 0, 0], 1, 5)(1:end-1)];
    
    
    Plot = true;

    if(Plot)
        close
        plot(t, sqW, 'linewidth', 2)
        axis tight
        set(gca, 'Ylim', [Amin - 1, Amax + 1])
        grid on
        set(gca, 'Xtick', [0:T:2 * nc * T])
        set(gca, 'fontsize', 14)
    end
end
