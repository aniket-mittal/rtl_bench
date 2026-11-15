module origen_157073(
    input [127:0] MK,
    input clk,
    input reset,
    input ed,
    output reg [7:0] WK0_4,
    output reg [7:0] WK1_5,
    output reg [7:0] WK2_6,
    output reg [7:0] WK3_7
);

reg [5:0] i_round;

always @(posedge clk) begin
    if (reset) begin
        i_round <= 6'b0;
    end else begin
        i_round <= i_round + 1'b1;
        if (i_round == 6'd34) begin
            i_round <= 6'b0;
        end
    end
end

always @(posedge clk) begin
    if (i_round == 6'b0) begin
        if (ed == 1'b0) begin
            WK0_4 <= MK[7:0];
            WK1_5 <= MK[15:8];
            WK2_6 <= MK[23:16];
            WK3_7 <= MK[31:24];
        end else begin
            WK0_4 <= MK[103:96];
            WK1_5 <= MK[111:104];
            WK2_6 <= MK[119:112];
            WK3_7 <= MK[127:120];
        end
    end else begin
        if (ed == 1'b0) begin
            WK0_4 <= MK[31:24];
            WK1_5 <= MK[23:16];
            WK2_6 <= MK[15:8];
            WK3_7 <= MK[7:0];
        end else begin
            WK0_4 <= MK[127:120];
            WK1_5 <= MK[119:112];
            WK2_6 <= MK[111:104];
            WK3_7 <= MK[103:96];
        end
    end
end

endmodule