module rtlpp_05502 (
    input clock,
    input reset,
    input [6:0] i_d,
    output reg [7:0] o_d,
    input [1:0] state,
    input fire,
    output f_start_i_eq_0,
    output f_zeros_i_eq_0,
    output f_zeros_cnt_eq_127
);

    parameter state_start = 2'd0;
    parameter state_zeros = 2'd1;
    parameter state_pending = 2'd2;

    reg [7:0] cnt, next_cnt;
    reg [6:0] i_at_0, i_at_0_;

    assign f_start_i_eq_0 = (i_d == 0);
    assign f_zeros_i_eq_0 = (i_d == 0);
    assign f_zeros_cnt_eq_127 = (cnt == 127);

    always @(posedge clock or negedge reset) begin
        if (!reset) begin
            cnt <= 0;
            i_at_0 <= 7'bx;
        end else begin
            cnt <= next_cnt;
            i_at_0 <= i_at_0_;
        end
    end

    always @(*) begin
        next_cnt = cnt;
        i_at_0_ = i_at_0;
        o_d = 8'bx;

        if (fire) begin
            case (state)
                state_start: begin
                    i_at_0_ = i_d;
                    if (f_start_i_eq_0) begin
                        next_cnt = 1;
                    end else begin
                        o_d = {1'b0, i_d};
                    end
                end

                state_zeros: begin
                    i_at_0_ = i_d;
                    if (f_zeros_i_eq_0) begin
                        if (f_zeros_cnt_eq_127) begin
                            o_d = 16 | cnt;
                            next_cnt = 0;
                        end else begin
                            next_cnt = cnt + 1;
                        end
                    end
                end

                state_pending: begin
                    o_d = {1'b0, i_at_0};
                end

                default: begin
                    next_cnt = 8'bx;
                    i_at_0_ = 7'bx;
                    o_d = 8'bx;
                end
            endcase 
        end
    end

endmodule