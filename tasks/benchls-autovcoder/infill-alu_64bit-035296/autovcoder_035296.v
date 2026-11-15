module autovcoder_035296 (
    //# {{data|ALU Data}}
    input  [63:0] in1,
    input  [63:0] in2,
    output [63:0] out,

    //# {{control|Control Signals}}
    input enable,
    input [2:0] unit,
    input [1:0] op
);

  reg [63:0] out_pre;
  assign out = out_pre;

  [MASKED]
endmodule

