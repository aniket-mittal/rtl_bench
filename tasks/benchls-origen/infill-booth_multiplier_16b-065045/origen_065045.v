module origen_065045 #(
    parameter WIDTH = 16
)(
    input wire clk,
    input wire reset,
    input wire start,
    input wire [WIDTH-1:0] multiplicand,
    input wire [WIDTH-1:0] multiplier,
    output reg [2*WIDTH-1:0] prod,
    output reg ready
);

    reg [WIDTH+1:0] pp;
    reg [$clog2(WIDTH/2):0] bit_cnt;
    reg [2*WIDTH:0] product;
    reg [WIDTH-1:0] x1, x2, x3;

    [MASKED]

    always @(posedge clk) begin
        if (ready && !start) begin
            prod <= product[2*WIDTH:1];
        end
    end

endmodule