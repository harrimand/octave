function varargout = truthTable(showTable = 0)
# Author: Darrell Harriman  harrimand@gmail.com
# Example Usage:
# [A, B, C] = truthTable(1); #Display table and assign bits to A, B and C
# Generate binary sequence with bits in columns A, B, C,...
# Output columns variable.  Eg: [A, B, C] or [A, B, C, D, E]
# showTable parameter default = 0.  
# Logic Operations after running this function Eg:  B & xor(A, C)
#
    for b = 1:nargout
        varargout{b} = bitget(0:2^nargout-1, nargout + 1 - b)';
    end

    if(showTable)
        printf('\n\n')
        printf('\t')
        for h = 1:length(varargout)
            printf(['   ', char(h + 64)])
        end
        printf('\n')

        printf('\t ')
        for h = 1:length(varargout)
            printf('----')
        end
        printf('\n')

        for Line = 1:2^length(varargout)
            printf([num2str(Line-1), '\t'])
            for Col = 1:length(varargout)
                printf(['   ', num2str(varargout{Col}(Line))])
            end
            printf('\n')
        end
     
        printf('\n')
    end

    printf([
        "!A             # NOT A\n",...
        "A | B          # A OR B\n",...
        "A & B & C      # A AND B AND C\n",...
        "xor(A, B, C)   # A XOR B XOR C\n",...
        "!(A | B)       # A NOR B\n",...
        "!(A & B)       # A NAND B\n",...
        "!xor(A, B)     # A XNOR B\n"])
end
