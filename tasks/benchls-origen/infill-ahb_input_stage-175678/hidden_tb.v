// Hidden tests: 5000 cycles of seeded random inputs (seed 120007596); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 49;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [1:0] i_2;
  reg [0:0] i_3;
  reg [2:0] i_4;
  reg [2:0] i_5;
  reg [3:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [1:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_175678 dut (
    .HCLK(clk),
    .HRESETn(i_0),
    .HADDR(i_1),
    .HTRANS(i_2),
    .HWRITE(i_3),
    .HSIZE(i_4),
    .HBURST(i_5),
    .HPROT(i_6),
    .HREADY(i_7),
    .ACTIVE_Decoder(i_8),
    .HREADYOUT_Decoder(i_9),
    .HRESP_Decoder(i_10),
    .HREADYOUT(out_dut[48:48]),
    .HRESP(out_dut[47:46]),
    .HADDR_Inputstage(out_dut[45:14]),
    .HTRANS_Inputstage(out_dut[13:12]),
    .HWRITE_Inputstage(out_dut[11:11]),
    .HSIZE_Inputstage(out_dut[10:8]),
    .HBURST_Inputstage(out_dut[7:5]),
    .HPROT_Inputstage(out_dut[4:1]),
    .TRANS_HOLD(out_dut[0:0])
  );
  origen_175678__ref ref_i (
    .HCLK(clk),
    .HRESETn(i_0),
    .HADDR(i_1),
    .HTRANS(i_2),
    .HWRITE(i_3),
    .HSIZE(i_4),
    .HBURST(i_5),
    .HPROT(i_6),
    .HREADY(i_7),
    .ACTIVE_Decoder(i_8),
    .HREADYOUT_Decoder(i_9),
    .HRESP_Decoder(i_10),
    .HREADYOUT(out_ref[48:48]),
    .HRESP(out_ref[47:46]),
    .HADDR_Inputstage(out_ref[45:14]),
    .HTRANS_Inputstage(out_ref[13:12]),
    .HWRITE_Inputstage(out_ref[11:11]),
    .HSIZE_Inputstage(out_ref[10:8]),
    .HBURST_Inputstage(out_ref[7:5]),
    .HPROT_Inputstage(out_ref[4:1]),
    .TRANS_HOLD(out_ref[0:0])
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
    seed = 120007596;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
