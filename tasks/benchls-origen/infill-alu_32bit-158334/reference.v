module origen_158334(
    input [31:0] in1,
    input [31:0] in2,
    input [3:0] control,
    input [4:0] SHAMT,
    output reg [31:0] out,
    output reg ov,
    output reg zero
);

reg [32:0] carry;

always @(*) begin
    case (control)
        4'b0000: begin // Addition
            {carry, out} = in1 + in2;
            ov = carry[32] ^ carry[31];
            zero = (out == 32'b0);
        end
        4'b0001: begin // Subtraction
            {carry, out} = in1 - in2;
            ov = carry[32] ^ carry[31];
            zero = (out == 32'b0);
        end
        4'b0010: begin // Bitwise AND
            out = in1 & in2;
            ov = 1'b0;
            zero = (out == 32'b0);
        end
        4'b0011: begin // Bitwise OR
            out = in1 | in2;
            ov = 1'b0;
            zero = (out == 32'b0);
        end
        4'b0100: begin // Bitwise XOR
            out = in1 ^ in2;
            ov = 1'b0;
            zero = (out == 32'b0);
        end
        4'b0101: begin // Logical left shift
            out = in1 << SHAMT;
            ov = 1'b0;
            zero = (out == 32'b0);
        end
        4'b0110: begin // Logical right shift
            out = in1 >> SHAMT;
            ov = 1'b0;
            zero = (out == 32'b0);
        end
        4'b0111: begin // Arithmetic right shift
            out = $signed(in1) >>> SHAMT;
            ov = 1'b0;
            zero = (out == 32'b0);
        end
        4'b1000: begin // Equal comparison
            out = (in1 == in2) ? 32'b1 : 32'b0;
            ov = 1'b0;
            zero = (out == 32'b0);
        end
        4'b1001: begin // Not-equal comparison
            out = (in1 != in2) ? 32'b1 : 32'b0;
            ov = 1'b0;
            zero = (out == 32'b0);
        end
        4'b1010: begin // Less-than comparison
            out = ($signed(in1) < $signed(in2)) ? 32'b1 : 32'b0;
            ov = 1'b0;
            zero = (out == 32'b0);
        end
        4'b1011: begin // Greater-than-or-equal-to comparison
            out = ($signed(in1) >= $signed(in2)) ? 32'b1 : 32'b0;
            ov = 1'b0;
            zero = (out == 32'b0);
        end
        4'b1100: begin // Greater-than comparison
            out = ($signed(in1) > $signed(in2)) ? 32'b1 : 32'b0;
            ov = 1'b0;
            zero = (out == 32'b0);
        end
        4'b1101: begin // Less-than-or-equal-to comparison
            out = ($signed(in1) <= $signed(in2)) ? 32'b1 : 32'b0;
            ov = 1'b0;
            zero = (out == 32'b0);
        end
        4'b1110: begin // Concatenation
            out = {in2, 16'b0};
            ov = 1'b0;
            zero = (out == 32'b0);
        end
        4'b1111: begin // No operation
            out = 32'b0;
            ov = 1'b0;
            zero = 1'b1;
        end
    endcase
end

endmodule