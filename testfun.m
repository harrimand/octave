% Copyright (C) 2018 Darrell harriman
% This file demonstrates the usage of script files in MatLab / Octave
% Script files may contain several functions.
% Function files can contain only one function and the keyword
%   'function' must be the first item evaluated.
% Script files are identified as script files when the keyword 'function' is 
%    NOT the first item evaluated.  Placing 1; on a line before the first 
%    function makes sure that the file isn't identified as a function file.
% Script files must be called before the functions in them can be used.
% Entering the script file's base name in the command window will call the file
% Example:
% >>testfun    % will call the script file testfun.m and make the functions
% >>           % in the file available.
%
% functions in script files are evaluated on first use.  You can call other 
%     functions in a function even if it hasn't already been evaluated. 

1;  %Does nothing but causes file to be interpreted as a script file.

function plus5 = add5(n)
  plus5 = add2(add3(n));
endfunction

function plus2 = add2(n)
  plus2 = n + 2;
endfunction

function plus3 = add3(n)
  plus3 = n + 3;
endfunction

% Returning 2 values in a row vector
function [mypi, myeul] = myvars()
    mypi = 3.14;
    myeul = 2.718;
endfunction

% Returning a matrix with size based on input parameter.
function [vlsmTable] = vlsm(n)
  vlsmTable = [base2dec(dec2bin(0:n-1),4)'.+(base2dec(dec2bin(0:n-1),4)*2)];
endfunction

% Getting user input from a dialog box.
 function [nums] = inputNums()
  prompt = {'Enter Space seperated numbers'};
  title = 'Data Entry';
  rows = 1;
  inputStr = inputdlg(prompt, title, rows);
  if (isempty (inputStr))
    nums = []
    helpdlg('Canceled by user', 'Information')
  else
    nums = str2double(strsplit(inputStr{1,1}));
  endif
endfunction

% Plot 3 Phase Sin Wave with comparator outputs
% A > B, B > C, C > A
function threePhEnc()
  t = 0:pi/36:8*pi;
  A = 1 * sin(t + 0) + 5;
  B = 1 * sin(t + 2 * pi/3) + 5;
  C = 1 * sin(t + 4 * pi/3) + 5;
  z = t * 0;
  cpAB = (A > B) * .8 + 3.1;
  cpBC = (B > C) * .8 + 2.1;
  cpCA = (C > A) * .8 + 1.1;
  plot(t, A, 'r', 'linewidth', 2
     , t, B, 'g', 'linewidth', 2
     , t, C, 'b', 'linewidth', 2
     , t, z, 'k', 'linewidth', 2);
  hold on;
  plot(t, cpAB, 'r', t, cpBC, 'g', t, cpCA, 'b');
  xlim([0, 25]);
  ylim([0, 7]);
  set(gca, 'xTick', pi/6:pi/3:8*pi);
  set(gca, 'xTickLabel', {...
     '  pi / 6', ' 3pi / 6', ' 5pi / 6', ' 7pi / 6', ' 9pi / 6', '11pi / 6'...
   , '13pi / 6', '15pi / 6', '17pi / 6', '19pi / 6', '21pi / 6', '23pi / 6'...
   , '25pi / 6', '27pi / 6', '29pi / 6', '31pi / 6', '33pi / 6', '35pi / 6'...
   , '37pi / 6', '39pi / 6', '41pi / 6', '43pi / 6', '45pi / 6', '47pi / 6'});
endfunction
