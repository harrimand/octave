## Copyright (C) 2019 Darrell Harriman
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} vlsmCalc (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Darrell Harriman <darrell@U64>
## Created: 2019-06-23

1;

function [vlsm] = vlsmCalc(ipCidr)
# Generate 16 x 16 2D vector for contiguous integers in submatrices where
# square matrix is split horizontally and rectangular matrix is split vertically
    quart = @(n) base2dec(dec2bin(n), 4);
    q = quart(0:15);
    vlsm = reshape(2 * q(floor((0:255)/16)+1) + q(mod(0:255, 16)+1), 16, 16)';
end

function snsz = snSize(mask)
    snsz = 2 ^ (32-mask);
end

function [octs] = octets(ipCidr)
# return vector of 4 IP octets + CIDR in 5th octet
    ipCIDR = strsplit(ipCidr, '/');
    octs = [str2double([strsplit(ipCIDR{1}, '.'), ipCIDR{2}])];
end

function [mask] = snMask(CIDR)
# Generate Subnet Mask from bit length (CIDR Bits)
    cidr = CIDR(end);
    lastOct = 256 - 2.^(8 - mod(cidr, 8));
    msk8 = floor(cidr / 8);
    mask = [ones(1, msk8) .* 255, lastOct, zeros(1, 3 - msk8)];
end
    
function [snA] = snAdd(octs, mask)
     snA = bitand(octs(1:4), mask);
end

function show(ip)
    octs = octets(ip);
    mask = snMask(octs);
    snA = snAdd(octs, mask);    
    disp(ip)
    disp(octs(1:4))
    disp(mask)
    disp(snA)
end
