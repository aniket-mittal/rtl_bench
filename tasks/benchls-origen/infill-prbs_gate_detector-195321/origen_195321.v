module origen_195321(
    input  [10:1] gdin,
    input         clk,
    input         rst_n,
    input         PRBSEN,
    output reg    gdflag
);

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

reg [10:1]  gdinreg;
reg [1:0]   state;
reg [10:1]  reference;
reg [3:1]   count;
reg         repick;

[MASKED]

endmodule