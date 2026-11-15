// Hidden tests: 5000 cycles of seeded random inputs (seed 809928257); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 28;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [14:0] i_3;
  reg [7:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [3:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_020527 dut (
    .m2(i_0),
    .romsel(i_1),
    .cpu_rw_in(i_2),
    .cpu_addr_in(i_3),
    .cpu_data_in(i_4),
    .ppu_rd_in(i_5),
    .ppu_wr_in(i_6),
    .ppu_addr_in(i_7),
    .led(out_dut[27:27]),
    .cpu_addr_out(out_dut[26:20]),
    .cpu_wr_out(out_dut[19:19]),
    .cpu_rd_out(out_dut[18:18]),
    .cpu_flash_ce(out_dut[17:17]),
    .cpu_sram_ce(out_dut[16:16]),
    .ppu_addr_out(out_dut[15:7]),
    .ppu_rd_out(out_dut[6:6]),
    .ppu_wr_out(out_dut[5:5]),
    .ppu_flash_ce(out_dut[4:4]),
    .ppu_sram_ce(out_dut[3:3]),
    .ppu_ciram_a10(out_dut[2:2]),
    .ppu_ciram_ce(out_dut[1:1]),
    .irq(out_dut[0:0])
  );
  autovcoder_020527__ref ref_i (
    .m2(i_0),
    .romsel(i_1),
    .cpu_rw_in(i_2),
    .cpu_addr_in(i_3),
    .cpu_data_in(i_4),
    .ppu_rd_in(i_5),
    .ppu_wr_in(i_6),
    .ppu_addr_in(i_7),
    .led(out_ref[27:27]),
    .cpu_addr_out(out_ref[26:20]),
    .cpu_wr_out(out_ref[19:19]),
    .cpu_rd_out(out_ref[18:18]),
    .cpu_flash_ce(out_ref[17:17]),
    .cpu_sram_ce(out_ref[16:16]),
    .ppu_addr_out(out_ref[15:7]),
    .ppu_rd_out(out_ref[6:6]),
    .ppu_wr_out(out_ref[5:5]),
    .ppu_flash_ce(out_ref[4:4]),
    .ppu_sram_ce(out_ref[3:3]),
    .ppu_ciram_a10(out_ref[2:2]),
    .ppu_ciram_ce(out_ref[1:1]),
    .irq(out_ref[0:0])
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
    seed = 809928257;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
