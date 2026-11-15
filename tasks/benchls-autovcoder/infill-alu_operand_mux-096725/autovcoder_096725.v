module autovcoder_096725 (
    A,
    B,
    shift,
    AluB_1,
    ins,
    syscall,
    aluX,
    aluY
);
  input [31:0] A;
  input [31:0] B;
  input [31:0] ins;
  input AluB_1, shift, syscall;
  output reg [31:0] aluX;
  output reg [31:0] aluY;
  reg [31:0] X;
  reg [31:0] Y;
  [MASKED]
endmodule

