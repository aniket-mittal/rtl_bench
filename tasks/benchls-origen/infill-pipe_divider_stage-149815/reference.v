module origen_149815(
    input sys_clk,
    input sys_rst,
    input pipe_stb_i,
    input [15:0] Y,
    input [15:0] S_X,
    input [15:0] S_U,
    input [15:0] S_V,
    input [15:0] E_X,
    input du_positive,
    input dv_positive,
    input [15:0] du_q,
    input [15:0] du_r,
    input [15:0] dv_q,
    input [15:0] dv_r,
    input [15:0] divisor,
    input pipe_ack_i,
    output reg busy,
    output reg pipe_ack_o,
    output reg pipe_stb_o,
    output reg [15:0] P_X,
    output reg [15:0] P_Y,
    output reg [15:0] P_U,
    output reg [15:0] P_V
);

    reg [1:0] state;
    parameter IDLE = 2'b00, BUSY = 2'b01;

    always @(posedge sys_clk or posedge sys_rst) begin
        if (sys_rst) begin
            state <= IDLE;
            busy <= 1'b0;
            pipe_ack_o <= 1'b0;
            pipe_stb_o <= 1'b0;
            P_X <= S_X;
            P_Y <= Y;
            P_U <= S_U;
            P_V <= S_V;
        end else begin
            case (state)
                IDLE: begin
                    if (pipe_stb_i) begin
                        state <= BUSY;
                        busy <= 1'b1;
                        pipe_ack_o <= 1'b1;
                        P_X <= S_X;
                        P_Y <= Y;
                        P_U <= S_U;
                        P_V <= S_V;
                    end else begin
                        busy <= 1'b0;
                        pipe_ack_o <= 1'b0;
                        pipe_stb_o <= 1'b0;
                    end
                end
                BUSY: begin
                    pipe_ack_o <= 1'b0;
                    if (P_X < E_X) begin
                        P_X <= P_X + 1;
                        if (du_positive) begin
                            P_U <= P_U + du_q;
                            if (P_U[15]) begin
                                P_U <= P_U + du_r;
                            end
                        end else begin
                            P_U <= P_U - du_q;
                            if (!P_U[15]) begin
                                P_U <= P_U - du_r;
                            end
                        end
                        if (dv_positive) begin
                            P_V <= P_V + dv_q;
                            if (P_V[15]) begin
                                P_V <= P_V + dv_r;
                            end
                        end else begin
                            P_V <= P_V - dv_q;
                            if (!P_V[15]) begin
                                P_V <= P_V - dv_r;
                            end
                        end
                        pipe_stb_o <= 1'b1;
                    end else begin
                        state <= IDLE;
                        busy <= 1'b0;
                        pipe_stb_o <= 1'b0;
                    end
                end
            endcase
        end
    end

endmodule