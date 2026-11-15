module origen_060168 #(
    parameter Gap = 4'd12
) (
    input wire sys_rst,
    input wire [63:0] global_counter,
    input wire gmii_rx_clk,
    input wire gmii_rx_dv,
    input wire [7:0] gmii_rxd,
    output reg [17:0] data_din,
    output reg data_wr_en,
    output reg [17:0] len_din,
    output reg len_wr_en,
    output wire wr_clk,
    input wire data_full,
    input wire len_full
);

    localparam STATE_SFD = 1'b0;
    localparam STATE_DATA = 1'b1;

    reg state;
    reg [63:0] timestamp;
    reg [15:0] frame_length;
    reg [3:0] byte_count;
    reg odd_byte;
    reg [3:0] gap_counter;

    assign wr_clk = gmii_rx_clk;

    [MASKED]

endmodule