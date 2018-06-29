
function  [RsMin, RsMax] = zener(Vs, Vz, IL, PzMax)
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
  
  disp('...');
  disp(['Maximum Series Resistor: ' num2str(RsMax)]);
  disp(['Input Power for ' num2str(RsMax) ' Ohms: ' num2str(Pmin) ' Watts']);
  disp([' Maximum Efficiency: ' num2str(PeffMax) '%']);
  disp(' ');  
  disp(['Minimum Series Resistor: ' num2str(RsMin)]);
  disp(['Input Power for ' num2str(RsMin) ' Ohms: ' num2str(Pmax) ' Watts']);
  disp([' Minimum Efficiency: ' num2str(PeffMin) '%']);
  disp(' ');
  disp(['Output Power: ' num2str(Vz * IL) ' Watts']);
  
  end
