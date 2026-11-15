module origen_214649(
    input [31:0] inst,
    output reg [4:0] rs, rt, rd,
    output reg [15:0] imm16,
    output reg [25:0] imm26,
    output reg [1:0] PCSrc,
    output reg [1:0] RegWriteSrc,
    output reg RegWrite,
    output reg MemWrite,
    output reg [1:0] ALUOperation,
    output reg [1:0] RegDst,
    output reg ALUSrc
);

    wire [5:0] op, func;
    assign op = inst[31:26];
    assign func = inst[5:0];

    always @(*) begin
        // Extract register fields
        rs = inst[25:21];
        rt = inst[20:16];
        rd = inst[15:11];

        // Extract immediate fields
        imm16 = inst[15:0];
        imm26 = inst[25:0];

        // Set control signals
        case (op)
            6'b000000: begin // R-type instructions
                case (func)
                    6'b100001: begin // I_addu
                        PCSrc = 2'b00;
                        RegWriteSrc = 2'b00;
                        RegWrite = 1'b1;
                        MemWrite = 1'b0;
                        ALUOperation = 2'b00;
                        RegDst = 2'b01;
                        ALUSrc = 1'b0;
                    end
                    6'b100011: begin // I_subu
                        PCSrc = 2'b00;
                        RegWriteSrc = 2'b00;
                        RegWrite = 1'b1;
                        MemWrite = 1'b0;
                        ALUOperation = 2'b01;
                        RegDst = 2'b01;
                        ALUSrc = 1'b0;
                    end
                    6'b001000: begin // I_jr
                        PCSrc = 2'b10;
                        RegWriteSrc = 2'b00;
                        RegWrite = 1'b0;
                        MemWrite = 1'b0;
                        ALUOperation = 2'b00;
                        RegDst = 2'b00;
                        ALUSrc = 1'b0;
                    end
                endcase
            end
            6'b001101: begin // I_ori
                PCSrc = 2'b00;
                RegWriteSrc = 2'b00;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                ALUOperation = 2'b10;
                RegDst = 2'b00;
                ALUSrc = 1'b1;
            end
            6'b100011: begin // I_lw
                PCSrc = 2'b00;
                RegWriteSrc = 2'b01;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                ALUOperation = 2'b00;
                RegDst = 2'b00;
                ALUSrc = 1'b1;
            end
            6'b101011: begin // I_sw
                PCSrc = 2'b00;
                RegWriteSrc = 2'b00;
                RegWrite = 1'b0;
                MemWrite = 1'b1;
                ALUOperation = 2'b00;
                RegDst = 2'b00;
                ALUSrc = 1'b1;
            end
            6'b000100: begin // I_beq
                PCSrc = 2'b01;
                RegWriteSrc = 2'b00;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                ALUOperation = 2'b01;
                RegDst = 2'b00;
                ALUSrc = 1'b0;
            end
            6'b001111: begin // I_lui
                PCSrc = 2'b00;
                RegWriteSrc = 2'b10;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                ALUOperation = 2'b11;
                RegDst = 2'b00;
                ALUSrc = 1'b1;
            end
            6'b000010: begin // J_jal
                PCSrc = 2'b11;
                RegWriteSrc = 2'b11;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                ALUOperation = 2'b00;
                RegDst = 2'b10;
                ALUSrc = 1'b0;
            end
            default: begin
                // Add default case handling here
            end
        endcase
    end

endmodule