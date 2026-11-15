module origen_044528 (
    input wire clk,
    input wire reset_n,
    input wire [4:0] address,
    output reg [7:0] dataout
);

    reg [7:0] lut [0:31];

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            lut[0] <= 8'd128;
            lut[1] <= 8'd140;
            lut[2] <= 8'd152;
            lut[3] <= 8'd165;
            lut[4] <= 8'd176;
            lut[5] <= 8'd188;
            lut[6] <= 8'd198;
            lut[7] <= 8'd208;
            lut[8] <= 8'd217;
            lut[9] <= 8'd224;
            lut[10] <= 8'd231;
            lut[11] <= 8'd236;
            lut[12] <= 8'd240;
            lut[13] <= 8'd242;
            lut[14] <= 8'd244;
            lut[15] <= 8'd244;
            lut[16] <= 8'd244;
            lut[17] <= 8'd244;
            lut[18] <= 8'd242;
            lut[19] <= 8'd240;
            lut[20] <= 8'd236;
            lut[21] <= 8'd231;
            lut[22] <= 8'd224;
            lut[23] <= 8'd217;
            lut[24] <= 8'd208;
            lut[25] <= 8'd198;
            lut[26] <= 8'd188;
            lut[27] <= 8'd176;
            lut[28] <= 8'd165;
            lut[29] <= 8'd152;
            lut[30] <= 8'd140;
            lut[31] <= 8'd128;
        end
    end

    always @(posedge clk) begin
        dataout <= lut[address];
    end

endmodule