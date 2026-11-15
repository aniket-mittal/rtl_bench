module autovcoder_141510 (
    input clk,
    input rst,
    input start,
    input [7:0] data,
    output reg tx,
    output reg busy
);
    reg [3:0] bit_counter;
    reg [1:0] state;

    parameter IDLE = 2'b00, START_BIT = 2'b01, DATA_BITS = 2'b10, STOP_BIT = 2'b11;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tx <= 1;
            busy <= 0;
            bit_counter <= 0;
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        busy <= 1;
                        tx <= 0; // start bit
                        bit_counter <= 0;
                        state <= START_BIT;
                    end
                end
                START_BIT: begin
                    // Wait for some time before sending data bits
                    if (bit_counter < 8) begin
                        tx <= data[bit_counter]; // send data bits, LSB first
                        bit_counter <= bit_counter + 1;
                    end else begin
                        tx <= 1; // stop bit
                        state <= STOP_BIT;
                    end
                end
                STOP_BIT: begin
                    busy <= 0;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule