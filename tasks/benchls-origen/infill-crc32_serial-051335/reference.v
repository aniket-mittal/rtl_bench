module origen_051335 (
    input wire reset,
    input wire enable,
    input wire clk,
    input wire d,
    output reg [31:0] q
);

    wire c;

    assign c = q[31] ^ d;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 32'hFFFFFFFF;
        end else if (enable) begin
            q[31] <= q[30];
            q[30] <= q[29];
            q[29] <= q[28];
            q[28] <= q[27];
            q[27] <= q[26];
            q[26] <= q[25] ^ c;
            q[25] <= q[24];
            q[24] <= q[23];
            q[23] <= q[22] ^ c;
            q[22] <= q[21] ^ c;
            q[21] <= q[20];
            q[20] <= q[19];
            q[19] <= q[18];
            q[18] <= q[17];
            q[17] <= q[16];
            q[16] <= q[15] ^ c;
            q[15] <= q[14];
            q[14] <= q[13];
            q[13] <= q[12];
            q[12] <= q[11] ^ c;
            q[11] <= q[10] ^ c;
            q[10] <= q[9] ^ c;
            q[9] <= q[8];
            q[8] <= q[7] ^ c;
            q[7] <= q[6] ^ c;
            q[6] <= q[5];
            q[5] <= q[4] ^ c;
            q[4] <= q[3] ^ c;
            q[3] <= q[2];
            q[2] <= q[1] ^ c;
            q[1] <= q[0] ^ c;
            q[0] <= c;
        end
    end

endmodule