module origen_160550 #(
    parameter N_REGS     = 2,
    parameter N_REG_BITS = $clog2(N_REGS)
)(
    input  clk,
    input  rst_n,

    input  [31:0] hwlp_start_data_i,
    input  [31:0] hwlp_end_data_i,
    input  [31:0] hwlp_cnt_data_i,
    input   [2:0] hwlp_we_i,
    input [N_REG_BITS-1:0] hwlp_regid_i,
    input         valid_i,
    input        [N_REGS-1:0] hwlp_dec_cnt_i,

    output [31:0] hwlp_start_addr_o,
    output [31:0] hwlp_end_addr_o,
    output [31:0] hwlp_counter_o
);

    reg [31:0] hwlp_start_q [N_REGS-1:0];
    reg [31:0] hwlp_end_q   [N_REGS-1:0];
    reg [31:0] hwlp_counter_q [N_REGS-1:0];

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            for (int i = 0; i < N_REGS; i++) begin
                hwlp_start_q[i] <= 32'b0;
                hwlp_end_q[i]   <= 32'b0;
                hwlp_counter_q[i] <= 32'b0;
            end
        end else begin
            if (hwlp_we_i[0]) begin
                hwlp_start_q[hwlp_regid_i] <= hwlp_start_data_i;
            end
            if (hwlp_we_i[1]) begin
                hwlp_end_q[hwlp_regid_i]   <= hwlp_end_data_i;
            end
            if (hwlp_we_i[2]) begin
                hwlp_counter_q[hwlp_regid_i] <= hwlp_cnt_data_i;
            end

            for (int i = 0; i < N_REGS; i++) begin
                if (valid_i && hwlp_dec_cnt_i[i]) begin
                    hwlp_counter_q[i] <= hwlp_counter_q[i] - 1;
                end
            end
        end
    end

    assign hwlp_start_addr_o = hwlp_start_q[hwlp_regid_i];
    assign hwlp_end_addr_o   = hwlp_end_q[hwlp_regid_i];
    assign hwlp_counter_o    = hwlp_counter_q[hwlp_regid_i];

endmodule