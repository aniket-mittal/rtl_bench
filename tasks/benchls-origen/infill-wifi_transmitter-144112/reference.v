// Wi-Fi Transmitter Module
module origen_144112 (
    input wire clk,
    input wire rst,
    input wire [7:0] data_in,
    input wire data_valid,
    output reg wifi_out
);

    // States for the transmitter FSM
    localparam IDLE = 2'b00;
    localparam ENCODE = 2'b01;
    localparam MODULATE = 2'b10;
    localparam TRANSMIT = 2'b11;

    reg [1:0] state, next_state;
    reg [7:0] encoded_data;
    reg [1:0] modulated_data;
    reg [3:0] bit_counter;

    // Simple encoding: XOR with a fixed pattern
    function [7:0] encode;
        input [7:0] data;
        begin
            encode = data ^ 8'b10101010;
        end
    endfunction

    // Simple QPSK modulation
    function [1:0] modulate;
        input [1:0] data;
        begin
            case(data)
                2'b00: modulate = 2'b00;
                2'b01: modulate = 2'b01;
                2'b10: modulate = 2'b10;
                2'b11: modulate = 2'b11;
            endcase
        end
    endfunction

    // FSM for transmitter
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            wifi_out <= 0;
            bit_counter <= 0;
        end else begin
            state <= next_state;
            case(state)
                IDLE: begin
                    wifi_out <= 0;
                    bit_counter <= 0;
                end
                ENCODE: begin
                    encoded_data <= encode(data_in);
                end
                MODULATE: begin
                    modulated_data <= modulate(encoded_data[7:6]);
                end
                TRANSMIT: begin
                    wifi_out <= modulated_data[bit_counter[0]];
                    bit_counter <= bit_counter + 1;
                end
            endcase
        end
    end

    // Next state logic
    always @(*) begin
        case(state)
            IDLE: next_state = data_valid ? ENCODE : IDLE;
            ENCODE: next_state = MODULATE;
            MODULATE: next_state = TRANSMIT;
            TRANSMIT: next_state = (bit_counter == 4'b1111) ? IDLE : MODULATE;
            default: next_state = IDLE;
        endcase
    end

endmodule

// Wi-Fi Receiver Module
module wifi_receiver (
    input wire clk,
    input wire rst,
    input wire wifi_in,
    output reg [7:0] data_out,
    output reg data_valid
);

    // States for the receiver FSM
    localparam IDLE = 2'b00;
    localparam DEMODULATE = 2'b01;
    localparam DECODE = 2'b10;
    localparam OUTPUT = 2'b11;

    reg [1:0] state, next_state;
    reg [7:0] demodulated_data;
    reg [3:0] bit_counter;

    // Simple QPSK demodulation
    function [1:0] demodulate;
        input [1:0] data;
        begin
            case(data)
                2'b00: demodulate = 2'b00;
                2'b01: demodulate = 2'b01;
                2'b10: demodulate = 2'b10;
                2'b11: demodulate = 2'b11;
            endcase
        end
    endfunction

    // Simple decoding: XOR with the same fixed pattern as in transmitter
    function [7:0] decode;
        input [7:0] data;
        begin
            decode = data ^ 8'b10101010;
        end
    endfunction

    // FSM for receiver
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            data_out <= 8'b0;
            data_valid <= 0;
            bit_counter <= 0;
        end else begin
            state <= next_state;
            case(state)
                IDLE: begin
                    data_valid <= 0;
                    bit_counter <= 0;
                end
                DEMODULATE: begin
                    demodulated_data[7-bit_counter] <= wifi_in;
                    bit_counter <= bit_counter + 1;
                end
                DECODE: begin
                    data_out <= decode(demodulated_data);
                end
                OUTPUT: begin
                    data_valid <= 1;
                end
            endcase
        end
    end

    // Next state logic
    always @(*) begin
        case(state)
            IDLE: next_state = wifi_in ? DEMODULATE : IDLE;
            DEMODULATE: next_state = (bit_counter == 4'b0111) ? DECODE : DEMODULATE;
            DECODE: next_state = OUTPUT;
            OUTPUT: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

endmodule