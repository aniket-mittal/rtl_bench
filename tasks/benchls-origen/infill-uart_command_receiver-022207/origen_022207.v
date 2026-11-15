module origen_022207 #(
    parameter LEN_DATA = 8
) (
    input wire clk,
    input wire reset,
    input wire rx_done_tick,
    input wire [LEN_DATA-1:0] rx_data_in,
    input wire [LEN_DATA-1:0] alu_data_in,
    output reg tx_start,
    output reg [LEN_DATA-1:0] A,
    output reg [LEN_DATA-1:0] B,
    output reg [5:0] OPCODE,
    output wire [LEN_DATA-1:0] data_out
);

    reg [1:0] counter_in;

    [MASKED]

    assign data_out = alu_data_in;

endmodule