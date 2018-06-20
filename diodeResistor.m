
function [DRvoltage] = diodeResistor(Wave, bias)
  % diodeResistor returns resistor voltage when connected in series with a diode
  %
  % Wave = vector of Waveform of voltages across series diode and resistor
  % bias = diode forward bias voltage
  %
  % See also: TriWave
  
 for i = 1:length(Wave)
  if  Wave(i) > bias
    DRvoltage(i) = Wave(i) - bias;
  else
    DRvoltage(i) = 0;
  end
end
