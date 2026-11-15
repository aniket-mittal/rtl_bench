module origen_209396(
    input wire in_data,
    input wire clk,
    input wire rst,
    output wire fullclk
);

reg [15:0] cnt;
reg last_data;
reg [15:0] cntsaved [49:0];
reg [15:0] mincnt [49:0];
wire [15:0] period;
wire [15:0] position;
reg [15:0] clkcnt;
reg [15:0] period_saved;

[MASKED]

assign period = mincnt[0];
assign position = period / 2;
assign fullclk = (clkcnt == 16'd0) | (clkcnt == position);

endmodule