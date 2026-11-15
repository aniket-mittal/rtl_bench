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

    [MASKED]

    assign an = (clr) ? 4'b1111 : 
                (s == 2'b00) ? 4'b1110 :
                (s == 2'b01) ? 4'b1101 :
                (s == 2'b10) ? 4'b1011 :
                4'b0111;

    assign dp = 1'b1;

endmodule