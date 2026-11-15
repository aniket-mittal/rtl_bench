module origen_127916 (
    output wire ram_full_fb_i_reg,
    input wire [4:0] v1_reg_0,
    input wire wr_rst_busy,
    input wire out,
    input wire wr_en,
    input wire comp1,
    output wire carrynet_0,
    output wire carrynet_1,
    output wire carrynet_2,
    output wire carrynet_3,
    output wire comp2,
    output wire [3:0] NLW_gmux_gm_0_gm1_m1_CARRY4_O_UNCONNECTED,
    output wire [3:1] NLW_gmux_gm_4_gms_ms_CARRY4_CO_UNCONNECTED,
    output wire [3:1] NLW_gmux_gm_4_gms_ms_CARRY4_DI_UNCONNECTED,
    output wire [3:0] NLW_gmux_gm_4_gms_ms_CARRY4_O_UNCONNECTED,
    output wire [3:1] NLW_gmux_gm_4_gms_ms_CARRY4_S_UNCONNECTED
);

    // Internal wires
    wire [4:0] v2_reg;
    wire [3:0] carry;
    wire [4:0] sum;

    // Assign inputs to internal wires
    assign v2_reg[0] = comp1;
    assign v2_reg[1] = comp2;
    assign v2_reg[4:2] = 3'b000; // Assuming the remaining bits are 0

    // First 4-bit adder
    assign {carry[0], sum[0]} = v1_reg_0[0] + v2_reg[0];
    assign {carry[1], sum[1]} = v1_reg_0[1] + v2_reg[1] + carry[0];
    assign {carry[2], sum[2]} = v1_reg_0[2] + v2_reg[2] + carry[1];
    assign {carry[3], sum[3]} = v1_reg_0[3] + v2_reg[3] + carry[2];

    // Assign carry outputs
    assign carrynet_0 = carry[0];
    assign carrynet_1 = carry[1];
    assign carrynet_2 = carry[2];
    assign carrynet_3 = carry[3];

    // Second 4-bit adder (not used in this implementation)
    assign NLW_gmux_gm_4_gms_ms_CARRY4_CO_UNCONNECTED = 3'b000;
    assign NLW_gmux_gm_4_gms_ms_CARRY4_DI_UNCONNECTED = 3'b000;
    assign NLW_gmux_gm_4_gms_ms_CARRY4_O_UNCONNECTED = 4'b0000;
    assign NLW_gmux_gm_4_gms_ms_CARRY4_S_UNCONNECTED = 3'b000;

    // Unused outputs
    assign NLW_gmux_gm_0_gm1_m1_CARRY4_O_UNCONNECTED = 4'b0000;

    // Compare logic
    wire compare_result = (v1_reg_0 == v2_reg);

    // Output logic
    assign ram_full_fb_i_reg = compare_result & ~wr_rst_busy & out & wr_en;

    // Assign remaining outputs
    assign comp2 = v2_reg[1];

endmodule