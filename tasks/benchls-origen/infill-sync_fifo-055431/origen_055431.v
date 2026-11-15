module origen_055431 #(
    parameter width = 4,
    parameter height = 8,
    parameter ptr_width = 3
)(
    input wire clk,
    input wire rst,
    input wire [width-1:0] data_in,
    input wire write,
    input wire read,
    output reg [width-1:0] data_out,
    output wire full,
    output wire empty
);

    reg [width-1:0] memory [0:height-1];
    reg [ptr_width-1:0] read_ptr, write_ptr;
    reg [ptr_width:0] diff;
    reg empty_r, empty_r_r, full_r, full_r_r;

    [MASKED]

    assign empty = empty_r && empty_r_r;
    assign full = full_r && full_r_r;

endmodule