function cplx = pold2cplx(mag, ang);
  cplx = 0;
  if (nargin == 2)
    [x, y] = pol2cart(ang * pi/180, mag);
    cplx = complex(x, y);
  else
    error("usage: pol2cplx(magnitude, degrees)");
  endif
  endfunction;