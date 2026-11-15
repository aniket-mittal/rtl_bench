module origen_115178(
    input [4:0] count,
    output reg [6:0] hex5, hex4, hex3, hex2
);

    always @(*) begin
        case(count)
            5'b00000: begin // CLEAR
                hex5 = 7'b1000110; // C
                hex4 = 7'b1000111; // L
                hex3 = 7'b0000110; // E
                hex2 = 7'b0101111; // A
            end
            5'b11001: begin // FULL
                hex5 = 7'b0001110; // F
                hex4 = 7'b1000001; // U
                hex3 = 7'b1000111; // L
                hex2 = 7'b1000111; // L
            end
            default: begin // OFF
                hex5 = 7'b1111111;
                hex4 = 7'b1111111;
                hex3 = 7'b1111111;
                hex2 = 7'b1111111;
            end
        endcase
    end

endmodule

