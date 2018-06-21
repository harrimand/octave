
function [t SinWave] = SinWav(F, Vp, SampleDuration, spc, PhDeg, DC)
% SinWave returns 2 vectors for timesteps and sin waveform
%
% F = Frequency of waveform
% Vp = Voltage peak
% SampleDuration = Time for duration of desired waveform
% spc = number of Samples Per Cycle
%    Note: spc = Sample_Frequency(Samp/sec) / F(cycles/Sec)
% DC (Optional) = DC Voltage offset for waveform. Default = 0
%
% Return vector t = timestep iterations for duration of waveform
% Return vector Wave = points for waveform at each timestep
%
% See also: TriWave

  if nargin < 5
    DC = 0
  end
  
 % Vp = Vpp / 2;
 T = 1/F;
 Ph = PhDeg * pi / 180;
 
  sampleIter = T / spc;
  t = 0 : sampleIter : SampleDuration;
  
  SinWave = Vp * sin(2 * pi * F * (t + Ph)) + DC;
  end
    