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

    [MASKED]

endmodule