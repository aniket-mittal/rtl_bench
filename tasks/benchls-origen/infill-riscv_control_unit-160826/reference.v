module origen_160826(
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
        MemRead = 1'b0;
        MemtoReg = 1'b0;
        MemWrite = 1'b0;
        RegWrite = 1'b0;
        Branch = 1'b0;
        ALUSrc = 1'b0;
        ALUop = 2'b00;
    end else begin
        case (opcode)
            7'b0110011: begin // R-type instruction
                ALUSrc = 1'b0;
                MemtoReg = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUop = 2'b10;
            end
            7'b0000011: begin // load instruction
                ALUSrc = 1'b1;
                MemtoReg = 1'b1;
                RegWrite = 1'b1;
                MemRead = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUop = 2'b00;
            end
            7'b0100011: begin // store instruction
                ALUSrc = 1'b1;
                MemtoReg = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b1;
                Branch = 1'b0;
                ALUop = 2'b00;
            end
            7'b1100011: begin // branch instruction
                ALUSrc = 1'b0;
                MemtoReg = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b1;
                ALUop = 2'b01;
            end
            7'b0010011: begin // immediate instruction
                ALUSrc = 1'b1;
                MemtoReg = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUop = 2'b10;
            end
            7'b0000000: begin // NOP instruction
                ALUSrc = 1'b0;
                MemtoReg = 1'b0;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUop = 2'b00;
            end
            default: begin
                MemRead = 1'bx;
                MemtoReg = 1'bx;
                MemWrite = 1'bx;
                RegWrite = 1'bx;
                Branch = 1'bx;
                ALUSrc = 1'bx;
                ALUop = 2'bxx;
            end
        endcase
    end
end

endmodule