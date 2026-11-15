module origen_168542 #(
    parameter DWIDTH = 8
) (
    input clk,
    input rst,
    input send,
    input receive,
    input [DWIDTH-1:0] din,
    input [DWIDTH-1:0] din_nonsend,
    input miso,
    output [DWIDTH-1:0] dout,
    output rvld,
    output idle,
    output sclk,
    output mosi,
    output cs
);

    parameter CPOL = 0;
    parameter CPHA = 0;

    localparam IDLE = 2'b00, DATA = 2'b01, END = 2'b11;

    reg [1:0] state_q, state_d;
    reg [DWIDTH-1:0] send_data_q, send_data_d;
    reg [DWIDTH-1:0] read_data_q, read_data_d;
    reg [4:0] bit_cnt_q, bit_cnt_d;
    reg sclk_q, sclk_d;
    reg mosi_q, mosi_d;
    reg cs_q, cs_d;
    reg rvld_q, rvld_d;
    reg idle_q, idle_d;

    wire sclk_1st_half, sclk_2nd_half;
    wire shift, capture;

    [MASKED]

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state_q <= IDLE;
            send_data_q <= 'b0;
            read_data_q <= 'b0;
            bit_cnt_q <= 'b0;
            sclk_q <= CPOL;
            mosi_q <= 1'b0;
            cs_q <= 1'b0;
            rvld_q <= 1'b0;
            idle_q <= 1'b1;
        end else begin
            state_q <= state_d;
            send_data_q <= send_data_d;
            read_data_q <= read_data_d;
            bit_cnt_q <= bit_cnt_d;
            sclk_q <= sclk_d;
            mosi_q <= mosi_d;
            cs_q <= cs_d;
            rvld_q <= rvld_d;
            idle_q <= idle_d;
        end
    end

    assign sclk_1st_half = (CPHA == 0) ? sclk_q : ~sclk_q;
    assign sclk_2nd_half = (CPHA == 0) ? ~sclk_q : sclk_q;
    assign shift = (CPHA == 0) ? sclk_1st_half : sclk_2nd_half;
    assign capture = (CPHA == 0) ? sclk_2nd_half : sclk_1st_half;

    assign sclk = sclk_q;
    assign mosi = mosi_q;
    assign cs = cs_q;
    assign dout = read_data_q;
    assign rvld = rvld_q;
    assign idle = idle_q;

endmodule