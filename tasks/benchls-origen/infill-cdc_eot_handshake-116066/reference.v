module origen_116066 (
    input  logic        sys_clk_i,
    input  logic        phy_clk_i,
    input  logic        rst_ni,
    input  logic [3:0]  proc_id_sys_i,
    input  logic [3:0]  proc_id_phy_i,
    input  logic        running_trans_sys_i,
    input  logic        running_trans_phy_i,
    output logic        evt_eot_o,
    output logic        busy_o
);

    // State definition
    typedef enum logic [1:0] {
        IDLE   = 2'b00,
        ISSUED = 2'b01,
        BUSY   = 2'b10,
        END    = 2'b11
    } state_t;

    state_t r_state, s_state_next;

    // Clock domain crossing signals
    logic [3:0] r_proc_id_phy, r2nd_proc_id_phy, r3rd_proc_id_phy;
    logic r_running_trans_phy, r2nd_running_trans_phy, r3rd_running_trans_phy;

    // Internal signals
    logic r_busy, s_busy_next;
    logic r_evt_eot, s_evt_eot_next;

    // Clock domain crossing
    always_ff @(posedge phy_clk_i or negedge rst_ni) begin
        if (~rst_ni) begin
            r_proc_id_phy <= 4'b0;
            r2nd_proc_id_phy <= 4'b0;
            r3rd_proc_id_phy <= 4'b0;
            r_running_trans_phy <= 1'b0;
            r2nd_running_trans_phy <= 1'b0;
            r3rd_running_trans_phy <= 1'b0;
        end else begin
            r_proc_id_phy <= proc_id_phy_i;
            r2nd_proc_id_phy <= r_proc_id_phy;
            r3rd_proc_id_phy <= r2nd_proc_id_phy;
            r_running_trans_phy <= running_trans_phy_i;
            r2nd_running_trans_phy <= r_running_trans_phy;
            r3rd_running_trans_phy <= r2nd_running_trans_phy;
        end
    end

    // State machine and output logic
    always_ff @(posedge sys_clk_i or negedge rst_ni) begin
        if (~rst_ni) begin
            r_state <= IDLE;
            r_busy <= 1'b0;
            r_evt_eot <= 1'b0;
        end else begin
            r_state <= s_state_next;
            r_busy <= s_busy_next;
            r_evt_eot <= s_evt_eot_next;
        end
    end

    always_comb begin
        s_state_next = r_state;
        s_busy_next = r_busy;
        s_evt_eot_next = 1'b0;

        case (r_state)
            IDLE: begin
                if (running_trans_sys_i) begin
                    s_state_next = ISSUED;
                    s_busy_next = 1'b1;
                end
            end
            ISSUED: begin
                if (r3rd_running_trans_phy && (r3rd_proc_id_phy == proc_id_sys_i)) begin
                    s_state_next = BUSY;
                end
            end
            BUSY: begin
                if (!r3rd_running_trans_phy && !running_trans_sys_i) begin
                    s_state_next = END;
                    s_busy_next = 1'b0;
                    s_evt_eot_next = 1'b1;
                end
            end
            END: begin
                s_state_next = IDLE;
            end
        endcase
    end

    // Output assignments
    assign busy_o = (r_busy | running_trans_sys_i) & rst_ni;
    assign evt_eot_o = r_evt_eot;

endmodule