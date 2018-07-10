
function [M] = conwayTest(M)
%  Calculate sums of neighboring cells to M(r,c) and update M(r,c)
%
%  Author:  Darrell Harriman  harrimand@gmail.com
%
%  Conway's Game of Life Rules:
%  If M(r,c) == 1 and sum_of_neighbors = 2 or 3 new M(r,c)=1 else new M(r,c)=0
%  If M(r,c) == 0 and sum_of_neighbors = 3 new M(r,c)=1 else new M(r,c)=0
%
%  Example Usage:
%  >> M = round(rand(8))==1; %creating 8x8 matrix of boolean 1s or 0s.
%  >> M = conwayTest(M);  Function updates plot until 'x' is entered on console
%
%  See also:  conway, subMwrap
  
  disp('Enter x in console to stop Conways Game of Life');
  fflush(stdout);
  [r c] = size(M);  % r = rows  c = columns
  [sum3_3 done] = neighbors(M);
%  sum3_3 = conway(M); % Sum of neighbors including wrapped top-bottom side-side
  M = M & (sum3_3 > 1) & (sum3_3 < 4) | (!M & (sum3_3 == 3));
  
  imagesc((1:r)+0.5, (1:c)+0.5, M); % Plot Matrix
  colormap(gray);
  axis equal;
  set(gca, 'XTick', 1:(c+1), 'YTick', 1:(r+1), ...
         'XLim', [1 c+1], 'YLim', [1 r+1], ...
         'GridLineStyle', '-', 'XGrid', 'on', 'YGrid', 'on');
  
  tstart = tic();
  generations = 0;
  while (~ done)
    if kbhit(1) == 'x' % Enter 'x' in console to stop
      display(generations);
      display(toc(tstart));
      break
    end
    [sum3_3 done] = neighbors(M);
%    sum3_3 = conway(M);
    M = M & (sum3_3 > 1) & (sum3_3 < 4) | (!M & (sum3_3 == 3));
    imagesc((1:r)+0.5, (1:c)+0.5, M);
    generations ++;
    title(['Generations: ' num2str(generations)], 'FontSize', 16);

%    while(toc(tstart) < .25)
%    end
%    tstart = tic();
    % pause(.25);  % Seconds to slow simulation
    
  end
  disp(toc(tstart))
  disp(num2str(generations))
end
