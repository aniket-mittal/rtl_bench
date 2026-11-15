module origen_184926(
    input [3:0] aluctr,
    input [31:0] aluoprand_a,
    input [31:0] aluoprand_b,
    output reg [31:0] aluoutput_c,
    output reg ifzero,
    output reg ifgtz,
    output reg ifeqz
);

parameter ADDU = 4'b0000;
parameter SUBU = 4'b0001;
parameter ORI  = 4'b0010;
parameter SRLV = 4'b0011;

[MASKED]

endmodule