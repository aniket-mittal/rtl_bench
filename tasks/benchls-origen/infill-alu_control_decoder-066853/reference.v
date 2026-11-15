module origen_066853(
    input [3:0] ALUOp,
    input [5:0] funct,
    output reg [4:0] ALUCtl,
    output Sign
);

    // ALU Operation Parameters
    parameter AND = 5'b00000;
    parameter OR  = 5'b00001;
    parameter ADD = 5'b00010;
    parameter SUB = 5'b00110;
    parameter SLT = 5'b00111;
    parameter NOR = 5'b01100;
    parameter XOR = 5'b01101;
    parameter SLL = 5'b10000;
    parameter SRL = 5'b10001;
    parameter SRA = 5'b10010;

    // Sign Generation
    assign Sign = (ALUOp[2:0] == 3'b010) ? ~funct[0] : ~ALUOp[3];

    // ALU Function Decoding
    reg [4:0] aluFunct;
    always @(*) begin
        case(funct)
            6'b100000: aluFunct = ADD;
            6'b100010: aluFunct = SUB;
            6'b100100: aluFunct = AND;
            6'b100101: aluFunct = OR;
            6'b101010: aluFunct = SLT;
            6'b100111: aluFunct = NOR;
            6'b100110: aluFunct = XOR;
            6'b000000: aluFunct = SLL;
            6'b000010: aluFunct = SRL;
            6'b000011: aluFunct = SRA;
            default:   aluFunct = 5'bxxxxx;
        endcase
    end

    // ALU Control Generation
    always @(*) begin
        case(ALUOp[2:0])
            3'b000: ALUCtl = ADD;
            3'b001: ALUCtl = SUB;
            3'b010: ALUCtl = aluFunct;
            3'b011: ALUCtl = OR;
            3'b100: ALUCtl = AND;
            3'b101: ALUCtl = SLT;
            default: ALUCtl = 5'bxxxxx;
        endcase
    end

endmodule