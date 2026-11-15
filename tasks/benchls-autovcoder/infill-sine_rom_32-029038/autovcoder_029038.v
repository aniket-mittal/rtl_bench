module autovcoder_029038 (
    addr,
    out,
    clk
);
  input clk;
  output [15:0] out;
  reg [15:0] out, out2, out3;
  input [4:0] addr;

  [MASKED]
  // synthesis attribute rom_style of out3 is "block"
endmodule

