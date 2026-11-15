// Hidden tests: 5000 cycles of seeded random inputs (seed 3296882013); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 97;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [15:0] i_2;
  reg [0:0] i_3;
  reg [1:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_06909 dut (
    .HCLK(clk),
    .HRESETn(i_0),
    .READ(i_1),
    .HRDATA(i_2),
    .HREADY(i_3),
    .HRESP(i_4),
    .DATAOUT(out_dut[96:81]),
    .HADDR(out_dut[80:49]),
    .HTRANS(out_dut[48:47]),
    .HWRITE(out_dut[46:46]),
    .HSIZE(out_dut[45:43]),
    .HBURST(out_dut[42:40]),
    .HPROT(out_dut[39:36]),
    .HWDATA(out_dut[35:4]),
    .RESP_err(out_dut[3:2]),
    .AHB_BUSY(out_dut[1:1]),
    .VALID(out_dut[0:0])
  );
  rtlpp_06909__ref ref_i (
    .HCLK(clk),
    .HRESETn(i_0),
    .READ(i_1),
    .HRDATA(i_2),
    .HREADY(i_3),
    .HRESP(i_4),
    .DATAOUT(out_ref[96:81]),
    .HADDR(out_ref[80:49]),
    .HTRANS(out_ref[48:47]),
    .HWRITE(out_ref[46:46]),
    .HSIZE(out_ref[45:43]),
    .HBURST(out_ref[42:40]),
    .HPROT(out_ref[39:36]),
    .HWDATA(out_ref[35:4]),
    .RESP_err(out_ref[3:2]),
    .AHB_BUSY(out_ref[1:1]),
    .VALID(out_ref[0:0])
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
    seed = 3296882013;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
