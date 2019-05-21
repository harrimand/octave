classdef base %  < handle
    properties (SetAccess = public, GetAccess = public)
        N
        Base
        len
        sym
        weights
        Symbols
    end
    methods
        function obj = base(NUM, B)
            obj.N = NUM;
            obj.Base = B;
            obj.Symbols = [char(48:57), char(65:70)];
            obj = obj.numSyms();
            obj = obj.symVec();
            obj = obj.wghts();
        end

        function obj = numSyms(obj)
            obj.len = floor(log10(obj.N) / log10(obj.Base) + 1);
        end
        
        function obj = symVec(obj)
            for d = 1:obj.len
                obj.sym(obj.len + 1 - d) = mod(floor(obj.N / obj.Base^(d-1)), obj.Base);
            end
        end
        
        function obj = wghts(obj)
            obj.weights = obj.sym .* obj.Base.^(obj.len-1:-1:0);        
        end
        
        function lg = logb(obj, n, b)
            lg = log10(n) / log10(b);
        end
        
        function show(obj)
            disp('obj.N')
            disp(obj.N)
            disp('obj.Base: ')
            disp(obj.Base)
            disp('obj.len: ')
            disp(obj.len)
            disp('obj.sym')
            disp(obj.sym)
            disp('obj.weights')
            disp(obj.weights)
        end            

    end
end


%{
dn = @(n, b, d) mod(floor(n / b^(d-1)), b);
baselen = @(n, b) floor(log10(n) / log10(b) + 1);
logb = @(n, b) log10(n) / log10(b);
        
for d = 1:baselen(1000, 3)
    d3(8-d) = dn(1000, 3, d);
end

d3 =
   1   1   0   1   0   0   1

d3 .* 3.^(6:-1:0)
ans =
   729   243     0    27     0     0     1
sum(d3 .* 3.^(6:-1:0))
ans =  1000
%}
