
function [sub] = subMwrap(M, r, c, rh, cw)
%  subMwrap(M, r, c, rh, cw) returns rh x cw submatrix of M at M(r, c).
%    rows wrapped bottom <-> top    columns wrapped right <-> left.
%
%  Author:  Darrell Harriman  harrimand@gmail.com
%
%  M = Matrix
%  r = starting row              C = starting column
%  rh = submatrix row height.    cw = submatrix column width
%  if ending row (r + rh) greater than # of rows in M additional rows will be
%    taken from top of M until rh rows are taken.
%  if ending column (c + cw) greater than # of columns in M additional columns
%     will be taken from left side of M until cw columns are taken.
%
%  See also:  conwayTest, conway

  [rows cols] = size(M);
  r = mod(r-1, rows)+1;
  c = mod(c-1, cols)+1;

  if ((r + rh - 1) <= rows) && ((c + cw - 1) <= cols) %re<=  ce<=
    % disp('re<=  ce<=')
    %disp(r:r+rh)
    sub = M(r:r + rh -1, c:c + cw - 1);
    return
    
  elseif ((r + rh - 1) > rows) && ((c + cw - 1) <= cols)  %re>  ce<= 
    % disp('re>  ce<=')
    re = mod(r + rh, rows) - 1;
    %disp(re);
    %disp(r);
    sub = vertcat(M(r:end, c:c + cw - 1), M(1:re, c:c + cw - 1));
    
  elseif ((r + rh - 1) <= rows) && ((c + cw - 1) > cols) %re<=  ce>
    % disp('re<=  ce>')
    ce = mod(c + cw, cols) - 1;
    sub = horzcat(M(r:r + rh - 1, c:end), M(r:r + rh - 1, 1:ce));
    
  else
    % disp('re>  ce>') % re>  ce>
    re = mod(r + rh, rows) - 1 ;
    ce = mod(c + cw, cols) - 1;
    subT = horzcat(M(r:end, c:end), M(r:end, 1:ce));
    subB = horzcat(M(1:re, c:end), M(1:re, 1:ce));
    sub = vertcat(subT, subB); 
end
