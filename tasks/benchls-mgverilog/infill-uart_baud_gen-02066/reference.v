module mg_02066(clk,baudtick);
parameter CLOCK = 25000000; 
  parameter BAUD = 9600; 
  parameter ACCWIDTH = 16; 
  parameter ROUNDBITS = 5; 
  parameter INC = ((BAUD<<(ACCWIDTH-(ROUNDBITS-1)))+(CLOCK>>ROUNDBITS))/(CLOCK>>(ROUNDBITS-1)); 
  input clk; 
  output baudtick; 
  reg [ACCWIDTH:0] accumulator = 0; 
  assign baudtick = accumulator[ACCWIDTH]; 
  always @(posedge clk) 
  accumulator <= accumulator[ACCWIDTH-1:0] + INC; 
 endmodule