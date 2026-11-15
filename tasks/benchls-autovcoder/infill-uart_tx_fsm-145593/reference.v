module autovcoder_145593 (
    input clk,
    input reset,
    input start,
    input [7:0] data_in,
    output reg tx,
    output reg busy
);
    parameter IDLE = 2'b00;
    parameter START_BIT = 2'b01;
    parameter DATA_BITS = 2'b10;
    parameter STOP_BIT = 2'b11;

    reg [1:0] state;
    reg [3:0] bit_index;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            tx <= 1; // idle state of UART is high
            busy <= 0;
            bit_index <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        state <= START_BIT;
                        busy <= 1;
                        tx <= 0; // send start bit
                    end
                end
                START_BIT: begin
                    state <= DATA_BITS;
                    bit_index <= 0;
                end
                DATA_BITS: begin
                    if (bit_index < 8) begin
                        tx <= data_in[bit_index]; // send data bit
                        bit_index <= bit_index + 1;
                    end else begin
                        state <= STOP_BIT;
                    end
                end
                STOP_BIT: begin
                    tx <= 1; // send stop bit
                    busy <= 0;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule