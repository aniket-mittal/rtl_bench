module origen_215703(
    input clk,
    input reset,
    input [1:0] control,
    output reg warnbit,
    output reg [3:0] curr_state
);

parameter state_0 = 4'b0000, state_1 = 4'b0001, state_2 = 4'b0010, state_3 = 4'b0011,
          state_4 = 4'b0100, state_5 = 4'b0101, state_6 = 4'b0110, state_7 = 4'b0111;

[MASKED]

endmodule