module origen_020527 (
    input wire clk,
    input wire rst,
    input wire sel_in,
    output reg sel_out
);

    // State encoding
    localparam IDLE = 2'b00;
    localparam FIRST = 2'b01;
    localparam MORE = 2'b10;

    // State register
    reg [1:0] current_state, next_state;

    // Sequential logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= IDLE;
        end else begin
            current_state <= next_state;
        end
    end

    // Combinational logic
    [MASKED]

    // Output logic
    always @(*) begin
        sel_out = (current_state == FIRST);
    end

endmodule