// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_093732 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .sclk_en(in_vec[36:36]),
    .if_write_ce(in_vec[35:35]),
    .if_write(in_vec[34:34]),
    .if_din(in_vec[33:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[33:33]),
    .if_empty_n(out_vec[32:32]),
    .if_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h2dac390a91;
    stim[1] = 38'h30543bed53;
    stim[2] = 38'h12f0d7995c;
    stim[3] = 38'h12815332cf;
    stim[4] = 38'h020de743f8;
    stim[5] = 38'h130e860929;
    stim[6] = 38'h1f432f075b;
    stim[7] = 38'h1af80297c4;
    stim[8] = 38'h152be5e1a0;
    stim[9] = 38'h02018667eb;
    stim[10] = 38'h076a07da81;
    stim[11] = 38'h0109a483c1;
    stim[12] = 38'h16d1f022d2;
    stim[13] = 38'h0f94613a37;
    stim[14] = 38'h0ab0b79498;
    stim[15] = 38'h07b5aa36ca;
    stim[16] = 38'h0de06a057a;
    stim[17] = 38'h1c27209aa0;
    stim[18] = 38'h00d5166319;
    stim[19] = 38'h10cae5939b;
    stim[20] = 38'h024b4caa58;
    stim[21] = 38'h0ffafe0166;
    stim[22] = 38'h035492797f;
    stim[23] = 38'h078102284d;
    stim[24] = 38'h1050ea5672;
    stim[25] = 38'h111fae3bce;
    stim[26] = 38'h1ecb336ee5;
    stim[27] = 38'h04cbab3ecf;
    stim[28] = 38'h0ab6d67951;
    stim[29] = 38'h1ab85dd985;
    stim[30] = 38'h1239f1fa96;
    stim[31] = 38'h1f4d051264;
    stim[32] = 38'h11684c3ac2;
    stim[33] = 38'h18e60461ec;
    stim[34] = 38'h1944b6b55a;
    stim[35] = 38'h13306925ff;
    stim[36] = 38'h02f6a475ea;
    stim[37] = 38'h13eeba82ab;
    stim[38] = 38'h1b5a407aee;
    stim[39] = 38'h0bca26e114;
    stim[40] = 38'h0501e5744f;
    stim[41] = 38'h07fafe48bf;
    stim[42] = 38'h037cf0aae0;
    stim[43] = 38'h0e573b9e9c;
    stim[44] = 38'h13b352d0fc;
    stim[45] = 38'h12b60b34be;
    stim[46] = 38'h0c64d19f9a;
    stim[47] = 38'h15366f477d;
    stim[48] = 38'h1f9039914e;
    stim[49] = 38'h1b49272879;
    stim[50] = 38'h24ad15f3f4;
    stim[51] = 38'h0f2091f3ee;
    stim[52] = 38'h067076d35f;
    stim[53] = 38'h0726e363db;
    stim[54] = 38'h0ed5a681c6;
    stim[55] = 38'h1f5bae7809;
    stim[56] = 38'h1fe055f581;
    stim[57] = 38'h0ff3c7cb42;
    stim[58] = 38'h170bfaf9ea;
    stim[59] = 38'h1dfa2f863b;
    stim[60] = 38'h0fd3fac885;
    stim[61] = 38'h1e6e7d3ea1;
    stim[62] = 38'h010498f64a;
    stim[63] = 38'h0981c54f7d;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h200000000;
      expv[13] = 34'h3d0cbc1d6;
      expv[14] = 34'h3d0cbc1d6;
      expv[15] = 34'h3d0cbc1d6;
      expv[16] = 34'h3d0cbc1d6;
      expv[17] = 34'h3d0cbc1d6;
      expv[18] = 34'h3d0cbc1d6;
      expv[19] = 34'h3d0cbc1d6;
      expv[20] = 34'h309c826a8;
      expv[21] = 34'h309c826a8;
      expv[22] = 34'h309c826a8;
      expv[23] = 34'h309c826a8;
      expv[24] = 34'h309c826a8;
      expv[25] = 34'h309c826a8;
      expv[26] = 34'h309c826a8;
      expv[27] = 34'h309c826a8;
      expv[28] = 34'h309c826a8;
      expv[29] = 34'h309c826a8;
      expv[30] = 34'h309c826a8;
      expv[31] = 34'h309c826a8;
      expv[32] = 34'h309c826a8;
      expv[33] = 34'h309c826a8;
      expv[34] = 34'h309c826a8;
      expv[35] = 34'h309c826a8;
      expv[36] = 34'h3b2ccdbb9;
      expv[37] = 34'h3b2ccdbb9;
      expv[38] = 34'h3d3414499;
      expv[39] = 34'h3d3414499;
      expv[40] = 34'h3d3414499;
      expv[41] = 34'h3d3414499;
      expv[42] = 34'h3d3414499;
      expv[43] = 34'h3d3414499;
      expv[44] = 34'h3d3414499;
      expv[45] = 34'h3d3414499;
      expv[46] = 34'h3d3414499;
      expv[47] = 34'h3d3414499;
      expv[48] = 34'h3d3414499;
      expv[49] = 34'h3d3414499;
      expv[50] = 34'h3d3414499;
      expv[51] = 34'h200000000;
      expv[52] = 34'h200000000;
      expv[53] = 34'h200000000;
      expv[54] = 34'h200000000;
      expv[55] = 34'h200000000;
      expv[56] = 34'h200000000;
      expv[57] = 34'h200000000;
      expv[58] = 34'h200000000;
      expv[59] = 34'h3f8157d60;
      expv[60] = 34'h3f8157d60;
      expv[61] = 34'h3f8157d60;
      expv[62] = 34'h3f8157d60;
      expv[63] = 34'h3f8157d60;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
