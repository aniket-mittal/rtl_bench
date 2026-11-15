module origen_048381(
    input game_clk,
    input reset,
    input [2:0] KEY,
    input [9:0] apx,
    input [9:0] apy,
    output reg [9:0] mpx,
    output reg [9:0] mpy,
    output reg hit,
    output reg mstate
);

parameter block_size = 100;
parameter S0 = 1'b0;
parameter S1 = 1'b1;

reg state;

always @(posedge game_clk or posedge reset) begin
    if (reset) begin
        state <= S0;
        mpx <= 10'd0;
        mpy <= 10'd0;
        hit <= 1'b0;
        mstate <= S0;
    end else begin
        case (state)
            S0: begin
                if (KEY[2]) begin
                    state <= S1;
                    mpx <= apx;
                    mpy <= apy;
                    hit <= 1'b0;
                    mstate <= S1;
                end
            end
            S1: begin
                if (mpy == 10'd0) begin
                    state <= S0;
                    mstate <= S0;
                end else begin
                    mpy <= mpy - 1'b1;
                    if (mpx <= 10'd600 && mpy == block_size) begin
                        hit <= 1'b1;
                    end
                end
            end
        endcase
    end
end

endmodule