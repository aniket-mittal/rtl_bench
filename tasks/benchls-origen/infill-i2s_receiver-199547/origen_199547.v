module origen_199547 #(
    parameter DATA_BITS = 32,
    parameter BCNT = 1,
    parameter DSTRB = 0
) (
    input  wire        xrst,
    input  wire        xclk,
    output reg         xBrise,
    output reg         xBfall,
    output reg         xLRrise,
    output reg         xLRfall,
    output reg [31:0]  xData,
    output reg         xData_rdy,
    input  wire        BCLK,
    input  wire        LRCLK,
    input  wire [15:0] din
);

    localparam IF_TPD = 1;

    reg [3:0]  shift_cnt;
    reg [15:0] temp_data;
    reg        b_clk, bc1, bc0;
    reg        xlrclk, lr1, lr0;
    reg [15:0] d2, d1, d0;

    [MASKED]

endmodule