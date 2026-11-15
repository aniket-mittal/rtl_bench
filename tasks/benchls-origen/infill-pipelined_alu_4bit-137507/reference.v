module origen_137507 (
    input wire clk,
    input wire rst,
    input wire [3:0] a,
    input wire [3:0] b,
    input wire [2:0] op,
    output reg [3:0] result
);

    // Pipeline registers
    reg [3:0] a_reg, b_reg;
    reg [2:0] op_reg;
    reg [4:0] temp_result;

    // Pipeline stage 1: Register inputs
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_reg <= 4'b0;
            b_reg <= 4'b0;
            op_reg <= 3'b0;
        end else begin
            a_reg <= a;
            b_reg <= b;
            op_reg <= op;
        end
    end

    // Pipeline stage 2: Perform operation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            temp_result <= 5'b0;
        end else begin
            case (op_reg)
                3'b000: temp_result <= a_reg + b_reg;  // Addition
                3'b001: temp_result <= a_reg - b_reg;  // Subtraction
                3'b010: temp_result <= a_reg & b_reg;  // Bitwise AND
                3'b011: temp_result <= a_reg | b_reg;  // Bitwise OR
                3'b100: temp_result <= a_reg ^ b_reg;  // Bitwise XOR
                3'b101: temp_result <= a_reg << 1;     // Shift left
                default: temp_result <= 5'b0;
            endcase
        end
    end

    // Pipeline stage 3: Register output
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            result <= 4'b0;
        end else begin
            result <= temp_result[3:0];
        end
    end

endmodule