module autovcoder_023913 (
    input             clk,
    input             start,
    input      [ 7:0] byte_in,
    input             reset,
    output reg [15:0] crc_16,
    output reg        busy
);

  localparam [15:0] polinom = 16'hA001;

  localparam [3:0] IDLE = 4'b0000;
  localparam [3:0] STAGE_0 = 4'b0001;
  localparam [3:0] STAGE_1 = 4'b0010;
  localparam [3:0] STAGE_2 = 4'b0011;
  localparam [3:0] STAGE_3 = 4'b0100;
  localparam [3:0] STAGE_4 = 4'b0101;
  localparam [3:0] STAGE_5 = 4'b0110;
  localparam [3:0] STAGE_6 = 4'b0111;
  localparam [3:0] STAGE_7 = 4'b1000;

  reg [ 3:0] state = 4'b0000;

  reg [15:0] crc = 16'hFFFF;
  reg        previous_strb = 1'b0;
  reg        strb_bf = 1'b0;

  [MASKED]

endmodule

