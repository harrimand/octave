% setFig
% Utility to help set figure position, size, title and axis settings.
% Author: Darrell Harriman  harrimand@gmail.com

ss = get(0, 'ScreenSize');
printf('\nYour Screen Size is %d by %d\n', ss(3), ss(4));

printf('\nSet desired figure position and size and click o.k.\n')
printf('Set desired axis properties\n')
printf('Copy the following code and paste it in your script.\n')

figure();
axis();
pause(.25);
msgbox('Select Current Figure Size');
pause(.25);
fp = get(gcf, 'Position');

% User Input Dialogs for figure and axis settings
dlgTitle = 'Set Figure Properties';
prompt = {'Title', 'Title Font Size', 'Xmin', 'Xmax', 'Ymin', 'Ymax',...
    'Xtick size', 'Ytick size', 'grid [on | off]'};
txtSz = [1, 20; 1,5; 1, 5; 1, 5; 1, 5; 1, 5; 1, 5; 1, 5; 1, 5];
defaults = {'Title', '20', '0', '100', '0', '256', '10', '16', 'on'};
cfg = inputdlg(prompt, dlgTitle, txtSz, defaults);

% Setting current figure and axis properties
title(cfg{1}, 'fontsize', str2num(cfg{2}), 'fontweight', 'bold')
set(gca, 'Xlim', [str2num(cfg{3}), str2num(cfg{4})],...
    'Ylim', [str2num(cfg{5}), str2num(cfg{6})],...
    'XTick', str2double(cfg{3}): str2double(cfg{7}): str2double(cfg{4}),...
    'YTick', str2double(cfg{5}): str2double(cfg{8}): str2double(cfg{6}));
grid(cfg{9});

% Printing Output Script
printf("\nfigure();\n")
printf("axis();\n")
printf("set(gcf, 'Position', [%d, %d, %d, %d])\n", fp(1), fp(2), fp(3), fp(4))
printf("title('%s', 'fontsize', %d, 'fontweight', 'bold');\n",...
    cfg{1}, str2num(cfg{2}))
printf("set(gca, 'XLim', [%d, %d], 'YLim', [%d, %d]);\n",...
    str2num(cfg{3}), str2num(cfg{4}), str2num(cfg{5}), str2num(cfg{6}))
printf("set(gca, 'XTick', %.2f: %.2f: %.2f);\n",...
    str2double(cfg{3}), str2double(cfg{7}),str2double(cfg{4}))
printf("set(gca, 'YTick', %.2f: %.2f: %.2f);\n",...
    str2double(cfg{5}), str2double(cfg{8}),str2double(cfg{6}))
printf("grid %s;\n\n", cfg{9})
