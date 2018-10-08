% fillComplexLine plots filled array of points
% Author: Darrell Harriman  harrimand@gmail.com
% Parameters:
%     fig:  figure # for plot
%     compPoints: Array of points to be filled
%
% See also: makeStar, randColor, randomStars

function fillComplexLine(fig, compPoints)
  figure(fig);
  hold on;
  
  Plen = length(compPoints);
  for i = 1:Plen
    x1 = real(compPoints(i));
    y1 = imag(compPoints(i));
    Px(i) = x1;
    Py(i) = y1; 
  end
  randomColor = randColor();
  fill(Px, Py, randomColor);
end
