module double_to_float(
        input_a,
        input_a_stb,
        output_z_ack,
        clk,
        rst,
        output_z,
        output_z_stb,
        input_a_ack);

  input     clk;
  input     rst;

  input     [63:0] input_a;
  input     input_a_stb;
  output    input_a_ack;

  output    [31:0] output_z;
  output    output_z_stb;
  input     output_z_ack;

  reg       s_output_z_stb;
  reg       [31:0] s_output_z;
  reg       s_input_a_ack;

  reg       [1:0] state;
  parameter get_a         = 3'd0,
            unpack        = 3'd1,
            denormalise   = 3'd2,
            put_z         = 3'd3;

  reg [63:0] a;
  reg [31:0] z;
  reg [10:0] z_e;
  reg [23:0] z_m;
  reg guard;
  reg round;
  reg sticky;

  [MASKED]
  assign input_a_ack = s_input_a_ack;
  assign output_z_stb = s_output_z_stb;
  assign output_z = s_output_z;

endmodule