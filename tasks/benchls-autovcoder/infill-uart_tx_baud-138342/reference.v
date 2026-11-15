module autovcoder_138342 (
    input wire clk,
    input wire reset,
    input wire transmit,
    input wire [7:0] data_in,
    output reg tx,
    output reg busy
);
    parameter BAUD_RATE = 9600;
    parameter CLOCK_FREQ = 50000000; // 50 MHz clock
    localparam BIT_TIME = CLOCK_FREQ / BAUD_RATE;

    reg [3:0] bit_index;
    reg [13:0] counter; // For bit timing
    reg transmitting;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            tx <= 1; // Idle state is high
            busy <= 0;
            bit_index <= 0;
            counter <= 0;
            transmitting <= 0;
        end else if (transmit && !busy) begin
            busy <= 1;
            transmitting <= 1;
            tx <= 0; // Start bit
            bit_index <= 0;
            counter <= 0;
        end else if (busy) begin
            if (counter < BIT_TIME - 1) begin
                counter <= counter + 1;
            end else begin
                counter <= 0;
                if (transmitting) begin
                    if (bit_index < 8) begin
                        tx <= data_in[bit_index]; // Transmit data bits
                        bit_index <= bit_index + 1;
                    end else if (bit_index == 8) begin
                        tx <= 1; // Stop bit
                        bit_index <= bit_index + 1;
                    end else begin
                        busy <= 0; // Transmission complete
                        transmitting <= 0;
                    end
                end
            end
        end
    end
endmodule