module axis_frame_len #
(
    // Width of AXI stream interfaces in bits
    parameter DATA_WIDTH = 64,
    // Propagate tkeep signal
    // If disabled, tkeep assumed to be 1'b1
    parameter KEEP_ENABLE = (DATA_WIDTH>8),
    // tkeep signal width (words per cycle)
    parameter KEEP_WIDTH = ((DATA_WIDTH+7)/8),
    // Width of length counter
    parameter LEN_WIDTH = 16
)
(
    input  wire                   clk,
    input  wire                   rst,

    /*
     * AXI monitor
     */
    input  wire [KEEP_WIDTH-1:0]  monitor_axis_tkeep,
    input  wire                   monitor_axis_tvalid,
    input  wire                   monitor_axis_tready,
    input  wire                   monitor_axis_tlast,

    /*
     * Status
     */
    output wire [LEN_WIDTH-1:0]   frame_len,
    output wire                   frame_len_valid
);

reg [LEN_WIDTH-1:0] frame_len_reg = 0, frame_len_next;
reg frame_len_valid_reg = 1'b0, frame_len_valid_next;

assign frame_len = frame_len_reg;
assign frame_len_valid = frame_len_valid_reg;

integer offset, i, bit_cnt;

[MASKED]

always @(posedge clk) begin
    frame_len_reg <= frame_len_next;
    frame_len_valid_reg <= frame_len_valid_next;

    if (rst) begin
        frame_len_reg <= 0;
        frame_len_valid_reg <= 0;
    end
end

endmodule