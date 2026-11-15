// Hidden tests: 5000 cycles of seeded random inputs (seed 2001219638); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 102;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [1:0] i_4;
  reg [2:0] i_5;
  reg [2:0] i_6;
  reg [3:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_152857 dut (
    .clk(clk),
    .rst_n(i_0),
    .ahbls_hready(i_1),
    .ahbls_haddr(i_2),
    .ahbls_hwrite(i_3),
    .ahbls_htrans(i_4),
    .ahbls_hsize(i_5),
    .ahbls_hburst(i_6),
    .ahbls_hprot(i_7),
    .ahbls_hmastlock(i_8),
    .ahbls_hwdata(i_9),
    .apbm_pready(i_10),
    .apbm_prdata(i_11),
    .apbm_pslverr(i_12),
    .ahbls_hready_resp(out_dut[101:101]),
    .ahbls_hresp(out_dut[100:99]),
    .ahbls_hrdata(out_dut[98:67]),
    .apbm_paddr(out_dut[66:35]),
    .apbm_psel(out_dut[34:34]),
    .apbm_penable(out_dut[33:33]),
    .apbm_pwrite(out_dut[32:32]),
    .apbm_pwdata(out_dut[31:0])
  );
  origen_152857__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .ahbls_hready(i_1),
    .ahbls_haddr(i_2),
    .ahbls_hwrite(i_3),
    .ahbls_htrans(i_4),
    .ahbls_hsize(i_5),
    .ahbls_hburst(i_6),
    .ahbls_hprot(i_7),
    .ahbls_hmastlock(i_8),
    .ahbls_hwdata(i_9),
    .apbm_pready(i_10),
    .apbm_prdata(i_11),
    .apbm_pslverr(i_12),
    .ahbls_hready_resp(out_ref[101:101]),
    .ahbls_hresp(out_ref[100:99]),
    .ahbls_hrdata(out_ref[98:67]),
    .apbm_paddr(out_ref[66:35]),
    .apbm_psel(out_ref[34:34]),
    .apbm_penable(out_ref[33:33]),
    .apbm_pwrite(out_ref[32:32]),
    .apbm_pwdata(out_ref[31:0])
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
    seed = 2001219638;
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
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
