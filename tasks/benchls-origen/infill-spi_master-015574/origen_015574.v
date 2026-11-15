module origen_015574 #(
    parameter DIV = 4,
    parameter DW = 32
) (
    input wire clk,
    input wire rst,
    input wire quad,
    input wire [DW-1:0] din,
    input wire din_valid,
    output reg din_ready,
    output reg [DW-1:0] dout,
    output reg dout_valid,
    input wire dout_ready,
    output reg sck,
    input wire miso,
    output wire mosi
);

    localparam IDLE = 2'b00;
    localparam BUSY = 2'b01;
    localparam ACK = 2'b10;

    reg [1:0] state;
    reg [DW-1:0] data_reg;
    reg [5:0] cnt;
    reg [5:0] tgt;
    reg [($clog2(DIV)-1):0] div_cnt;
    reg quad_mode;

    assign mosi = data_reg[DW-1];

    [MASKED]

endmodule