function fillComplexLine(fig, compPoints, color)
% Plot line connecting points represented by complex numbers in a vector
% fig = figure number 1.. to select plot window
% compPoints = vector of complex points.  Eg: [1+1i, 2+1i, 2+2i,... ]
% Close (Optional) if Close == 'close' a line will be drawn from the
%      last point in the vector to the first point in the vector.
%
%  See also: plotVector, plotPolD, plotStem, plotDC 

  figure(fig);
  hold on;
    if nargin == 3;
    if ischar(color)
      C = color;
    elseif max(color) > 1
      C = color ./ 255;
    else 
      C = color;
    end
  else
      C = [.7, .2, .5];  %Bright Red
  end

  for i = 1:length(compPoints)
    x1 = real(compPoints(i));
    y1 = imag(compPoints(i));
    Px(i) = x1;
    Py(i) = y1;
  end
  fill(Px, Py, C);  
end

% Example Usage:
% house = [2 + 3i, 2 + 1i, 4 + 1i, 4 + 3i, 2 + 3i, 3 + 4i, 4 + 3i]
% plotComplexLine(1, house .* (4+3i)); 
% Multiply house by complex number  house .* (4 + 3i)
% zooms in on house by magnitude = sqrt(4^2 + 3^2) = 5 times.
% rotates house by angle atan(3/4) = 36.9 degrees.