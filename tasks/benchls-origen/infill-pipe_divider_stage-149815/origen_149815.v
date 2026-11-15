module origen_149815(
    input sys_clk,
    input sys_rst,
    input pipe_stb_i,
    input [15:0] Y,
    input [15:0] S_X,
    input [15:0] S_U,
    input [15:0] S_V,
    input [15:0] E_X,
    input du_positive,
    input dv_positive,
    input [15:0] du_q,
    input [15:0] du_r,
    input [15:0] dv_q,
    input [15:0] dv_r,
    input [15:0] divisor,
    input pipe_ack_i,
    output reg busy,
    output reg pipe_ack_o,
    output reg pipe_stb_o,
    output reg [15:0] P_X,
    output reg [15:0] P_Y,
    output reg [15:0] P_U,
    output reg [15:0] P_V
);

    reg [1:0] state;
    parameter IDLE = 2'b00, BUSY = 2'b01;

    [MASKED]

endmodule