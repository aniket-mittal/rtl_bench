module origen_104651 #(
    parameter COUNTER_SIZE = 8
)(
    input wire clk,
    input wire en,
    input wire rst,
    input wire cnt_mode,
    input wire free,
    input wire init_cnt,
    input wire [COUNTER_SIZE-1:0] min,
    input wire [COUNTER_SIZE-1:0] max,
    input wire [COUNTER_SIZE-1:0] init,
    output reg [COUNTER_SIZE-1:0] value,
    output reg overflow_set
);

    [MASKED]

endmodule