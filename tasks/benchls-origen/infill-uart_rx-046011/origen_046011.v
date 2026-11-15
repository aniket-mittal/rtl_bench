module origen_046011
  #(parameter CLKS_PER_BIT = 217)
  (
   input        i_clk,
   input        i_rx_serial,
   output       o_rx_dv,
   output [7:0] o_rx_byte
   );
    
  parameter STATE_IDLE     = 3'b000;
  parameter STATE_STARTBIT = 3'b001;
  parameter STATE_DATABITS = 3'b010;
  parameter STATE_STOPBIT  = 3'b011;
  parameter STATE_CLEANUP  = 3'b100;
   
  reg           r_rx_data_r = 1'b1;
  reg           r_rx_data   = 1'b1;
   
  reg [7:0]     r_counter   = 0;
  reg [2:0]     r_bit_index = 0;
  reg [7:0]     r_rx_byte   = 0;
  reg           r_rx_dv     = 0;
  reg [2:0]     r_state     = STATE_IDLE;
   
  always @(posedge i_clk)
    begin
      r_rx_data_r <= i_rx_serial;
      r_rx_data   <= r_rx_data_r;
    end
   
  [MASKED]   
   
  assign o_rx_dv   = r_rx_dv;
  assign o_rx_byte = r_rx_byte;
   
endmodule