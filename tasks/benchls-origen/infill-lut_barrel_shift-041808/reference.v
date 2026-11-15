module origen_041808 (
    input wire clk,
    input wire rst,
    input wire ena,
    input wire [8:0] din,
    output reg [31:0] dout
);

reg [22:0] lut_out;
reg [5:0] barrelshfcnt;
reg [54:0] tmp1;
reg [39:0] dout1;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        lut_out <= 23'b0;
        barrelshfcnt <= 6'b0;
        tmp1 <= 55'b0;
        dout1 <= 40'b0;
        dout <= 32'b0;
    end else if (ena) begin
        // LUT operation
        case (din[3:0])
            4'h0: lut_out <= 23'h000000;
            4'h1: lut_out <= 23'h0B5586;
            4'h2: lut_out <= 23'h172B84;
            4'h3: lut_out <= 23'h23D70A;
            4'h4: lut_out <= 23'h306FE0;
            4'h5: lut_out <= 23'h3DEA64;
            4'h6: lut_out <= 23'h4B4268;
            4'h7: lut_out <= 23'h5878E8;
            4'h8: lut_out <= 23'h658D00;
            4'h9: lut_out <= 23'h727C00;
            4'hA: lut_out <= 23'h7F4880;
            4'hB: lut_out <= 23'h8BF140;
            4'hC: lut_out <= 23'h987840;
            4'hD: lut_out <= 23'hA4DFA0;
            4'hE: lut_out <= 23'hB12780;
            4'hF: lut_out <= 23'hBD5080;
        endcase

        // Barrel shift operation
        barrelshfcnt <= din[8:4];
        tmp1 <= {1'b1, lut_out} << barrelshfcnt;

        // Output calculation
        dout1 <= tmp1[54:15];
        dout <= dout1[39:8];
    end
end

endmodule