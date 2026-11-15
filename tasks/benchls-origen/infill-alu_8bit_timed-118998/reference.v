module origen_118998 (
    input [7:0] A,
    input [7:0] B,
    input [2:0] F,
    output reg [7:0] S,
    output reg G,
    output reg CarryOut
);

    reg [8:0] temp;

    always @(*) begin
        G = (A > B);
        CarryOut = 1'b0;
        
        case (F)
            3'b000: begin // Addition
                #64.3;
                {CarryOut, S} = A + B;
            end
            3'b001: begin // Subtraction
                #64.3;
                {CarryOut, S} = A - B;
            end
            3'b010: begin // Comparison
                #71.3;
                S = (A < B) ? B : S;
            end
            3'b011: begin // Modified addition
                #64.3;
                temp = A + {1'b0, B[7:1]};
                S = temp[7:0];
                CarryOut = temp[8];
            end
            3'b100: begin // Clear
                #14.2;
                S = 8'b0;
            end
            3'b101: begin // Bitwise OR
                #56;
                S = A | B;
            end
            3'b110: begin // Bitwise AND
                #56;
                S = A & B;
            end
            3'b111: begin // Left shift B
                #7.2;
                {CarryOut, S} = B + B;
            end
        endcase
    end

endmodule