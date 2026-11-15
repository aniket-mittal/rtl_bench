module origen_132486 (
    input wire clk,
    input wire rst,
    input wire enable,
    output reg red_light,
    output reg yellow_light,
    output reg green_light
);

    // Parameters for state encoding
    localparam GREEN = 2'b00;
    localparam YELLOW = 2'b01;
    localparam RED = 2'b10;

    // Parameters for timing (assuming 50MHz clock)
    localparam GREEN_TIME = 500_000_000;  // 10 seconds
    localparam YELLOW_TIME = 100_000_000; // 2 seconds
    localparam RED_TIME = 400_000_000;    // 8 seconds

    reg [1:0] state, next_state;
    reg [28:0] counter; // 29 bits to count up to 500,000,000

    // State and counter update
    always @(posedge clk) begin
        if (rst) begin
            state <= GREEN;
            counter <= 0;
        end else if (enable) begin
            state <= next_state;
            counter <= (state != next_state) ? 0 : counter + 1;
        end
    end

    // Next state logic
    [MASKED]

    // Output logic
    always @(*) begin
        red_light = (state == RED);
        yellow_light = (state == YELLOW);
        green_light = (state == GREEN);
    end

endmodule