module origen_179454(
    input clk,
    input rst,
    input btn_in,
    output reg btn_press
);

localparam INIT = 2'b00;
localparam BTN_PRESSED = 2'b01;
localparam LOCKOUT = 2'b10;

reg [1:0] state;
reg [15:0] lockout_timer;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= INIT;
        btn_press <= 1'b0;
        lockout_timer <= 16'h0;
    end
    else begin
        case (state)
            INIT: begin
                btn_press <= 1'b0;
                if (btn_in) begin
                    state <= BTN_PRESSED;
                end
            end
            BTN_PRESSED: begin
                btn_press <= 1'b1;
                state <= LOCKOUT;
            end
            LOCKOUT: begin
                btn_press <= 1'b0;
                if (btn_in) begin
                    lockout_timer <= 16'hFFFF;
                end
                else if (lockout_timer != 16'h0) begin
                    lockout_timer <= lockout_timer - 1;
                end
                else begin
                    state <= INIT;
                end
            end
            default: begin
                state <= INIT;
            end
        endcase
    end
end

endmodule