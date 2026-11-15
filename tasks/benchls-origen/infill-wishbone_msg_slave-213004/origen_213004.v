module origen_213004 (
    input           clk_i,
    input           rst_i,
    input           cyc_i,
    input           stb_i,
    input   [3:0]   sel_i,
    input           we_i,
    input   [2:0]   adr_i,
    input   [31:0]  dat_i,
    input   [31:0]  msg_in,
    output  [31:0]  dat_o,
    output          ack_o,
    output  [31:0]  msg_out
);

    reg [1:0] state;
    reg [31:0] msg;

    localparam S_IDLE = 2'd0;
    localparam S_WAIT = 2'd1;
    localparam S_DONE = 2'd2;

    [MASKED]

    assign dat_o = msg;
    assign msg_out = msg;
    assign ack_o = (state == S_DONE) ? 1'b1 : 1'b0;

endmodule