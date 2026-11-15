// Hidden tests: 5000 cycles of seeded random inputs (seed 1679827093); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 17;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_102879 dut (
    .SD_clk(clk),
    .SD_dataout(i_0),
    .sec(i_1),
    .read_req(i_2),
    .init(i_3),
    .SD_cs(out_dut[16:16]),
    .SD_datain(out_dut[15:15]),
    .mydata_o(out_dut[14:7]),
    .myvalid_o(out_dut[6:6]),
    .data_come(out_dut[5:5]),
    .mystate(out_dut[4:1]),
    .read_o(out_dut[0:0])
  );
  autovcoder_102879__ref ref_i (
    .SD_clk(clk),
    .SD_dataout(i_0),
    .sec(i_1),
    .read_req(i_2),
    .init(i_3),
    .SD_cs(out_ref[16:16]),
    .SD_datain(out_ref[15:15]),
    .mydata_o(out_ref[14:7]),
    .myvalid_o(out_ref[6:6]),
    .data_come(out_ref[5:5]),
    .mystate(out_ref[4:1]),
    .read_o(out_ref[0:0])
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
    seed = 1679827093;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
