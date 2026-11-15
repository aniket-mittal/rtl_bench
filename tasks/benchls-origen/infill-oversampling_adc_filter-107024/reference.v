module origen_107024 (
    input wire clk_100mhz,
    input wire rst,
    input wire [11:0] data_in,
    output reg sample_trigger,
    output reg [11:0] data_out
);

    // Parameters
    parameter OVERSAMPLE_N_BITS = 6;
    parameter SAMPLE_COUNT = 33280;
    parameter OVERSAMPLE_COUNT = SAMPLE_COUNT >> OVERSAMPLE_N_BITS;

    // Internal registers
    reg [15:0] sample_counter;
    reg [9:0] oversample_counter;
    reg [17:0] sum;
    reg oversample_trigger;

    // Main logic
    always @(posedge clk_100mhz or posedge rst) begin
        if (rst) begin
            sample_counter <= 16'd0;
            oversample_counter <= 10'd0;
            sum <= 18'd0;
            sample_trigger <= 1'b0;
            oversample_trigger <= 1'b0;
            data_out <= 12'd0;
        end else begin
            // Default values
            sample_trigger <= 1'b0;
            oversample_trigger <= 1'b0;

            // Increment counters
            sample_counter <= sample_counter + 1'b1;
            oversample_counter <= oversample_counter + 1'b1;

            // Check for sample completion
            if (sample_counter == SAMPLE_COUNT - 1) begin
                sample_counter <= 16'd0;
                oversample_counter <= 10'd0;
                sum <= {6'b0, data_in};
                sample_trigger <= 1'b1;
                data_out <= sum >> OVERSAMPLE_N_BITS;
            end else if (oversample_counter == OVERSAMPLE_COUNT - 1) begin
                // Check for oversample completion
                oversample_counter <= 10'd0;
                sum <= sum + {6'b0, data_in};
                oversample_trigger <= 1'b1;
            end
        end
    end

endmodule