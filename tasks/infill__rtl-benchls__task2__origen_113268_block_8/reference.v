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
    always @(negedge clk or posedge reset) begin
        if (reset) begin
            state <= WAITING;
            data_out <= 8'b0;
            ready <= 1'b0;
            bits_shifted <= 4'b0;
        end else begin
            state <= next_state;
            case (state)
                READING: begin
                    data_out <= {data_in, data_out[7:1]};
                    bits_shifted <= bits_shifted + 1;
                end
                STOP_BIT: begin
                    ready <= 1'b1;
                end
                default: begin
                    ready <= 1'b0;
                    bits_shifted <= 4'b0;
                end
            endcase
        end
    end

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