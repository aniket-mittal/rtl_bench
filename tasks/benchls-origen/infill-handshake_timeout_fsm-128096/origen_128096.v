module origen_128096 #(
    parameter TIMEOUT = 100
) (
    input wire clk,
    input wire rst,
    input wire up_req,
    input wire up_ack,
    output reg up_grant,
    output reg down_req,
    input wire down_grant,
    output reg down_ack,
    output reg timeout
);

    reg [31:0] counter;
    reg timer_running;

    [MASKED]

endmodule