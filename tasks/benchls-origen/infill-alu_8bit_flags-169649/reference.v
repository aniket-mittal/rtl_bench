module origen_169649 (
    input [7:0] A,
    input [7:0] B,
    input [3:0] opcode,
    output reg [7:0] Y,
    output reg N,
    output reg Z,
    output reg C,
    output reg V
);

    always @(*) begin
        case (opcode)
            4'b0001: // AND
                begin
                    Y = A & B;
                    N = Y[7];
                    Z = (Y == 8'b0);
                    C = 1'b0;
                    V = 1'b0;
                end
            4'b0010: // OR
                begin
                    Y = A | B;
                    N = Y[7];
                    Z = (Y == 8'b0);
                    C = 1'b0;
                    V = 1'b0;
                end
            4'b0011: // NOT
                begin
                    Y = ~A;
                    N = Y[7];
                    Z = (Y == 8'b0);
                    C = 1'b0;
                    V = 1'b0;
                end
            4'b0100: // XOR
                begin
                    Y = A ^ B;
                    N = Y[7];
                    Z = (Y == 8'b0);
                    C = 1'b0;
                    V = 1'b0;
                end
            4'b0101: // Shift left
                begin
                    Y = A << B[2:0];
                    N = Y[7];
                    Z = (Y == 8'b0);
                    C = 1'b0;
                    V = 1'b0;
                end
            4'b0110: // Arithmetic shift right
                begin
                    Y = $signed(A) >>> B[2:0];
                    N = Y[7];
                    Z = (Y == 8'b0);
                    C = 1'b0;
                    V = 1'b0;
                end
            4'b0111: // Logical shift right
                begin
                    Y = A >> B[2:0];
                    N = Y[7];
                    Z = (Y == 8'b0);
                    C = 1'b0;
                    V = 1'b0;
                end
            4'b1000: // Add
                begin
                    {C, Y} = A + B;
                    N = Y[7];
                    Z = (Y == 8'b0);
                    V = (~(A[7] ^ B[7])) & (A[7] ^ Y[7]);
                end
            4'b1001: // Subtract
                begin
                    {C, Y} = A - B;
                    N = Y[7];
                    Z = (Y == 8'b0);
                    V = (A[7] ^ B[7]) & (A[7] ^ Y[7]);
                end
            default:
                begin
                    Y = 8'b0;
                    N = 1'b0;
                    Z = 1'b0;
                    C = 1'b0;
                    V = 1'b0;
                end
        endcase
    end

endmodule