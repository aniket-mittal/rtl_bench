module origen_177651(
    input pclk,
    input clk1Hz,
    input reset,
    input [15:0] keycode,
    input [7:0] xpos,
    input [7:0] ypos,
    input [7:0] rotation,
    output reg [7:0] test_x,
    output reg [7:0] test_y,
    output reg [7:0] test_rot
);

    parameter A_BUTTON = 16'h0041;
    parameter D_BUTTON = 16'h0044;
    parameter W_BUTTON = 16'h0057;
    parameter S_BUTTON = 16'h0053;
    parameter SPACE_BUTTON = 16'h0020;

    reg [7:0] tx_nxt, ty_nxt, trot_nxt;

    [MASKED]

    always @(posedge pclk) begin
        test_x <= tx_nxt;
        test_y <= ty_nxt;
        test_rot <= trot_nxt;
    end

endmodule