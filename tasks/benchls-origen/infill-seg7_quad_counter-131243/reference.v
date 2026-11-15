module origen_131243(
    input [6:0] Cuenta,
    output reg [7:0] catodo1,
    output reg [7:0] catodo2,
    output reg [7:0] catodo3,
    output reg [7:0] catodo4
);

    reg [3:0] digit1, digit2, digit3, digit4;
    
    always @(*) begin
        digit1 = Cuenta % 10;
        digit2 = (Cuenta / 10) % 10;
        digit3 = (Cuenta / 100) % 10;
        digit4 = Cuenta / 1000;
        
        catodo1 = 8'b11111111;
        catodo2 = 8'b11111111;
        catodo3 = 8'b11111111;
        catodo4 = 8'b11111111;
        
        case(digit1)
            4'h0: catodo1 = 8'b11000000;
            4'h1: catodo1 = 8'b11111001;
            4'h2: catodo1 = 8'b10100100;
            4'h3: catodo1 = 8'b10110000;
            4'h4: catodo1 = 8'b10011001;
            4'h5: catodo1 = 8'b10010010;
            4'h6: catodo1 = 8'b10000010;
            4'h7: catodo1 = 8'b11111000;
            4'h8: catodo1 = 8'b10000000;
            4'h9: catodo1 = 8'b10010000;
            4'ha: catodo1 = 8'b10001000;
            4'hb: catodo1 = 8'b10000011;
            4'hc: catodo1 = 8'b11000110;
            4'hd: catodo1 = 8'b10100001;
            4'he: catodo1 = 8'b10000110;
            4'hf: catodo1 = 8'b10001110;
        endcase
        
        case(digit2)
            4'h0: catodo2 = 8'b11000000;
            4'h1: catodo2 = 8'b11111001;
            4'h2: catodo2 = 8'b10100100;
            4'h3: catodo2 = 8'b10110000;
            4'h4: catodo2 = 8'b10011001;
            4'h5: catodo2 = 8'b10010010;
            4'h6: catodo2 = 8'b10000010;
            4'h7: catodo2 = 8'b11111000;
            4'h8: catodo2 = 8'b10000000;
            4'h9: catodo2 = 8'b10010000;
            4'ha: catodo2 = 8'b10001000;
            4'hb: catodo2 = 8'b10000011;
            4'hc: catodo2 = 8'b11000110;
            4'hd: catodo2 = 8'b10100001;
            4'he: catodo2 = 8'b10000110;
            4'hf: catodo2 = 8'b10001110;
        endcase
        
        case(digit3)
            4'h0: catodo3 = 8'b11000000;
            4'h1: catodo3 = 8'b11111001;
            4'h2: catodo3 = 8'b10100100;
            4'h3: catodo3 = 8'b10110000;
            4'h4: catodo3 = 8'b10011001;
            4'h5: catodo3 = 8'b10010010;
            4'h6: catodo3 = 8'b10000010;
            4'h7: catodo3 = 8'b11111000;
            4'h8: catodo3 = 8'b10000000;
            4'h9: catodo3 = 8'b10010000;
            4'ha: catodo3 = 8'b10001000;
            4'hb: catodo3 = 8'b10000011;
            4'hc: catodo3 = 8'b11000110;
            4'hd: catodo3 = 8'b10100001;
            4'he: catodo3 = 8'b10000110;
            4'hf: catodo3 = 8'b10001110;
        endcase
        
        case(digit4)
            4'h0: catodo4 = 8'b11000000;
            4'h1: catodo4 = 8'b11111001;
            4'h2: catodo4 = 8'b10100100;
            4'h3: catodo4 = 8'b10110000;
            4'h4: catodo4 = 8'b10011001;
            4'h5: catodo4 = 8'b10010010;
            4'h6: catodo4 = 8'b10000010;
            4'h7: catodo4 = 8'b11111000;
            4'h8: catodo4 = 8'b10000000;
            4'h9: catodo4 = 8'b10010000;
            4'ha: catodo4 = 8'b10001000;
            4'hb: catodo4 = 8'b10000011;
            4'hc: catodo4 = 8'b11000110;
            4'hd: catodo4 = 8'b10100001;
            4'he: catodo4 = 8'b10000110;
            4'hf: catodo4 = 8'b10001110;
        endcase
    end

endmodule