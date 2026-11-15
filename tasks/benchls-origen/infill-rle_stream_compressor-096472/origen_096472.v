module origen_096472 #(
    parameter DATA_WIDTH = 8,
    parameter CTR_WIDTH = 4
) (
    input wire clk,
    input wire rst,
    input wire ready,
    input wire [DATA_WIDTH-1:0] stream_in,
    output reg [DATA_WIDTH+CTR_WIDTH-1:0] compressed_stream,
    output reg valid
);

localparam CTR_MAX = (1 << CTR_WIDTH) - 1;

reg [DATA_WIDTH-1:0] stream_in_prev;
reg [CTR_WIDTH-1:0] seq_counter;
reg ready_prev;

[MASKED]

endmodule