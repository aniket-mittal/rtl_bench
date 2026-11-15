module origen_111225 (
    input wire ap_clk,
    input wire ap_rst,
    input wire ap_start,
    input wire [15:0] n,
    output reg ap_ready,
    output reg ap_done,
    output reg [31:0] ap_return
);

    reg [19:0] mul8;
    reg [16:0] mul2;
    reg [1:0] mul_state;

    localparam IDLE = 2'b00;
    localparam COMPUTE = 2'b01;
    localparam DONE = 2'b10;

    [MASKED]

endmodule