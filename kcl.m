
function I = kcl(It, R, varargin)
% KCL  Kirchoff's current law  current divider calculation
%    It = Total Current
%    R = Resistor Value to find current through
%    varargin = Remaining resistor values.
%    Eg:  kcl(12, 100, 200, 200) returns 6.  Current through 100 Ohm Resistor
%
%    See also rpar, kvl

    G = 1 / R;
    for n = 1:length(varargin)
        G = G + 1 / varargin{n};
    end
    I = It * 1/R / G;
end
