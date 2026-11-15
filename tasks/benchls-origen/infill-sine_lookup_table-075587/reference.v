module origen_075587 (
    input wire clk_i,
    input wire [4:0] addr_i,
    output reg [7:0] value_o
);

reg [7:0] outval;
reg [7:0] lookup_table [0:29];

initial begin
    lookup_table[0] = 8'd128;
    lookup_table[1] = 8'd140;
    lookup_table[2] = 8'd152;
    lookup_table[3] = 8'd165;
    lookup_table[4] = 8'd176;
    lookup_table[5] = 8'd188;
    lookup_table[6] = 8'd198;
    lookup_table[7] = 8'd208;
    lookup_table[8] = 8'd217;
    lookup_table[9] = 8'd224;
    lookup_table[10] = 8'd231;
    lookup_table[11] = 8'd236;
    lookup_table[12] = 8'd240;
    lookup_table[13] = 8'd243;
    lookup_table[14] = 8'd245;
    lookup_table[15] = 8'd246;
    lookup_table[16] = 8'd247;
    lookup_table[17] = 8'd246;
    lookup_table[18] = 8'd245;
    lookup_table[19] = 8'd243;
    lookup_table[20] = 8'd240;
    lookup_table[21] = 8'd236;
    lookup_table[22] = 8'd231;
    lookup_table[23] = 8'd224;
    lookup_table[24] = 8'd217;
    lookup_table[25] = 8'd208;
    lookup_table[26] = 8'd198;
    lookup_table[27] = 8'd188;
    lookup_table[28] = 8'd176;
    lookup_table[29] = 8'd165;
end

always @(posedge clk_i) begin
    if (addr_i < 5'd30) begin
        outval <= lookup_table[addr_i];
    end
end

always @(*) begin
    value_o = outval;
end

endmodule