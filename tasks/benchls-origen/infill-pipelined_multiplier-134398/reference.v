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

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < STAGES; i = i + 1) begin
                a_reg[i] <= 0;
                b_reg[i] <= 0;
            end
            for (i = 0; i <= STAGES; i = i + 1) begin
                partial_product[i] <= 0;
            end
        end else begin
            // First stage
            a_reg[0] <= a;
            b_reg[0] <= b;
            partial_product[0] <= 0;

            // Pipeline stages
            for (i = 1; i < STAGES; i = i + 1) begin
                a_reg[i] <= a_reg[i-1];
                b_reg[i] <= b_reg[i-1];
                partial_product[i] <= partial_product[i-1] + 
                    (a_reg[i-1][i-1] ? (b_reg[i-1] << (i-1)) : 0);
            end

            // Final stage
            partial_product[STAGES] <= partial_product[STAGES-1] + 
                (a_reg[STAGES-1][STAGES-1] ? (b_reg[STAGES-1] << (STAGES-1)) : 0);
        end
    end

    // Output assignment
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            c <= 0;
        end else begin
            c <= partial_product[STAGES][WIDTH-1:0];
        end
    end

endmodule