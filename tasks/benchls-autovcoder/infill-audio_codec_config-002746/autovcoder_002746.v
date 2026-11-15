module autovcoder_002746 (
    input CCLK,
    input rst,
    input ready,
    input frame_done,
    input [19:0] leftadc,
    input [19:0] rightadc,
    input [19:0] reg_status,
    input [19:0] status_data,
    output reg cmd_vd,
    output reg left_vd,
    output reg right_vd,
    output reg [19:0] leftdac,
    output reg [19:0] rightdac,
    output reg [7:0] cmd_addr,
    output reg [15:0] cmd_data
);

  reg set;
  reg [4:0] state;
  //reg rst = 0;


  [MASKED]


endmodule

