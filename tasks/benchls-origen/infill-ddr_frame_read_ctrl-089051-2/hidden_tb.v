// Hidden tests: 5000 cycles of seeded random inputs (seed 2128946555); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 165;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [127:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_089051 dut (
    .ui_clk(clk),
    .rst(i_0),
    .rd_start(i_1),
    .rd_ack(i_2),
    .app_rdy(i_3),
    .app_rd_data_vld(i_4),
    .app_rd_data(i_5),
    .rd_req(out_dut[164:164]),
    .rd_done(out_dut[163:163]),
    .rd_busy(out_dut[162:162]),
    .app_cmd(out_dut[161:159]),
    .app_en(out_dut[158:158]),
    .app_addr(out_dut[157:129]),
    .rd_ddr_data_vld(out_dut[128:128]),
    .rd_ddr_data(out_dut[127:0])
  );
  origen_089051__ref ref_i (
    .ui_clk(clk),
    .rst(i_0),
    .rd_start(i_1),
    .rd_ack(i_2),
    .app_rdy(i_3),
    .app_rd_data_vld(i_4),
    .app_rd_data(i_5),
    .rd_req(out_ref[164:164]),
    .rd_done(out_ref[163:163]),
    .rd_busy(out_ref[162:162]),
    .app_cmd(out_ref[161:159]),
    .app_en(out_ref[158:158]),
    .app_addr(out_ref[157:129]),
    .rd_ddr_data_vld(out_ref[128:128]),
    .rd_ddr_data(out_ref[127:0])
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
    seed = 2128946555;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
