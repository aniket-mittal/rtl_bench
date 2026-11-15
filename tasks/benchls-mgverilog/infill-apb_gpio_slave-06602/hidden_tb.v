// Hidden tests: 5000 cycles of seeded random inputs (seed 3514881334); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 98;
  reg clk;
  reg [3:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_06602 dut (
    .io_mainClk(clk),
    .io_apb_PADDR(i_0),
    .io_apb_PSEL(i_1),
    .io_apb_PENABLE(i_2),
    .io_apb_PWRITE(i_3),
    .io_apb_PWDATA(i_4),
    .io_gpio_read(i_5),
    .resetCtrl_systemReset(i_6),
    .io_apb_PREADY(out_dut[97:97]),
    .io_apb_PRDATA(out_dut[96:65]),
    .io_apb_PSLVERROR(out_dut[64:64]),
    .io_gpio_write(out_dut[63:32]),
    .io_gpio_writeEnable(out_dut[31:0])
  );
  mg_06602__ref ref_i (
    .io_mainClk(clk),
    .io_apb_PADDR(i_0),
    .io_apb_PSEL(i_1),
    .io_apb_PENABLE(i_2),
    .io_apb_PWRITE(i_3),
    .io_apb_PWDATA(i_4),
    .io_gpio_read(i_5),
    .resetCtrl_systemReset(i_6),
    .io_apb_PREADY(out_ref[97:97]),
    .io_apb_PRDATA(out_ref[96:65]),
    .io_apb_PSLVERROR(out_ref[64:64]),
    .io_gpio_write(out_ref[63:32]),
    .io_gpio_writeEnable(out_ref[31:0])
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
    seed = 3514881334;
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
      i_6 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
