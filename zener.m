
function  [RsMin RsMax] = zener(Vs, Vz, IL, PzMax)
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
  %   We have zener diodes rated for 250 mW
  %
  
  IzMax = PzMax / Vz;    % Max Zener Current
  V_Rs = Vs - Vz;        % Series Resistor Voltage
  I_tMax = IL + IzMax;   % Maximum Total Current
  RsMin = V_Rs / I_tMax; % Minimum Series Resistor Value
  RsMax = V_Rs / IL;     % Maximum Series Resistor Value
  Pmax = Vs*(Vs-Vz)/RsMin;
  Pmin = Vs*(Vs-Vz)/RsMax;  
  
  display('');
  display(['Maximum Series Resistor: ' num2str(RsMax)]);
  display(['Input Power for ' num2str(RsMax) ' Ohms: ' num2str(Pmin) ' Watts']);
  
  display(['Minimum Series Resistor: ' num2str(RsMin)]);
  display(['Input Power for ' num2str(RsMin) ' Ohms: ' num2str(Pmax) ' Watts']);
  
  display(['Output Power: ' num2str(Vz * IL) ' Watts']);
 
  
end
