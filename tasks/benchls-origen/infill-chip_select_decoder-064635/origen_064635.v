module origen_064635 (
    input [7:0] addr,
    input CS,
    output reg cs1,
    output reg cs2,
    output reg cs3,
    output reg cs4
);

    parameter chip1_decode = 2'b00;
    parameter chip2_decode = 2'b01;
    parameter chip3_decode = 2'b10;
    parameter chip4_decode = 2'b11;

    [MASKED]

endmodule