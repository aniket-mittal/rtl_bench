module origen_183246(
    input [31:0] in1,
    input [31:0] in2,
    input [3:0] aluControl,
    output reg [31:0] out,
    output reg zeroFlag
);

always @(*) begin
    case (aluControl)
        4'b0000: begin // Bitwise AND
            out = in1 & in2;
            zeroFlag = (out == 32'b0);
        end
        4'b0001: begin // Bitwise OR
            out = in1 | in2;
            zeroFlag = (out == 32'b0);
        end
        4'b0010: begin // Addition
            out = in1 + in2;
            zeroFlag = (out == 32'b0);
        end
        4'b0110: begin // Equality comparison
            out = (in1 == in2) ? 32'b1 : 32'b0;
            zeroFlag = (in1 == in2);
        end
        4'b0111: begin // Less-than comparison
            out = (in1 < in2) ? 32'b1 : 32'b0;
            zeroFlag = (in1 < in2);
        end
        4'b1111: begin // Left shift
            out = in1 << (in2[5:0]);
            zeroFlag = (out == 32'b0);
        end
        4'b1110: begin // Right shift
            out = in1 >> (in2[5:0]);
            zeroFlag = (out == 32'b0);
        end
        4'b1011: begin // Inequality comparison
            out = (in1 != in2) ? 32'b1 : 32'b0;
            zeroFlag = (in1 != in2);
        end
        default: begin
            out = 32'b0;
            zeroFlag = 1'b0;
        end
    endcase
end

endmodule