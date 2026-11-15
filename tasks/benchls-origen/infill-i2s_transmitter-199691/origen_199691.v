module origen_199691 (
    input S_AXIS_ACLK,
    input S_AXIS_ARESETN,
    input S_AXIS_TVALID,
    input [31:0] S_AXIS_TDATA,
    input S_AXIS_TLAST,
    output reg S_AXIS_TREADY,
    input sck,
    input ws,
    output reg sd
);

reg [31:0] data_left;
reg [31:0] data_right;
reg [31:0] data;
reg wsp;

[MASKED]

endmodule