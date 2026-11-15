module origen_197257(
    input clock,
    input reset,
    input enable,
    input signed [15:0] phase1,
    input signed [15:0] phase2,
    input signed [15:0] phase3,
    input signed [15:0] phase4,
    output reg signed [15:0] angle1,
    output reg signed [15:0] angle2,
    output reg signed [15:0] angle3,
    output reg signed [15:0] angle4,
    output reg signed [15:0] angle5,
    output reg signed [15:0] angle6
);

reg signed [15:0] ang1, ang2;
reg run_state;
reg [2:0] state;

localparam IDLE = 3'b000;
localparam DIF12 = 3'b001;
localparam DIF13 = 3'b010;
localparam DIF14 = 3'b011;
localparam DIF23 = 3'b100;
localparam DIF24 = 3'b101;
localparam DIF34 = 3'b110;

[MASKED]

endmodule