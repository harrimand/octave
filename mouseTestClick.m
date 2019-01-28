
function mouseTestClick(H, d, S)
    fprintf('CLICK\n')
    mt = get(gcf, 'selectiontype');
    mp = get(gcf, 'currentpoint');
    tg = get(H, 'tag');
    ttStr = sprintf('Clicked %s', tg);
    title(ttStr, 'color', 'g', 'fontSize', 18, 'fontWeight', 'bold')
    
    fprintf('Mouse X: %d\n', mp(1))
    fprintf('Mouse Y: %d\n', mp(2))
    fprintf('Obj ID: %s\n', tg)

    % set(H, 'faceColor', 'k');
    
    switch(mt)
        case('normal')
            fprintf('Left Button\n')
        case('alt')
            fprintf('Right Button\n')
        case('extend')
            fprintf('Middle Button\n')
    end
end
    