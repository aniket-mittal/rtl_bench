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
    [MASKED]

endmodule