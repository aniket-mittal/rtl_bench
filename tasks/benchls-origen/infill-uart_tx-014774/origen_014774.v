module origen_014774 
  #(parameter CLKS_PER_BIT = 868)
  (
   input       i_Clk,
   input       i_TX_DV,
   input [7:0] i_TX_BYTE, 
   output      o_TX_SERIAL,
   output      o_TX_ACTIVE,
   output      o_TX_DONE
   );
  
  parameter IDLE      = 3'b000;
  parameter START_BIT = 3'b001;
  parameter DATA_BITS = 3'b010;
  parameter STOP_BIT  = 3'b011;
  parameter CLEANUP   = 3'b100;
   
  reg [2:0]    r_SM_Main     = 0;
  reg [9:0]    r_Clock_Count = 0;
  reg [2:0]    r_BIT_INDEX   = 0;
  reg          r_TX_ACTIVE   = 0;
  reg          r_TX_DONE     = 0;
  reg          r_TX_SERIAL   = 1;
  reg [7:0]    r_TX_DATA     = 0;
   
  [MASKED]

  assign o_TX_SERIAL = r_TX_SERIAL;
  assign o_TX_ACTIVE = r_TX_ACTIVE;
  assign o_TX_DONE   = r_TX_DONE;
   
endmodule