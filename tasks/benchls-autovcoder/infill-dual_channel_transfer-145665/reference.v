module autovcoder_145665(
    input clk,
    input rst,
    input start_ch1,
    input start_ch2,
    input [7:0] src_addr_ch1,
    input [7:0] src_addr_ch2,
    input [7:0] dest_addr_ch1,
    input [7:0] dest_addr_ch2,
    input [7:0] data_in,
    output reg [7:0] data_out_ch1,
    output reg [7:0] data_out_ch2,
    output reg done_ch1,
    output reg done_ch2
);
    reg [1:0] state; // 2-bit state register
    parameter IDLE = 2'b00, TRANSFER_CH1 = 2'b01, TRANSFER_CH2 = 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            data_out_ch1 <= 0;
            data_out_ch2 <= 0;
            done_ch1 <= 0;
            done_ch2 <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (start_ch1) begin
                        state <= TRANSFER_CH1;
                        done_ch1 <= 0;
                    end else if (start_ch2) begin
                        state <= TRANSFER_CH2;
                        done_ch2 <= 0;
                    end
                end
                TRANSFER_CH1: begin
                    data_out_ch1 <= data_in; // Simulate data transfer
                    done_ch1 <= 1;
                    state <= IDLE; // Go back to idle state
                end
                TRANSFER_CH2: begin
                    data_out_ch2 <= data_in; // Simulate data transfer
                    done_ch2 <= 1;
                    state <= IDLE; // Go back to idle state
                end
            endcase
        end
    end
endmodule