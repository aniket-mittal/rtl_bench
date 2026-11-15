module origen_174342(
    input [31:0] inst,
    output reg [2:0] ALU_OP,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [4:0] rd,
    output reg Write_Reg,
    output reg [15:0] imm,
    output reg rd_rt_s,
    output reg imm_s,
    output reg rt_imm_s,
    output reg Mem_Write,
    output reg alu_mem_s
);

    always @(*) begin
        // Decode the instruction
        if (inst[31:26] == 6'b000000) begin // Register-type instruction
            rs = inst[25:21];
            rt = inst[20:16];
            rd = inst[15:11];
            Write_Reg = 1'b1;

            case (inst[5:0])
                6'b100000: ALU_OP = 3'b000; // ADD
                6'b100010: ALU_OP = 3'b001; // SUB
                6'b100100: ALU_OP = 3'b010; // AND
                6'b100101: ALU_OP = 3'b011; // OR
                6'b101010: ALU_OP = 3'b100; // SLT
                default: ALU_OP = 3'b000;
            endcase

            rd_rt_s = 1'b0;
            imm_s = 1'b0;
            rt_imm_s = 1'b0;
            Mem_Write = 1'b0;
            alu_mem_s = 1'b1;
        end
        else if (inst[31:29] == 3'b001) begin // Immediate-type instruction
            rs = inst[25:21];
            rt = inst[20:16];
            imm = inst[15:0];
            Write_Reg = 1'b1;

            case (inst[31:26])
                6'b001000: ALU_OP = 3'b000; // ADDI
                6'b001100: ALU_OP = 3'b010; // ANDI
                6'b001101: ALU_OP = 3'b011; // ORI
                6'b001010: ALU_OP = 3'b100; // SLTI
                default: ALU_OP = 3'b000;
            endcase

            rd_rt_s = 1'b1;
            imm_s = 1'b1;
            rt_imm_s = 1'b1;
            Mem_Write = 1'b0;
            alu_mem_s = 1'b1;
        end
        else if (inst[31:30] == 2'b10 && inst[28:26] == 3'b011) begin // Memory-type instruction
            rs = inst[25:21];
            rt = inst[20:16];
            imm = inst[15:0];
            Write_Reg = 1'b1;

            case (inst[31:26])
                6'b100011: begin // LW
                    ALU_OP = 3'b000;
                    Mem_Write = 1'b0;
                    alu_mem_s = 1'b0;
                end
                6'b101011: begin // SW
                    ALU_OP = 3'b000;
                    Mem_Write = 1'b1;
                    alu_mem_s = 1'b0;
                end
                default: begin
                    ALU_OP = 3'b000;
                    Mem_Write = 1'b0;
                    alu_mem_s = 1'b0;
                end
            endcase

            rd_rt_s = 1'b1;
            imm_s = 1'b1;
            rt_imm_s = 1'b1;
        end
        else begin
            ALU_OP = 3'b000;
            rs = 5'b00000;
            rt = 5'b00000;
            rd = 5'b00000;
            Write_Reg = 1'b0;
            imm = 16'b0000000000000000;
            rd_rt_s = 1'b0;
            imm_s = 1'b0;
            rt_imm_s = 1'b0;
            Mem_Write = 1'b0;
            alu_mem_s = 1'b0;
        end
    end

endmodule