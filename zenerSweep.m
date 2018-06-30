function  [analysis] = zenerSweep(parameters)
  % zener(Vs, Vz, IL, PzMax) returns Min and Max series resistor value.
  % Usage Example: 
  %      [RsMin RsMax] = zener(12.5, 5.1, .015, .20)
  % Vs = Supply Voltage
  % Vz = Rated Zener Voltage
  % IL = Designed Load Current
  % PzMax = Rated Max Zener Power
  %
  % Subtract and Add source voltage (noise/deviations) and run for each.
  % Derate PzMax to protect zener from over current.
  % Run function with Load Current = 0 to find minimum series resistance 
  %     to protect the zener diode when the output is switched off.
  %   We have zener diodes rated for 250 mW
  %
  
  disp('RsMin   Pmax    PeffMin RsMax   Pmin    PeffMax Pout')
  for ind = 1 : length(parameters)
    val = parameters(ind,:);
    Vs = val(1);
    Vz = val(2);
    IL = val(3);
    PzMax = val(4);
  
    IzMax = PzMax / Vz;    % Max Zener Current
    V_Rs = Vs - Vz;        % Series Resistor Voltage
    I_tMax = IL + IzMax;   % Maximum Total Current
    RsMin = V_Rs / I_tMax; % Minimum Series Resistor Value (Max Zener Current)
    RsMax = V_Rs / IL;     % Maximum Series Resistor Value (No Zener Current)
    Pmax = Vs*(Vs-Vz)/RsMin; % Max Input Power with minimum series resistance
    Pmin = Vs*(Vs-Vz)/RsMax; % Min Input Power with maximum series resistance
    Pout = Vz * IL;          % Power Output
    PeffMin = 100 * Pout / Pmax;  % Power Efficiency Minimum
    PeffMax = 100 * Pout / Pmin;  % Power Efficiency Maximum
    
    analysis(ind,1) = RsMin;
    analysis(ind,2) = Pmax;
    analysis(ind,3) = PeffMin;
    analysis(ind,4) = RsMax;
    analysis(ind,5) = Pmin;
    analysis(ind,6) = PeffMax;
    analysis(ind,7) = Pout;
    ind ++;
  end
end
