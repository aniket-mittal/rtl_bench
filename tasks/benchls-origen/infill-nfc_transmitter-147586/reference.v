// NFC Transmitter Module
module origen_147586 (
    input wire clk,
    input wire reset,
    input wire [7:0] data_in,
    output reg nfc_out
);

    localparam PREAMBLE = 8'b10101010;
    localparam HIGH_FREQ = 4;
    localparam LOW_FREQ = 8;

    reg [2:0] state;
    reg [7:0] shift_reg;
    reg [3:0] bit_counter;
    reg [3:0] freq_counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= 3'b000;
            shift_reg <= PREAMBLE;
            bit_counter <= 4'b0000;
            freq_counter <= 4'b0000;
            nfc_out <= 1'b0;
        end else begin
            case (state)
                3'b000: begin // Preamble
                    if (bit_counter == 4'b1000) begin
                        state <= 3'b001;
                        shift_reg <= data_in;
                        bit_counter <= 4'b0000;
                    end else begin
                        bit_counter <= bit_counter + 1'b1;
                    end
                end
                3'b001: begin // Data transmission
                    if (bit_counter == 4'b1000) begin
                        state <= 3'b000;
                        shift_reg <= PREAMBLE;
                        bit_counter <= 4'b0000;
                    end else begin
                        bit_counter <= bit_counter + 1'b1;
                    end
                end
            endcase

            if (shift_reg[7] == 1'b1) begin
                if (freq_counter == HIGH_FREQ - 1) begin
                    nfc_out <= ~nfc_out;
                    freq_counter <= 4'b0000;
                end else begin
                    freq_counter <= freq_counter + 1'b1;
                end
            end else begin
                if (freq_counter == LOW_FREQ - 1) begin
                    nfc_out <= ~nfc_out;
                    freq_counter <= 4'b0000;
                end else begin
                    freq_counter <= freq_counter + 1'b1;
                end
            end

            shift_reg <= {shift_reg[6:0], shift_reg[7]};
        end
    end

endmodule

// NFC Receiver Module
module nfc_receiver (
    input wire clk,
    input wire reset,
    input wire nfc_in,
    output reg [7:0] data_out
);

    localparam PREAMBLE = 8'b10101010;
    localparam HIGH_FREQ_THRESHOLD = 6;
    localparam BIT_SAMPLE_POINT = 12;

    reg [2:0] state;
    reg [7:0] shift_reg;
    reg [3:0] bit_counter;
    reg [4:0] sample_counter;
    reg [4:0] edge_counter;
    reg prev_nfc_in;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= 3'b000;
            shift_reg <= 8'b00000000;
            bit_counter <= 4'b0000;
            sample_counter <= 5'b00000;
            edge_counter <= 5'b00000;
            prev_nfc_in <= 1'b0;
            data_out <= 8'b00000000;
        end else begin
            prev_nfc_in <= nfc_in;

            case (state)
                3'b000: begin // Waiting for preamble
                    if (nfc_in != prev_nfc_in) begin
                        edge_counter <= edge_counter + 1'b1;
                    end
                    if (sample_counter == BIT_SAMPLE_POINT - 1) begin
                        sample_counter <= 5'b00000;
                        shift_reg <= {shift_reg[6:0], (edge_counter > HIGH_FREQ_THRESHOLD) ? 1'b1 : 1'b0};
                        edge_counter <= 5'b00000;
                        if (shift_reg == PREAMBLE) begin
                            state <= 3'b001;
                            bit_counter <= 4'b0000;
                        end
                    end else begin
                        sample_counter <= sample_counter + 1'b1;
                    end
                end
                3'b001: begin // Receiving data
                    if (nfc_in != prev_nfc_in) begin
                        edge_counter <= edge_counter + 1'b1;
                    end
                    if (sample_counter == BIT_SAMPLE_POINT - 1) begin
                        sample_counter <= 5'b00000;
                        shift_reg <= {shift_reg[6:0], (edge_counter > HIGH_FREQ_THRESHOLD) ? 1'b1 : 1'b0};
                        edge_counter <= 5'b00000;
                        bit_counter <= bit_counter + 1'b1;
                        if (bit_counter == 4'b0111) begin
                            state <= 3'b000;
                            data_out <= shift_reg;
                        end
                    end else begin
                        sample_counter <= sample_counter + 1'b1;
                    end
                end
            endcase
        end
    end

endmodule