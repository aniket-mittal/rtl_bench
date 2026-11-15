module origen_217283(
    input [31:0] X,
    input [31:0] Y,
    input [3:0] S,
    output reg [31:0] Result,
    output reg [31:0] Result2,
    output reg OF,
    output reg UOF,
    output reg Equal
);

always @(*) begin
    case (S)
        4'b0000: begin // Logical Shift Left
            Result = X << (Y[4:0]);
            Result2 = 32'b0;
            OF = 1'b0;
            UOF = 1'b0;
            Equal = 1'b0;
        end
        4'b0001: begin // Arithmetic Shift Right
            Result = $signed(X) >>> (Y[4:0]);
            Result2 = 32'b0;
            OF = 1'b0;
            UOF = 1'b0;
            Equal = 1'b0;
        end
        4'b0010: begin // Logical Shift Right
            Result = X >> (Y[4:0]);
            Result2 = 32'b0;
            OF = 1'b0;
            UOF = 1'b0;
            Equal = 1'b0;
        end
        4'b0011: begin // Multiplication
            {Result2, Result} = X * Y;
            OF = 1'b0;
            UOF = 1'b0;
            Equal = 1'b0;
        end
        4'b0100: begin // Division and Modulo
            Result = X / Y;
            Result2 = X % Y;
            OF = 1'b0;
            UOF = 1'b0;
            Equal = 1'b0;
        end
        4'b0101: begin // Addition
            {OF, Result} = X + Y;
            UOF = (X[31] == Y[31]) && (Result[31] != X[31]);
            Result2 = 32'b0;
            Equal = 1'b0;
        end
        4'b0110: begin // Subtraction
            {OF, Result} = X - Y;
            UOF = (X[31] != Y[31]) && (Result[31] != X[31]);
            Result2 = 32'b0;
            Equal = 1'b0;
        end
        4'b0111: begin // Bitwise AND
            Result = X & Y;
            Result2 = 32'b0;
            OF = 1'b0;
            UOF = 1'b0;
            Equal = 1'b0;
        end
        4'b1000: begin // Bitwise OR
            Result = X | Y;
            Result2 = 32'b0;
            OF = 1'b0;
            UOF = 1'b0;
            Equal = 1'b0;
        end
        4'b1001: begin // Bitwise XOR
            Result = X ^ Y;
            Result2 = 32'b0;
            OF = 1'b0;
            UOF = 1'b0;
            Equal = 1'b0;
        end
        4'b1010: begin // Bitwise NOR
            Result = ~(X | Y);
            Result2 = 32'b0;
            OF = 1'b0;
            UOF = 1'b0;
            Equal = 1'b0;
        end
        4'b1011: begin // Signed Comparison
            Result = ($signed(X) < $signed(Y)) ? 32'b1 : 32'b0;
            Result2 = 32'b0;
            OF = 1'b0;
            UOF = 1'b0;
            Equal = 1'b0;
        end
        4'b1100: begin // Unsigned Comparison
            Result = (X < Y) ? 32'b1 : 32'b0;
            Result2 = 32'b0;
            OF = 1'b0;
            UOF = 1'b0;
            Equal = 1'b0;
        end
        default: begin
            Result = 32'b0;
            Result2 = 32'b0;
            OF = 1'b0;
            UOF = 1'b0;
            Equal = 1'b0;
        end
    endcase

    Equal = (X == Y) ? 1'b1 : 1'b0;
end

endmodule