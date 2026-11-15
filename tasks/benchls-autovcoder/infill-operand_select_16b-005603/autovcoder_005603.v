module autovcoder_005603 (
    instr,
    rsVal,
    rtVal,
    opA,
    opB
);
  input [15:0] instr;
  input [15:0] rsVal;
  input [15:0] rtVal;

  output [15:0] opA;
  output [15:0] opB;

  // wires and regs
  reg  [15:0] opBVal;
  wire [ 6:0] op;

  // assigns
  assign opA = rsVal;
  assign opB = opBVal;
  assign op  = {instr[15:11], instr[1:0]};

  [MASKED]
endmodule

