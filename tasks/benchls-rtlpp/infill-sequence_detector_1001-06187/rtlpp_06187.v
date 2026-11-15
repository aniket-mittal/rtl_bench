module rtlpp_06187 (
    input CLK,
    input [3:0] I,
    output Y
);

    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
    reg [2:0] NS, PS;
    reg temp;

    always @(posedge CLK)
        PS <= NS;

    [MASKED]

    assign Y = temp;

endmodule