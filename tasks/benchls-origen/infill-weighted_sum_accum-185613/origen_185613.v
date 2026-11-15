module origen_185613 #(
    parameter NWBITS = 8,
    parameter NPIXEL = 16,
    parameter COUNT_BIT1 = 4
) (
    input clk,
    input reset_b,
    input start_multiply,
    input signed [NWBITS-1:0] partial_product,
    output signed [NWBITS+COUNT_BIT1-1:0] weighted_sum,
    output add_bias
);

reg [NWBITS+COUNT_BIT1-1:0] weighted_sum_reg;
reg [COUNT_BIT1-1:0] counter;
reg add_bias_reg;

localparam WAIT = 1'b0,
           ADD = 1'b1;

reg state;

[MASKED]

assign weighted_sum = weighted_sum_reg;
assign add_bias = add_bias_reg;

endmodule