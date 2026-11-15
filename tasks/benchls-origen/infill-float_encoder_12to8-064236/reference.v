module origen_064236(
    input [11:0] D,
    output S,
    output [2:0] E,
    output [3:0] F
);

    wire [11:0] mag;
    wire [3:0] encoder_out;
    wire [3:0] f_temp;
    wire [2:0] exp_temp;
    wire [3:0] f_rounded;
    wire [2:0] e_rounded;
    wire overflow;

    // Sign extraction
    assign S = D[11];

    // Magnitude conversion
    assign mag = S ? (~D + 1'b1) : D;

    // Priority encoding
    priority_encoder pe (
        .in(mag),
        .out(encoder_out)
    );

    // Fraction and exponent extraction
    get_f_temp gft (
        .mag(mag),
        .encoder_out(encoder_out),
        .f_temp(f_temp)
    );

    get_exp ge (
        .encoder_out(encoder_out),
        .exp_temp(exp_temp)
    );

    // Rounding
    round r (
        .f_temp(f_temp),
        .exp_temp(exp_temp),
        .f_rounded(f_rounded),
        .e_rounded(e_rounded),
        .overflow(overflow)
    );

    // Output assignment with overflow handling
    assign F = overflow ? 4'b1111 : f_rounded;
    assign E = overflow ? 3'b111 : e_rounded;

endmodule

module priority_encoder(
    input [11:0] in,
    output reg [3:0] out
);
    integer i;
    always @(*) begin
        out = 4'b0000;
        for (i = 11; i >= 0; i = i - 1) begin
            if (in[i]) begin
                out = i[3:0];
            end
        end
    end
endmodule

module get_f_temp(
    input [11:0] mag,
    input [3:0] encoder_out,
    output reg [3:0] f_temp
);
    always @(*) begin
        case (encoder_out)
            4'd11: f_temp = mag[10:7];
            4'd10: f_temp = mag[9:6];
            4'd9:  f_temp = mag[8:5];
            4'd8:  f_temp = mag[7:4];
            4'd7:  f_temp = mag[6:3];
            4'd6:  f_temp = mag[5:2];
            4'd5:  f_temp = mag[4:1];
            4'd4:  f_temp = mag[3:0];
            4'd3:  f_temp = {mag[2:0], 1'b0};
            4'd2:  f_temp = {mag[1:0], 2'b0};
            4'd1:  f_temp = {mag[0], 3'b0};
            default: f_temp = 4'b0000;
        endcase
    end
endmodule

module get_exp(
    input [3:0] encoder_out,
    output reg [2:0] exp_temp
);
    always @(*) begin
        if (encoder_out > 4'd7)
            exp_temp = encoder_out[2:0] - 3'd7;
        else if (encoder_out < 4'd4)
            exp_temp = 3'd0;
        else
            exp_temp = 3'd1;
    end
endmodule

module round(
    input [3:0] f_temp,
    input [2:0] exp_temp,
    output reg [3:0] f_rounded,
    output reg [2:0] e_rounded,
    output reg overflow
);
    always @(*) begin
        if (f_temp[3:0] == 4'b1111 && exp_temp != 3'b111) begin
            f_rounded = 4'b1000;
            e_rounded = exp_temp + 1'b1;
            overflow = (e_rounded == 3'b111);
        end else begin
            f_rounded = f_temp;
            e_rounded = exp_temp;
            overflow = 1'b0;
        end
    end
endmodule