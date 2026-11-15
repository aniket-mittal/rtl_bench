module origen_029983 (
    input [3:0] ALU_ctrl,
    input [31:0] ALU_operand_1,
    input [31:0] ALU_operand_2,
    input [4:0] shamnt,
    output reg [31:0] ALU_result,
    output reg [7:0] ALU_status
);

    reg [32:0] temp_result;
    wire signed [31:0] signed_op1 = ALU_operand_1;
    wire signed [31:0] signed_op2 = ALU_operand_2;

    always @(*) begin
        ALU_status = 8'b0;
        temp_result = 33'b0;

        case (ALU_ctrl)
            4'b0010: begin // Addition
                temp_result = {1'b0, ALU_operand_1} + {1'b0, ALU_operand_2};
                ALU_result = temp_result[31:0];
                ALU_status[6] = (ALU_operand_1[31] == ALU_operand_2[31]) && (ALU_result[31] != ALU_operand_1[31]);
                ALU_status[5] = temp_result[32];
            end
            4'b0110: begin // Subtraction
                ALU_result = ALU_operand_1 - ALU_operand_2;
                ALU_status[6] = (ALU_operand_1[31] != ALU_operand_2[31]) && (ALU_result[31] != ALU_operand_1[31]);
            end
            4'b0000: ALU_result = ALU_operand_1 & ALU_operand_2; // AND
            4'b0001: ALU_result = ALU_operand_1 | ALU_operand_2; // OR
            4'b1000: begin // Multiplication
                ALU_result = signed_op1 * signed_op2;
                ALU_status[6] = (signed_op1 != 0) && (ALU_result / signed_op1 != signed_op2);
            end
            4'b1001: begin // Division
                if (ALU_operand_2 == 0) begin
                    ALU_status[2] = 1'b1; // Division by zero flag
                    ALU_result = 32'b0;
                end else begin
                    ALU_result = signed_op1 / signed_op2;
                end
            end
            4'b1010: ALU_result = ALU_operand_1 ^ ALU_operand_2; // XOR
            4'b1100: ALU_result = ALU_operand_1 << shamnt; // Left shift
            4'b1101: ALU_result = ALU_operand_1 >> shamnt; // Right shift
            default: ALU_result = 32'b0;
        endcase

        // Set status flags
        ALU_status[7] = (ALU_result == 32'b0); // Zero flag
        ALU_status[4] = ALU_result[31]; // Negative flag
        ALU_status[3] = (ALU_result[0] == 1'b1) && (ALU_result[1:0] != 2'b00); // Odd flag
    end

endmodule