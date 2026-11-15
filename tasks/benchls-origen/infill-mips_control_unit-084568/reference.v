module origen_084568(
    input [5:0] Op,
    output reg [3:0] ALUOp,
    output reg ALUSrc,
    output reg RegDst,
    output reg MemWrite,
    output reg MemRead,
    output reg RegWrite,
    output reg MemtoReg,
    output reg [1:0] Jump,
    output reg [1:0] Branch
);

    // Local parameters for branch and jump operations
    localparam BEQ = 2'b01;
    localparam BNE = 2'b10;
    localparam J = 2'b01;
    localparam JAL = 2'b10;

    always @(*) begin
        // Default values
        ALUOp = 4'b0000;
        ALUSrc = 1'b0;
        RegDst = 1'b0;
        MemWrite = 1'b0;
        MemRead = 1'b0;
        RegWrite = 1'b0;
        MemtoReg = 1'b0;
        Jump = 2'b00;
        Branch = 2'b00;

        case(Op)
            6'b000000: begin // R-type
                RegDst = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 4'b1000;
            end
            6'b000010: begin // J
                Jump = J;
            end
            6'b000011: begin // JAL
                Jump = JAL;
                RegWrite = 1'b1;
            end
            6'b000100: begin // BEQ
                Branch = BEQ;
                ALUOp = 4'b0001;
            end
            6'b000101: begin // BNE
                Branch = BNE;
                ALUOp = 4'b0001;
            end
            6'b001000: begin // ADDI
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 4'b0010;
            end
            6'b001100: begin // ANDI
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 4'b0011;
            end
            6'b001101: begin // ORI
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 4'b0100;
            end
            6'b001010: begin // SLTI
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 4'b0101;
            end
            6'b100011: begin // LW
                ALUSrc = 1'b1;
                MemRead = 1'b1;
                RegWrite = 1'b1;
                MemtoReg = 1'b1;
                ALUOp = 4'b0010;
            end
            6'b101011: begin // SW
                ALUSrc = 1'b1;
                MemWrite = 1'b1;
                ALUOp = 4'b0010;
            end
            default: begin
                // Do nothing, use default values
            end
        endcase
    end

endmodule