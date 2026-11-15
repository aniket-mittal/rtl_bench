module origen_026143 (
    input wire rst,
    input wire clk,
    input wire [1:0] prio,
    input wire [1:0] req,
    input wire [1:0] using,
    output reg [1:0] en
);

    parameter RR = 400000;

    reg switch;
    reg [18:0] cnt;
    reg target;

    [MASKED]

endmodule