module mg_01232 (input wire clock,output wire serial_out,input wire [7:0] transmit_data,input wire we,output wire busy);
parameter bps = 0; 
  parameter frequency = 0; 
 `ifndef __ICARUS__ 
  parameter period = (frequency + bps/2) / bps; 
 `else 
  parameter period = 0; 
 `endif 
  parameter TTYCLK_SIGN = 16; 
  parameter COUNT_SIGN = 4; 
  reg [TTYCLK_SIGN:0] ttyclk = 0; 
  wire [31:0] ttyclk_bit = period - 2; 
  reg [8:0] shift_out = 0; 
  reg [COUNT_SIGN:0] count = 0; 
  assign serial_out = shift_out[0]; 
  assign busy = ~count[COUNT_SIGN] | ~ttyclk[TTYCLK_SIGN]; 
  [MASKED] 
 endmodule