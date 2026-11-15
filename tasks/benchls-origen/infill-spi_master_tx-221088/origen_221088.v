module origen_221088(
    input s_axis_aclk,
    input s_axis_aresetn,
    input [31:0] s_axis_tdata,
    input s_axis_tlast,
    input s_axis_tvalid,
    output reg DOUT,
    output reg s_axis_tready
);

reg [23:0] ws_shiftreg;
reg [2:0] bitcount;
reg [2:0] subbitcount;
reg [7:0] subbittimer;
reg [7:0] subbittimer_top;
reg subbitclk_enable;
reg transfer;
reg [1:0] state;
reg [2:0] bit_shiftreg;

localparam IDLE = 2'b00;
localparam LOAD = 2'b01;
localparam SHIFT = 2'b10;

[MASKED]

endmodule