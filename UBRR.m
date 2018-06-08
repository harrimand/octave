% Calculate AVR USART Universal Baud Rate Register 
% UBRR = mcu_clk / (16 * BAUD) - 1
%
% Usage:  UBRR(mcu_clock_frequency, BAUD_rate)
% Output [UBRR, UBRR High Byte, UBRR Low Byte]

function [B BH BL] = UBRR(f_osc, baud)
  B = uint16(f_osc / (16 * baud) - 1);
  BL = bitand(B, 255);  % Low Byte
  BH = bitand(B, uint16(255 * 256)) / 256 % High Byte
  % BH = (B - BL) / 256;        % This works as well.
  printf("\n\tUBRR = %d\t", B)
  printf("UBRRH = %d\t", BH)
  printf("UBRRL = %d\n\n", BL)
endfunction
