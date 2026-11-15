module origen_186384(
    input [3:0] controlop,
    output reg [2:0] ALUop,
    output reg jump,
    output reg regdest,
    output reg Regwrite,
    output reg ALUsrc,
    output reg branch,
    output reg memread,
    output reg memwrite,
    output reg memtoreg
);

always @(*) begin
    case (controlop)
        4'b0000: begin // ADD
            ALUop = 3'b010;
            jump = 1'b0;
            regdest = 1'b0;
            Regwrite = 1'b1;
            ALUsrc = 1'b0;
            branch = 1'b0;
            memread = 1'b0;
            memwrite = 1'b0;
            memtoreg = 1'b0;
        end
        4'b0001: begin // SUBTRACT
            ALUop = 3'b110;
            jump = 1'b0;
            regdest = 1'b0;
            Regwrite = 1'b1;
            ALUsrc = 1'b0;
            branch = 1'b0;
            memread = 1'b0;
            memwrite = 1'b0;
            memtoreg = 1'b0;
        end
        4'b0010: begin // AND
            ALUop = 3'b000;
            jump = 1'b0;
            regdest = 1'b0;
            Regwrite = 1'b1;
            ALUsrc = 1'b0;
            branch = 1'b0;
            memread = 1'b0;
            memwrite = 1'b0;
            memtoreg = 1'b0;
        end
        4'b0011: begin // OR
            ALUop = 3'b001;
            jump = 1'b0;
            regdest = 1'b0;
            Regwrite = 1'b1;
            ALUsrc = 1'b0;
            branch = 1'b0;
            memread = 1'b0;
            memwrite = 1'b0;
            memtoreg = 1'b0;
        end
        4'b0100: begin // Load Word
            ALUop = 3'b010;
            jump = 1'b0;
            regdest = 1'b0;
            Regwrite = 1'b1;
            ALUsrc = 1'b1;
            branch = 1'b0;
            memread = 1'b1;
            memwrite = 1'b0;
            memtoreg = 1'b1;
        end
        4'b0101: begin // Store Word
            ALUop = 3'b010;
            jump = 1'b0;
            regdest = 1'b0; // Don't care
            Regwrite = 1'b0;
            ALUsrc = 1'b1;
            branch = 1'b0;
            memread = 1'b0;
            memwrite = 1'b1;
            memtoreg = 1'b0; // Don't care
        end
        4'b0110: begin // Branch on Equal
            ALUop = 3'b110;
            jump = 1'b0;
            regdest = 1'b0;
            Regwrite = 1'b0;
            ALUsrc = 1'b0;
            branch = 1'b1;
            memread = 1'b0;
            memwrite = 1'b0;
            memtoreg = 1'b0;
        end
        4'b0111: begin // Jump
            ALUop = 3'b000; // Don't care
            jump = 1'b1;
            regdest = 1'b0; // Don't care
            Regwrite = 1'b0;
            ALUsrc = 1'b0; // Don't care
            branch = 1'b0;
            memread = 1'b0;
            memwrite = 1'b0;
            memtoreg = 1'b0; // Don't care
        end
        default: begin
            ALUop = 3'b000;
            jump = 1'b0;
            regdest = 1'b0;
            Regwrite = 1'b0;
            ALUsrc = 1'b0;
            branch = 1'b0;
            memread = 1'b0;
            memwrite = 1'b0;
            memtoreg = 1'b0;
        end
    endcase
end

endmodule