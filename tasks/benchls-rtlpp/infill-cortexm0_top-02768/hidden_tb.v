// Hidden tests: 5000 cycles of seeded random inputs (seed 313734277); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 82;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [25:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02768 dut (
    .HCLK(clk),
    .HRESETn(i_0),
    .HRDATA(i_1),
    .HREADY(i_2),
    .HRESP(i_3),
    .NMI(i_4),
    .IRQ(i_5),
    .RXEV(i_6),
    .STCLKEN(i_7),
    .STCALIB(i_8),
    .HADDR(out_dut[81:50]),
    .HBURST(out_dut[49:47]),
    .HMASTLOCK(out_dut[46:46]),
    .HPROT(out_dut[45:42]),
    .HSIZE(out_dut[41:39]),
    .HTRANS(out_dut[38:37]),
    .HWDATA(out_dut[36:5]),
    .HWRITE(out_dut[4:4]),
    .TXEV(out_dut[3:3]),
    .LOCKUP(out_dut[2:2]),
    .SYSRESETREQ(out_dut[1:1]),
    .SLEEPING(out_dut[0:0])
  );
  rtlpp_02768__ref ref_i (
    .HCLK(clk),
    .HRESETn(i_0),
    .HRDATA(i_1),
    .HREADY(i_2),
    .HRESP(i_3),
    .NMI(i_4),
    .IRQ(i_5),
    .RXEV(i_6),
    .STCLKEN(i_7),
    .STCALIB(i_8),
    .HADDR(out_ref[81:50]),
    .HBURST(out_ref[49:47]),
    .HMASTLOCK(out_ref[46:46]),
    .HPROT(out_ref[45:42]),
    .HSIZE(out_ref[41:39]),
    .HTRANS(out_ref[38:37]),
    .HWDATA(out_ref[36:5]),
    .HWRITE(out_ref[4:4]),
    .TXEV(out_ref[3:3]),
    .LOCKUP(out_ref[2:2]),
    .SYSRESETREQ(out_ref[1:1]),
    .SLEEPING(out_ref[0:0])
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
    seed = 313734277;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
