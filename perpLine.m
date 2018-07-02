
function [P_outX, P_outY] = perpLine(L_in)
% Return [X1 X2], [Y1 Y2] for line L_in rotated 90 degrees at it's center.
%
% Usage:
%     L1 = line([x1, x2], [y1, y2]);
%     [L1pX L1pY] = perpLine(L1);
%     L1p = line(L1pX, L1pY, 'LineWidth', 3, 'color', 'b');
%

  X = get(L_in, 'xdata');  % X(1) = X1   X(2) = X2
  Y = get(L_in, 'ydata');  % Y(1) = Y1   Y(2) = Y2

  Dx = X(2) - X(1);  
  Dy = Y(2) - Y(1);

  Mid_X = (X(1)+X(2)) / 2;  % Mid point between X1 and X2
  Mid_Y = (Y(1)+Y(2)) / 2;  % Mid point between Y1 and Y2

  P_outX(1) = Mid_X + Dy/2; % New X1
  P_outX(2) = Mid_X - Dy/2; % New X2
  P_outY(1) = Mid_Y - Dx/2; % New Y1
  P_outY(2) = Mid_Y + Dx/2; % new Y2
   
end
