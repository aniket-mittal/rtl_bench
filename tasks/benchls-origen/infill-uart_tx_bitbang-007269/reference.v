module origen_007269 (
    input wire clk,
    input wire rst,
    input wire tx_en,
    input wire [7:0] tx_data,
    input wire bpsclk,
    output wire tx_stop,
    output wire tx_out
);

    reg [3:0] i;
    reg rTX;
    reg isDone;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            i <= 4'd0;
            rTX <= 1'b1;
            isDone <= 1'b0;
        end else if (bpsclk) begin
            case (i)
                4'd0: begin
                    if (tx_en) begin
                        rTX <= 1'b0;  // Start bit
                        i <= i + 1'b1;
                        isDone <= 1'b0;
                    end
                end
                4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8: begin
                    rTX <= tx_data[i-1];  // Data bits
                    i <= i + 1'b1;
                end
                4'd9, 4'd10: begin
                    rTX <= 1'b1;  // Stop bits
                    i <= i + 1'b1;
                end
                4'd11: begin
                    isDone <= 1'b1;  // Transmission complete
                    i <= i + 1'b1;
                end
                4'd12: begin
                    i <= 4'd0;  // Reset for next transmission
                    isDone <= 1'b0;
                end
                default: i <= 4'd0;
            endcase
        end
    end

    assign tx_out = rTX;
    assign tx_stop = isDone;

endmodule