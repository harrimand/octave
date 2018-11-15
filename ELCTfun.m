% ELCTfun
%
printf('\nppc(RX) 	Calculate Parallel R || X using a Vector with R, XL, XC\n')
ppc = @(RX) 1 / sum(1 ./ RX);  % Parallel Vector with R, XL, XC

printf('\nxcc(F, C)  Calculate Capacitive Reactance\n')
xcc = @(F, C) 1 / (2 * pi * F * C) * -1j;	% Capacitive Reactance

printf('\nxlc(F, L)  Calculate Inductive Reactance\n')
xlc = @(F, L) 2 * pi * F * L * 1j;   % Inductive Reactance

printf('\nfcc(L,C)   Calculate Resonant Frequency for L and C\n')
fcc = @(L, C) 1 / (2 * pi * sqrt(L * C));  % Resonant Frequency for L and C

printf('\nzc(R, X)   Combine sum(R) and sum(X) and return complex result\n')
zc = @(R, X) sum([R, complex(X)]); % Return complex number for R + X

printf('\nzmagc(Z)   Calculate complex(Z) magnitude and return result\n')
zmagc = @(Z) abs(Z);

printf('\nzAngDc(Z)   Calculate complex(Z) angle and return result in degrees\n')
zAngDc = @(Z) atan(real(Z) / imag(Z)) * 180 / pi;

printf('\nzAngRc(Z)   Calculate complex(Z) angle and return result in radians\n')
zAngRc = @(Z) atan(real(Z) / imag(Z));
