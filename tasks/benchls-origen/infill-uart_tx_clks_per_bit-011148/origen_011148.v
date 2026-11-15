module origen_011148 
  #(parameter CLKS_PER_BIT = 217)
  (
   input       i_Clock,
   input [7:0] i_TX_Byte, 
   input       i_TX_DV,
   output reg  o_TX_Serial,
   output      o_TX_Active,
   output      o_TX_Done
   );
  
  parameter IDLE         = 3'b000;
  parameter TX_START_BIT = 3'b001;
  parameter TX_DATA_BITS = 3'b010;
  parameter TX_STOP_BIT  = 3'b011;
  parameter CLEANUP      = 3'b100;
   
  reg [2:0]    r_SM_Main     = 0;
  reg [7:0]    r_Clock_Count = 0;
  reg [2:0]    r_Bit_Index   = 0;
  reg [7:0]    r_TX_Data     = 0;
  reg          r_TX_Done     = 0;
  reg          r_TX_Active   = 0;
     
  [MASKED]

  assign o_TX_Active = r_TX_Active;
  assign o_TX_Done   = r_TX_Done;
   
endmodule