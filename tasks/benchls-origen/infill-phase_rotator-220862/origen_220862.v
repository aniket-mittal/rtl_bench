module origen_220862 #(
    parameter L = 9
)(
    input  wire        clk,
    input  wire        rst,
    input  wire        ld,
    input  wire        acc,
    input  wire        ce,
    input  wire [15:0] phase_in,
    output reg  [15:0] phase_out,
    output reg         phase_out_rdy
);

    parameter Pi = 16'h648B;

    reg [15:0] phase_in_lat;
    reg [15:0] phase_rot;
    reg [15:0] phase_rot_acc;

    [MASKED]

endmodule