module origen_127838 (
    input wire clk,
    input wire [4:0] button,
    input wire [7:0] SW,
    output reg [4:0] button_out,
    output reg [4:0] button_pulse,
    output wire [7:0] SW_OK
);

    // Parameters
    localparam DEBOUNCE_DELAY = 100000;

    // Internal signals
    reg [4:0] button_sync;
    reg [4:0] button_prev;
    reg [19:0] counter [0:4];
    reg [4:0] button_stable;

    // Assign SW_OK directly
    assign SW_OK = SW;

    // Button debounce logic
    integer i;
    [MASKED]

    // Button output and pulse generation
    integer j;
    always @(posedge clk) begin
        for (j = 0; j < 5; j = j + 1) begin
            if (button_stable[j] && !button_out[j]) begin
                button_out[j] <= 1'b1;
                button_pulse[j] <= button[j];
            end else if (!button_stable[j] && button_out[j]) begin
                button_out[j] <= 1'b0;
                button_pulse[j] <= 1'b0;
            end else begin
                button_pulse[j] <= 1'b0;
            end
        end
    end

endmodule