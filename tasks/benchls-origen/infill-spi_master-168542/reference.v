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

    always @* begin
        state_d = state_q;
        send_data_d = send_data_q;
        read_data_d = read_data_q;
        bit_cnt_d = bit_cnt_q;
        sclk_d = sclk_q;
        mosi_d = mosi_q;
        cs_d = cs_q;
        rvld_d = rvld_q;
        idle_d = idle_q;

        case (state_q)
            IDLE: begin
                if (send) begin
                    state_d = DATA;
                    send_data_d = din;
                    bit_cnt_d = DWIDTH - 1;
                    cs_d = 1'b1;
                end else if (receive) begin
                    state_d = DATA;
                    read_data_d = 'b0;
                    bit_cnt_d = DWIDTH - 1;
                    cs_d = 1'b1;
                end else begin
                    send_data_d = din_nonsend;
                end
                sclk_d = CPOL;
                mosi_d = 1'b0;
                rvld_d = 1'b0;
                idle_d = 1'b1;
            end
            DATA: begin
                if (bit_cnt_q == 0) begin
                    state_d = END;
                end else begin
                    bit_cnt_d = bit_cnt_q - 1;
                end
                sclk_d = ~sclk_q;
                mosi_d = send_data_q[bit_cnt_q];
                read_data_d = {read_data_q[DWIDTH-2:0], miso};
                rvld_d = 1'b0;
                idle_d = 1'b0;
            end
            END: begin
                state_d = IDLE;
                cs_d = 1'b0;
                rvld_d = 1'b1;
                idle_d = 1'b1;
            end
        endcase
    end

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