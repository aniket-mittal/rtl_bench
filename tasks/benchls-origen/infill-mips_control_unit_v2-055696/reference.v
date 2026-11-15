module origen_055696 (
    input [5:0] instr_op_i,
    output reg RegWrite_o,
    output reg [2:0] ALU_op_o,
    output reg ALUSrc_o,
    output reg [1:0] RegDst_o,
    output reg Branch_o,
    output reg Jump_o,
    output reg MemRead_o,
    output reg MemWrite_o,
    output reg [1:0] MemtoReg_o
);

always @(*) begin
    case(instr_op_i)
        6'b000000: begin // R-type
            RegWrite_o = 1'b1;
            ALU_op_o = 3'b010;
            ALUSrc_o = 1'b0;
            RegDst_o = 2'b01;
            Branch_o = 1'b0;
            Jump_o = 1'b0;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b0;
            MemtoReg_o = 2'b00;
        end
        6'b000100: begin // Branch
            RegWrite_o = 1'b0;
            ALU_op_o = 3'b001;
            ALUSrc_o = 1'b0;
            RegDst_o = 2'b00;
            Branch_o = 1'b1;
            Jump_o = 1'b0;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b0;
            MemtoReg_o = 2'b00;
        end
        6'b001000, 6'b001010: begin // I-type arithmetic (ADDI, SLTI)
            RegWrite_o = 1'b1;
            ALU_op_o = 3'b011;
            ALUSrc_o = 1'b1;
            RegDst_o = 2'b00;
            Branch_o = 1'b0;
            Jump_o = 1'b0;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b0;
            MemtoReg_o = 2'b00;
        end
        6'b100011: begin // Load
            RegWrite_o = 1'b1;
            ALU_op_o = 3'b000;
            ALUSrc_o = 1'b1;
            RegDst_o = 2'b00;
            Branch_o = 1'b0;
            Jump_o = 1'b0;
            MemRead_o = 1'b1;
            MemWrite_o = 1'b0;
            MemtoReg_o = 2'b01;
        end
        6'b101011: begin // Store
            RegWrite_o = 1'b0;
            ALU_op_o = 3'b000;
            ALUSrc_o = 1'b1;
            RegDst_o = 2'b00;
            Branch_o = 1'b0;
            Jump_o = 1'b0;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b1;
            MemtoReg_o = 2'b00;
        end
        6'b000010: begin // Jump
            RegWrite_o = 1'b0;
            ALU_op_o = 3'b000;
            ALUSrc_o = 1'b0;
            RegDst_o = 2'b00;
            Branch_o = 1'b0;
            Jump_o = 1'b1;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b0;
            MemtoReg_o = 2'b00;
        end
        6'b000011: begin // JAL
            RegWrite_o = 1'b1;
            ALU_op_o = 3'b000;
            ALUSrc_o = 1'b0;
            RegDst_o = 2'b10;
            Branch_o = 1'b0;
            Jump_o = 1'b1;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b0;
            MemtoReg_o = 2'b10;
        end
        default: begin // Undefined opcode
            RegWrite_o = 1'b0;
            ALU_op_o = 3'b000;
            ALUSrc_o = 1'b0;
            RegDst_o = 2'b00;
            Branch_o = 1'b0;
            Jump_o = 1'b0;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b0;
            MemtoReg_o = 2'b00;
        end
    endcase
end

endmodule