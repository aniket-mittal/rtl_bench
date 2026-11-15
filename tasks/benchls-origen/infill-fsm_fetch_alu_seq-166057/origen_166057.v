module origen_166057(
    input clk,
    input reset,
    output reg fetch,
    output reg alu_ena
);

    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;
    parameter S5 = 3'b101;
    parameter S6 = 3'b110;
    parameter S7 = 3'b111;
    parameter S8 = 4'b1000;
    parameter idle = 3'b000;

    reg [2:0] state;

    [MASKED]

endmodule