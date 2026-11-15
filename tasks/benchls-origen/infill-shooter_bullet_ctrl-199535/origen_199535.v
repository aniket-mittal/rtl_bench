module origen_199535(
    input clk,
    input rst,
    input move,
    input fire,
    input collision,
    input [10:0] inx,
    input [10:0] iny,
    output reg [10:0] ox,
    output reg [10:0] oy
);

localparam S0 = 1'b0, S1 = 1'b1;
reg state;

initial begin
    state = S0;
    ox = 11'd1050;
    oy = 11'd128;
end

[MASKED]

endmodule