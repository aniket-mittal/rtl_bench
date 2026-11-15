module origen_146015 (
    input wire clk,
    input wire [15:0] data_in,
    output reg pattern_detected
);

    // State encoding
    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b010;
    localparam S3 = 3'b011;
    localparam S4 = 3'b100;

    reg [2:0] current_state, next_state;

    // State register
    always @(posedge clk) begin
        current_state <= next_state;
    end

    // Next state logic and output logic
    [MASKED]

endmodule