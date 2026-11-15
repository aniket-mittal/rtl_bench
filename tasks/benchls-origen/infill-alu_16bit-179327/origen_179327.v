module origen_179327(
    input  wire [15:0] A,
    input  wire [15:0] B,
    input  wire [3:0]  ICNT,
    output wire [15:0] OUT
);

`define ISADD 4'b0000
`define ISSUB 4'b0001
`define ISAND 4'b0010
`define ISOR  4'b0011

reg [15:0] a, b, r;
reg        cin;

[MASKED]

assign OUT = r;

endmodule