% conway
function conway(varargin)
    % Set Matrix dimensions for plot. round(rand(Rows, Columns))==1;
    %   For optimal scale set Columns = int(1.5 * Rows).
    switch nargin
        case(0)
            M = round(rand(960, 1440))==1;
            updateTime = .03;
        case(1)
            M = varargin{1};
            updateTime = .2;
        case(2)
            M = varargin{1};
            updateTime = varargin{2};
        case(3)
            M = varargin{1};
            updateTime = varargin{2};
            option = varargin{3};
    end
    % M = tMat;
    useColorPick = false; % Change to true if you want to pick 9 colors
    % updateTime = .03;    % Update speed ( Seconds per update )

    hfig = figure;
    %Define Color Maps:
    map2 = [0, 0, 0; 0, 1, 0];
    mapR9 = [0,0,0;.125,0,0;.25,0,0;.375,0,0;.5,0,0;.625,0,0;.75,0,0;.875,0,0;1,0,0];
    mapG9 = circshift(mapR9, [0,1]);
    mapB9 = circshift(mapG9, [0,1]);
    mapY9 = mapR9 + mapG9;
    mapX9 = [0,0,0;0,0,0;.5,0,0;1,0,0;0,1,1;0,.5,.5;0,0,1;0,0,.5;1,1,0];
    mapZ91 = [0,0,0; 0,0,0; 1,0,0; 1,1,0; 1,0,1; 0,1,1; 0,1,0; 1,1,1; 1,1,1];
    mapZ92 = [0,0,0; 0,0,0; 0,.8,0; 1,1,0; 1,0,0; 0,0,1; 0,1,0; 1,1,1; 1,1,1];
    mapZ93 = [0,0,0; 0,0,0; 0,0,1; 1,1,0; 1,0,0; 1,.11,.81; 0,1,0; 1,1,1; 1,1,1];

    if useColorPick
        mapCpick = colorPick(9)
        colormap(mapCpick);  % Use colorMap generated by colorPick
    else
        colormap(mapZ93);  % choose pre-defined colormap
    end
    ax = get(gca);
    set(hfig, 'Position', get(0, 'ScreenSize'))
    set(gca, 'Units', 'normalized')
    set(gca, 'Position', [0, 0, 1, 1])
    set(hfig, 'Menubar', 'none')
    tM = M(:,:) .* 6;
    mH = imagesc(tM, [0,8]);
    set(0, 'UserData', false)
    set(mH, 'ButtonDownFcn', {@conwayStop, '1'})

    % rotD = [-1, -1; -1, 0; -1, 1; 0, -1; 0, 1; 1, -1; 1, 0; 1, 1];
    % rotD2 = [-1, 0; 0, 1; 0, 1; 1, 0; 1, 0; -1, 0; -1, 0];
    rotD = [-1, -1; -1, 0; -1, 1; 0, 1; 1, -1; 1, 0; 1, 1];
    [r, c] = size(M);
    beginLiveCount = sum(sum(M));
    beginDensity = beginLiveCount / (r * c) * 100;

    m = zeros(size(M));
    mSumT = zeros(size(M));
    mSumT2 = zeros(size(M));
    mSum3 = zeros(size(M));
    done = false;
    generations = 1;

    tstart = tic();
    tperiod = tstart;
    pause(.3)
    set(hfig, 'Position', get(0, 'ScreenSize'))

    % set(mH, 'cdata', M.*5)
    drawnow
    pause(5)

    while(~ get(0, 'UserData'))
        mSum = circshift(M, [0,-1]);
        for rL = 1:7
            mSum = mSum + circshift(M, rotD(rL,:));
        end
        % disp(get(mH, 'UserData'))
        %{
        for rL = 1:8
            m(:,:,rL) = circshift(M, rotD(rL,:));
        end 
        %}
        % mSum = cast(sum(m, 3), 'uint8');
        
        % Plotting Live cells. Use colormap with 2 colors for this plot.
        % imagesc(M); 
        
        % Plotting cell colors based on number of live neighbors
        % imagesc(mSum, [0,8]); 
        set(mH, 'cdata', mSum)
        
        M = M & (mSum > 1) & (mSum < 4) | (~M & (mSum == 3));
        if(bitget(generations, 1))
            if(mSumT == mSum)
                set(0, 'UserData', true)
                % done = true;
            end
            mSumT = mSum;
        else
            if(mSumT2 == mSum)
                set(0, 'UserData', true)
                % done = true;
            end
            mSumT2 = mSum;
        end
        if(mod(generations,6) == 0) % Detect Pulsars with period = 3
            if(mSum3 == mSum)
                set(0, 'UserData', true)
                % done = true;
                fprintf('\nPulsar Detected\n')
            end
            mSum3 = mSum;
        end

        generations = generations + 1;
        if(option && (generations == 2))
            M(floor(r/2)-4:floor(r/2)-3, floor(c/2)-1:floor(c/2)) = [1,1;1,1;];
        end
        while(toc(tperiod) < updateTime)
        end    
        tperiod = tic();
        drawnow('expose')
        if(generations == 14000)
            break
        end
    end
      runtime = toc(tstart);
      LiveCount = sum(sum(M));
      Density = LiveCount / (r * c) * 100;
      fprintf('  Rows: %d  Columns: %d  Cells: %d\n', r, c, r * c);
      fprintf('  Run Time = %f seconds.\n', runtime);
      fprintf('  Generations = %d\n', generations);
      fprintf('  Average generation time = %f seconds.\n', runtime / generations);
      fprintf('  Generations Per Second: %f\n', generations / runtime );
      fprintf('  Begin Live Cells: %d  Begin Matrix Density %.2f%%\n',...
        beginLiveCount, beginDensity);
      fprintf('    End Live Cells: %d  End Matrix Density %.2f%%\n\n',...
        LiveCount, Density);

