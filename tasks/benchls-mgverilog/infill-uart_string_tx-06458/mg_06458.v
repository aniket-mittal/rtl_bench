module mg_06458(NumberOfChars, Clock, Reset, Start, tx_full, uartClock, RAMAddress, Transmitting, write_to_uart);
input [5:0] NumberOfChars; 
  input Clock, Reset, Start, tx_full, uartClock; 
  output reg [5:0] RAMAddress; 
  output reg Transmitting, write_to_uart; 
  reg [1:0] specialCharacter; 
  parameter [5:0] newline = 6'd32; 
  parameter [5:0] carriagereturn = 6'd33; 
  [MASKED] 
 endmodule