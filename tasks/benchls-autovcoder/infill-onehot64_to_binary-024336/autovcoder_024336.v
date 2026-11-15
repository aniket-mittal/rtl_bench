module autovcoder_024336 (
    x_num,
    x_num_expand
);

  // &Ports; @25
  input [63:0] x_num_expand;
  output [5 : 0] x_num;

  // &Regs; @26

  // &Wires; @27
  wire [5 : 0] x_num;
  wire [ 63:0] x_num_expand;


  //==========================================================
  //  encode 64 bits one-hot number to 6 bits binary number
  //==========================================================
  [MASKED]

  // &ModuleEnd; @98
endmodule

