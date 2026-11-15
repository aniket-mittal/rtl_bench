module origen_164360 (
    input clk,
    input rst_n,
    input [7:0] fifo_read_data,
    input empty,
    input tx_done,
    output reg fifo_read_req,
    output reg tx_en_sig,
    output reg [7:0] tx_data
);

    reg [3:0] i;

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            i <= 0;
            fifo_read_req <= 0;
            tx_en_sig <= 0;
            tx_data <= 0;
        end else begin
            case (i)
                4'd0: // IDLE
                    if (~empty) begin
                        i <= 4'd1;
                    end
                4'd1: // FIFO_READ
                    begin
                        fifo_read_req <= 1;
                        i <= 4'd2;
                    end
                4'd2: // FIFO_DATA_READY
                    begin
                        fifo_read_req <= 0;
                        i <= 4'd3;
                    end
                4'd3: // TX_ENABLE
                    begin
                        tx_en_sig <= 1;
                        tx_data <= fifo_read_data;
                        i <= 4'd4;
                    end
                4'd4: // TX_COMPLETE
                    begin
                        if (tx_done) begin
                            tx_en_sig <= 0;
                            i <= 4'd0;
                        end
                    end
            endcase
        end
    end

endmodule