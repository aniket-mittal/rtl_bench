// Hidden tests: 5000 cycles of seeded random inputs (seed 910487859); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 78;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [9:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [3:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [22:0] i_18;
  reg [15:0] i_19;
  reg [15:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  reg [22:0] i_24;
  reg [0:0] i_25;
  reg [1:0] i_26;
  reg [15:0] i_27;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_07329 dut (
    .clk(clk),
    .clk7_en(i_0),
    .clk7n_en(i_1),
    .blk(i_2),
    .c1(i_3),
    .c3(i_4),
    .eclk(i_5),
    .vpa(i_6),
    .dbr(i_7),
    .dbs(i_8),
    .xbs(i_9),
    .nrdy(i_10),
    .cck(i_11),
    .cpu_speed(i_12),
    .memory_config(i_13),
    ._as(i_14),
    ._lds(i_15),
    ._uds(i_16),
    .r_w(i_17),
    .address(i_18),
    .cpudatain(i_19),
    .data_in(i_20),
    ._cpu_reset(i_21),
    .cpu_halt(i_22),
    .host_cs(i_23),
    .host_adr(i_24),
    .host_we(i_25),
    .host_bs(i_26),
    .host_wdat(i_27),
    .bls(out_dut[77:77]),
    .turbo(out_dut[76:76]),
    ._dtack(out_dut[75:75]),
    .rd(out_dut[74:74]),
    .hwr(out_dut[73:73]),
    .lwr(out_dut[72:72]),
    .address_out(out_dut[71:49]),
    .data(out_dut[48:33]),
    .data_out(out_dut[32:17]),
    .host_rdat(out_dut[16:1]),
    .host_ack(out_dut[0:0])
  );
  mg_07329__ref ref_i (
    .clk(clk),
    .clk7_en(i_0),
    .clk7n_en(i_1),
    .blk(i_2),
    .c1(i_3),
    .c3(i_4),
    .eclk(i_5),
    .vpa(i_6),
    .dbr(i_7),
    .dbs(i_8),
    .xbs(i_9),
    .nrdy(i_10),
    .cck(i_11),
    .cpu_speed(i_12),
    .memory_config(i_13),
    ._as(i_14),
    ._lds(i_15),
    ._uds(i_16),
    .r_w(i_17),
    .address(i_18),
    .cpudatain(i_19),
    .data_in(i_20),
    ._cpu_reset(i_21),
    .cpu_halt(i_22),
    .host_cs(i_23),
    .host_adr(i_24),
    .host_we(i_25),
    .host_bs(i_26),
    .host_wdat(i_27),
    .bls(out_ref[77:77]),
    .turbo(out_ref[76:76]),
    ._dtack(out_ref[75:75]),
    .rd(out_ref[74:74]),
    .hwr(out_ref[73:73]),
    .lwr(out_ref[72:72]),
    .address_out(out_ref[71:49]),
    .data(out_ref[48:33]),
    .data_out(out_ref[32:17]),
    .host_rdat(out_ref[16:1]),
    .host_ack(out_ref[0:0])
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
    seed = 910487859;
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
      i_21 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      i_27 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
