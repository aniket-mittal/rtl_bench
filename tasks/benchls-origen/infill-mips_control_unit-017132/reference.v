module origen_017132(
    input [5:0] op,
    input [5:0] func,
    output reg wreg,
    output reg m2reg,
    output reg wmem,
    output reg [3:0] aluc,
    output reg aluimm,
    output reg regrt
);

always @(*) begin
    case(op)
        6'b100011: begin // Load Word
            wreg = 1'b1;
            m2reg = 1'b1;
            wmem = 1'b0;
            aluc = 4'b0010;
            aluimm = 1'b1;
            regrt = 1'b1;
        end
        6'b101011: begin // Store Word
            wreg = 1'b0;
            m2reg = 1'bx;
            wmem = 1'b1;
            aluc = 4'b0010;
            aluimm = 1'b1;
            regrt = 1'bx;
        end
        6'b101011: begin // Duplicate opcode (possibly a typo)
            wreg = 1'b0;
            m2reg = 1'bx;
            wmem = 1'b0;
            aluc = 4'b0110;
            aluimm = 1'b0;
            regrt = 1'bx;
        end
        default: begin
            wreg = 1'b0;
            m2reg = 1'b0;
            wmem = 1'b0;
            aluc = 4'b0000;
            aluimm = 1'b0;
            regrt = 1'b0;
        end
    endcase
end

endmodule