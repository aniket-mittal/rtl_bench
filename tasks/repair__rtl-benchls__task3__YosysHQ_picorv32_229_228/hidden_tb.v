// Hidden tests: 5000 cycles of seeded random inputs (seed 2245849492); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 307;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  picorv32 dut (
    .clk(clk),
    .resetn(i_0),
    .mem_ready(i_1),
    .mem_rdata(i_2),
    .pcpi_wr(i_3),
    .pcpi_rd(i_4),
    .pcpi_wait(i_5),
    .pcpi_ready(i_6),
    .irq(i_7),
    .trap(out_dut[306:306]),
    .mem_valid(out_dut[305:305]),
    .mem_instr(out_dut[304:304]),
    .mem_addr(out_dut[303:272]),
    .mem_wdata(out_dut[271:240]),
    .mem_wstrb(out_dut[239:236]),
    .mem_la_read(out_dut[235:235]),
    .mem_la_write(out_dut[234:234]),
    .mem_la_addr(out_dut[233:202]),
    .mem_la_wdata(out_dut[201:170]),
    .mem_la_wstrb(out_dut[169:166]),
    .pcpi_valid(out_dut[165:165]),
    .pcpi_insn(out_dut[164:133]),
    .pcpi_rs1(out_dut[132:101]),
    .pcpi_rs2(out_dut[100:69]),
    .eoi(out_dut[68:37]),
    .trace_valid(out_dut[36:36]),
    .trace_data(out_dut[35:0])
  );
  picorv32__ref ref_i (
    .clk(clk),
    .resetn(i_0),
    .mem_ready(i_1),
    .mem_rdata(i_2),
    .pcpi_wr(i_3),
    .pcpi_rd(i_4),
    .pcpi_wait(i_5),
    .pcpi_ready(i_6),
    .irq(i_7),
    .trap(out_ref[306:306]),
    .mem_valid(out_ref[305:305]),
    .mem_instr(out_ref[304:304]),
    .mem_addr(out_ref[303:272]),
    .mem_wdata(out_ref[271:240]),
    .mem_wstrb(out_ref[239:236]),
    .mem_la_read(out_ref[235:235]),
    .mem_la_write(out_ref[234:234]),
    .mem_la_addr(out_ref[233:202]),
    .mem_la_wdata(out_ref[201:170]),
    .mem_la_wstrb(out_ref[169:166]),
    .pcpi_valid(out_ref[165:165]),
    .pcpi_insn(out_ref[164:133]),
    .pcpi_rs1(out_ref[132:101]),
    .pcpi_rs2(out_ref[100:69]),
    .eoi(out_ref[68:37]),
    .trace_valid(out_ref[36:36]),
    .trace_data(out_ref[35:0])
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
    seed = 2245849492;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
