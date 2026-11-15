module origen_150855(
    input signed [31:0] X,
    input signed [31:0] Y,
    input [4:0] S,
    output reg [31:0] result1,
    output reg [31:0] result2,
    output reg OF, // Overflow Flag
    output reg UOF, // Underflow Flag
    output reg Equal
);

always @(*) begin
    case (S)
        5'd0: begin // Left Shift
            result1 = X << (Y[4:0]);
            result2 = 32'b0;
            OF = 0;
            UOF = 0;
        end
        5'd1: begin // Logical Right Shift
            result1 = X >> (Y[4:0]);
            result2 = 32'b0;
            OF = 0;
            UOF = 0;
        end
        5'd2: begin // Arithmetic Right Shift
            result1 = X >>> (Y[4:0]);
            result2 = 32'b0;
            OF = 0;
            UOF = 0;
        end
        5'd3: begin // Multiply
            {result2, result1} = X * Y;
            OF = 0;
            UOF = 0;
        end
        5'd4: begin // Divide
            result1 = X / Y;
            result2 = X % Y;
            OF = 0;
            UOF = 0;
        end
        5'd5: begin // Add
            {OF, result1} = X + Y;
            UOF = 0;
        end
        5'd6: begin // Subtract
            {OF, result1} = X - Y;
            UOF = (X < Y);
        end
        5'd7: begin // Bitwise AND
            result1 = X & Y;
            result2 = 32'b0;
            OF = 0;
            UOF = 0;
        end
        5'd8: begin // Bitwise OR
            result1 = X | Y;
            result2 = 32'b0;
            OF = 0;
            UOF = 0;
        end
        5'd9: begin // Bitwise XOR
            result1 = X ^ Y;
            result2 = 32'b0;
            OF = 0;
            UOF = 0;
        end
        5'd10: begin // Bitwise NOR
            result1 = ~(X | Y);
            result2 = 32'b0;
            OF = 0;
            UOF = 0;
        end
        5'd11: begin // Signed Compare
            result1 = (X < Y) ? 32'b1 : 32'b0;
            result2 = 32'b0;
            OF = 0;
            UOF = 0;
        end
        5'd12: begin // Unsigned Compare
            result1 = ($unsigned(X) < $unsigned(Y)) ? 32'b1 : 32'b0;
            result2 = 32'b0;
            OF = 0;
            UOF = 0;
        end
        default: begin
            result1 = 32'b0;
            result2 = 32'b0;
            OF = 0;
            UOF = 0;
        end
    endcase

    Equal = (X == Y) ? 1'b1 : 1'b0;
end

endmodule