
function [star] = makeStar()

  VertPos = 2;
  HorPos = 2;
  r = .5;
  h1 = 0;
  h2 = .224514;
  h3 = .363271;
  h4 = .587785;
  h5 = .951057;
  v1 = 1;
  v2 = .309017;
  v3 = -.118034;
  v4 = -.381966;
  v5 = -.809017;
   
  cx = HorPos;
  % center vertical so border above top point matches border below bottom points.
  cy = VertPos / 2 + (1 - v5) / 2 * r;

star(1) = (( h1 * r + cx - r) + ((v1 * r + cy) * 1i));
star(2) = (( h2 * r + cx - r) + ((v2 * r + cy) * 1i));
star(3) = (( h5 * r + cx - r) + ((v2 * r + cy) * 1i));
star(4) = (( h3 * r + cx - r) + ((v3 * r + cy) * 1i));
star(5) = (( h4 * r + cx - r) + ((v5 * r + cy) * 1i));
star(6) = (( h1 * r + cx - r) + ((v4 * r + cy) * 1i));
star(7) = ((-h4 * r + cx - r) + ((v5 * r + cy) * 1i));
star(8) = ((-h3 * r + cx - r) + ((v3 * r + cy) * 1i));
star(9) = ((-h5 * r + cx - r) + ((v2 * r + cy) * 1i));
star(10) = ((-h2 * r + cx - r) + ((v2 * r + cy) * 1i));
star(11) = (( h1 * r + cx - r) + ((v1 * r + cy) * 1i));

  
end

%Randomly placing stars on an 18 x 18 plot.
%for i = 1:100
%  x = rand(1) * 16;
%  y = rand(1) * 16;
%  fillComplexLine(1, St + (x + y * 1i));
%end;