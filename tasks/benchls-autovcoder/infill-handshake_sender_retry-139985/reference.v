module autovcoder_139985(
    input clk,
    input reset,
    input data_in,
    input ack,
    output reg data_out
);

    reg [1:0] state; // 2-bit state for state machine
    reg [3:0] counter; // Count cycles without ack
    parameter IDLE = 2'b00, SEND = 2'b01, WAIT_ACK = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            counter <= 0;
            data_out <= 0;
        end else begin
            case (state)
                IDLE: begin
                    data_out <= data_in;
                    state <= SEND;
                    counter <= 0; // Reset counter
                end
                SEND: begin
                    if (ack) begin
                        state <= IDLE; // Acknowledgment received, go back to IDLE
                    end else begin
                        counter <= counter + 1; // Increment counter
                        if (counter == 4'b1111) begin
                            state <= SEND; // Resend the last data bit
                        end else begin
                            state <= WAIT_ACK; // Wait for ack
                        end
                    end
                end
                WAIT_ACK: begin
                    if (ack) begin
                        state <= IDLE; // Acknowledgment received
                    end else begin
                        counter <= counter + 1; // Increment counter
                        if (counter == 4'b1111) begin
                            state <= SEND; // Resend the last data bit
                        end
                    end
                end
            endcase
        end
    end
endmodule