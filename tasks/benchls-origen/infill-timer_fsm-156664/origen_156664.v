module origen_156664(
    input clk,
    input rst,
    input one_shot_button,
    input time_out,
    output reg en_subiendo,
    output reg en_counter
);

    reg [1:0] state, next_state;
    parameter FALL = 2'b00, UP = 2'b01;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= FALL;
        end
        else begin
            state <= next_state;
        end
    end

    [MASKED]

endmodule