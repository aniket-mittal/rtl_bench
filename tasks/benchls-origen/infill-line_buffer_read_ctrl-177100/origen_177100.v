module origen_177100(
    input       video_clk,
    input       video_rst,
    input       ras_ready,
    output reg  lb_read
);

reg [1:0] rd_state;
localparam EMPTY0 = 2'b00;
localparam READ0 = 2'b01;
localparam EMPTY1 = 2'b10;
localparam READ1 = 2'b11;

[MASKED]

endmodule