function cplx = pol2cplx(mag, ang);
  cplx = 0;
  if (nargin == 2)
    [x, y] = pol2cart(ang, mag);
    cplx = complex(x, y);
  else
    error("usage: pol2cplx(magnitude, radians)");
  endif
  endfunction;
  