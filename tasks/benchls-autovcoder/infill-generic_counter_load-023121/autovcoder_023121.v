module autovcoder_023121 (
    clk,
    rst,
    load,
    en,
    data_in,
    data_out
);
  parameter [1:0] COUNTER_STYLE_1 = 2'b01, COUNTER_STYLE_2 = 2'b10, COUNTER_STYLE_3 = 2'b11;
  parameter [31:0] n = 2;
  parameter [31:0] step = 1;
  parameter [1:0] style = COUNTER_STYLE_1;
  input clk;
  input rst;
  input load;
  input en;
  input data_in;
  output data_out;
  wire value;
  wire init_value;
  reg  temp;
  generate
    if (style == COUNTER_STYLE_1) begin : s1
      assign value = step;
      assign init_value = data_in;
    end
  endgenerate
  generate
    if (style == COUNTER_STYLE_2) begin : s2
      assign value = data_in;
      assign init_value = 0;
    end
  endgenerate
  generate
    if (style == COUNTER_STYLE_3) begin : s3
      assign value = data_in;
      assign init_value = data_in;
    end
  endgenerate
  [MASKED]
  assign data_out = temp;
endmodule

