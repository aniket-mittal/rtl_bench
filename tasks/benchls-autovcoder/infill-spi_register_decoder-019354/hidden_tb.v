// Hidden tests: 5000 cycles of seeded random inputs (seed 1476478218); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 192;
  reg clk;
  reg [15:0] i_0;
  reg [7:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_019354 dut (
    .isData(clk),
    .SPI_data(i_0),
    .N(i_1),
    .CMD1(out_dut[191:176]),
    .CMD2(out_dut[175:160]),
    .Eth_I_max(out_dut[159:144]),
    .Eth_I_min(out_dut[143:128]),
    .Eth_Temp_max(out_dut[127:112]),
    .Eth_I_work(out_dut[111:96]),
    .Eth_kor(out_dut[95:80]),
    .Eth_Imp_time(out_dut[79:64]),
    .Eth_Start(out_dut[63:48]),
    .Eth_Full_stop(out_dut[47:32]),
    .Eth_Calibr(out_dut[31:16]),
    .Eth_Ch_num(out_dut[15:0])
  );
  autovcoder_019354__ref ref_i (
    .isData(clk),
    .SPI_data(i_0),
    .N(i_1),
    .CMD1(out_ref[191:176]),
    .CMD2(out_ref[175:160]),
    .Eth_I_max(out_ref[159:144]),
    .Eth_I_min(out_ref[143:128]),
    .Eth_Temp_max(out_ref[127:112]),
    .Eth_I_work(out_ref[111:96]),
    .Eth_kor(out_ref[95:80]),
    .Eth_Imp_time(out_ref[79:64]),
    .Eth_Start(out_ref[63:48]),
    .Eth_Full_stop(out_ref[47:32]),
    .Eth_Calibr(out_ref[31:16]),
    .Eth_Ch_num(out_ref[15:0])
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
    seed = 1476478218;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
