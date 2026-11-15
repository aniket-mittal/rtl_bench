module origen_070354(
    input [6:0] Op_i,
    input NoOp_i,
    output reg RegWrite_o,
    output reg MemtoReg_o,
    output reg MemRead_o,
    output reg MemWrite_o,
    output reg [1:0] ALUOp_o,
    output reg ALUSrc_o,
    output reg Branch_o
);

    // Instruction type constants
    localparam R_Type  = 2'b10;
    localparam I_Type  = 2'b00;
    localparam S_Type  = 2'b01;
    localparam SB_Type = 2'b11;

    always @(*) begin
        if (NoOp_i) begin
            RegWrite_o = 1'b0;
            MemtoReg_o = 1'b0;
            MemRead_o  = 1'b0;
            MemWrite_o = 1'b0;
            ALUOp_o    = R_Type;
            ALUSrc_o   = 1'b0;
            Branch_o   = 1'b0;
        end else begin
            case (Op_i)
                7'b0110011: begin // R-Type
                    RegWrite_o = 1'b1;
                    MemtoReg_o = 1'b0;
                    MemRead_o  = 1'b0;
                    MemWrite_o = 1'b0;
                    ALUOp_o    = R_Type;
                    ALUSrc_o   = 1'b0;
                    Branch_o   = 1'b0;
                end
                7'b0010011: begin // I-Type ALU
                    RegWrite_o = 1'b1;
                    MemtoReg_o = 1'b0;
                    MemRead_o  = 1'b0;
                    MemWrite_o = 1'b0;
                    ALUOp_o    = I_Type;
                    ALUSrc_o   = 1'b1;
                    Branch_o   = 1'b0;
                end
                7'b0000011: begin // Load
                    RegWrite_o = 1'b1;
                    MemtoReg_o = 1'b1;
                    MemRead_o  = 1'b1;
                    MemWrite_o = 1'b0;
                    ALUOp_o    = I_Type;
                    ALUSrc_o   = 1'b1;
                    Branch_o   = 1'b0;
                end
                7'b0100011: begin // Store
                    RegWrite_o = 1'b0;
                    MemtoReg_o = 1'b0;
                    MemRead_o  = 1'b0;
                    MemWrite_o = 1'b1;
                    ALUOp_o    = S_Type;
                    ALUSrc_o   = 1'b1;
                    Branch_o   = 1'b0;
                end
                7'b1100011: begin // Branch
                    RegWrite_o = 1'b0;
                    MemtoReg_o = 1'b0;
                    MemRead_o  = 1'b0;
                    MemWrite_o = 1'b0;
                    ALUOp_o    = SB_Type;
                    ALUSrc_o   = 1'b0;
                    Branch_o   = 1'b1;
                end
                7'b0000000: begin // No-op
                    RegWrite_o = 1'b0;
                    MemtoReg_o = 1'b0;
                    MemRead_o  = 1'b0;
                    MemWrite_o = 1'b0;
                    ALUOp_o    = SB_Type;
                    ALUSrc_o   = 1'b0;
                    Branch_o   = 1'b0;
                end
                default: begin // Default case
                    RegWrite_o = 1'b0;
                    MemtoReg_o = 1'b0;
                    MemRead_o  = 1'b0;
                    MemWrite_o = 1'b0;
                    ALUOp_o    = R_Type;
                    ALUSrc_o   = 1'b0;
                    Branch_o   = 1'b0;
                end
            endcase
        end
    end

endmodule