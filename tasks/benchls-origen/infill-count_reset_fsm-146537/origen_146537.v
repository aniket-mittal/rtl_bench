module origen_146537 (
    input wire clk,
    input wire reset,
    output reg [2:0] count,
    output reg done
);

    // State encoding
    localparam RESET = 2'b00;
    localparam COUNT1 = 2'b01;
    localparam COUNT2 = 2'b10;
    localparam COUNT3 = 2'b11;

    reg [1:0] current_state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= RESET;
        else
            current_state <= next_state;
    end

    // Next state logic and output logic
    [MASKED]

endmodule