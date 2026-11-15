module autovcoder_031410 (
    clk,
    clr,
    en,
    npcout,
    iseret,
    instr_i,
    pc8_i,
    bd_i,
    exccode_i,
    instr_d,
    pc8_d,
    bd_d,
    exccode_d
);
  input clk, clr, en, bd_i, iseret;
  input [31:0] instr_i, pc8_i, npcout;
  input [4:0] exccode_i;
  output reg [31:0] instr_d, pc8_d;
  output reg bd_d;
  output reg [4:0] exccode_d;

  [MASKED]
endmodule

