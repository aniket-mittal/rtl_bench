module origen_029234(
    input [1:0] ALUOp,
    input [5:0] Funct,
    output reg [3:0] ALUOperation
);

    // Function codes
    parameter F_ADD = 6'b100000;
    parameter F_SUB = 6'b100010;
    parameter F_AND = 6'b100100;
    parameter F_OR  = 6'b100101;
    parameter F_SLT = 6'b101010;
    parameter F_SLL = 6'b000000;
    parameter F_SRL = 6'b000010;
    parameter F_MFHI = 6'b010000;
    parameter F_MFLO = 6'b010010;

    // ALU Operations
    parameter ALU_ADD = 4'b0010;
    parameter ALU_SUB = 4'b0110;
    parameter ALU_AND = 4'b0000;
    parameter ALU_OR  = 4'b0001;
    parameter ALU_SLT = 4'b0111;
    parameter ALU_SLL = 4'b1000;
    parameter ALU_SRL = 4'b1001;
    parameter ALU_MFHI = 4'b1010;
    parameter ALU_MFLO = 4'b1011;

    always @(*) begin
        case(ALUOp)
            2'b00: ALUOperation = ALU_ADD; // Memory operations and immediate instructions
            2'b01: ALUOperation = ALU_SUB; // Branch instructions
            2'b10: begin // R-type instructions
                case(Funct)
                    F_ADD: ALUOperation = ALU_ADD;
                    F_SUB: ALUOperation = ALU_SUB;
                    F_AND: ALUOperation = ALU_AND;
                    F_OR:  ALUOperation = ALU_OR;
                    F_SLT: ALUOperation = ALU_SLT;
                    F_SLL: ALUOperation = ALU_SLL;
                    F_SRL: ALUOperation = ALU_SRL;
                    F_MFHI: ALUOperation = ALU_MFHI;
                    F_MFLO: ALUOperation = ALU_MFLO;
                    default: ALUOperation = 4'bxxxx; // Undefined function code
                endcase
            end
            default: ALUOperation = 4'bxxxx; // Undefined ALUOp
        endcase
    end

endmodule