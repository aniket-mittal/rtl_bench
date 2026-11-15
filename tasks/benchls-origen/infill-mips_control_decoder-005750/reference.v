module origen_005750 (
    input [31:0] inst,
    output reg RegDst, ALUsrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,
    output reg [1:0] ALUop,
    output reg Jump
);

    wire [5:0] OP;
    assign OP = inst[31:26];

    always @(*) begin
        // Default values
        RegDst = 0;
        ALUsrc = 0;
        MemtoReg = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        ALUop = 2'b00;
        Jump = 0;

        // Jump instruction
        if (OP == 6'b000010)
            Jump = 1;

        // RegWrite signal
        if (inst[30:28] == 3'b000)
            RegWrite = 1;

        // Control signals based on opcode
        case (OP)
            6'b000000: begin // R-type
                RegDst = 1;
                ALUop[1] = 1;
            end
            6'b100011: begin // Load
                ALUsrc = 1;
                MemtoReg = 1;
                MemRead = 1;
            end
            6'b101011: begin // Store
                ALUsrc = 1;
                MemWrite = 1;
            end
            6'b000100: begin // Branch
                Branch = 1;
                ALUop[0] = 1;
            end
            default: begin
                // Default case (no operation)
            end
        endcase
    end

endmodule