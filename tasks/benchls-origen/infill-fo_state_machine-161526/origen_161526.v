module origen_161526(
    input clk,
    input rst,
    input period_flag,
    input signI,
    input [2:0] vc_level,
    input [7:0] vc1,
    input [7:0] vc2,
    output reg [3:0] Fo
);

reg [3:0] Fo_1;

initial begin
    Fo_1 = 4'b1010;
end

[MASKED]

endmodule