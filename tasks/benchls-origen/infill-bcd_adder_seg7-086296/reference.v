module origen_086296(
    input [8:0] SW,
    output [6:0] HEX0, HEX1, HEX3, HEX5
);

    wire [4:0] sum;
    wire [3:0] sum_adjusted;
    wire carry_out, Z, C;

    adder add_inst(
        .a(SW[3:0]),
        .b(SW[7:4]),
        .cin(SW[8]),
        .sum(sum[3:0]),
        .cout(sum[4])
    );

    greater_than_nine_if gtn_inst(
        .in(sum),
        .Z(Z),
        .C(C)
    );

    assign sum_adjusted = sum[3:0] - Z;

    to_hex hex0_inst(
        .in(sum_adjusted),
        .out(HEX0)
    );

    to_hex hex1_inst(
        .in({3'b000, C}),
        .out(HEX1)
    );

    to_hex hex3_inst(
        .in(SW[3:0]),
        .out(HEX3)
    );

    to_hex hex5_inst(
        .in(SW[7:4]),
        .out(HEX5)
    );

endmodule

module adder(
    input [3:0] a, b,
    input cin,
    output [3:0] sum,
    output cout
);

    assign {cout, sum} = a + b + cin;

endmodule

module greater_than_nine_if(
    input [4:0] in,
    output reg Z,
    output reg C
);

    always @(*) begin
        if (in > 5'd9) begin
            Z = 4'd6;
            C = 1'b1;
        end else begin
            Z = 4'd0;
            C = 1'b0;
        end
    end

endmodule

module to_hex(
    input [3:0] in,
    output reg [6:0] out
);

    always @(*) begin
        case (in)
            4'h0: out = 7'b1000000;
            4'h1: out = 7'b1111001;
            4'h2: out = 7'b0100100;
            4'h3: out = 7'b0110000;
            4'h4: out = 7'b0011001;
            4'h5: out = 7'b0010010;
            4'h6: out = 7'b0000010;
            4'h7: out = 7'b1111000;
            4'h8: out = 7'b0000000;
            4'h9: out = 7'b0010000;
            4'ha: out = 7'b0001000;
            4'hb: out = 7'b0000011;
            4'hc: out = 7'b1000110;
            4'hd: out = 7'b0100001;
            4'he: out = 7'b0000110;
            4'hf: out = 7'b0001110;
            default: out = 7'b1111111;
        endcase
    end

endmodule