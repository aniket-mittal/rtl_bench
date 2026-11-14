module origen_121558 #(
    parameter KER_SIZE = 3,
    parameter BITWIDTH = 8,
    parameter STRIDE = 1,
    parameter NFMAPS = 3,
    parameter INPUT_X_DIM = 28,
    parameter PAD = 1,
    parameter AW = 5
)(
    input wire clk,
    input wire rstn,
    input wire valid,
    output reg [AW-1:0] addr,
    output reg [KER_SIZE-1:0] write_en,
    output reg [KER_SIZE-1:0] read_en,
    output reg ready,
    output reg [KER_SIZE-1:0] top_pad_mask,
    output reg bottom_pad_mask,
    output reg row_is_complete
);

    localparam PADDED_DIM = INPUT_X_DIM + 2*PAD;

    reg [3:0] row_ptr;
    reg [5:0] global_row_ptr;
    reg [5:0] col_ptr;
    reg [3:0] init_row_counter;
    reg [3:0] row_stride_counter;

    [MASKED]

endmodule