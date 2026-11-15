module origen_001214 #(
    parameter MSB = 31,
    parameter LSB = 0,
    parameter F_MSB = 2,
    parameter F_LSB = 0
)(
    input [MSB:LSB] in0,
    input [MSB:LSB] in1,
    input [F_MSB:F_LSB] op,
    output reg [MSB:LSB] out
);

    always @(*) begin
        case (op)
            3'b000: out = in0 & in1;  // AND
            3'b001: out = in0 | in1;  // OR
            3'b010: out = in0 + in1;  // ADD
            3'b110: out = in0 - in1;  // SUB
            default: out = {(MSB-LSB+1){1'b0}};  // Default case
        endcase
    end

endmodule

module ALU_Control (
    input [1:0] ALU_op,
    input [31:0] instr,
    output reg [2:0] op
);

    wire [2:0] funct3;
    wire [6:0] funct7;

    assign funct3 = instr[14:12];
    assign funct7 = instr[31:25];

    always @(*) begin
        case (ALU_op)
            2'b00: op = 3'b010;  // Addition
            2'b01: op = 3'b110;  // Subtraction
            2'b10: begin
                case (funct3)
                    3'b000: op = (funct7[5]) ? 3'b110 : 3'b010;  // SUB if funct7[5]=1, else ADD
                    3'b111: op = 3'b000;  // AND
                    3'b110: op = 3'b001;  // OR
                    default: op = 3'b000;  // Default to AND
                endcase
            end
            2'b11: op = 3'b110;  // Subtraction
            default: op = 3'b000;  // Default to AND
        endcase
    end

endmodule