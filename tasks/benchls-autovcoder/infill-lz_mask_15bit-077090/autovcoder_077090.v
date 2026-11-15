module autovcoder_077090 (
    input clk,
    input [14:0] data_in,
    input [5:0] lz_pos,
    output [14:0] data_out
);
  wire [14:0] data_in_rev;
  reg  [14:0] data_in_r = 15'd0;
  reg  [14:0] data = 15'd0;

  assign data_in_rev = {
    data_in[0],
    data_in[1],
    data_in[2],
    data_in[3],
    data_in[4],
    data_in[5],
    data_in[6],
    data_in[7],
    data_in[8],
    data_in[9],
    data_in[10],
    data_in[11],
    data_in[12],
    data_in[13],
    data_in[14]
  };

  [MASKED]

  assign data_out = data;
endmodule

