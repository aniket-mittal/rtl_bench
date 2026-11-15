module origen_162759(
    input [7:0] data_in,
    input tx_clk,
    input reset,
    input start,
    output reg data_out,
    output tx_ready
);

    reg [10:0] shift;
    reg [3:0] state;
    reg available;

    initial begin
        shift <= 11'b11111111111;
        state <= 4'd0;
        available <= 1'b1;
    end

    [MASKED]

    assign tx_ready = available;

endmodule