module origen_178163 (
    input           clk,
    input   [9:0]   fifo_usedw,
    input           fifo_empty,
    input           fifo_full,
    output  reg     fifo_tx_rdy,
    input           ftdi_rx_rdy,
    output  reg     fifo_rdreq,
    output  reg     fifo_rx_rdy
);

parameter OFF       = 1'b0;
parameter ON        = 1'b1;
parameter FALSE     = 1'b0;
parameter TRUE      = 1'b1;
parameter NUMBER_OF_8B_WORDS_IN_KBYTE = 1024;

reg [9:0] byte_cnt;
wire KBYTE_IS_RDY;

assign KBYTE_IS_RDY = (fifo_usedw >= NUMBER_OF_8B_WORDS_IN_KBYTE) || fifo_full;

always @(posedge clk) begin
    if (fifo_empty) begin
        fifo_rx_rdy <= FALSE;
    end else begin
        fifo_rx_rdy <= TRUE;
    end
end

always @(posedge clk) begin
    if (KBYTE_IS_RDY) begin
        fifo_tx_rdy <= ON;
    end else begin
        fifo_tx_rdy <= OFF;
    end
end

always @(posedge clk) begin
    if (fifo_rdreq) begin
        byte_cnt <= byte_cnt + 1;
    end else begin
        byte_cnt <= 0;
    end
end

wire rx_tx_rdy;
assign rx_tx_rdy = fifo_tx_rdy && ftdi_rx_rdy;

always @(posedge clk) begin
    if (rx_tx_rdy && byte_cnt < NUMBER_OF_8B_WORDS_IN_KBYTE) begin
        fifo_rdreq <= TRUE;
    end else begin
        fifo_rdreq <= FALSE;
    end
end

endmodule