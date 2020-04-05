% AVR Microcontroller Timer Counter OCRnA Calculator

T_freq = 50

T_period = 1 / T_freq

Fcpu = 1E6;
Per_cpu = 1 / Fcpu;
T1max = 65535;
T0max = 255;

ckSel = [0, 1, 8, 64, 256, 1024];
tPeriod = 1 / Fcpu .* ckSel;

T0_maxTime = (T0max + 1) * max(ckSel) * 1E-6
T1_maxTime = (T1max + 1) * max(ckSel) * 1E-6

%------------------------------------------------------------------
% Timer 1
if(T_period <= T1_maxTime)
    printf("\nTimer 1---------------------------------------------")
    maxT1time = (T1max + 1) .* tPeriod;
    printf("\nTimer 1 Resolution | Max Time\n")
    format short eng
    disp([tPeriod; maxT1time]')

    format
    CS1 = min(maxT1time(maxT1time > T_period));
    T1_ckSel = ckSel(find(CS1 == maxT1time));
    OCR1A = round(T_period / (T1_ckSel * Per_cpu));

    TCCR1 = sprintf("\nCksel = MCU/IOclk/%d  |  OCR1A = %d\n", T1_ckSel, OCR1A);
    printf(TCCR1)

    CT1set = sprintf("Target Time: %d uS | %d S\n", T_period * 1E6, T_period);
    printf(CT1set)
    CT1p = sprintf("Configured T1 Time: %d uS\n", OCR1A * T1_ckSel);
    CT1f = sprintf("Configured T1 Frequency: %d Hz\n", 1/(OCR1A * T1_ckSel * 1E-6));
    printf(CT1p)
    printf(CT1f)
    else
    error("Frequency too low for Timer 1")
end
printf("\n\n")

%------------------------------------------------------------------
% Timer 0
if(T_period <= T0_maxTime)
    printf("\nTimer 0---------------------------------------------")
    maxT0time = (T0max + 1) .* tPeriod;
    printf("\nTimer 0 Resolution | Max Time\n")
    format short eng
    disp([tPeriod; maxT0time]')

    format
    CS0 = min(maxT0time(maxT0time > T_period));
    T0_ckSel = ckSel(find(CS0 == maxT0time));
    OCR0A = round(T_period / (T0_ckSel * Per_cpu));

    TCCR0 = sprintf("\nCksel = MCU/IOclk/%d  |  OCR0A = %d\n", T0_ckSel, OCR0A);
    printf(TCCR0)

    CT0set = sprintf("Target Time: %d uS | %d S\n", T_period * 1E6, T_period);
    printf(CT0set)

    CT0p = sprintf("Configured T0 Time: %d uS\n", OCR0A * T0_ckSel);
    CT0f = sprintf("Configured T0 Frequency: %d Hz\n", 1/(OCR0A * T0_ckSel * 1E-6));
    printf(CT0p)
    printf(CT0f)
else
    error("Frequency too low for Timer 0")
end
