module origen_062837 (
    input wire clk,
    input wire reset,
    input wire [7:0] img_di,
    input wire [19:0] grad_di,
    output reg done,
    output reg img_wr,
    output reg img_rd,
    output reg grad_wr,
    output reg grad_rd,
    output reg [15:0] img_addr,
    output reg [15:0] grad_addr,
    output reg [7:0] img_do,
    output reg [19:0] grad_do
);

    reg [15:0] counter;
    reg [7:0] counter_1;
    reg [7:0] counter_256;
    reg [7:0] x_1, x_2, x_3;
    reg ctrl, cal, rd, wr, init;
    reg [15:0] img_addr_reg, grad_addr_reg;

    wire signed [9:0] gx, gy;

    assign gx = {2'b0, x_2} - {2'b0, x_1};
    assign gy = {2'b0, x_3} - {2'b0, x_1};

    [MASKED]

endmodule