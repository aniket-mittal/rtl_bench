module origen_106586 #(
    parameter FIFO_DEPTH_BITS = 4
) (
    input wire rstn,
    input wire ps2_clk,
    input wire ps2_data,
    input wire busclk,
    input wire pop,
    output wire [7:0] fifo_top,
    output wire rx_empty,
    output reg frame_error,
    output reg parity_error,
    output reg rx_overflow
);

    localparam FIFO_DEPTH = 1 << FIFO_DEPTH_BITS;

    reg [7:0] fifo [0:FIFO_DEPTH-1];
    reg [FIFO_DEPTH_BITS-1:0] r_fifo_head, r_fifo_tail;
    reg [3:0] pos;
    reg [7:0] r_rx_data;
    reg r_rx_parity;
    reg [2:0] r_buf_cnt;
    reg [7:0] clk_buf;
    wire ps2_clk_falling;

    assign fifo_top = fifo[r_fifo_tail];
    assign rx_empty = (r_fifo_head == r_fifo_tail);
    assign ps2_clk_falling = (r_buf_cnt == 3'b000) && (clk_buf == 8'b11100000);

    always @(posedge busclk or negedge rstn) begin
        if (!rstn) begin
            r_buf_cnt <= 3'b000;
            clk_buf <= 8'h00;
        end else begin
            r_buf_cnt <= r_buf_cnt + 1'b1;
            clk_buf <= {clk_buf[6:0], ps2_clk};
        end
    end

    always @(posedge busclk or negedge rstn) begin
        if (!rstn) begin
            pos <= 4'd0;
            r_rx_data <= 8'h00;
            r_rx_parity <= 1'b0;
            frame_error <= 1'b0;
            parity_error <= 1'b0;
            rx_overflow <= 1'b0;
            r_fifo_head <= {FIFO_DEPTH_BITS{1'b0}};
            r_fifo_tail <= {FIFO_DEPTH_BITS{1'b0}};
        end else if (ps2_clk_falling) begin
            case (pos)
                4'd0: begin // Start bit
                    if (ps2_data == 1'b0) pos <= pos + 1'b1;
                    else frame_error <= 1'b1;
                end
                4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8: begin // Data bits
                    r_rx_data <= {ps2_data, r_rx_data[7:1]};
                    r_rx_parity <= r_rx_parity ^ ps2_data;
                    pos <= pos + 1'b1;
                end
                4'd9: begin // Parity bit
                    if (ps2_data == ~r_rx_parity) pos <= pos + 1'b1;
                    else parity_error <= 1'b1;
                end
                4'd10: begin // Stop bit
                    if (ps2_data == 1'b1) begin
                        if (r_fifo_head + 1'b1 != r_fifo_tail) begin
                            fifo[r_fifo_head] <= r_rx_data;
                            r_fifo_head <= r_fifo_head + 1'b1;
                        end else begin
                            rx_overflow <= 1'b1;
                        end
                    end else begin
                        frame_error <= 1'b1;
                    end
                    pos <= 4'd0;
                    r_rx_parity <= 1'b0;
                end
                default: pos <= 4'd0;
            endcase
        end
    end

    always @(posedge busclk or negedge rstn) begin
        if (!rstn) begin
            r_fifo_tail <= {FIFO_DEPTH_BITS{1'b0}};
        end else if (pop && !rx_empty) begin
            r_fifo_tail <= r_fifo_tail + 1'b1;
        end
    end

endmodule