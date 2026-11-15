module origen_110119(
    input [5:0] opcode,
    output reg memtoreg,
    output reg memwrite,
    output reg branch,
    output reg alusrc,
    output reg regdst,
    output reg regwrite,
    output reg jump,
    output reg [1:0] aluop
);

    always @(*) begin
        casez(opcode)
            6'b000000: begin // R-type
                memtoreg = 1'b0;
                memwrite = 1'b0;
                branch = 1'b0;
                alusrc = 1'b0;
                regdst = 1'b1;
                regwrite = 1'b1;
                jump = 1'b0;
                aluop = 2'b10;
            end
            6'b100011: begin // Load word
                memtoreg = 1'b1;
                memwrite = 1'b0;
                branch = 1'b0;
                alusrc = 1'b1;
                regdst = 1'b0;
                regwrite = 1'b1;
                jump = 1'b0;
                aluop = 2'b00;
            end
            6'b101011: begin // Store word
                memtoreg = 1'bx;
                memwrite = 1'b1;
                branch = 1'b0;
                alusrc = 1'b1;
                regdst = 1'bx;
                regwrite = 1'b0;
                jump = 1'b0;
                aluop = 2'b00;
            end
            6'b00010?: begin // Branch
                memtoreg = 1'bx;
                memwrite = 1'b0;
                branch = 1'b1;
                alusrc = 1'b0;
                regdst = 1'bx;
                regwrite = 1'b0;
                jump = 1'b0;
                aluop = 2'b01;
            end
            6'b001000: begin // Immediate arithmetic
                memtoreg = 1'b0;
                memwrite = 1'b0;
                branch = 1'b0;
                alusrc = 1'b1;
                regdst = 1'b0;
                regwrite = 1'b1;
                jump = 1'b0;
                aluop = 2'b00;
            end
            6'b000010: begin // Jump
                memtoreg = 1'bx;
                memwrite = 1'b0;
                branch = 1'bx;
                alusrc = 1'bx;
                regdst = 1'bx;
                regwrite = 1'b0;
                jump = 1'b1;
                aluop = 2'bxx;
            end
            6'b001101: begin // ORI
                memtoreg = 1'b0;
                memwrite = 1'b0;
                branch = 1'b0;
                alusrc = 1'b1;
                regdst = 1'b0;
                regwrite = 1'b1;
                jump = 1'b0;
                aluop = 2'b11;
            end
            default: begin
                memtoreg = 1'b0;
                memwrite = 1'b0;
                branch = 1'b0;
                alusrc = 1'b0;
                regdst = 1'b0;
                regwrite = 1'b0;
                jump = 1'b0;
                aluop = 2'b00;
            end
        endcase
    end

endmodule