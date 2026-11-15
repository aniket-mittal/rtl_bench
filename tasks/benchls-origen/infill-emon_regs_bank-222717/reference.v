module origen_222717(
    input clk,
    input reset,
    input mi_access,
    input mi_write,
    input [19:0] mi_addr,
    input [31:0] mi_data_in,
    input erx_rdfifo_access,
    input erx_rdfifo_wait,
    input erx_wrfifo_access,
    input erx_wrfifo_wait,
    input erx_wbfifo_access,
    input erx_wbfifo_wait,
    input etx_rdfifo_access,
    input etx_rdfifo_wait,
    input etx_wrfifo_access,
    input etx_wrfifo_wait,
    input etx_wbfifo_access,
    input etx_wbfifo_wait,
    output reg [31:0] mi_data_out,
    output reg [5:0] emon_zero_flag
);

reg [31:0] emon_regs [0:63];
reg [5:0] emon_zero_cnt;

always @(posedge clk) begin
    if (reset) begin
        emon_zero_cnt <= 0;
        mi_data_out <= 0;
    end else begin
        if (mi_access) begin
            if (mi_write) begin
                emon_regs[mi_addr[5:0]] <= mi_data_in;
            end else begin
                mi_data_out <= emon_regs[mi_addr[5:0]];
            end
        end

        emon_zero_cnt <= 0;
        emon_zero_flag <= 0;

        if (erx_rdfifo_access) emon_zero_cnt[0] <= erx_rdfifo_wait;
        if (erx_wrfifo_access) emon_zero_cnt[1] <= erx_wrfifo_wait;
        if (erx_wbfifo_access) emon_zero_cnt[2] <= erx_wbfifo_wait;
        if (etx_rdfifo_access) emon_zero_cnt[3] <= etx_rdfifo_wait;
        if (etx_wrfifo_access) emon_zero_cnt[4] <= etx_wrfifo_wait;
        if (etx_wbfifo_access) emon_zero_cnt[5] <= etx_wbfifo_wait;

        emon_zero_flag <= emon_zero_cnt;
    end
end

endmodule