module autovcoder_099041 (
    a_in,
    a_out,
    b_in,
    b_out,
    destreg_in,
    destreg_out,
    set_regwrite_in,
    set_regwrite_out,
    set_memwrite_in,
    set_memwrite_out,
    set_memread_in,
    set_memread_out,
    opcode_in,
    opcode_out,
    imedi_in,
    imedi_out,
    clk
);
  input [15:0] a_in;
  output reg [15:0] a_out;
  input [15:0] b_in;
  output reg [15:0] b_out;
  input [3:0] destreg_in;
  output reg [3:0] destreg_out;
  input set_regwrite_in;
  output reg set_regwrite_out;
  input set_memwrite_in;
  output reg set_memwrite_out;
  input set_memread_in;
  output reg set_memread_out;
  input [7:0] opcode_in;
  output reg [7:0] opcode_out;
  input [15:0] imedi_in;
  output reg [15:0] imedi_out;
  input clk;

  always @(posedge clk) begin
    a_out <= a_in;
    b_out <= b_in;
    destreg_out <= destreg_in;
    set_regwrite_out <= set_regwrite_in;
    set_memwrite_out <= set_memwrite_in;
    set_memread_out <= set_memread_in;
    opcode_out <= opcode_in;
    imedi_out <= imedi_in;
  end

endmodule

