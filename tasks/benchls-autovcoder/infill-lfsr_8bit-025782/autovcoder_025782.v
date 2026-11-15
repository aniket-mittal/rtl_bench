module autovcoder_025782 (
    clk,
    reset_n,
    enable,
    pause,
    load,
    data,
    ldata
);

  parameter seed = 32;
  input clk;
  input reset_n;
  input enable;
  input pause;
  input load;
  output [8 - 1:0] data;
  wire [8 - 1:0] data;
  input [8 - 1:0] ldata;

  reg [8 - 1:0] lfsr_data;

  assign data = lfsr_data;

  [MASKED]
endmodule

