module origen_185327 #(
    parameter CFG_FRAME_SIZE = 8
) (
    // System signals
    input  wire        aresetn,
    input  wire        sresetn,

    // AHB-Lite interface
    input  wire        psel,
    input  wire        penable,
    input  wire        pwrite,
    input  wire [7:0]  paddr,
    input  wire [CFG_FRAME_SIZE-1:0] wr_data_in,

    // SPI control signals
    input  wire        cfg_master,
    input  wire        rx_fifo_empty,
    input  wire        tx_fifo_empty,

    // SPI data signals
    output reg [CFG_FRAME_SIZE-1:0] tx_fifo_data,
    output reg         tx_fifo_write,
    output reg         tx_fifo_last,
    output reg         rx_fifo_read
);

    always @(*) begin
        // Default values
        tx_fifo_data = 'b0;
        tx_fifo_write = 1'b0;
        tx_fifo_last = 1'b0;
        rx_fifo_read = 1'b0;

        // Control logic
        if (psel && penable) begin
            if (pwrite) begin
                case (paddr)
                    8'h00: begin
                        tx_fifo_data = wr_data_in;
                        tx_fifo_write = 1'b1;
                    end
                    8'h04: begin
                        tx_fifo_last = 1'b1;
                    end
                endcase
            end else begin
                if (paddr == 8'h08) begin
                    rx_fifo_read = 1'b1;
                end
            end
        end
    end

endmodule