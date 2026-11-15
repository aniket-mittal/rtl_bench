module origen_058059 (
    input wire [7:0] data_mux,
    input wire valid_mux,
    input wire reset_L,
    input wire clk_2f,
    output reg [7:0] data_stripe_0,
    output reg [7:0] data_stripe_1,
    output reg valid_stripe_0,
    output reg valid_stripe_1
);

    reg selector;
    reg validflop;
    reg [7:0] l0, l1;
    reg flag;

    [MASKED]

endmodule