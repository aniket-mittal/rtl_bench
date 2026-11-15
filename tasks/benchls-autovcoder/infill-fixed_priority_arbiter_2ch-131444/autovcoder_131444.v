module autovcoder_131444 (
    input clk,
    input reset,
    input req1,
    input req2,
    output reg grant1,
    output reg grant2
);

    reg [1:0] state; // 0: grant1, 1: grant2, 2: idle
    parameter GRANT1 = 2'b00, GRANT2 = 2'b01, IDLE = 2'b10;

    [MASKED]
endmodule