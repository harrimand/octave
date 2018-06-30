
function  [zS] = zenerMat(iS)
  % zenerMat(iS) returns a 2D matrix with zener diode circuit analysis results
  %
  % Usage Example: 
  %      analysis = zenerMat(iS)
  %      where iS is a 2D list of input parameters
  % iS(:,1) = all Rows, Column 1 = Supply Voltage
  % iS(:,2) = all Rows, Column 2 = Rated Zener Voltage
  % iS(:,3) = all Rows, Column 3 = Designed Load Current
  % is(:,4) = all Rows, Column 4 = Rated Max Zener Power
  %
  % Output zS is a 2D list containing calculated analysis results.
  % zS contains one row for each row in iS
  % zS(:1) = all Rows, Column 1 = IzMax = Max Zener Current
  % zS(:2) = all Rows, Column 2 = V_Rs = Voltage on Series Resistor
  % zS(:3) = all Rows, Column 3 = I_Max = Max Total Current
  % zS(:4) = all Rows, Column 4 = RsMin = Minimum Series Resistor Value
  % zS(:5) = all Rows, Column 5 = RsMax = Maximum Series Resistor Value
  % zS(:6) = all Rows, Column 6 = PMax = Maximum Input Power
  % zS(:7) = all Rows, Column 7 = PMin = Minimum Input Power
  % zS(:8) = all Rows, Column 8 = Pout = Output Power to load
  % zS(:9) = all Rows, Column 9 = PeffMin = Minimum Power Efficiency
  % zS(:10) = all Rows, Column 10 = PeffMax = Maximum Power Efficiency
  %
  % zS = [IzMax V_Rs I_Max RsMin RsMax Pmax PMin Pout PeffMin PeffMax]
  %
  % See also: zener, zenerSweep
  
  header = (['   ' 'IzMax         ' 'V_Rs        ' 'I_Max        '...
  'RsMin        ' 'RsMax         ' 'Pmax         ' 'PMin         '...
  'Pout         ' 'PeffMin      ' 'PeffMax']);
  disp(header);
  
  zS(:,1) = iS(:,4) ./ iS(:,2);             % IzMax = PzMax / Vz
  zS(:,2) = iS(:,1) -  iS(:,2);             % V_Rs = Vs - Vz
  zS(:,3) = iS(:,3) +  zS(:,1);             % I_Max = IL + IzMax
  zS(:,4) = zS(:,2) ./ zS(:,3);             % RsMin = V_Rs / I_Max
  zS(:,5) = zS(:,2) ./ iS(:,3);             % RsMax = V_Rs / IL
  zS(:,6) = iS(:,1) .* zS(:,3);             % Pmax = Vs * I_Max
  zS(:,7) = iS(:,1) .* zS(:,2) ./ zS(:,5);  % Pmin = Vs * V_Rs / RsMax
  zS(:,8) = iS(:,2) .* iS(:,3);             % Pout = Vz * IL
  zS(:,9) = zS(:,8) ./ zS(:,6) .* 100;      % PeffMin = Pout / Pmax * 100
  zS(:,10) = zS(:,8) ./ zS(:,7) .* 100;     % PeffMax = Pout / Pmin * 100
  
end
