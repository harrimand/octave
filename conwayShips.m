% conwayShips

% pattern = 3;

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
gssDR =     [0,1,0;...
             0,0,1;...
             1,1,1];
gssDR2 =    [0, 1, 0;...
             1, 0, 1;...
             0, 1, 1];

%gssDL = rot90(gssDR, -1);
gssDL = fliplr(gssDR);

gssUR = [1,1,1;0,0,1;0,1,0];
gssUL2 = [1,1,0;1,0,1;0,0,1];
% gssUR = gssDR(:,end:-1:1);

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

switch pattern
    case (1)
    % Random 1s and 0s -------------------------------------------------------
        % tMat = round(rand(480, 720))==1;
        tMat = round(rand(960, 1440))==1;
        Period = .0001;
        opt = false;

    case (2)
    % Gliders Low Resolution -------------------------------------------------
        tMat = zeros(48, 72);
        tMat = toroidMatPaste(tMat, mwssR, 18, 2);
        tMat = toroidMatPaste(tMat, mwssL, 25, 66);
        tMat = toroidMatPaste(tMat, mwssU, 22, 39);
        tMat = toroidMatPaste(tMat, mwssD, 22, 30);

        tMat = toroidMatPaste(tMat, mwssL, 2, 67);
        tMat = toroidMatPaste(tMat, mwssL, 43, 24);

        tMat = circshift(tMat, [0, -36]);
        Period = .07;
        opt = false;

    case (3)
    % Gliders Randomly Placed ------------------------------------------------
        gl = zeros(3,3,4);
        gl(:,:,1) = gssDR;
        gl(:,:,2) = gssUR;
        gl(:,:,3) = gssDL;
        gl(:,:,4) = gssUL;

        % tMat = zeros(240, 360);
        % tMat = zeros(480, 720);
        % tMat = zeros(560, 840);
        % tMat = zeros(600, 900);
        % tMat = zeros(640, 960);
        % tMat = zeros(960, 1440);
        tMat = zeros(1600, 2400);
        
        for s = 1:1200
            rcMax = size(tMat) - size(gl(:,:,1));
            sx = round(rand(1)*(rcMax(1)-1)) + 1;
            sy = round(rand(1)*(rcMax(2)-1)) + 1;
            tMat = toroidMatPaste(tMat, gl(:,:,mod(s, 4)+1), sx, sy);
        end
        Period = .001;
        opt = false;

    case (4)
    % Single Pulsar Low Resolution -------------------------------------------
        tMat = zeros(20, 30);
        tMat = toroidMatPaste(tMat, PS56, 2, 6);
        Period = .2;
        opt = false;

    case (5)
    %acorn --------------------------------------------------------------------
        tMat = zeros(200, 300);
        [tMR, tMC] = size(tMat);
        [aMR, aMC] = size(acorn);
        tMat = toroidMatPaste(tMat, acorn, floor(tMR/2-aMR/2), floor(tMC/2-aMC/2));
        Period = .03;
%        Period = .005;
        opt = false;

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
        Period = .001;
        opt = true;
        
    case (7)
    % Glider Collision --------------------------------------------------------
        tMat = zeros(192, 288);
        % tMat = toroidMatPaste(tMat, gssUL, 92, 141);
        % tMat = toroidMatPaste(tMat, gssUR, 92, 145);
        % tMat = toroidMatPaste(tMat, gssDL, 96, 141);
        % tMat = toroidMatPaste(tMat, gssDR, 96, 145);
        tMat = toroidMatPaste(tMat, gssDR, 4, 4);
        tMat = toroidMatPaste(tMat, gssDL, 2, 189);
        tMat = toroidMatPaste(tMat, gssUR, 189, 2);
        tMat = toroidMatPaste(tMat, gssUL, 188, 188);
        Period = .03;
        opt = false;

    case (8)
    % Glider Column Collision -------------------------------------------------
        tMat = zeros(320, 480);
        for sr = 2:12:302
            tMat = toroidMatPaste(tMat, gssUR, sr, 82);
            tMat = toroidMatPaste(tMat, gssDL, sr, 398);
        end
        Period = .03;
        opt = false;
    
    case (9)
    % Glider Column Collision (17499 Generations)------------------------------
        tMat = zeros(320, 480);
        for sr = 2:12:302
            tMat = toroidMatPaste(tMat, gssUR, sr, 83);
            tMat = toroidMatPaste(tMat, gssDL, sr, 238);
            tMat = toroidMatPaste(tMat, gssDR, sr, 242);
            tMat = toroidMatPaste(tMat, gssUL, sr, 397);            
        end
        Period = .03;
        opt = false;
    
    case (10)
    % Glider Column Collision (17499 Generations)------------------------------
        tMat = zeros(320, 480);
        for sr = 2:12:302
            tMat = toroidMatPaste(tMat, gssUR, sr, 79);
            tMat = toroidMatPaste(tMat, gssDL, sr, 236);
            tMat = toroidMatPaste(tMat, gssDR, sr, 242);
            tMat = toroidMatPaste(tMat, gssUL, sr, 397);            
        end
        Period = .03;
        opt = false;
    
    case (11)
    % Glider Collision With Block ---------------------------------------------
    % Clearance to avoid other objects  32 Rows by 47 Columns    
        tMat = zeros(50, 75);
        tMat = toroidMatPaste(tMat, gssDR, 14, 27);
        tMat = toroidMatPaste(tMat, [1,1;1,1] , 28, 37);
        Period = .005;
        opt = false;

    case (12)
    % Glider Collision With Block ---------------------------------------------
    % Clearance to avoid other objects  32 Rows by 47 Columns    
        tMat = zeros(132, 252);
        for c = 2:49:198
            for r = 12:38:88
                tMat = toroidMatPaste(tMat, gssDR, r+2, c + 13);
                tMat = toroidMatPaste(tMat, [1,1;1,1] , r + 16, c + 23);
            end
        end
        Period = .1;
        opt = false;

    case (13)
    % Glider Collision With Block 4x4 -----------------------------------------
    % Clearance to avoid other objects  32 Rows by 47 Columns
        tMat = zeros(120, 180);
        mid = round(size(tMat)./2);
        tr = round(mid(1)/2) + 10;
        br = mid(1) + tr - 22;
        lc = mid(2)/2;
        rc = mid(2) + lc - 1;
        
        tMat = toroidMatPaste(tMat, gssDR, tr-14, mid(2)-10);
        tMat = toroidMatPaste(tMat, [1,1;1,1] , tr, mid(2));
        tMat = toroidMatPaste(tMat, gssUL, br+13, mid(2)+10);
        tMat = toroidMatPaste(tMat, [1,1;1,1] , br, mid(2)+1);
        tMat = toroidMatPaste(tMat, gssUR, mid(1) + 11, lc-12);
        tMat = toroidMatPaste(tMat, [1,1;1,1] , mid(1)+1, lc+2);
        tMat = toroidMatPaste(tMat, gssDL, mid(1) - 12, rc+13);
        tMat = toroidMatPaste(tMat, [1,1;1,1] , mid(1)-1, rc);

        Period = .1;
        opt = false;

    case (14)
    % Glider Collision 4 gliders start at top and bottom centers --------------
        tMat = zeros(20, 30);
        tMat = toroidMatPaste(tMat, gssDL, 2, 12);
        tMat = toroidMatPaste(tMat, gssDR, 2, 16);
        tMat = toroidMatPaste(tMat, gssUL, 17, 12);
        tMat = toroidMatPaste(tMat, gssUR, 17, 16);        
        
        Period = .3;
        opt = false;
        
    case (15)
        tMat = zeros(24, 36);
        tMat = toroidMatPaste(tMat, [1,1;1,1], 12, 18);
        tMat = toroidMatPaste(tMat, gssDR2, 4, 15);
        tMat = toroidMatPaste(tMat, gssDL, 8, 24);
        tMat = toroidMatPaste(tMat, gssUR, 15, 11);
        tMat = toroidMatPaste(tMat, gssUL2, 19, 20);        
        
        Period = .4;
        opt = false;

    case (16)
        tMat = zeros(66, 99);
        for c = 1:14:85
            tMat = conwayMatPaste(tMat, glDL(:,:,mod(c-1,4)+1), 30, c);
            tMat = conwayMatPaste(tMat, glUL(:,:,mod(c-1,4)+1), 30, c+7);
            tMat = conwayMatPaste(tMat, glDR(:,:,mod(c-1,4)+1), 36, c);
            tMat = conwayMatPaste(tMat, glUR(:,:,mod(c-1,4)+1), 36, c+7);            

            Period = .05;
            opt = false;
        end

    case (17)
    % Glider Collision With Block 4x4 -----------------------------------------
    % Clearance to avoid other objects  32 Rows by 47 Columns
        tMat = zeros(120, 180);
        mid = round(size(tMat)./2);
        tr = round(mid(1)/2) + 10;
        br = mid(1) + tr-4;
        lc = mid(2)/2;
        rc = mid(2) + lc - 1;
        
        tMat = toroidMatPaste(tMat, gssDR, tr-14, mid(2)-10);
        tMat = toroidMatPaste(tMat, [1,1;1,1] , tr, mid(2));
        tMat = toroidMatPaste(tMat, gssDR, tr-7, .5 * mid(2)-12);
        tMat = toroidMatPaste(tMat, [1,1;1,1] , tr, .5 * mid(2)-9);
        tMat = toroidMatPaste(tMat, gssDR, tr-7, 1.5 * mid(2)+3);
        tMat = toroidMatPaste(tMat, [1,1;1,1] , tr, 1.5 * mid(2)+6);

        tMat = toroidMatPaste(tMat, gssDR, br-14, mid(2)-10);
        tMat = toroidMatPaste(tMat, [1,1;1,1] , br, mid(2));
        tMat = toroidMatPaste(tMat, gssDR, br-7, .5 * mid(2)-12);
        tMat = toroidMatPaste(tMat, [1,1;1,1] , br, .5 * mid(2)-9);
        tMat = toroidMatPaste(tMat, gssDR, br-7, 1.5 * mid(2)+3);
        tMat = toroidMatPaste(tMat, [1,1;1,1] , br, 1.5 * mid(2)+6);
        
        %{
        tMat = toroidMatPaste(tMat, gssUL, br+13, mid(2)+10);
        tMat = toroidMatPaste(tMat, [1,1;1,1] , br, mid(2)+1);

        tMat = toroidMatPaste(tMat, gssUR, mid(1) + 11, lc-12);
        tMat = toroidMatPaste(tMat, [1,1;1,1] , mid(1)+1, lc+2);

        tMat = toroidMatPaste(tMat, gssDL, mid(1) - 12, rc+13);
        tMat = toroidMatPaste(tMat, [1,1;1,1] , mid(1)-1, rc);
%}
        Period = .1;
        opt = false;

    case (18)
        tMat = zeros(120, 178);
        tMat1 = toroidMatPaste(tMat, eye(79), 22, 41);
        tMat2 = toroidMatPaste(tMat, eye(79), 22, 43);
        tMat = tMat1 | tMat2;
        % tMat([59:60]-0, [87:90]-0) = [1,1,1,1;1,1,1,1];
        tMat([59:61]-0, [78:82]-0) = [1,1,0,1,1;0,0,0,0,0;1,1,0,1,1];%1,1,1,1];
        Period = .1;
        opt = false;
       
    end

close
M = conway(tMat, Period, opt);
% M = conwayTest(tMat, Period, opt);

% Matrix Insert Function -----------------------------------------------------
function mat = toroidMatPaste(mat, iMat, r, c)
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
function [mat] = toroidMatPaste(mat, imat, r, c)
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
