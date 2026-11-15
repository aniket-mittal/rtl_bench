// Hidden tests: 5000 cycles of seeded random inputs (seed 71781285); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 19;
  reg clk;
  reg [15:0] i_0;
  reg [3:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_003604 dut (
    .cpu_a(i_0),
    .romsel(i_1),
    .ddr_enable(out_dut[18:18]),
    .ram_enable(out_dut[17:17]),
    .rom_enable(out_dut[16:16]),
    .mos_enable(out_dut[15:15]),
    .io_fred(out_dut[14:14]),
    .io_jim(out_dut[13:13]),
    .io_sheila(out_dut[12:12]),
    .crtc_enable(out_dut[11:11]),
    .acia_enable(out_dut[10:10]),
    .serproc_enable(out_dut[9:9]),
    .vidproc_enable(out_dut[8:8]),
    .romsel_enable(out_dut[7:7]),
    .sys_via_enable(out_dut[6:6]),
    .user_via_enable(out_dut[5:5]),
    .fddc_enable(out_dut[4:4]),
    .adlc_enable(out_dut[3:3]),
    .adc_enable(out_dut[2:2]),
    .tube_enable(out_dut[1:1]),
    .mhz1_enable(out_dut[0:0])
  );
  autovcoder_003604__ref ref_i (
    .cpu_a(i_0),
    .romsel(i_1),
    .ddr_enable(out_ref[18:18]),
    .ram_enable(out_ref[17:17]),
    .rom_enable(out_ref[16:16]),
    .mos_enable(out_ref[15:15]),
    .io_fred(out_ref[14:14]),
    .io_jim(out_ref[13:13]),
    .io_sheila(out_ref[12:12]),
    .crtc_enable(out_ref[11:11]),
    .acia_enable(out_ref[10:10]),
    .serproc_enable(out_ref[9:9]),
    .vidproc_enable(out_ref[8:8]),
    .romsel_enable(out_ref[7:7]),
    .sys_via_enable(out_ref[6:6]),
    .user_via_enable(out_ref[5:5]),
    .fddc_enable(out_ref[4:4]),
    .adlc_enable(out_ref[3:3]),
    .adc_enable(out_ref[2:2]),
    .tube_enable(out_ref[1:1]),
    .mhz1_enable(out_ref[0:0])
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
    seed = 71781285;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
