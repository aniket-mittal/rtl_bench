module origen_138222 (
    input wire clk,
    input wire rst,
    input wire [7:0] A,
    input wire [7:0] B,
    input wire carry_in,
    input wire sub,
    output reg [7:0] sum,
    output reg borrow_out
);

    // Pipeline registers
    reg [7:0] A_reg, B_reg;
    reg carry_in_reg, sub_reg;
    reg [8:0] result_reg;

    // First pipeline stage
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            A_reg <= 8'b0;
            B_reg <= 8'b0;
            carry_in_reg <= 1'b0;
            sub_reg <= 1'b0;
        end else begin
            A_reg <= A;
            B_reg <= B;
            carry_in_reg <= carry_in;
            sub_reg <= sub;
        end
    end

    // Second pipeline stage
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            result_reg <= 9'b0;
        end else begin
            if (sub_reg)
                result_reg <= A_reg - B_reg - carry_in_reg;
            else
                result_reg <= A_reg + B_reg + carry_in_reg;
        end
    end

    // Third pipeline stage
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum <= 8'b0;
            borrow_out <= 1'b0;
        end else begin
            sum <= result_reg[7:0];
            borrow_out <= sub_reg ? ~result_reg[8] : result_reg[8];
        end
    end

endmodule