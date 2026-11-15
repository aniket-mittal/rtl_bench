module origen_157579 (
    input clk,
    input rst,
    input wr,
    input [31:0] m,
    input [31:0] x,
    input [31:0] b,
    output reg [31:0] y,
    output reg valid
);

reg [31:0] i_m_0;
reg [31:0] i_x_0;
reg [31:0] i_dy;
reg [31:0] cnt;

localparam S_IDLE = 1'b0;
localparam S_CALC = 1'b1;
reg state;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= S_IDLE;
        i_m_0 <= 0;
        i_x_0 <= 0;
        i_dy <= 0;
        cnt <= 0;
        y <= 0;
        valid <= 0;
    end else begin
        case (state)
            S_IDLE: begin
                if (wr) begin
                    i_m_0 <= m;
                    i_x_0 <= x;
                    i_dy <= 0;
                    cnt <= 0;
                    state <= S_CALC;
                end
                valid <= (i_m_0 == m) && (i_x_0 == x);
            end
            S_CALC: begin
                i_dy <= i_dy + i_m_0;
                cnt <= cnt + 1;
                if (cnt == i_x_0 - 1) begin
                    y <= i_dy + b;
                    state <= S_IDLE;
                end
            end
        endcase
    end
end

endmodule