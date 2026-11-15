module rtlpp_09267 (
    output [37:0] jdo,
    output        jrst_n,
    output        st_ready_test_idle,
    output        take_action_break_a,
    output        take_action_break_b,
    output        take_action_break_c,
    output        take_action_ocimem_a,
    output        take_action_ocimem_b,
    output        take_action_tracectrl,
    output        take_action_tracemem_a,
    output        take_action_tracemem_b,
    output        take_no_action_break_a,
    output        take_no_action_break_b,
    output        take_no_action_break_c,
    output        take_no_action_ocimem_a,
    output        take_no_action_tracemem_a,
    input [31:0]  MonDReg,
    input [31:0]  break_readreg,
    input         clk,
    input         dbrk_hit0_latch,
    input         dbrk_hit1_latch,
    input         dbrk_hit2_latch,
    input         dbrk_hit3_latch,
    input         debugack,
    input         monitor_error,
    input         monitor_ready,
    input         reset_n,
    input         resetlatch,
    input         tracemem_on,
    input [35:0]  tracemem_trcdata,
    input         tracemem_tw,
    input [6:0]   trc_im_addr,
    input         trc_on,
    input         trc_wrap,
    input         trigbrktype,
    input         trigger_state_1
);

    wire [37:0] sr;
    wire [1:0]  vji_ir_in;
    wire [1:0]  vji_ir_out;
    wire        vji_rti;
    wire        vji_sdr;
    wire        vji_tck;
    wire        vji_tdi;
    wire        vji_tdo;
    wire        vji_udr;
    wire        vji_uir;

    // Internal logic for the_Computer_System_Nios2_cpu_debug_slave_tck
    assign vji_tck = 1'b0;
    assign vji_tdi = 1'b0;
    assign vji_sdr = 1'b0;
    assign vji_cdr = 1'b0;
    assign vji_rti = 1'b0;
    assign vji_uir = 1'b0;
    assign vji_udr = 1'b0;
    assign vji_ir_in = 2'b00;

    // Logic implementation for Computer_System_Nios2_cpu_debug_slave_tck
    assign jrst_n = reset_n & ~resetlatch;
    assign sr = { dbrk_hit3_latch, dbrk_hit2_latch, dbrk_hit1_latch, dbrk_hit0_latch, MonDReg[31:0] };
    assign st_ready_test_idle = monitor_ready & ~monitor_error;

    // Logic implementation for Computer_System_Nios2_cpu_debug_slave_sysclk
    assign jdo = { 3'b0, tracemem_trcdata };
    assign take_action_break_a = clk & break_readreg[0];
    assign take_action_break_b = clk & break_readreg[1];
    assign take_action_break_c = clk & break_readreg[2];
    assign take_action_ocimem_a = clk & break_readreg[3];
    assign take_action_ocimem_b = clk & break_readreg[4];
    assign take_action_tracectrl = clk & break_readreg[5];
    assign take_action_tracemem_a = tracemem_on & tracemem_tw;
    assign take_action_tracemem_b = tracemem_on & trc_wrap;
    assign take_no_action_break_a = ~take_action_break_a;
    assign take_no_action_break_b = ~take_action_break_b;
    assign take_no_action_break_c = ~take_action_break_c;
    assign take_no_action_ocimem_a = ~take_action_ocimem_a;
    assign take_no_action_tracemem_a = ~take_action_tracemem_a;

endmodule