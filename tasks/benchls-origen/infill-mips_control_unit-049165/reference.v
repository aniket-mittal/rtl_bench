module origen_049165(
    input [5:0] opcode,
    input [5:0] func,
    output reg [1:0] AluOp,
    output reg Jmp, Brancheq, Branchneq, DataSrc, regDst, regWrite, AluSrc, MemWrite, MemRead
);

    always @(*) begin
        // Initialize all control signals to 0
        {AluOp, Jmp, Brancheq, Branchneq, DataSrc, regDst, regWrite, AluSrc, MemWrite, MemRead} = 11'b0;

        case(opcode)
            6'b000000: begin // R-type
                AluOp = 2'b10;
                regDst = 1'b1;
                regWrite = 1'b1;
            end
            6'b100011: begin // Load
                AluOp = 2'b00;
                DataSrc = 1'b1;
                regWrite = 1'b1;
                AluSrc = 1'b1;
                MemRead = 1'b1;
            end
            6'b101011: begin // Store
                AluOp = 2'b00;
                AluSrc = 1'b1;
                MemWrite = 1'b1;
            end
            6'b001000: begin // Immediate
                AluOp = 2'b00;
                regWrite = 1'b1;
                AluSrc = 1'b1;
            end
            6'b000010: begin // Jump
                Jmp = 1'b1;
            end
            6'b000100: begin // Branch Equal
                AluOp = 2'b01;
                Brancheq = 1'b1;
            end
            6'b000101: begin // Branch Not Equal
                AluOp = 2'b01;
                Branchneq = 1'b1;
            end
            default: begin
                // Default case: all signals remain 0
            end
        endcase
    end
endmodule

module ALUcontroller(
    input [1:0] AluOp,
    input [5:0] func,
    output reg [2:0] AluOperation
);

    always @(*) begin
        case(AluOp)
            2'b00: AluOperation = 3'b010; // Addition
            2'b01: AluOperation = 3'b110; // Subtraction
            2'b10: begin // R-type
                case(func)
                    6'b100000: AluOperation = 3'b010; // ADD
                    6'b100010: AluOperation = 3'b110; // SUB
                    6'b100100: AluOperation = 3'b000; // AND
                    6'b100101: AluOperation = 3'b001; // OR
                    6'b101010: AluOperation = 3'b111; // SLT
                    default:   AluOperation = 3'b010; // Default to ADD
                endcase
            end
            2'b11: AluOperation = 3'b000; // AND operation
            default: AluOperation = 3'b010; // Default to ADD
        endcase
    end
endmodule

module controlUnit(
    input [5:0] func,
    input [5:0] opcode,
    output [2:0] AluOperation,
    output [1:0] AluOp,
    output Jmp, Brancheq, Branchneq, DataSrc, regDst, regWrite, AluSrc, MemWrite, MemRead
);

    wire [1:0] AluOp_wire;

    CUcenter cu_center(
        .opcode(opcode),
        .func(func),
        .AluOp(AluOp_wire),
        .Jmp(Jmp),
        .Brancheq(Brancheq),
        .Branchneq(Branchneq),
        .DataSrc(DataSrc),
        .regDst(regDst),
        .regWrite(regWrite),
        .AluSrc(AluSrc),
        .MemWrite(MemWrite),
        .MemRead(MemRead)
    );

    ALUcontroller alu_ctrl(
        .AluOp(AluOp_wire),
        .func(func),
        .AluOperation(AluOperation)
    );

    assign AluOp = AluOp_wire;

endmodule