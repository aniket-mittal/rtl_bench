module origen_022761 (
    input [31:0] INST,
    output reg [2:0] ALUControl,
    output reg RegDst, RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, Branch
);

    wire [5:0] opcode = INST[31:26];
    wire [5:0] funct = INST[5:0];

    always @(*) begin
        // Default values
        RegDst = 0; RegWrite = 0; ALUSrc = 0;
        MemWrite = 0; MemRead = 0; MemtoReg = 0; Branch = 0;
        ALUControl = 3'b000;

        case(opcode)
            6'b000000: begin // R-type instructions
                RegDst = 1;
                RegWrite = 1;
                case(funct)
                    6'b100000: ALUControl = 3'b101; // add
                    6'b100100: ALUControl = 3'b001; // and
                    6'b100101: ALUControl = 3'b011; // or
                    6'b100110: ALUControl = 3'b010; // xor
                    6'b000000: ALUControl = 3'b100; // sll
                    6'b000010: ALUControl = 3'b111; // srl
                    6'b100010: ALUControl = 3'b110; // sub
                endcase
            end
            6'b101011: begin // Store Word
                ALUSrc = 1;
                MemWrite = 1;
                ALUControl = 3'b101; // add
            end
            6'b100011: begin // Load Word
                ALUSrc = 1;
                MemtoReg = 1;
                RegWrite = 1;
                MemRead = 1;
                ALUControl = 3'b101; // add
            end
            6'b000100: begin // Branch on Equal
                Branch = 1;
                ALUControl = 3'b110; // subtract
            end
            6'b001000: begin // Add Immediate
                ALUSrc = 1;
                RegWrite = 1;
                ALUControl = 3'b101; // add
            end
        endcase
    end

endmodule