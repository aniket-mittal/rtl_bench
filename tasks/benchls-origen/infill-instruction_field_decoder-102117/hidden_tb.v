// Hidden tests: 5000 cycles of seeded random inputs (seed 357419120); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 104;
  reg clk;
  reg [63:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_102117 dut (
    .instruction(i_0),
    .opcode(out_dut[103:98]),
    .func(out_dut[97:88]),
    .Store_or_load_address(out_dut[87:66]),
    .Data_register_or_address(out_dut[65:44]),
    .Image_Buffer_Register(out_dut[43:22]),
    .Resize_Reg_1(out_dut[21:11]),
    .Resize_Reg_2(out_dut[10:0])
  );
  origen_102117__ref ref_i (
    .instruction(i_0),
    .opcode(out_ref[103:98]),
    .func(out_ref[97:88]),
    .Store_or_load_address(out_ref[87:66]),
    .Data_register_or_address(out_ref[65:44]),
    .Image_Buffer_Register(out_ref[43:22]),
    .Resize_Reg_1(out_ref[21:11]),
    .Resize_Reg_2(out_ref[10:0])
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
    seed = 357419120;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
