module origen_072079 (
    input wire [5:0] Opcode,
    input wire [5:0] Function,
    input wire Rst,
    output reg MemRead,
    output reg RegWrite,
    output reg MemWrite,
    output reg ALUSrc,
    output reg Is_Br,
    output reg Is_Imm,
    output reg StoreOrBranch,
    output reg [2:0] ALUOprand,
    output reg [1:0] BranchCommand
);

    // Instruction type parameters
    parameter Load = 6'b100011;
    parameter Store = 6'b101011;
    parameter Jump = 6'b000010;
    parameter Branch_eq = 6'b000100;
    parameter Branch_ne = 6'b000101;
    parameter R_Type = 6'b000000;

    // ALU operation parameters
    parameter AND = 3'b000;
    parameter OR  = 3'b001;
    parameter ADD = 3'b010;
    parameter SUB = 3'b110;
    parameter SLT = 3'b111;

    // Branch type parameters
    parameter NO_BRANCH = 2'b00;
    parameter JUMP = 2'b01;
    parameter BRANCH_EQ = 2'b10;
    parameter BRANCH_NE = 2'b11;

    always @(*) begin
        // Default values
        MemRead = 0;
        RegWrite = 0;
        MemWrite = 0;
        ALUSrc = 0;
        Is_Br = 0;
        Is_Imm = 0;
        StoreOrBranch = 0;
        ALUOprand = 3'b000;
        BranchCommand = NO_BRANCH;

        if (Rst) begin
            // Reset all outputs to default values
        end else begin
            case (Opcode)
                Load: begin
                    MemRead = 1;
                    RegWrite = 1;
                    Is_Imm = 1;
                    ALUSrc = 1;
                    StoreOrBranch = 1;
                    ALUOprand = ADD;
                end
                Store: begin
                    MemWrite = 1;
                    Is_Imm = 1;
                    StoreOrBranch = 1;
                    ALUSrc = 1;
                    ALUOprand = ADD;
                end
                Jump: begin
                    BranchCommand = JUMP;
                    Is_Imm = 1;
                    Is_Br = 1;
                    ALUSrc = 1;
                end
                Branch_eq: begin
                    BranchCommand = BRANCH_EQ;
                    Is_Br = 1;
                    Is_Imm = 1;
                    ALUSrc = 1;
                end
                Branch_ne: begin
                    BranchCommand = BRANCH_NE;
                    Is_Br = 1;
                    Is_Imm = 1;
                    ALUSrc = 1;
                end
                R_Type: begin
                    case (Function)
                        6'b100000: begin // Add
                            ALUOprand = ADD;
                            RegWrite = 1;
                        end
                        6'b100010: begin // Sub
                            ALUOprand = SUB;
                            RegWrite = 1;
                        end
                        6'b100100: begin // And
                            ALUOprand = AND;
                            RegWrite = 1;
                        end
                        6'b100101: begin // Or
                            ALUOprand = OR;
                            RegWrite = 1;
                        end
                        6'b101010: begin // SLT
                            ALUOprand = SLT;
                            RegWrite = 1;
                        end
                    endcase
                end
            endcase
        end
    end

endmodule