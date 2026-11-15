// Hidden tests: 5000 cycles of seeded random inputs (seed 1008810578); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 21;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_04138 dut (
    .clk(clk),
    .rst(i_0),
    .deposited(i_1),
    .selected(i_2),
    .cancel(i_3),
    .maintenance(i_4),
    .purchase(i_5),
    .ldRdeposit(out_dut[20:20]),
    .ldRselect(out_dut[19:19]),
    .ldRprice(out_dut[18:18]),
    .ldA(out_dut[17:17]),
    .ldRproduct(out_dut[16:16]),
    .ldRchange(out_dut[15:15]),
    .ldRpurchase(out_dut[14:14]),
    .ldMprice(out_dut[13:13]),
    .ldMquantity(out_dut[12:12]),
    .clrRdeposit(out_dut[11:11]),
    .clrRselect(out_dut[10:10]),
    .clrRprice(out_dut[9:9]),
    .clrA(out_dut[8:8]),
    .clrRproduct(out_dut[7:7]),
    .clrRchange(out_dut[6:6]),
    .clrRpurchase(out_dut[5:5]),
    .refundall(out_dut[4:4]),
    .depositall(out_dut[3:3]),
    .state(out_dut[2:0])
  );
  mg_04138__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .deposited(i_1),
    .selected(i_2),
    .cancel(i_3),
    .maintenance(i_4),
    .purchase(i_5),
    .ldRdeposit(out_ref[20:20]),
    .ldRselect(out_ref[19:19]),
    .ldRprice(out_ref[18:18]),
    .ldA(out_ref[17:17]),
    .ldRproduct(out_ref[16:16]),
    .ldRchange(out_ref[15:15]),
    .ldRpurchase(out_ref[14:14]),
    .ldMprice(out_ref[13:13]),
    .ldMquantity(out_ref[12:12]),
    .clrRdeposit(out_ref[11:11]),
    .clrRselect(out_ref[10:10]),
    .clrRprice(out_ref[9:9]),
    .clrA(out_ref[8:8]),
    .clrRproduct(out_ref[7:7]),
    .clrRchange(out_ref[6:6]),
    .clrRpurchase(out_ref[5:5]),
    .refundall(out_ref[4:4]),
    .depositall(out_ref[3:3]),
    .state(out_ref[2:0])
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
    seed = 1008810578;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
