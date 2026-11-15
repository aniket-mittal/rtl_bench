module origen_009375 (
    input wire clk,
    input wire baud_clk,
    input wire txd_start,
    input wire [7:0] byte_in,
    output reg bit_out,
    output reg done
);

    reg [3:0] state;
    reg [7:0] tx_data;
    reg tx_bit;

    always @(posedge clk) begin
        bit_out <= tx_bit;
    end

    always @(posedge baud_clk) begin
        case (state)
            4'b0000: begin // Idle state
                if (txd_start) begin
                    state <= 4'b0100;
                    tx_data <= byte_in;
                    done <= 1'b0;
                end else begin
                    done <= 1'b1;
                end
                tx_bit <= 1'b1;
            end
            4'b0100: begin // Start bit
                state <= 4'b1000;
                tx_bit <= 1'b0;
            end
            4'b1000, 4'b1001, 4'b1010, 4'b1011,
            4'b1100, 4'b1101, 4'b1110, 4'b1111: begin // Data bits
                state <= state + 1'b1;
                tx_bit <= tx_data[state[2:0]];
            end
            4'b0001: begin // First stop bit
                state <= 4'b0010;
                tx_bit <= 1'b1;
            end
            4'b0010: begin // Second stop bit
                state <= 4'b0000;
                tx_bit <= 1'b1;
            end
            default: state <= 4'b0000;
        endcase
    end

endmodule