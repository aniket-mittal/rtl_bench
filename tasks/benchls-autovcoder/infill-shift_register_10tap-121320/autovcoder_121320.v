module autovcoder_121320 (
    clk,
    data,
    ce,
    a,
    q
);

  parameter DATA_WIDTH = 32'd10;
  parameter ADDR_WIDTH = 32'd4;
  parameter DEPTH = 5'd10;

  input clk;
  input [DATA_WIDTH-1:0] data;
  input ce;
  input [ADDR_WIDTH-1:0] a;
  output reg [DATA_WIDTH-1:0] q;

  reg [DATA_WIDTH-1:0] sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9;
  integer i;

  always @(posedge clk) begin
    if (ce) begin
      sr_0 <= data;
      sr_1 <= sr_0;
      sr_2 <= sr_1;
      sr_3 <= sr_2;
      sr_4 <= sr_3;
      sr_5 <= sr_4;
      sr_6 <= sr_5;
      sr_7 <= sr_6;
      sr_8 <= sr_7;
      sr_9 <= sr_8;


    end
  end

  [MASKED]

endmodule

