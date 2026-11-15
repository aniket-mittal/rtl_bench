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

    always @(*) begin
        if (reset) begin
            tx_nxt = 8'd2;
            ty_nxt = 8'd2;
            trot_nxt = 8'd0;
        end
        else if (clk1Hz) begin
            tx_nxt = xpos;
            ty_nxt = ypos + 1;
            trot_nxt = rotation;
        end
        else begin
            tx_nxt = xpos;
            ty_nxt = ypos;
            trot_nxt = rotation;

            case (keycode)
                A_BUTTON: tx_nxt = xpos - 1;
                D_BUTTON: tx_nxt = xpos + 1;
                W_BUTTON: trot_nxt = rotation - 1;
                S_BUTTON: trot_nxt = rotation + 1;
                SPACE_BUTTON: ty_nxt = ypos + 2;
                default: ;
            endcase
        end
    end

    always @(posedge pclk) begin
        test_x <= tx_nxt;
        test_y <= ty_nxt;
        test_rot <= trot_nxt;
    end

endmodule