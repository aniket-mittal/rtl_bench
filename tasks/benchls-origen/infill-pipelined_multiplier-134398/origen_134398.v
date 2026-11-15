module origen_134398 #(
    parameter WIDTH = 32
)(
    input wire clk,
    input wire rst,
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,
    output reg [WIDTH-1:0] c
);

    localparam STAGES = $clog2(WIDTH);

    reg [WIDTH-1:0] a_reg [STAGES-1:0];
    reg [WIDTH-1:0] b_reg [STAGES-1:0];
    reg [2*WIDTH-1:0] partial_product [STAGES:0];

    integer i;

    [MASKED]

    // Output assignment
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            c <= 0;
        end else begin
            c <= partial_product[STAGES][WIDTH-1:0];
        end
    end

endmodule