module add64 (
    input  [63:0] A,
    input  [63:0] B,
    input  [63:0] C,
    output [63:0] Carry,
    output [63:0] S
);
  genvar i;
  generate
    for (i = 0; i < 64; i = i + 1) begin  
      assign {Carry[i], S[i]} = A[i] + B[i] + C[i];
    end
  endgenerate
endmodule