module autovcoder_145857 (
    input clk,
    input rst,
    input req_ch1,
    input req_ch2,
    output reg ack_ch1,
    output reg ack_ch2,
    output reg [7:0] data_out
);
    reg [1:0] state; // 00: idle, 01: channel 1 active, 10: channel 2 active
    parameter IDLE = 2'b00, CH1_ACTIVE = 2'b01, CH2_ACTIVE = 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            ack_ch1 <= 0;
            ack_ch2 <= 0;
            data_out <= 8'b0;
        end else begin
            case (state)
                IDLE: begin
                    ack_ch1 <= 0;
                    ack_ch2 <= 0;
                    if (req_ch1) begin
                        state <= CH1_ACTIVE;
                    end else if (req_ch2) begin
                        state <= CH2_ACTIVE;
                    end
                end
                CH1_ACTIVE: begin
                    ack_ch1 <= 1;
                    ack_ch2 <= 0;
                    data_out <= 8'hAA; // Example data for channel 1
                    if (!req_ch1) begin
                        state <= IDLE;
                    end
                end
                CH2_ACTIVE: begin
                    ack_ch1 <= 0;
                    ack_ch2 <= 1;
                    data_out <= 8'hBB; // Example data for channel 2
                    if (!req_ch2) begin
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule