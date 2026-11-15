module origen_035439(
    input [7:0] A, B, C, D, E, F, G,
    input [2:0] Sel,
    input addOverflow, shiftOverflow,
    output reg [7:0] Y,
    output reg overflow
);

always @(*) begin
    case(Sel)
        3'b000: begin
            Y = A;
            overflow = addOverflow;
        end
        3'b001: begin
            Y = B;
            overflow = shiftOverflow;
        end
        3'b010: begin
            Y = C;
            overflow = 1'b0;
        end
        3'b011: begin
            Y = D;
            overflow = 1'b0;
        end
        3'b100: begin
            Y = E;
            overflow = 1'b0;
        end
        3'b101: begin
            Y = F;
            overflow = 1'b0;
        end
        3'b110: begin
            Y = G;
            overflow = 1'b0;
        end
        3'b111: begin
            Y = 8'b0;
            overflow = 1'b0;
        end
        default: begin
            Y = 8'b0;
            overflow = 1'b0;
        end
    endcase
end

endmodule