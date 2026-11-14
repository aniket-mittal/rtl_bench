module origen_113268 (
    input wire clk,
    input wire data_in,
    input wire reset,
    output reg ready,
    output reg [7:0] data_out
);

    // State encoding
    localparam WAITING = 2'b00;
    localparam READING = 2'b01;
    localparam PARITY_BIT = 2'b10;
    localparam STOP_BIT = 2'b11;

    reg [1:0] state, next_state;
    reg [3:0] bits_shifted;

    // State transition logic
    [MASKED]

    // Next state logic
    always @(*) begin
        case (state)
            WAITING: next_state = (data_in == 1'b0) ? READING : WAITING;
            READING: next_state = (bits_shifted == 4'd7) ? PARITY_BIT : READING;
            PARITY_BIT: next_state = STOP_BIT;
            STOP_BIT: next_state = WAITING;
            default: next_state = WAITING;
        endcase
    end

endmodule