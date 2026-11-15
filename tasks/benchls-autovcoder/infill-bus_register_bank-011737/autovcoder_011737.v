module autovcoder_011737 #(
    parameter INIT_00 = 0,
    parameter INIT_02 = 0
) (
    input             i_Bus_Rst_L,
    input             i_Bus_Clk,
    input             i_Bus_CS,
    input             i_Bus_Wr_Rd_n,
    input      [ 1:0] i_Bus_Addr8,
    input      [15:0] i_Bus_Wr_Data,
    output reg [15:0] o_Bus_Rd_Data,
    output reg        o_Bus_Rd_DV,
    input      [15:0] i_Reg_00,
    input      [15:0] i_Reg_02,
    output reg [15:0] o_Reg_00,
    output reg [15:0] o_Reg_02
);

  [MASKED]  // always @ (posedge i_Bus_Clk or negedge i_Bus_Rst_L)

endmodule

