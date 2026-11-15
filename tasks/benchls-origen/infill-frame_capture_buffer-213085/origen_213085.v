module origen_213085 #(
    parameter H_RES = 160,
    parameter TOTAL_COL = (H_RES * 2),
    parameter TOTAL_ROW = 120,
    parameter BUFF_BITS = 16
)
(
    input  clk,
    input  HS,
    input  VS,
    input  pclk,
    input  start_capture,
    output reg [BUFF_BITS-1:0] addr,
    output reg write_to_buff,
    output reg frame_captured
);

reg [BUFF_BITS-1:0] pixel_count;
reg state;
localparam IDLE = 1'b0, CAPTURE_DATA = 1'b1;

[MASKED]

endmodule