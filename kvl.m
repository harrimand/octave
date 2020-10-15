
function VR = kvl(V, R, varargin)
% KCL  Kirchoff's voltage law  voltage divider calculation
%    V = Total applied voltage
%    R = Resistor Value to find voltage across
%    varargin = Remaining resistor values.
%    Eg:  kvl(12, 100, 200, 300) returns 2.  Voltage across 100 Ohm Resistor
%
%    See also rpar, kcl

    Rt = R;
    for n = 1:length(varargin)
        Rt = Rt + varargin{n};
    end
    VR = V * R / Rt;
end
