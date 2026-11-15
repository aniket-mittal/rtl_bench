module autovcoder_126043 (
    input clk,
    input rst,
    input [31:0] data_in,
    input data_valid,
    input [15:0] mss,
    output reg [31:0] tcp_packet_out,
    output reg packet_valid,
    output reg segmentation_done
);
    reg [15:0] data_count;
    reg [31:0] buffer;
    reg [15:0] segment_size;

    [MASKED]
endmodule