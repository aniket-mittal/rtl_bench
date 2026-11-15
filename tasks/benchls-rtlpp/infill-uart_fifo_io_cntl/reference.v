module UART_FIFO_IO_cntl (
    input clk,
    input rst,
    input fifoM_full,
    output fifoM_rd_en,
    output uart_rx_rd_en,
    input uart_tx_rfd,
    output uart_tx_wr_en,
    input fifoM_wr_ack
);
    // Mock logic for UART FIFO control purpose
    assign fifoM_rd_en = ~fifoM_full;
    assign uart_tx_wr_en = uart_tx_rfd;
    assign uart_rx_rd_en = 0;
endmodule