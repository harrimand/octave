
#Equations for series R-C circuits.

#Solve for capacitor voltage at given V, R, C and t
Vc = @(V, R, C, t) V * (1 - exp(-t./(R * C)));

#Solve for required Resistor value at given V, Vc, C and t
Rt = @(V, Vc, C, t) -t/(log(-(Vc/V-1)))/C;

#Solve for required Capacitance value at given V, Vc, R and t
Ct = @(V, Vc, R, t) -t/(log(-(Vc/V-1)))/R;

#Solve for Current at given V, R, C and t
It = @(V, R, C, t) (V - Vc(V, R, C, t)) ./ R;




