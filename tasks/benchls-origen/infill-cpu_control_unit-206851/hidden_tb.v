// Hidden tests: 5000 cycles of seeded random inputs (seed 660569642); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 21;
  reg clk;
  reg [7:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_206851 dut (
    .clk(clk),
    .IR_Input(i_0),
    .flag(i_1),
    .C_Bus_CU(out_dut[20:16]),
    .B_Bus_CU(out_dut[15:11]),
    .DATA_Con_CU(out_dut[10:8]),
    .ALU_CU(out_dut[7:4]),
    .Reg_Inc_CU(out_dut[3:1]),
    .IR_Load(out_dut[0:0])
  );
  origen_206851__ref ref_i (
    .clk(clk),
    .IR_Input(i_0),
    .flag(i_1),
    .C_Bus_CU(out_ref[20:16]),
    .B_Bus_CU(out_ref[15:11]),
    .DATA_Con_CU(out_ref[10:8]),
    .ALU_CU(out_ref[7:4]),
    .Reg_Inc_CU(out_ref[3:1]),
    .IR_Load(out_ref[0:0])
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
    seed = 660569642;
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
