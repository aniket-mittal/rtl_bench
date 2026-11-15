module origen_000635 (
    input wire reset,
    input wire clk_4f,
    input wire clk_32f,
    input wire data_in,
    output reg active,
    output reg valid_out,
    output reg [7:0] data_out
);

    reg [7:0] data;
    reg [7:0] data2send;
    reg [2:0] bit_counter;
    reg [2:0] BC_counter;
    reg data_ready;

    // Serial to Parallel Conversion (32f clock domain)
    always @(posedge clk_32f or negedge reset) begin
        if (!reset) begin
            data <= 8'b0;
            bit_counter <= 3'b0;
            data_ready <= 1'b0;
        end else begin
            data <= {data[6:0], data_in};
            bit_counter <= bit_counter + 1'b1;
            if (bit_counter == 3'b111) begin
                data2send <= {data[6:0], data_in};
                data_ready <= 1'b1;
            end else begin
                data_ready <= 1'b0;
            end
        end
    end

    // Output Control and BC Counter (4f clock domain)
    always @(posedge clk_4f or negedge reset) begin
        if (!reset) begin
            data_out <= 8'b0;
            BC_counter <= 3'b0;
            active <= 1'b0;
            valid_out <= 1'b0;
        end else begin
            if (data_ready) begin
                data_out <= data2send;
                if (data2send == 8'hBC && BC_counter < 3'b100) begin
                    BC_counter <= BC_counter + 1'b1;
                end
            end

            active <= (BC_counter == 3'b100);
            valid_out <= active && (data_out != 8'hBC);
        end
    end

endmodule