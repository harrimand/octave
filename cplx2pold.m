function [mag, ang] = cplx2pold(cp);
  x = real(cp);
  y = imag(cp);
  ang = atan(y/x) * 180/pi;
  mag = y / (sin(atan(y/x)));
  endfunction