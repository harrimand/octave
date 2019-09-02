# avrTable
# write cell array of strings, vector of 8 bit or 16 bit numbers to a text file
# with given name.  File rows are formatted to be copied to AVR microcontroller
# asm file.

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
    
    fid = fopen([name, '.txt'], 'at');
    fwrite(fid, [name, 'Start:']);
    
    if(cellData)
        numRows = length(data);
        for n = 1:length(data)
            fwrite(fid, [char([13, 10]), '.db', char([9, 34]), data{n}, char([34])]);
        end
    else        
        numRows = floor(length(data) / 8);    
        for n = 0:numRows-1
            fwrite(fid, [char([13, 10]), prefix, char([9]), num2str(data(n*8+1))]);
            for c = 2:8
                fwrite(fid, [', ', num2str(data(n*8 + c))]);
            end
        end
        fwrite(fid, [char([13, 10]), prefix, char([9]), num2str(data(numRows * 8))]);
        for n = numRows * 8 + 1: length(data)
            fwrite(fid, [', ', num2str(data(n))]);
            # disp(n)
        end
    end
    
    fwrite(fid, [char([13, 10]), [name, 'End:'], char([13, 10])]);
    fflush(fid);
    fclose(fid);
end
