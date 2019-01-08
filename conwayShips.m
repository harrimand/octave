% conwayShips

pattern = 7;

% Medium Weight Space Ship
mwssL = [0,0,0,1,0,0;0,1,0,0,0,1;1,0,0,0,0,0;1,0,0,0,0,1;1,1,1,1,1,0];
mwssR = mwssL(:,end:-1:1);
mwssU = rot90(mwssL, -1);
mwssD = rot90(mwssL, 1);

% Heavy Weight Space Ship
hwssL = [0,0,0,1,1,0,0;0,1,0,0,0,0,1;1,0,0,0,0,0,0;1,0,0,0,0,0,1;1,1,1,1,1,1,0];
hwssR = hwssL(:,end:-1:1);
hwssU = rot90(hwssL, -1);
hwssD = rot90(hwssL, 1);

% Light Weight Space Ship
lwssL = [1,0,0,1,0;0,0,0,0,1;1,0,0,0,1;0,1,1,1,1];
lwssR = lwssL(:,end:-1:1);
lwssU = rot90(lwssL, -1);
lwssD = rot90(lwssL, 1);

% Glider Space Ship
gssDR = [0,1,0;0,0,1;1,1,1];
gssUR = [1,1,1;0,0,1;0,1,0];
% gssUR = gssDR(:,end:-1:1);
gssDL = rot90(gssDR, -1);
gssUL = flipud(gssDL); %, 1)

% Pulsar  Sequence has 48, 56 and 72 live cells. size = 17x17
PS48 =    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
           0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0;...
           0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0;...
           0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0;...
           0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0;...
           0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0;...
           0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0;...
           0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0;...
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

PS56 =    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
           0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0;...
           0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0;...
           0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0;...
           0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0;...
           0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0;...
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
           
PS72 =    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0;...
           0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0;...
           0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0;...
           0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0;...
           0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0;...
           0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0;...
           0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0;...
           0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0;...
           0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; 

% acorn 5x9
acorn =    [0, 0, 0, 0, 0, 0, 0, 0, 0;...
            0, 0, 1, 0, 0, 0, 0, 0, 0;...
            0, 0, 0, 0, 1, 0, 0, 0, 0;...
            0, 1, 1, 0, 0, 1, 1, 1, 0;...
            0, 0, 0, 0, 0, 0, 0, 0, 0];

% Matrix Insert Function -----------------------------------------------------
function mat = minsert(mat, iMat, r, c)
    [matR, matC] = size(mat);
    [imatR, imatC] = size(iMat);

    if((imatR > matR) || (imatC > matC))
        error('Paste Matrix larger than Matrix')
    end
    
    r = mod(r-1, matR)+1;
    c = mod(c-1, matC)+1;
    ovR = max(0, (imatR + r) - matR - 1);
    ovC = max(0, (imatC + c) - matC - 1);
    rStart = r - ovR;
    rEnd = r + imatR - ovR - 1;
    cStart = c - ovC;
    cEnd = c + imatC - ovC - 1;

    tmat = circshift(mat, [-ovR, -ovC]);
    tmat(rStart:rEnd,cStart:cEnd) = iMat;
    mat = circshift(tmat, [ovR, ovC]);
end

%{ Matrix Insert Function  (Depricated)
function [mat] = minsert(mat, imat, r, c)
    [matR, matC] = size(mat);
    [imatR, imatC] = size(imat);
    if((imatC + c - 1) > matC)
        error('Column Out of Bounds\n')
    elseif((imatR + r - 1) > matR)
        error('Row Out of Bounds\n')
    end
    mat(r:r+imatR-1,c:c+imatC-1) = imat;
end
%}
switch pattern
    case (1)
    % Random 1s and 0s -------------------------------------------------------
        tMat = round(rand(480, 720))==1;
        % tMat = round(rand(960, 1440))==1;

    case (2)
    % Gliders Low Resolution -------------------------------------------------

        tMat = zeros(48, 72);
        tMat = minsert(tMat, mwssR, 18, 2);
        tMat = minsert(tMat, mwssL, 25, 66);
        tMat = minsert(tMat, mwssU, 22, 39);
        tMat = minsert(tMat, mwssD, 22, 30);

        tMat = minsert(tMat, mwssL, 2, 67);
        tMat = minsert(tMat, mwssL, 43, 24);

        tMat = circshift(tMat, [0, -36]);

    case (3)
    % Gliders Randomly Placed ------------------------------------------------
        gl = zeros(3,3,4);
        gl(:,:,1) = gssDR;
        gl(:,:,2) = gssUR;
        gl(:,:,3) = gssDL;
        gl(:,:,4) = gssUL;

        % tMat = zeros(240, 360);
        tMat = zeros(480, 720);
        for s = 1:800
            rcMax = size(tMat) - size(gl(:,:,1));
            sx = round(rand(1)*(rcMax(1)-1)) + 1;
            sy = round(rand(1)*(rcMax(2)-1)) + 1;
            tMat = minsert(tMat, gl(:,:,mod(s, 4)+1), sx, sy);
        end

    case (4)
    % Single Pulsar Low Resolution -------------------------------------------
        tMat = zeros(20, 30);
        tMat = toroidMatPaste(tMat, PS48, 2, 6);

    case (5)
    %acorn
        tMat = zeros(200, 300);
        [tMR, tMC] = size(tMat);
        [aMR, aMC] = size(acorn);
        tMat = toroidMatPaste(tMat, acorn, floor(tMR/2-aMR/2), floor(tMC/2-aMC/2));

    case (6)
    % Pulsar Grid ------------------------------------------------------------
        ps(:,:,1) = PS48;
        ps(:,:,2) = PS56;
        ps(:,:,3) = PS72;
        PSCount = 1;

        tMat = zeros(212, 307);
        for r = 3:19:193
            for c = 3:19:288
                tMat = toroidMatPaste(tMat, ps(:,:,mod(PSCount,3) + 1), r, c);
                PSCount = PSCount + 1;
             end
             PSCount = PSCount + 1;
        end
    case (7)
    % Glider Collision
        tMat = zeros(192, 288);
        % tMat = toroidMatPaste(tMat, gssUL, 92, 141);
        % tMat = toroidMatPaste(tMat, gssUR, 92, 145);
        % tMat = toroidMatPaste(tMat, gssDL, 96, 141);
        % tMat = toroidMatPaste(tMat, gssDR, 96, 145);
        tMat = toroidMatPaste(tMat, gssDR, 4, 4);
        tMat = toroidMatPaste(tMat, gssDL, 2, 189);
        tMat = toroidMatPaste(tMat, gssUR, 189, 2);
        tMat = toroidMatPaste(tMat, gssUL, 188, 188);
    end
