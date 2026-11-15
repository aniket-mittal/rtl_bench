// Hidden tests: 5000 cycles of seeded random inputs (seed 917981915); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 128;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [8:0] i_16;
  reg [8:0] i_17;
  reg [8:0] i_18;
  reg [8:0] i_19;
  reg [8:0] i_20;
  reg [8:0] i_21;
  reg [8:0] i_22;
  reg [8:0] i_23;
  reg [15:0] i_24;
  reg [15:0] i_25;
  reg [15:0] i_26;
  reg [15:0] i_27;
  reg [15:0] i_28;
  reg [15:0] i_29;
  reg [15:0] i_30;
  reg [15:0] i_31;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_087772 dut (
    .clk(clk),
    .write_en1(i_0),
    .write_en2(i_1),
    .write_en3(i_2),
    .write_en4(i_3),
    .write_en5(i_4),
    .write_en6(i_5),
    .write_en7(i_6),
    .write_en8(i_7),
    .read_en1(i_8),
    .read_en2(i_9),
    .read_en3(i_10),
    .read_en4(i_11),
    .read_en5(i_12),
    .read_en6(i_13),
    .read_en7(i_14),
    .read_en8(i_15),
    .addr1(i_16),
    .addr2(i_17),
    .addr3(i_18),
    .addr4(i_19),
    .addr5(i_20),
    .addr6(i_21),
    .addr7(i_22),
    .addr8(i_23),
    .Data_in1(i_24),
    .Data_in2(i_25),
    .Data_in3(i_26),
    .Data_in4(i_27),
    .Data_in5(i_28),
    .Data_in6(i_29),
    .Data_in7(i_30),
    .Data_in8(i_31),
    .Data_out1(out_dut[127:112]),
    .Data_out2(out_dut[111:96]),
    .Data_out3(out_dut[95:80]),
    .Data_out4(out_dut[79:64]),
    .Data_out5(out_dut[63:48]),
    .Data_out6(out_dut[47:32]),
    .Data_out7(out_dut[31:16]),
    .Data_out8(out_dut[15:0])
  );
  autovcoder_087772__ref ref_i (
    .clk(clk),
    .write_en1(i_0),
    .write_en2(i_1),
    .write_en3(i_2),
    .write_en4(i_3),
    .write_en5(i_4),
    .write_en6(i_5),
    .write_en7(i_6),
    .write_en8(i_7),
    .read_en1(i_8),
    .read_en2(i_9),
    .read_en3(i_10),
    .read_en4(i_11),
    .read_en5(i_12),
    .read_en6(i_13),
    .read_en7(i_14),
    .read_en8(i_15),
    .addr1(i_16),
    .addr2(i_17),
    .addr3(i_18),
    .addr4(i_19),
    .addr5(i_20),
    .addr6(i_21),
    .addr7(i_22),
    .addr8(i_23),
    .Data_in1(i_24),
    .Data_in2(i_25),
    .Data_in3(i_26),
    .Data_in4(i_27),
    .Data_in5(i_28),
    .Data_in6(i_29),
    .Data_in7(i_30),
    .Data_in8(i_31),
    .Data_out1(out_ref[127:112]),
    .Data_out2(out_ref[111:96]),
    .Data_out3(out_ref[95:80]),
    .Data_out4(out_ref[79:64]),
    .Data_out5(out_ref[63:48]),
    .Data_out6(out_ref[47:32]),
    .Data_out7(out_ref[31:16]),
    .Data_out8(out_ref[15:0])
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
    seed = 917981915;
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
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      i_27 = {$random(seed)};
      i_28 = {$random(seed)};
      i_29 = {$random(seed)};
      i_30 = {$random(seed)};
      i_31 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
