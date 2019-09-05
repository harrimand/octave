# avrLEDbreath

Fcpu = 1E6;  # AVR frequency
Tcpu = 1 / Fcpu;
csOpts = [1, 8, 64, 256, 1024];
format short eng
maxT0_T = 256 .* csOpts .* Tcpu
# maxT0_T =
#
#    256.0000e-06     2.0480e-03    16.3840e-03    65.5360e-03   262.1440e-03
#
F = 200;    #Pulse Frequency
T = 1/F
# T =     5.0000e-003
format
T0_preScaler = csOpts(find(maxT0_T == min(maxT0_T(maxT0_T > T))));
# T0_preScaler =  64

OCR0A = round(T / (T0_preScaler * Tcpu));
# OCR0A = 78

breathTime = 2; # Time to fade from dark to full bright
numSteps = breathTime * F;
# numSteps = 400

# create exppnential vector from 1 to 78
ex = linspace(0, log(OCR0A), numSteps);
p = floor(exp(ex));

# Append reversed vector so LED fades dark to bright to dark
p = [p, p(end:-1:1)];
# length(p) = 800

# Generate AVR table
avrTable('ledBreathe', p);
# File ledBreath.txt created

# The moral of this story
# Using Timer 0.
# Timer 0 Clock Select for Fcpu / 64
# OCR0A = TOP
# OCR0B = Pulse Width
# Waveform Generation Mode = 7
# COM0B1..0 = 10

plot(1:length(p), p)
title("A plot is worth a 1000 words.", 'fontsize', 16, 'fontweight', 'bold')
