// Hidden tests: 5000 cycles of seeded random inputs (seed 2624827494); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 15;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_127116 dut (
    .clk(clk),
    .reset(i_0),
    .address(i_1),
    .writedata(i_2),
    .write(i_3),
    .read(i_4),
    .chipselect(i_5),
    .usbClk(i_6),
    .USBWireVPI(i_7),
    .USBWireVMI(i_8),
    .readdata(out_dut[14:7]),
    .waitrequest(out_dut[6:6]),
    .irq(out_dut[5:5]),
    .USBWireVPO(out_dut[4:4]),
    .USBWireVMO(out_dut[3:3]),
    .USBWireDataOutTick(out_dut[2:2]),
    .USBWireOutEn_n(out_dut[1:1]),
    .USBFullSpeed(out_dut[0:0])
  );
  origen_127116__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .address(i_1),
    .writedata(i_2),
    .write(i_3),
    .read(i_4),
    .chipselect(i_5),
    .usbClk(i_6),
    .USBWireVPI(i_7),
    .USBWireVMI(i_8),
    .readdata(out_ref[14:7]),
    .waitrequest(out_ref[6:6]),
    .irq(out_ref[5:5]),
    .USBWireVPO(out_ref[4:4]),
    .USBWireVMO(out_ref[3:3]),
    .USBWireDataOutTick(out_ref[2:2]),
    .USBWireOutEn_n(out_ref[1:1]),
    .USBFullSpeed(out_ref[0:0])
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
    seed = 2624827494;
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
