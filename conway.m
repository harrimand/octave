
function [S] = conway(M)
% conway(M) returns size(M) matrix of sums of neighbors for each cell
%
%  Author:  Darrell Harriman  harrimand@gmail.com
%
% M = Matrix of bool, integer or float
%{
%Example:
R = round(rand(8)) == 1;
sum3_3 = conway(R);
R = R & (sum3_3 > 1) & (sum3_3 < 4) | (!R & (sum3_3 == 3))

sum3_3 = conway(R);
R = R & (sum3_3 > 1) & (sum3_3 < 4) | (!R & (sum3_3 == 3))

%}
% See also:  conwayTest subMwrap

  [r c] = size(M);
  ri = [r, 1:r-1];  % 3x3 matrix starts at row -1 with wrapping
  ci = [c, 1:c-1];  % 3x3 matrix starts at column -1 with wrapping

  ir = 1;     % iteration counter for row
  for rr = ri
    ic = 1;   % iteration counter for column
    for cc = ci
      %  Sum of elements of 3x3 submatrix at M(rr, cc) - M(ir, ic)
      S(ir,ic) = cast(sum(sum(subMwrap(M, rr, cc, 3, 3))) - M(ir, ic), 'uint8');
      ic ++;
    end
    ir ++;
  end
end
