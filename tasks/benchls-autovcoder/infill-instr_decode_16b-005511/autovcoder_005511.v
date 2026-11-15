module autovcoder_005511 (
    instr,
    rd,
    we_reg
);
  // Inputs
  input [15:0] instr;

  // Outputsn
  output reg [2:0] rd;
  output reg we_reg;

  // Wires
  wire [2:0] rd_imm, rd_reg, rd_ld_imm;
  assign rd_imm = instr[7:5];
  assign rd_reg = instr[4:2];
  assign rd_ld_imm = instr[10:8];

  // assigns
  wire [6:0] op;
  assign op = {instr[15:11], instr[1:0]};

  [MASKED]
endmodule

