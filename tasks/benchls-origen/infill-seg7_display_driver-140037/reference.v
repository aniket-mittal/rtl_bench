module origen_140037(
    input [15:0] x,
    input clk,
    input clr,
    output reg [6:0] a_to_g,
    output reg [3:0] an,
    output wire dp
);

    reg [3:0] digit;
    reg [1:0] sel;
    reg [19:0] refresh_counter;

    assign dp = 1'b0; // Decimal point always on (active low)

    always @(posedge clk or posedge clr) begin
        if (clr)
            refresh_counter <= 20'd0;
        else
            refresh_counter <= refresh_counter + 1;
    end

    always @(*) begin
        sel = refresh_counter[19:18];
        case(sel)
            2'b00: begin digit = x[3:0];   an = 4'b1110; end
            2'b01: begin digit = x[7:4];   an = 4'b1101; end
            2'b10: begin digit = x[11:8];  an = 4'b1011; end
            2'b11: begin digit = x[15:12]; an = 4'b0111; end
        endcase
    end

    always @(*) begin
        case(digit)
            4'h0: a_to_g = 7'b1000000;
            4'h1: a_to_g = 7'b1111001;
            4'h2: a_to_g = 7'b0100100;
            4'h3: a_to_g = 7'b0110000;
            4'h4: a_to_g = 7'b0011001;
            4'h5: a_to_g = 7'b0010010;
            4'h6: a_to_g = 7'b0000010;
            4'h7: a_to_g = 7'b1111000;
            4'h8: a_to_g = 7'b0000000;
            4'h9: a_to_g = 7'b0010000;
            4'ha: a_to_g = 7'b0001000;
            4'hb: a_to_g = 7'b0000011;
            4'hc: a_to_g = 7'b1000110;
            4'hd: a_to_g = 7'b0100001;
            4'he: a_to_g = 7'b0000110;
            4'hf: a_to_g = 7'b0001110;
        endcase
    end

endmodule