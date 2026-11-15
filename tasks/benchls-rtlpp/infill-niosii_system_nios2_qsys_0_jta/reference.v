module niosII_system_nios2_qsys_0_jtag_debug_module_sysclk (
    input clk,
    input [1:0] ir_in,
    output [37:0] jdo,
    input [37:0] sr,
    output take_action_break_a,
    output take_action_break_b,
    output take_action_break_c,
    output take_action_ocimem_a,
    output take_action_ocimem_b,
    output take_action_tracectrl,
    output take_action_tracemem_a,
    output take_action_tracemem_b,
    output take_no_action_break_a,
    output take_no_action_break_b,
    output take_no_action_break_c,
    output take_no_action_ocimem_a,
    output take_no_action_tracemem_a,
    input vs_udr,
    input vs_uir
);

    // Internal logic
    assign jdo = 38'b0;
    assign take_action_break_a = 1'b0;
    assign take_action_break_b = 1'b0;
    assign take_action_break_c = 1'b0;
    assign take_action_ocimem_a = 1'b0;
    assign take_action_ocimem_b = 1'b0;
    assign take_action_tracectrl = 1'b0;
    assign take_action_tracemem_a = 1'b0;
    assign take_action_tracemem_b = 1'b0;
    assign take_no_action_break_a = 1'b0;
    assign take_no_action_break_b = 1'b0;
    assign take_no_action_break_c = 1'b0;
    assign take_no_action_ocimem_a = 1'b0;
    assign take_no_action_tracemem_a = 1'b0;

endmodule