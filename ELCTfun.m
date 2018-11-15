% ELCTfun
%
fprintf('\nppc(RX) 	Calculate Parallel R || X using a Vector with R, XL, XC\n')
ppc = @(RX) 1 / sum(1 ./ RX);  % Parallel Vector with R, XL, XC

fprintf('\nxcc(F, C)  Calculate Capacitive Reactance\n')
xcc = @(F, C) 1 ./ (2 * pi * F * C) * -1j;	% Capacitive Reactance

fprintf('\nxlc(F, L)  Calculate Inductive Reactance\n')
xlc = @(F, L) 2 * pi * F * L * 1j;   % Inductive Reactance

fprintf('\nfcc(L,C)   Calculate Resonant Frequency for L and C\n')
fcc = @(L, C) 1 / (2 * pi * sqrt(L * C));  % Resonant Frequency for L and C

fprintf('\nzc(R, X)   Combine sum(R) and sum(X) and return complex result\n')
zc = @(R, X) sum([R, complex(X)]); % Return complex number for R + X

fprintf('\nzs(z1, z2)  Add Series Impedances and return result\n')
zs = @(z1, z2) z1 + z2;

fprintf('\nzmagc(Z)   Calculate complex(Z) magnitude and return result\n')
zmagc = @(Z) abs(Z);

fprintf('\nzAngDc(Z)   Calculate complex(Z) angle and return result in degrees\n')
zAngDc = @(Z) atan(imag(Z) ./ real(Z)) .* 180 / pi;

fprintf('\nzAngRc(Z)   Calculate complex(Z) angle and return result in radians\n')
zAngRc = @(Z) atan(imag(Z) ./ real(Z));

