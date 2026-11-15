module origen_029211(
    input [3:0] select,
    input rst,
    output reg RegDst,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg [3:0] ALUOp
);

    // Instruction opcodes
    localparam ADD = 4'b0000;
    localparam SUB = 4'b0001;
    localparam XOR = 4'b0010;
    localparam SLL = 4'b0011;
    localparam SRA = 4'b0100;
    localparam ROR = 4'b0101;
    localparam LW  = 4'b0110;
    localparam SW  = 4'b0111;
    localparam LHB = 4'b1000;
    localparam LLB = 4'b1001;
    localparam B   = 4'b1010;
    localparam BR  = 4'b1011;
    localparam PCS = 4'b1100;
    localparam HLT = 4'b1101;

    always @(*) begin
        if (rst) begin
            RegDst = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            ALUOp = 4'b0000;
        end else begin
            case(select)
                SW: begin
                    MemWrite = 1'b1;
                    ALUSrc = 1'b1;
                    RegWrite = 1'b0;
                    Branch = 1'b0;
                    MemRead = 1'b0;
                    MemtoReg = 1'b0;
                    ALUOp = 4'b0000;
                end
                LW: begin
                    MemRead = 1'b1;
                    MemtoReg = 1'b1;
                    ALUSrc = 1'b1;
                    RegWrite = 1'b1;
                    Branch = 1'b0;
                    MemWrite = 1'b0;
                    ALUOp = 4'b0000;
                end
                B, BR: begin
                    Branch = 1'b1;
                    RegWrite = 1'b0;
                    MemRead = 1'b0;
                    MemWrite = 1'b0;
                    MemtoReg = 1'b0;
                    ALUSrc = 1'b0;
                    ALUOp = select;
                end
                HLT: begin
                    RegWrite = 1'b0;
                    Branch = 1'b0;
                    MemRead = 1'b0;
                    MemWrite = 1'b0;
                    MemtoReg = 1'b0;
                    ALUSrc = 1'b0;
                    ALUOp = select;
                end
                SLL, SRA, ROR: begin
                    ALUSrc = 1'b1;
                    RegWrite = 1'b1;
                    Branch = 1'b0;
                    MemRead = 1'b0;
                    MemWrite = 1'b0;
                    MemtoReg = 1'b0;
                    ALUOp = select;
                end
                LHB, LLB: begin
                    MemtoReg = 1'b1;
                    RegWrite = 1'b1;
                    Branch = 1'b0;
                    MemRead = 1'b0;
                    MemWrite = 1'b0;
                    ALUSrc = 1'b0;
                    ALUOp = select;
                end
                default: begin  // ADD, SUB, XOR, PCS
                    RegWrite = 1'b1;
                    Branch = 1'b0;
                    MemRead = 1'b0;
                    MemWrite = 1'b0;
                    MemtoReg = 1'b0;
                    ALUSrc = 1'b0;
                    ALUOp = select;
                end
            endcase
        end
    end

endmodule