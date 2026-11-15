module origen_217926(
    input clk_100,
    input one_pulse_s,
    input one_pulse_f,
    input rst,
    output reg freeze_en,
    output reg rst_f,
    output reg count_en
);

reg [1:0] state, next_state;

always @(posedge clk_100 or posedge rst) begin
    if (rst) begin
        state <= 2'b00;
    end
    else begin
        state <= next_state;
    end
end

[MASKED]

endmodule