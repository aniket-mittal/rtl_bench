module origen_182710(
    input [6:0] opcode,
    input control_sel,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg RegWrite,
    output reg Branch,
    output reg ALUSrc,
    output reg [1:0] ALUop
);

always @(*) begin
    if (control_sel) begin
        MemRead = 0;
        MemtoReg = 0;
        MemWrite = 0;
        RegWrite = 0;
        Branch = 0;
        ALUSrc = 0;
        ALUop = 2'b00;
    end
    else begin
        case (opcode)
            7'b0000000: begin // R-type instructions
                ALUSrc = 0;
                MemtoReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUop = 2'b00;
            end
            7'b0000011: begin // Load instructions
                ALUSrc = 1;
                MemtoReg = 1;
                RegWrite = 1;
                MemRead = 1;
                MemWrite = 0;
                Branch = 0;
                ALUop = 2'b00;
            end
            7'b0100011: begin // Store instructions
                ALUSrc = 1;
                MemtoReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 1;
                Branch = 0;
                ALUop = 2'b00;
            end
            7'b0110011: begin // R-type ALU instructions
                ALUSrc = 0;
                MemtoReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUop = 2'b10;
            end
            7'b0010011: begin // Immediate ALU instructions
                ALUSrc = 1;
                MemtoReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUop = 2'b10;
            end
            7'b1100011: begin // Branch instructions
                ALUSrc = 0;
                MemtoReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 1;
                ALUop = 2'b01;
            end
            default: begin
                ALUSrc = 0;
                MemtoReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUop = 2'b00;
            end
        endcase
    end
end

endmodule