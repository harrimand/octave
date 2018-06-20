

function [t Wave] = TriWave(F, Vpp, SampleDuration, spc, DC)
% TriWave returns 2 vectors for timesteps and triangle waveform
%
% F = Frequency of waveform
% Vpp = Voltage peak to peak
% SampleDuration = Time for duration of desired waveform
% spc = number of Samples Per Cycle
%    Note: spc = Sample_Frequency(Samp/sec) / F(cycles/Sec)
% DC (Optional) = DC Voltage offset for waveform. Default = 0
%
% Return vector t = timestep iterations for duration of waveform
% Return vector Wave = points for waveform at each timestep
%

  if nargin == 4
    DC = 0;
  elseif nargin < 4 || nargin > 5  
    error("Wrong number of arguments\n\
Usage: Triwave(Frequency, V_p-p, Sample_Duration,\
 Samples_Per_Cycle, DC_offset)\n\
 DC offset is optional.  Default = 0\n\
 Type 'help TriWave' for more information\n")
  end
  
  T = 1/F;
  Vmin = DC - Vpp/2;
  Vmax = DC + Vpp/2;
  Vslope = (Vmax - Vmin) / (T/2);
  sampleIter = T / spc;
  t = 0 : sampleIter : SampleDuration;
  Wave = abs((t+T/4) - (round((t+T/4)/T) * T)) * Vslope - Vpp/2 + DC;
  end
  