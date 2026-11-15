module origen_126409 (
    input wire clk,
    input wire rst,
    input wire [3:0] a,
    input wire [3:0] b,
    input wire mode,
    output reg [3:0] result,
    output reg overflow
);

    // Pipeline registers
    reg [3:0] a_reg, b_reg;
    reg mode_reg;
    reg [4:0] sum_reg;

    // First stage: Register inputs
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_reg <= 4'b0;
            b_reg <= 4'b0;
            mode_reg <= 1'b0;
        end else begin
            a_reg <= a;
            b_reg <= b;
            mode_reg <= mode;
        end
    end

    // Second stage: Perform addition/subtraction
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum_reg <= 5'b0;
        end else begin
            if (mode_reg)
                sum_reg <= {1'b0, a_reg} - {1'b0, b_reg};
            else
                sum_reg <= {1'b0, a_reg} + {1'b0, b_reg};
        end
    end

    // Third stage: Determine result and overflow
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            result <= 4'b0;
            overflow <= 1'b0;
        end else begin
            result <= sum_reg[3:0];
            if (mode_reg) // Subtraction
                overflow <= (a_reg[3] != b_reg[3]) && (b_reg[3] == sum_reg[3]);
            else // Addition
                overflow <= (a_reg[3] == b_reg[3]) && (a_reg[3] != sum_reg[3]);
        end
    end

endmodule