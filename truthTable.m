

function [tt] = truthTable(bits)
  tt = dec2bin(0:2^bits-1)(:,:);
