function [mag, ang] = cplx2polr(cp);
  x = real(cp);
  y = imag(cp);
  ang = atan(y/x);
  mag = y / sin(ang);
  endfunction
  
  