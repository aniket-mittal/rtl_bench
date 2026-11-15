module origen_142485 (
    input wire arbpc1_pcxdp_grant_arbbf_pa,
    input wire arbpc1_pcxdp_q0_hold_arbbf_pa_l,
    input wire arbpc1_pcxdp_qsel0_arbbf_pa,
    input wire arbpc1_pcxdp_qsel1_arbbf_pa_l,
    input wire arbpc1_pcxdp_shift_arbbf_px,
    input wire arbpc3_pcxdp_grant_arbbf_pa,
    input wire arbpc3_pcxdp_q0_hold_arbbf_pa_l,
    input wire arbpc3_pcxdp_qsel0_arbbf_pa,
    input wire arbpc3_pcxdp_qsel1_arbbf_pa_l,
    input wire arbpc3_pcxdp_shift_arbbf_px,
    input wire arbpc4_pcxdp_grant_arbbf_pa,
    input wire arbpc4_pcxdp_q0_hold_arbbf_pa_l,
    input wire arbpc4_pcxdp_qsel0_arbbf_pa,
    input wire arbpc4_pcxdp_qsel1_arbbf_pa_l,
    input wire arbpc4_pcxdp_shift_arbbf_px,

    output wire arbpc1_pcxdp_grant_pa,
    output wire arbpc1_pcxdp_q0_hold_pa_l,
    output wire arbpc1_pcxdp_qsel0_pa,
    output wire arbpc1_pcxdp_qsel1_pa_l,
    output wire arbpc1_pcxdp_shift_px,
    output wire arbpc3_pcxdp_grant_pa,
    output wire arbpc3_pcxdp_q0_hold_pa_l,
    output wire arbpc3_pcxdp_qsel0_pa,
    output wire arbpc3_pcxdp_qsel1_pa_l,
    output wire arbpc3_pcxdp_shift_px,
    output wire arbpc4_pcxdp_grant_pa,
    output wire arbpc4_pcxdp_q0_hold_pa_l,
    output wire arbpc4_pcxdp_qsel0_pa,
    output wire arbpc4_pcxdp_qsel1_pa_l,
    output wire arbpc4_pcxdp_shift_px
);

    assign arbpc1_pcxdp_grant_pa = arbpc1_pcxdp_grant_arbbf_pa;
    assign arbpc1_pcxdp_q0_hold_pa_l = arbpc1_pcxdp_q0_hold_arbbf_pa_l;
    assign arbpc1_pcxdp_qsel0_pa = arbpc1_pcxdp_qsel0_arbbf_pa;
    assign arbpc1_pcxdp_qsel1_pa_l = arbpc1_pcxdp_qsel1_arbbf_pa_l;
    assign arbpc1_pcxdp_shift_px = arbpc1_pcxdp_shift_arbbf_px;
    assign arbpc3_pcxdp_grant_pa = arbpc3_pcxdp_grant_arbbf_pa;
    assign arbpc3_pcxdp_q0_hold_pa_l = arbpc3_pcxdp_q0_hold_arbbf_pa_l;
    assign arbpc3_pcxdp_qsel0_pa = arbpc3_pcxdp_qsel0_arbbf_pa;
    assign arbpc3_pcxdp_qsel1_pa_l = arbpc3_pcxdp_qsel1_arbbf_pa_l;
    assign arbpc3_pcxdp_shift_px = arbpc3_pcxdp_shift_arbbf_px;
    assign arbpc4_pcxdp_grant_pa = arbpc4_pcxdp_grant_arbbf_pa;
    assign arbpc4_pcxdp_q0_hold_pa_l = arbpc4_pcxdp_q0_hold_arbbf_pa_l;
    assign arbpc4_pcxdp_qsel0_pa = arbpc4_pcxdp_qsel0_arbbf_pa;
    assign arbpc4_pcxdp_qsel1_pa_l = arbpc4_pcxdp_qsel1_arbbf_pa_l;
    assign arbpc4_pcxdp_shift_px = arbpc4_pcxdp_shift_arbbf_px;

endmodule