module origen_115478 (
    input wire rst,
    input wire go,
    input wire clk,
    input wire [31:0] n,
    output reg [31:0] result,
    output reg done
);

    // State definition
    typedef enum logic [3:0] {
        start, n_grt_0, inc_cnt1, cnt_grt_n, cnt_eq_1, add_sum_reg_cnt_times,
        update_sum_reg, ld_res_from_sum_reg, set_sum_reg_to_0, send_done,
        n_eq_0, error
    } statetype;

    statetype state, next_state;

    // Internal registers
    reg [31:0] sum_reg, add_res_reg, cnt_1, cnt_2;

    // State machine
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= start;
            sum_reg <= 32'd0;
            add_res_reg <= 32'd0;
            cnt_1 <= 32'd0;
            cnt_2 <= 32'd0;
            result <= 32'd0;
            done <= 1'b0;
        end else begin
            state <= next_state;
            case (state)
                start: begin
                    if (go) next_state = n_grt_0;
                    else next_state = start;
                end
                n_grt_0: begin
                    if (n > 0) next_state = inc_cnt1;
                    else if (n == 0) next_state = n_eq_0;
                    else next_state = error;
                end
                inc_cnt1: begin
                    cnt_1 <= cnt_1 + 1;
                    next_state = cnt_grt_n;
                end
                cnt_grt_n: begin
                    if (cnt_1 <= n) next_state = cnt_eq_1;
                    else next_state = ld_res_from_sum_reg;
                end
                cnt_eq_1: begin
                    if (cnt_1 == 1) begin
                        sum_reg <= 32'd1;
                        next_state = inc_cnt1;
                    end else begin
                        cnt_2 <= 32'd0;
                        add_res_reg <= 32'd0;
                        next_state = add_sum_reg_cnt_times;
                    end
                end
                add_sum_reg_cnt_times: begin
                    if (cnt_2 < cnt_1) begin
                        add_res_reg <= add_res_reg + sum_reg;
                        cnt_2 <= cnt_2 + 1;
                        next_state = add_sum_reg_cnt_times;
                    end else begin
                        next_state = update_sum_reg;
                    end
                end
                update_sum_reg: begin
                    sum_reg <= add_res_reg;
                    next_state = inc_cnt1;
                end
                ld_res_from_sum_reg: begin
                    result <= sum_reg;
                    next_state = set_sum_reg_to_0;
                end
                set_sum_reg_to_0: begin
                    sum_reg <= 32'd0;
                    next_state = send_done;
                end
                send_done: begin
                    done <= 1'b1;
                    next_state = start;
                end
                n_eq_0: begin
                    result <= 32'd1;
                    next_state = send_done;
                end
                error: begin
                    next_state = start;
                end
                default: next_state = start;
            endcase
        end
    end

endmodule