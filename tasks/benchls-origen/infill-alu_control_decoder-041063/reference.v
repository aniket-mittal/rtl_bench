module origen_041063 (
    input [3:0] ALUOp,
    input [5:0] Funct,
    output reg [4:0] ALUCtl,
    output reg Sign
);

    // ALU Operation Codes
    parameter ALU_ADD = 5'b00000;
    parameter ALU_SUB = 5'b00001;
    parameter ALU_AND = 5'b00010;
    parameter ALU_OR  = 5'b00011;
    parameter ALU_XOR = 5'b00100;
    parameter ALU_NOR = 5'b00101;
    parameter ALU_SLT = 5'b00110;
    parameter ALU_SLL = 5'b00111;
    parameter ALU_SRL = 5'b01000;
    parameter ALU_SRA = 5'b01001;

    reg [4:0] aluFunct;

    always @(*) begin
        // Function Decoder
        case (Funct)
            6'b100000: aluFunct = ALU_ADD; // add
            6'b100010: aluFunct = ALU_SUB; // sub
            6'b100100: aluFunct = ALU_AND; // and
            6'b100101: aluFunct = ALU_OR;  // or
            6'b100110: aluFunct = ALU_XOR; // xor
            6'b100111: aluFunct = ALU_NOR; // nor
            6'b101010: aluFunct = ALU_SLT; // slt
            6'b000000: aluFunct = ALU_SLL; // sll
            6'b000010: aluFunct = ALU_SRL; // srl
            6'b000011: aluFunct = ALU_SRA; // sra
            default:   aluFunct = ALU_ADD; // Default to ADD
        endcase

        // Operation Decoder
        case (ALUOp[2:0])
            3'b000: ALUCtl = ALU_ADD;
            3'b001: ALUCtl = ALU_SUB;
            3'b010: ALUCtl = aluFunct;
            3'b011: ALUCtl = ALU_OR;
            3'b100: ALUCtl = ALU_AND;
            3'b101: ALUCtl = ALU_SLT;
            default: ALUCtl = ALU_ADD;
        endcase

        // Sign Flag
        if (ALUOp[2:0] == 3'b010)
            Sign = ~Funct[0];
        else
            Sign = ~ALUOp[3];
    end

endmodule