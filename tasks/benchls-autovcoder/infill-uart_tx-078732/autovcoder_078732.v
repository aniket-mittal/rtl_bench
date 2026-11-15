module autovcoder_078732 #(
    parameter CLKS_PER_BIT = 217
) (
    input            i_Rst_L,
    input            i_Clock,
    input            i_TX_DV,
    input      [7:0] i_TX_Byte,
    output reg       o_TX_Active,
    output reg       o_TX_Serial,
    output reg       o_TX_Done
);

  localparam TX_IDLE = 3'b000;
  localparam TX_START_BIT = 3'b001;
  localparam TX_DATA_BITS = 3'b010;
  localparam TX_STOP_BIT = 3'b011;
  localparam TX_CLEANUP = 3'b100;

  reg [2:0] t_SM_Main = TX_IDLE;
  reg [$clog2(CLKS_PER_BIT):0] t_Clock_Count;
  reg [2:0] t_Bit_Index;
  reg [7:0] t_TX_Data;


  // Purpose: Control TX state machine
  [MASKED]  // always @ (posedge i_Clock or negedge i_Rst_L)
endmodule

