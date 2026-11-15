module origen_081631(
    input [11:0] in,
    output sign,
    output [10:0] magnitude
);
    assign sign = in[11];
    assign magnitude = sign ? (~in[10:0] + 1'b1) : in[10:0];
endmodule

module countZerosExtractData(
    input [10:0] magnitude,
    output [2:0] exp,
    output [3:0] sig,
    output round_bit
);
    wire [3:0] leading_zeros;
    reg [2:0] exp_temp;
    reg [3:0] sig_temp;
    reg round_bit_temp;

    assign leading_zeros = 
        magnitude[10] ? 4'd0 :
        magnitude[9]  ? 4'd1 :
        magnitude[8]  ? 4'd2 :
        magnitude[7]  ? 4'd3 :
        magnitude[6]  ? 4'd4 :
        magnitude[5]  ? 4'd5 :
        magnitude[4]  ? 4'd6 :
        magnitude[3]  ? 4'd7 :
        magnitude[2]  ? 4'd8 :
        magnitude[1]  ? 4'd9 :
        magnitude[0]  ? 4'd10 : 4'd11;

    always @(*) begin
        exp_temp = 3'd7 - leading_zeros[2:0];
        case (leading_zeros)
            4'd0:  {sig_temp, round_bit_temp} = magnitude[9:5];
            4'd1:  {sig_temp, round_bit_temp} = magnitude[8:4];
            4'd2:  {sig_temp, round_bit_temp} = magnitude[7:3];
            4'd3:  {sig_temp, round_bit_temp} = magnitude[6:2];
            4'd4:  {sig_temp, round_bit_temp} = magnitude[5:1];
            4'd5:  {sig_temp, round_bit_temp} = magnitude[4:0];
            4'd6:  {sig_temp, round_bit_temp} = {magnitude[3:0], 1'b0};
            4'd7:  {sig_temp, round_bit_temp} = {magnitude[2:0], 2'b0};
            4'd8:  {sig_temp, round_bit_temp} = {magnitude[1:0], 3'b0};
            4'd9:  {sig_temp, round_bit_temp} = {magnitude[0], 4'b0};
            default: {sig_temp, round_bit_temp} = 5'b0;
        endcase
    end

    assign exp = exp_temp;
    assign sig = sig_temp;
    assign round_bit = round_bit_temp;
endmodule

module round(
    input [2:0] exp_in,
    input [3:0] sig_in,
    input round_bit,
    output [2:0] exp_out,
    output [3:0] sig_out
);
    wire [4:0] rounded_sig = sig_in + round_bit;
    assign sig_out = rounded_sig[4] ? 4'b1000 : rounded_sig[3:0];
    assign exp_out = rounded_sig[4] ? (exp_in + 1'b1) : exp_in;
endmodule

module FPCVT(
    input [11:0] D,
    output S,
    output [2:0] E,
    output [3:0] F
);
    wire sign;
    wire [10:0] magnitude;
    wire [2:0] exp_temp;
    wire [3:0] sig_temp;
    wire round_bit;
    wire [2:0] exp_rounded;
    wire [3:0] sig_rounded;

    signMagnitude sm(
        .in(D),
        .sign(sign),
        .magnitude(magnitude)
    );

    countZerosExtractData czed(
        .magnitude(magnitude),
        .exp(exp_temp),
        .sig(sig_temp),
        .round_bit(round_bit)
    );

    round r(
        .exp_in(exp_temp),
        .sig_in(sig_temp),
        .round_bit(round_bit),
        .exp_out(exp_rounded),
        .sig_out(sig_rounded)
    );

    assign S = sign;
    assign E = (D == 12'h7FF || D == 12'h800) ? 3'b111 : exp_rounded;
    assign F = (D == 12'h7FF || D == 12'h800) ? 4'b1111 : sig_rounded;
endmodule