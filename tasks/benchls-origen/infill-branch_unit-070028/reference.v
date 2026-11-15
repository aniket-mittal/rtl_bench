module origen_070028(
    input [2:0] opcode,
    input [3:0] fcode,
    input [24:0] label,
    input carryFlag, zFlag, overflowFlag, signFlag,
    input [9:0] PC,
    output reg [9:0] exNPC,
    output reg PCSrc,
    output reg [31:0] ra
);

    initial begin
        exNPC = 10'b0;
        PCSrc = 1'b0;
        ra = 32'b0;
    end

    always @(*) begin
        exNPC = 10'b0;
        PCSrc = 1'b0;

        if (opcode == 3'b011) begin
            case (fcode)
                4'b0000: begin // Unconditional branch
                    exNPC = label[9:0];
                    PCSrc = 1'b1;
                end
                4'b0001: begin // Branch if zero
                    if (zFlag) begin
                        exNPC = label[9:0];
                        PCSrc = 1'b1;
                    end
                end
                4'b0010: begin // Branch if not zero
                    if (!zFlag) begin
                        exNPC = label[9:0];
                        PCSrc = 1'b1;
                    end
                end
                4'b0011: begin // Branch if carry
                    if (carryFlag) begin
                        exNPC = label[9:0];
                        PCSrc = 1'b1;
                    end
                end
                4'b0100: begin // Branch if not carry
                    if (!carryFlag) begin
                        exNPC = label[9:0];
                        PCSrc = 1'b1;
                    end
                end
                4'b0101: begin // Branch if sign
                    if (signFlag) begin
                        exNPC = label[9:0];
                        PCSrc = 1'b1;
                    end
                end
                4'b0110: begin // Branch if not sign
                    if (!signFlag) begin
                        exNPC = label[9:0];
                        PCSrc = 1'b1;
                    end
                end
                4'b0111: begin // Branch if overflow
                    if (overflowFlag) begin
                        exNPC = label[9:0];
                        PCSrc = 1'b1;
                    end
                end
                4'b1000: begin // Branch if not overflow
                    if (!overflowFlag) begin
                        exNPC = label[9:0];
                        PCSrc = 1'b1;
                    end
                end
                4'b1001: begin // Branch and link
                    exNPC = label[9:0];
                    PCSrc = 1'b1;
                    ra = {22'b0, PC};
                end
                4'b1010: begin // Return from subroutine
                    exNPC = ra[9:0];
                    PCSrc = 1'b1;
                end
                default: begin
                    exNPC = 10'b0;
                    PCSrc = 1'b0;
                end
            endcase
        end
        else if (opcode == 3'b100) begin // Unconditional branch
            exNPC = label[9:0];
            PCSrc = 1'b1;
        end
    end
endmodule