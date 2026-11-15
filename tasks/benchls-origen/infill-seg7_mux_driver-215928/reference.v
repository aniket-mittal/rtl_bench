module origen_215928(
    input [15:0] x,
    input clk,
    input clr,
    output [6:0] a_to_g,
    output [3:0] an,
    output dp
);

    reg [1:0] s;
    reg [3:0] digit;

    always @(posedge clk or posedge clr) begin
        if (clr)
            s <= 2'b00;
        else
            s <= s + 1'b1;
    end

    always @* begin
        case (s)
            2'b00: digit = x[3:0];
            2'b01: digit = x[7:4];
            2'b10: digit = x[11:8];
            2'b11: digit = x[15:12];
        endcase
    end

    assign a_to_g = (clr) ? 7'b1111111 : 
                   (digit == 4'h0) ? 7'b1000000 :
                   (digit == 4'h1) ? 7'b1111001 :
                   (digit == 4'h2) ? 7'b0100100 :
                   (digit == 4'h3) ? 7'b0110000 :
                   (digit == 4'h4) ? 7'b0011001 :
                   (digit == 4'h5) ? 7'b0010010 :
                   (digit == 4'h6) ? 7'b0000010 :
                   (digit == 4'h7) ? 7'b1111000 :
                   (digit == 4'h8) ? 7'b0000000 :
                   (digit == 4'h9) ? 7'b0010000 :
                   (digit == 4'hA) ? 7'b0001000 :
                   (digit == 4'hB) ? 7'b0000011 :
                   (digit == 4'hC) ? 7'b1000110 :
                   (digit == 4'hD) ? 7'b0100001 :
                   (digit == 4'hE) ? 7'b0000110 :
                   7'b0001110;

    assign an = (clr) ? 4'b1111 : 
                (s == 2'b00) ? 4'b1110 :
                (s == 2'b01) ? 4'b1101 :
                (s == 2'b10) ? 4'b1011 :
                4'b0111;

    assign dp = 1'b1;

endmodule