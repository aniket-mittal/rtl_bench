module origen_101269 #(
    parameter CLK_PER_BIT = 868,
    parameter CTR_SIZE = $clog2(CLK_PER_BIT)
)(
    input wire clk,
    input wire rst,
    input wire block,
    input wire [7:0] data,
    input wire new_data,
    output reg tx,
    output wire busy
);

    localparam IDLE = 2'b00;
    localparam START_BIT = 2'b01;
    localparam DATA = 2'b10;
    localparam STOP_BIT = 2'b11;

    reg [1:0] state_q, state_d;
    reg [CTR_SIZE-1:0] ctr_q, ctr_d;
    reg [2:0] bit_ctr_q, bit_ctr_d;
    reg [7:0] data_q, data_d;
    reg tx_q, tx_d;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state_q <= IDLE;
            ctr_q <= 0;
            bit_ctr_q <= 0;
            data_q <= 0;
            tx_q <= 1'b1;
        end else begin
            state_q <= state_d;
            ctr_q <= ctr_d;
            bit_ctr_q <= bit_ctr_d;
            data_q <= data_d;
            tx_q <= tx_d;
        end
    end

    [MASKED]

    assign busy = (state_q != IDLE) | block;
    assign tx = tx_q;

endmodule