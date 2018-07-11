
function [ M64 ] = conMat64()
  
  travUR = [ 0 1 1; 1 0 1; 0 0 1];
  travUL = [ 1 1 0; 1 0 1; 1 0 0];
  travDR = [ 0 0 1; 1 0 1; 0 1 1];
  travDL = [ 1 0 0; 1 0 1; 1 1 0];
  
  M64 = zeros(64);
  M64(62:64,  1: 3) = travUR;
  M64(52:54, 11:13) = travUR;
  M64(42:44, 21:23) = travUR;
  M64(32:34, 31:33) = travUR;
  M64(22:24, 41:43) = travUR;
  M64(12:14, 51:53) = travUR;
  M64(2:4,   61:63) = travUR;
  
  M64(57:59, 57:59) = travUL;
  M64(47:49, 47:49) = travUL;
  M64(37:39, 37:39) = travUL;
  M64(27:29, 27:29) = travUL;
  M64(17:19, 17:19) = travUL;
  M64( 7: 9,  7: 9) = travUL;
  
  M64( 6: 8,  56: 58) = travDR;
  M64(16:18,   6:  8) = travDR;
  M64(26:28,  16: 18) = travDR;
  M64(36:38,  26: 28) = travDR;
  M64(46:48,  36: 38) = travDR;
  M64(56:58,  46: 48) = travDR;
  
  M64( 21: 23,  62: 64) = travDL;
  M64( 31: 33,  52: 54) = travDL;
  M64( 41: 43,  42: 44) = travDL;
  M64( 51: 53,  32: 34) = travDL;
  M64( 61: 63,  22: 24) = travDL;
%  M64(  10: 12,  11: 13) = travDL;
%  M64( 17: 19,   2:  4) = travDL;  
  
  
  % M64( 26: 28,  53: 55) = travDL;
  
  [r c] = size(M64);  
  imagesc((1:r)+0.5, (1:c)+0.5, M64); % Plot Matrix
  colormap(gray);
  axis equal;
  set(gca, 'XTick', 1:(c+1), 'YTick', 1:(r+1), ...
         'XLim', [1 c+1], 'YLim', [1 r+1], ...
         'GridLineStyle', '-', 'XGrid', 'on', 'YGrid', 'on');  
end
