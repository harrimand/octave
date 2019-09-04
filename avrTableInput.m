## Copyright (C) 2019 Darrell Harriman
## 
## Author: Darrell Harriman harrimand@gmail.com
## Created: 2019-09-04

function avrTableInput()

    dlgTitle = "Enter SinWave Table Settings";
    
    endianness = ["Endianess Big Endian | Little Endian\n",...
        "Enter hl for high byte, low byte in flash memory.\n",...
        "Enter lh for low byte, high byte in flash memory.\n",...
        "The .dw assembly directive reverses the byte order.\n"];
    
    prompt = {"Table/File Name", "Pulse Frequency (Hz)" ,"Sweep Time (Seconds)",...
        "Min Pulse Width (uS)", "Max Pulse Width (uS)", endianness};
    defaults = {"avrTable", "50", "1.5", "600", "2200", "hl"};
    rowscols = [1,30; 1,20; 1,20; 1,20; 1,20; 1,10];
    sinParams = inputdlg (prompt, dlgTitle, rowscols, defaults);
    
    # disp(sinParams)
    
    name = sinParams{1};
    F = str2num(sinParams{2});
    sweepTime = str2num(sinParams{3});
    minPulse = str2num(sinParams{4});
    maxPulse = str2num(sinParams{5});
    endian = sinParams{6};

    map = @(In, minIn, maxIn, minOut, maxOut) In * (maxOut - minOut) / (maxIn - minIn) + minOut;
   
    numVals = sweepTime  * F;

    avrSinTable = floor(min(128 + sin(0:2 * pi / numVals: 2 * pi) .* 128, 255))(1:end-1);

    avrServoTable = round(arrayfun(map, avrSinTable, min(avrSinTable),...
        max(avrSinTable), minPulse, maxPulse));

    if(max(avrServoTable) > 255 && strcmp(endian, 'hl'))
        avrServoTable = swapbytes(uint16(avrServoTable));
        disp(["\nByte order swapped to lowByte|highByte";...
        ".dw assembly directive will reverse it to highByte|lowByte\n"])
    end

    avrTable(name, avrServoTable);

    disp(["Created File: ", name, ".txt with ", num2str(numVals), " values.\n"])

end
