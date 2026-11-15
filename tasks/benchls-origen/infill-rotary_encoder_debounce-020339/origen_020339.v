module origen_020339 (
    input wire clk,
    input wire reset,
    input wire [2:0] rot,
    output reg rot_btn,
    output reg rot_event,
    output reg rot_left
);

    reg [1:0] rot_q;
    reg [1:0] rot_q_prev;
    reg [15:0] dead_count;
    reg [2:0] rot_d;

    [MASKED]

endmodule