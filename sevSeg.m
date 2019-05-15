classdef sevSeg
    properties (SetAccess = public, GetAccess = public)
        dig
        Val
        segSize
        posX
        posY
    end
    methods
        function obj = sevSeg(X, Y, Sz)
            if nargin == 3
                obj.Val = 0;
                obj.posX = X;
                obj.posY = Y;
                obj.segSize = Sz;
                obj = obj.newSeg();
                obj = obj.setSize(Sz);
                obj = obj.setPos(X, Y);
            else
                error('Usage: sevSeg(posX, posY, Size)')
            end
        end

        function obj = newSeg(obj)
            obj.dig = hggroup();
            Rec = rectangle('Position', [-5/14, -.5, 5/7, 1], 'edgecolor', 'b',...
                'faceColor', [.5, .5, .5], 'linewidth', 2, 'tag', 'r', 'parent', obj.dig);
            seg(1) = fill([-.2, .2, .3, -.3, -.2], [.35, .35, .45, .45, .35], 'g', 'tag', 'a', 'parent', obj.dig);
            seg(2) = fill([.2, .2, .3, .3, .2], [.35, .05, 0, .45, .35], 'g', 'tag', 'b', 'parent', obj.dig);
            seg(3) = fill([.2, .2, .3, .3, .2], [-.05, -.35, -.45, 0, -.05], 'g', 'tag', 'c', 'parent', obj.dig);
            seg(4) = fill([-.2, .2, .3, -.3, -.2], [-.35, -.35, -.45, -.45, -.35], 'g', 'tag', 'd', 'parent', obj.dig);
            seg(5) = fill([-.2, -.2, -.3, -.3, -.2], [-.05, -.35, -.45, 0, -.05], 'g', 'tag', 'e', 'parent', obj.dig);
            seg(6) = fill([-.2, -.2, -.3, -.3, -.2], [.35, .05, 0, .45, .35], 'g', 'tag', 'f', 'parent', obj.dig);
            seg(7) = fill([-.3, -.2, .2, .3, .2, -.2, -.3], [0, -.05, -.05, 0, .05, .05, 0],...
                  'g', 'tag', 'g', 'parent', obj.dig);
            seg(8) = rectangle('Position', [.305, -.495, .04, .04], 'Curvature', [1, 1],...
                'Edgecolor', 'none', 'Facecolor', 'r', 'tag', 'p', 'parent', obj.dig);
         end
 
        function obj = setSize(obj, segSize)
            % dig = obj.dig;
            CH = get(obj.dig, 'Children');
            set(CH(1), 'Position', get(CH(1), 'Position') .* segSize)
            set(CH(9), 'Position', get(CH(9), 'Position') .* segSize)

            for n = 2:8
                set(CH(n), 'Xdata', get(CH(n), 'Xdata') .* segSize);
                set(CH(n), 'Ydata', get(CH(n), 'Ydata') .* segSize);
            end
        end
        
        function obj = setPos(obj, posX, posY)
            % dig = obj.dig;
            CH = get(obj.dig, 'Children');
            OldposX = get(CH(9), 'position')(1);
            OldposY = get(CH(9), 'position')(2);
            movX = posX - OldposX;
            movY = posY - OldposY;

            for n = 2:8
                set(CH(n), 'Xdata', get(CH(n), 'Xdata') + movX);
                set(CH(n), 'Ydata', get(CH(n), 'Ydata') + movY);
            end
            set(CH(1), 'position', get(CH(1), 'position') + [movX, movY, 0, 0])
            set(CH(9), 'position', get(CH(9), 'position') + [movX, movY, 0, 0])
        end
        
        function obj = digWr(obj, num)
            % dig = obj.dig;
            obj.Val = num;
            set(obj.dig, 'userdata', num)
            CH = get(obj.dig, 'Children');
            ss = [0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0xFD, 0x07,...
                0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71];
            for b = 2:8
                if(bitget(ss(num+1), 9-b))
                    set(CH(b), 'facecolor', [0, 1, 0])
                else
                    set(CH(b), 'facecolor', [.6, .6, .6])
                end
            end
        end
        
        function obj = digClr(obj)
            % dig = obj.dig;
            CH = get(obj.dig, 'Children');
            for b = 2:8
                set(CH(b), 'facecolor', [.6, .6, .6])
            end
        end
        
        function V = getVal(obj)
            V = obj.Val;
            disp(V)
        end
%{
        function obj = set.Val(obj, num)
            obj.Val = num;
        end
%}
        function obj = set.Val(obj, num)
            obj.Val = num;
        end
        
        function V = get.Val(obj)
            V = obj.Val;
            % disp(V)
        end            
    end
end
