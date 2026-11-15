module autovcoder_026630 (
    input  [ 4:0] WriteRegister,
    output [31:0] SelectRegister
);
  reg [31:0] SelectRegister_reg;

  [MASKED]

  assign SelectRegister = SelectRegister_reg;




endmodule

