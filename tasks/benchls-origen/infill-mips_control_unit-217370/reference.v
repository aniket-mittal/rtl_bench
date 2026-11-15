module origen_217370(
    input  wire [5:0] op,
    output reg        re,
    output reg        wb,
    output reg        eq,
    output reg        jump,
    output reg        branch,
    output reg        alusrc,
    output reg        memwrite,
    output reg        memtoreg,
    output reg        regwrite,
    output reg        regdst,
    output reg [2:0]  aluop
);

    always @(*) begin
        case (op)
            6'b000000, 6'b011100: begin // Arithmetic/Logical
                aluop = 3'b010;
                re = 1'b1;
                wb = 1'b1;
                eq = 1'b0;
                jump = 1'b0;
                branch = 1'b0;
                alusrc = 1'b1;
                memwrite = 1'b0;
                memtoreg = 1'b0;
                regwrite = 1'b1;
                regdst = 1'b1;
            end
            6'b100000, 6'b100011, 6'b101000, 6'b101011: begin // Load/Store
                aluop = 3'b000;
                re = 1'b1;
                wb = 1'b1;
                eq = 1'b0;
                jump = 1'b0;
                branch = 1'b0;
                alusrc = 1'b1;
                memwrite = 1'b1;
                memtoreg = 1'b1;
                regwrite = 1'b1;
                regdst = 1'b0;
            end
            6'b000100, 6'b000101, 6'b000111: begin // Branch
                aluop = 3'b001;
                re = 1'b1;
                wb = 1'b0;
                eq = 1'b1;
                jump = 1'b0;
                branch = 1'b1;
                alusrc = 1'b0;
                memwrite = 1'b0;
                memtoreg = 1'b0;
                regwrite = 1'b0;
                regdst = 1'b0;
            end
            6'b000010, 6'b000011: begin // Jump
                aluop = 3'b000;
                re = 1'b0;
                wb = 1'b0;
                eq = 1'b0;
                jump = 1'b1;
                branch = 1'b0;
                alusrc = 1'b0;
                memwrite = 1'b0;
                memtoreg = 1'b0;
                regwrite = 1'b0;
                regdst = 1'b0;
            end
            6'b001100, 6'b001101, 6'b001111, 6'b001110: begin // Misc
                aluop = 3'b011;
                re = 1'b1;
                wb = 1'b1;
                eq = 1'b0;
                jump = 1'b0;
                branch = 1'b0;
                alusrc = 1'b1;
                memwrite = 1'b1;
                memtoreg = 1'b1;
                regwrite = 1'b1;
                regdst = 1'b0;
            end
            default: begin // Unrecognized opcode
                aluop = 3'b000;
                re = 1'b0;
                wb = 1'b0;
                eq = 1'b0;
                jump = 1'b0;
                branch = 1'b0;
                alusrc = 1'b0;
                memwrite = 1'b0;
                memtoreg = 1'b0;
                regwrite = 1'b0;
                regdst = 1'b0;
            end
        endcase
    end

endmodule