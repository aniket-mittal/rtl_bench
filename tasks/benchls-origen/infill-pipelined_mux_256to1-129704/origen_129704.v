module origen_129704 (
    input wire clk,
    input wire rst,
    input wire [255:0] data_in,
    input wire [7:0] sel,
    output reg out
);

    // Pipeline registers
    reg [127:0] stage1_data;
    reg [63:0] stage2_data;
    reg [31:0] stage3_data;
    reg [15:0] stage4_data;
    reg [7:0] stage5_data;
    reg [3:0] stage6_data;
    reg [1:0] stage7_data;

    reg [6:0] sel_pipe;

    [MASKED]

endmodule