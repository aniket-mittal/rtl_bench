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

[MASKED]

endmodule