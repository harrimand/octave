# avrTable
# write cell array of strings, 1D vector of 8 bit or 16 bit numbers to a text 
# file with given name.  File rows are formatted to be copied to AVR
# microcontroller asm file.

function avrTable(name, data)

    if(iscell(data(1)))
        cellData = 1;
    else
        cellData = 0;
    end

    if not(cellData)
        if(isempty(find(data(data > 255), 1)))
            prefix = '.db';
        else
            prefix = '.dw';
        end
    else
        prefix = '.db';
    end

    newLine = [10];
    # newLine = [13, 10];
    
    fid = fopen([name, '.txt'], 'at');
    fwrite(fid, [';', char(ones(1,79) .* 45), char([10])]);
    fwrite(fid, [name, 'Start:']);
    
    if(cellData)
        numRows = length(data);
        for n = 1:length(data)
            fwrite(fid, [char(newLine), '.db', char([9, 34]), data{n}, char([34])]);
        end
    else        
        numRows = floor(length(data) / 8);    
        for n = 0:numRows-1
            fwrite(fid, [char(newLine), prefix, char([9]), num2str(data(n*8+1))]);
            for c = 2:8
                fwrite(fid, [', ', num2str(data(n*8 + c))]);
            end
        end
        if(mod(length(data), 8))
            fwrite(fid, [char(newLine), prefix, char([9]), num2str(data(numRows * 8 + 1))]);
            for n = numRows * 8 + 2: length(data)
                fwrite(fid, [', ', num2str(data(n))]);
                # disp(n)
            end
        end
    end

    fwrite(fid, [char(newLine), [name, 'End:'], char(newLine)]);
    fwrite(fid, [';', char(ones(1,79) .* 45), char(newLine)]);
    fflush(fid);
    fclose(fid);
end

#{
# Example Usage

# avrTable with 8 bit numbers
VT = 2 .* base2dec(dec2bin(0:15),4) + base2dec(dec2bin(0:15),4)';
VTflat = reshape(VT', 1, 256);
avrTable('avr8bit', VTflat)

# avrTable with 16 bit numbers
D = randi(1000, 1, 68);
avrTable('avr16bit', D)

# avrTable with cell array of strings
dC = {'abc', 'def', 'ghi', 'jkl', 'mno', 'pqr', 'stu', 'vwx', 'yz'};
avrTable('avrText', dC)

# avr Sin Wave Table (256 Values) Peak = 255, Min = 0, Zero = 128
avrSinTable = [floor(min(128 + sin(0:2 * pi / 256: 2 * pi) .* 128, 255))](1:end-1)
avrTable('avrSinTable', avrSinTable)

Open files in your favorite text editor.
avr8bit.txt
avr16bit.txt
avrText.txt
avrSinTable.txt

# To view a plot of the avrSinTable:
plot(1:length(avrSinTable), avrSinTable, 'color', 'r', 'linewidth', 2)
set(gca, 'XTick', [0:16:256], 'YTick', [0:16:256], 'XLim', [0,256],...
    'YLim', [0,256])
grid on
hold on
# line([x1, x2], [y1, y2], 'properties', 'property_Values')
line([0, 256], [128, 128], 'color', 'b', 'linewidth', 3) # X axis line
#}
