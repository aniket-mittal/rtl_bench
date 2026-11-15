module origen_164025(
    input clk_i,
    input rst_i,
    input [7:0] a_bi,
    input [7:0] b_bi,
    input start_i,
    output reg busy_o,
    output reg [15:0] y_bo
);

reg [7:0] a, b;
reg [7:0] ctr;
reg [15:0] part_res;
reg [1:0] state;

parameter IDLE = 2'b00, WORK = 2'b01;

[MASKED]

endmodule