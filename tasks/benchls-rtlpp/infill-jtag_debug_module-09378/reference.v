module rtlpp_09378 (
    MonDReg,
    break_readreg,
    clk,
    dbrk_hit0_latch,
    dbrk_hit1_latch,
    dbrk_hit2_latch,
    dbrk_hit3_latch,
    debugack,
    monitor_error,
    monitor_ready,
    reset_n,
    resetlatch,
    tracemem_on,
    tracemem_trcdata,
    tracemem_tw,
    trc_im_addr,
    trc_on,
    trc_wrap,
    trigbrktype,
    trigger_state_1,
    jdo,
    jrst_n,
    st_ready_test_idle,
    take_action_break_a,
    take_action_break_b,
    take_action_break_c,
    take_action_ocimem_a,
    take_action_ocimem_b,
    take_action_tracectrl,
    take_action_tracemem_a,
    take_action_tracemem_b,
    take_no_action_break_a,
    take_no_action_break_b,
    take_no_action_break_c,
    take_no_action_ocimem_a,
    take_no_action_tracemem_a
);

output [37:0] jdo;
output jrst_n;
output st_ready_test_idle;
output take_action_break_a;
output take_action_break_b;
output take_action_break_c;
output take_action_ocimem_a;
output take_action_ocimem_b;
output take_action_tracectrl;
output take_action_tracemem_a;
output take_action_tracemem_b;
output take_no_action_break_a;
output take_no_action_break_b;
output take_no_action_break_c;
output take_no_action_ocimem_a;
output take_no_action_tracemem_a;
input [31:0] MonDReg;
input [31:0] break_readreg;
input clk;
input dbrk_hit0_latch;
input dbrk_hit1_latch;
input dbrk_hit2_latch;
input dbrk_hit3_latch;
input debugack;
input monitor_error;
input monitor_ready;
input reset_n;
input resetlatch;
input tracemem_on;
input [35:0] tracemem_trcdata;
input tracemem_tw;
input [6:0] trc_im_addr;
input trc_on;
input trc_wrap;
input trigbrktype;
input trigger_state_1;

wire [37:0] sr;
wire vji_cdr, vji_sdr, vji_tck, vji_tdi, vji_rti, vji_uir, vji_udr;
wire [1:0] vji_ir_in = 2'b0;
wire [1:0] vji_ir_out;

// Embedded logic of Computer_System_Nios2_2nd_Core_cpu_debug_slave_tck
assign jrst_n = reset_n;
assign st_ready_test_idle = monitor_ready & ~monitor_error;
assign sr = {break_readreg, MonDReg};
assign vji_tck = 1'b0;
assign vji_tdi = 1'b0;
assign vji_sdr = 1'b0;
assign vji_cdr = 1'b0;
assign vji_rti = 1'b0;
assign vji_uir = 1'b0;
assign vji_udr = 1'b0;
assign vji_ir_in = 2'b0;

// Embedded logic of Computer_System_Nios2_2nd_Core_cpu_debug_slave_sysclk
reg [37:0] jdo_reg;
reg take_action_break_a_reg, take_action_break_b_reg, take_action_break_c_reg;
reg take_action_ocimem_a_reg, take_action_ocimem_b_reg;
reg take_action_tracectrl_reg, take_action_tracemem_a_reg, take_action_tracemem_b_reg;
reg take_no_action_break_a_reg, take_no_action_break_b_reg, take_no_action_break_c_reg;
reg take_no_action_ocimem_a_reg, take_no_action_tracemem_a_reg;

always @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin
        jdo_reg <= 38'b0;
        take_action_break_a_reg <= 1'b0;
        take_action_break_b_reg <= 1'b0;
        take_action_break_c_reg <= 1'b0;
        take_action_ocimem_a_reg <= 1'b0;
        take_action_ocimem_b_reg <= 1'b0;
        take_action_tracectrl_reg <= 1'b0;
        take_action_tracemem_a_reg <= 1'b0;
        take_action_tracemem_b_reg <= 1'b0;
        take_no_action_break_a_reg <= 1'b0;
        take_no_action_break_b_reg <= 1'b0;
        take_no_action_break_c_reg <= 1'b0;
        take_no_action_ocimem_a_reg <= 1'b0;
        take_no_action_tracemem_a_reg <= 1'b0;
    end else begin
        jdo_reg <= sr; // Some logic to generate jdo from sr
        take_action_break_a_reg <= dbrk_hit0_latch;
        take_action_break_b_reg <= dbrk_hit1_latch;
        take_action_break_c_reg <= dbrk_hit2_latch;
        take_action_ocimem_a_reg <= dbrk_hit3_latch;
        take_action_ocimem_b_reg <= tracemem_tw;
        take_action_tracectrl_reg <= tracemem_on;
        take_action_tracemem_a_reg <= trc_on;
        take_action_tracemem_b_reg <= trc_wrap;
        take_no_action_break_a_reg <= ~take_action_break_a_reg;
        take_no_action_break_b_reg <= ~take_action_break_b_reg;
        take_no_action_break_c_reg <= ~take_action_break_c_reg;
        take_no_action_ocimem_a_reg <= ~take_action_ocimem_a_reg;
        take_no_action_tracemem_a_reg <= ~take_action_tracemem_a_reg;
    end
end

assign jdo = jdo_reg;
assign take_action_break_a = take_action_break_a_reg;
assign take_action_break_b = take_action_break_b_reg;
assign take_action_break_c = take_action_break_c_reg;
assign take_action_ocimem_a = take_action_ocimem_a_reg;
assign take_action_ocimem_b = take_action_ocimem_b_reg;
assign take_action_tracectrl = take_action_tracectrl_reg;
assign take_action_tracemem_a = take_action_tracemem_a_reg;
assign take_action_tracemem_b = take_action_tracemem_b_reg;
assign take_no_action_break_a = take_no_action_break_a_reg;
assign take_no_action_break_b = take_no_action_break_b_reg;
assign take_no_action_break_c = take_no_action_break_c_reg;
assign take_no_action_ocimem_a = take_no_action_ocimem_a_reg;
assign take_no_action_tracemem_a = take_no_action_tracemem_a_reg;

endmodule