module origen_155516(
    input reset,
    input active_m1,
    input [2:0] cpu_action,
    input [1:0] i_state,
    input [1:0] processor,
    output reg writeback_block,
    output reg [1:0] f_state,
    output reg [1:0] processor_index,
    output reg [2:0] bus
);

initial begin
    writeback_block = 1'b0;
end

[MASKED]

endmodule