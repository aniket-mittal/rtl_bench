module origen_128629 (
    input [2:0] operation,
    input [7:0] operand_a,
    input [7:0] operand_b,
    output reg [7:0] result,
    output reg overflow,
    output reg underflow
);

    reg [15:0] temp_result;
    
    always @(*) begin
        overflow = 1'b0;
        underflow = 1'b0;
        
        case (operation)
            3'b000: begin // Addition
                temp_result = operand_a + operand_b;
                if (temp_result[8] != temp_result[7])
                    overflow = 1'b1;
                result = temp_result[7:0];
            end
            
            3'b001: begin // Subtraction
                temp_result = operand_a - operand_b;
                if (temp_result[8] != temp_result[7])
                    underflow = 1'b1;
                result = temp_result[7:0];
            end
            
            3'b010: begin // Multiplication
                temp_result = operand_a * operand_b;
                if (temp_result[15:8] != 8'b0)
                    overflow = 1'b1;
                result = temp_result[7:0];
            end
            
            3'b011: begin // Division
                if (operand_b == 8'b0) begin
                    result = 8'bx;
                    overflow = 1'b1;
                end else begin
                    result = operand_a / operand_b;
                    if (operand_a % operand_b != 0)
                        underflow = 1'b1;
                end
            end
            
            default: begin
                result = 8'bx;
                overflow = 1'bx;
                underflow = 1'bx;
            end
        endcase
    end

endmodule