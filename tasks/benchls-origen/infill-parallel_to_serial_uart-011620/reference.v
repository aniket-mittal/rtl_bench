module origen_011620 #(
    parameter input_width = 48,
    parameter cycles_per_bit = 391
) (
    input wire clk,
    input wire start,
    input wire [input_width-1:0] bus_in,
    output reg done,
    output reg serial_out
);

    localparam BYTES = input_width / 8;
    localparam BITS_PER_BYTE = 10; // Start bit + 8 data bits + Stop bit

    reg [input_width-1:0] bus_reg;
    reg [$clog2(BYTES)-1:0] byte_counter;
    reg [3:0] bit_counter;
    reg [$clog2(cycles_per_bit)-1:0] clk_counter;

    always @(posedge clk) begin
        if (start) begin
            bus_reg <= bus_in;
            byte_counter <= BYTES - 1;
            bit_counter <= 0;
            clk_counter <= 0;
            done <= 0;
            serial_out <= 1;
        end else if (!done) begin
            if (clk_counter == cycles_per_bit - 1) begin
                clk_counter <= 0;
                if (bit_counter == BITS_PER_BYTE - 1) begin
                    bit_counter <= 0;
                    if (byte_counter == 0) begin
                        done <= 1;
                    end else begin
                        byte_counter <= byte_counter - 1;
                    end
                end else begin
                    bit_counter <= bit_counter + 1;
                end
            end else begin
                clk_counter <= clk_counter + 1;
            end

            case (bit_counter)
                0: serial_out <= 0; // Start bit
                9: serial_out <= 1; // Stop bit
                default: serial_out <= bus_reg[byte_counter * 8 + bit_counter - 1];
            endcase
        end
    end

endmodule