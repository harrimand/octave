% Set X axis tick spacing.
% integer fig = figure number (Plot Window Number)
% tickSize = tick spacing from 0 (- .. 0 .. +)

function Dxtick(fig, tickSize)
  figure(fig);
  xRange = get(gca, 'xlim');
  xMin = xRange(1);
  xMax = xRange(2);
  
  xTick = xMin+mod(abs(xMin),tickSize):tickSize:xMax-mod(abs(xMax),tickSize);  
  
  set(gca, 'xtick', []);
  set(gca, 'XMinorGrid', 'off');
  
  set(gca, 'xtick', xTick);
  end
