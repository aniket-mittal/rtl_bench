module origen_107301 (
    input wire clk,
    input wire rst,
    input wire valid_in,
    input wire pixel_in,
    output reg [9:0] output_symbol
);

parameter MIN_RUN = 20;
parameter IMAGE_W = 640;

reg [9:0] pixel_count;
reg [9:0] run_start, run_length;
reg [9:0] largest_run, largest_run_start;
reg [9:0] zeros, ones;
reg im_end, final_pix;
reg [1:0] state;

localparam RESET = 2'b00, PROCESS = 2'b01, LINE_END = 2'b10, ENCODE = 2'b11;

[MASKED]

endmodule