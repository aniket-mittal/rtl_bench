module origen_170219(
    input sclk,
    input rst_n,
    input A,
    output reg k1,
    output reg k2
);

    reg [1:0] state;
    localparam IDLE = 2'b00, START = 2'b01, STOP = 2'b10, CLEAR = 2'b11;

    [MASKED]

endmodule