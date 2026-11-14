// Hidden tests: 5000 cycles of seeded random inputs (seed 558852762); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 288;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_08869 dut (
    .Clk(clk),
    .Reset(i_0),
    .IO_read_data(i_1),
    .IO_ready(i_2),
    .TRACE_data_access(out_dut[287:287]),
    .TRACE_data_address(out_dut[286:255]),
    .TRACE_data_byte_enable(out_dut[254:251]),
    .TRACE_data_read(out_dut[250:250]),
    .TRACE_data_write(out_dut[249:249]),
    .TRACE_data_write_value(out_dut[248:217]),
    .TRACE_dcache_hit(out_dut[216:216]),
    .TRACE_dcache_rdy(out_dut[215:215]),
    .TRACE_dcache_read(out_dut[214:214]),
    .TRACE_dcache_req(out_dut[213:213]),
    .TRACE_delay_slot(out_dut[212:212]),
    .TRACE_ex_piperun(out_dut[211:211]),
    .TRACE_exception_kind(out_dut[210:206]),
    .TRACE_exception_taken(out_dut[205:205]),
    .TRACE_icache_hit(out_dut[204:204]),
    .TRACE_icache_rdy(out_dut[203:203]),
    .TRACE_icache_req(out_dut[202:202]),
    .TRACE_instruction(out_dut[201:170]),
    .TRACE_jump_hit(out_dut[169:169]),
    .TRACE_jump_taken(out_dut[168:168]),
    .TRACE_mb_halted(out_dut[167:167]),
    .TRACE_mem_piperun(out_dut[166:166]),
    .TRACE_msr_reg(out_dut[165:151]),
    .TRACE_new_reg_value(out_dut[150:119]),
    .TRACE_of_piperun(out_dut[118:118]),
    .TRACE_pc(out_dut[117:86]),
    .TRACE_pid_reg(out_dut[85:78]),
    .TRACE_reg_addr(out_dut[77:73]),
    .TRACE_reg_write(out_dut[72:72]),
    .TRACE_valid_instr(out_dut[71:71]),
    .IO_addr_strobe(out_dut[70:70]),
    .IO_address(out_dut[69:38]),
    .IO_byte_enable(out_dut[37:34]),
    .IO_read_strobe(out_dut[33:33]),
    .IO_write_data(out_dut[32:1]),
    .IO_write_strobe(out_dut[0:0])
  );
  rtlpp_08869__ref ref_i (
    .Clk(clk),
    .Reset(i_0),
    .IO_read_data(i_1),
    .IO_ready(i_2),
    .TRACE_data_access(out_ref[287:287]),
    .TRACE_data_address(out_ref[286:255]),
    .TRACE_data_byte_enable(out_ref[254:251]),
    .TRACE_data_read(out_ref[250:250]),
    .TRACE_data_write(out_ref[249:249]),
    .TRACE_data_write_value(out_ref[248:217]),
    .TRACE_dcache_hit(out_ref[216:216]),
    .TRACE_dcache_rdy(out_ref[215:215]),
    .TRACE_dcache_read(out_ref[214:214]),
    .TRACE_dcache_req(out_ref[213:213]),
    .TRACE_delay_slot(out_ref[212:212]),
    .TRACE_ex_piperun(out_ref[211:211]),
    .TRACE_exception_kind(out_ref[210:206]),
    .TRACE_exception_taken(out_ref[205:205]),
    .TRACE_icache_hit(out_ref[204:204]),
    .TRACE_icache_rdy(out_ref[203:203]),
    .TRACE_icache_req(out_ref[202:202]),
    .TRACE_instruction(out_ref[201:170]),
    .TRACE_jump_hit(out_ref[169:169]),
    .TRACE_jump_taken(out_ref[168:168]),
    .TRACE_mb_halted(out_ref[167:167]),
    .TRACE_mem_piperun(out_ref[166:166]),
    .TRACE_msr_reg(out_ref[165:151]),
    .TRACE_new_reg_value(out_ref[150:119]),
    .TRACE_of_piperun(out_ref[118:118]),
    .TRACE_pc(out_ref[117:86]),
    .TRACE_pid_reg(out_ref[85:78]),
    .TRACE_reg_addr(out_ref[77:73]),
    .TRACE_reg_write(out_ref[72:72]),
    .TRACE_valid_instr(out_ref[71:71]),
    .IO_addr_strobe(out_ref[70:70]),
    .IO_address(out_ref[69:38]),
    .IO_byte_enable(out_ref[37:34]),
    .IO_read_strobe(out_ref[33:33]),
    .IO_write_data(out_ref[32:1]),
    .IO_write_strobe(out_ref[0:0])
  );

  task check;
    begin
      bad = 0;
      for (b = 0; b < OW; b = b + 1)
        if (out_ref[b] !== 1'bx && out_dut[b] !== out_ref[b]) bad = 1;
      if (bad) begin
        mismatches = mismatches + 1;
        if (shown < 10) begin
          $display("MISMATCH cycle %0d: expected=%h got=%h", c, out_ref, out_dut);
          shown = shown + 1;
        end
      end
    end
  endtask

  initial begin
    seed = 558852762;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
