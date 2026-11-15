module origen_148332 (
    input wire enable,
    input wire [7:0] data,
    input wire rst_cvc,
    input wire rst_cds,
    input wire sample,
    input wire end_adc,
    input wire lval,
    input wire pixel_clock,
    input wire main_clock_source,
    input wire main_clock,
    input wire n_reset,
    input wire load_pulse,
    output reg [7:0] pixel_data,
    output reg pixel_captured
);

    reg [7:0] pixel_buffer;
    reg capture_active;
    wire selected_clock;

    // Clock selection
    assign selected_clock = main_clock_source ? main_clock : pixel_clock;

    always @(posedge selected_clock or negedge n_reset) begin
        if (!n_reset) begin
            pixel_data <= 8'b0;
            pixel_buffer <= 8'b0;
            pixel_captured <= 1'b0;
            capture_active <= 1'b0;
        end else if (!rst_cvc || !rst_cds) begin
            pixel_data <= 8'b0;
            pixel_buffer <= 8'b0;
            pixel_captured <= 1'b0;
            capture_active <= 1'b0;
        end else if (enable) begin
            if (lval && sample) begin
                pixel_buffer <= data;
                capture_active <= 1'b1;
            end

            if (capture_active && end_adc) begin
                pixel_data <= pixel_buffer;
                pixel_captured <= 1'b1;
                capture_active <= 1'b0;
            end else if (load_pulse) begin
                pixel_captured <= 1'b0;
            end
        end else begin
            pixel_captured <= 1'b0;
            capture_active <= 1'b0;
        end
    end

endmodule