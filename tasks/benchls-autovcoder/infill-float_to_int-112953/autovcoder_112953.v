module autovcoder_112953 (
    isInputStable,
    isFloat,
    sign,
    exponent,
    mantissa,
    out,
    isInputNormalized
);


  parameter SIZE = 8'd64, EXPONENT_SIZE = 4'd11, MANTISSA_SIZE = 6'd52;


  input isFloat, isInputStable;
  input sign;
  input [EXPONENT_SIZE - 1:0] exponent;
  input [MANTISSA_SIZE - 1:0] mantissa;
  output [SIZE -1:0] out;
  reg [SIZE -1:0] out;
  output isInputNormalized;
  reg isInputNormalized;

  [MASKED]


endmodule

