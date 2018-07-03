function [table] = vlsm(bits)
%  vlsm(bits) return 2D matrix sequenced for division to contiguous ranges
%
%  Matrix will contain all integers from 0 to (2^bits)-1

if mod(sqrt(2.^bits),1) == 0
    r = 0:sqrt(2^bits)-1;
    c = r;
else
    r =  0:sqrt(2^(bits+1)-1)/2;
    c = 0:sqrt(2^(bits+1)-1);
end
table = [base2dec(dec2bin(c),4)]' + [2 * base2dec(dec2bin(r),4)];
