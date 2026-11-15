module origen_151628(
    input [7:0] in,
    input [2:0] Cin,
    output reg [7:0] out1, out2, out3, out4, out5, out6, out7, out8
);

always @(*) begin
    case (Cin)
        3'b000: begin
            out1 = in;
            out2 = 8'b0;
            out3 = 8'b0;
            out4 = 8'b0;
            out5 = 8'b0;
            out6 = 8'b0;
            out7 = 8'b0;
            out8 = 8'b0;
        end
        3'b001: begin
            out1 = 8'b0;
            out2 = in;
            out3 = 8'b0;
            out4 = 8'b0;
            out5 = 8'b0;
            out6 = 8'b0;
            out7 = 8'b0;
            out8 = 8'b0;
        end
        3'b010: begin
            out1 = 8'b0;
            out2 = 8'b0;
            out3 = in;
            out4 = 8'b0;
            out5 = 8'b0;
            out6 = 8'b0;
            out7 = 8'b0;
            out8 = 8'b0;
        end
        3'b011: begin
            out1 = 8'b0;
            out2 = 8'b0;
            out3 = 8'b0;
            out4 = in;
            out5 = 8'b0;
            out6 = 8'b0;
            out7 = 8'b0;
            out8 = 8'b0;
        end
        3'b100: begin
            out1 = 8'b0;
            out2 = 8'b0;
            out3 = 8'b0;
            out4 = 8'b0;
            out5 = in;
            out6 = 8'b0;
            out7 = 8'b0;
            out8 = 8'b0;
        end
        3'b101: begin
            out1 = 8'b0;
            out2 = 8'b0;
            out3 = 8'b0;
            out4 = 8'b0;
            out5 = 8'b0;
            out6 = in;
            out7 = 8'b0;
            out8 = 8'b0;
        end
        3'b110: begin
            out1 = 8'b0;
            out2 = 8'b0;
            out3 = 8'b0;
            out4 = 8'b0;
            out5 = 8'b0;
            out6 = 8'b0;
            out7 = in;
            out8 = 8'b0;
        end
        3'b111: begin
            out1 = 8'b0;
            out2 = 8'b0;
            out3 = 8'b0;
            out4 = 8'b0;
            out5 = 8'b0;
            out6 = 8'b0;
            out7 = 8'b0;
            out8 = in;
        end
    endcase
end

endmodule