module origen_006784 (
    input wire clk,
    input wire rst_n,
    output reg [7:0] rout,
    output reg rout_en,
    input wire [7:0] send_char,
    input wire send_en,
    output wire rx_rden,
    input wire [7:0] rx_rdata,
    input wire rx_fifo_full,
    input wire rx_fifo_dvalid,
    input wire rx_fifo_overrun,
    input wire rx_fifo_underrun,
    output reg [7:0] tx_wdata,
    output reg tx_wten,
    input wire tx_fifo_full,
    input wire tx_fifo_overrun,
    input wire tx_fifo_underrun
);

    reg [7:0] rx_data_l;
    reg tx_wten_loop;

    // RX Data Handling
    assign rx_rden = rx_fifo_dvalid;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_data_l <= 8'b0;
        end else if (rx_fifo_dvalid) begin
            rx_data_l <= rx_rdata;
        end
    end

    // TX Data Handling
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_wten_loop <= 1'b0;
        end else begin
            tx_wten_loop <= rx_fifo_dvalid;
        end
    end

    always @(*) begin
        tx_wten = (tx_wten_loop && !tx_fifo_full) || send_en;
        tx_wdata = send_en ? send_char : rx_data_l;
    end

    // Output Interface
    always @(*) begin
        rout = rx_data_l;
        rout_en = tx_wten_loop;
    end

endmodule