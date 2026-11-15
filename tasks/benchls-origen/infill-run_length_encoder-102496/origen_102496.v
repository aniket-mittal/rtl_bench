module origen_102496 (
    input wire rst,
    input wire clk,
    input wire in_valid,
    input wire [255:0] in_data,
    output reg out_valid,
    output reg [255:0] out_data
);

    reg [63:0] ctr_repeat;
    reg [63:0] ctr_entries;
    reg [255:0] prev_wr_data;
    reg prev_wr_same;

    [MASKED]

endmodule