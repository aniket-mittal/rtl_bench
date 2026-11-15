// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09119 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h32b9f1953f9;
    stim[1] = 42'h1761819d590;
    stim[2] = 42'h2e055a0c128;
    stim[3] = 42'h3aac91712cd;
    stim[4] = 42'h0eb0c521860;
    stim[5] = 42'h2bed7598db6;
    stim[6] = 42'h177c4f778f2;
    stim[7] = 42'h189455a4498;
    stim[8] = 42'h2ae298a6613;
    stim[9] = 42'h1a35e6631ec;
    stim[10] = 42'h296b1057287;
    stim[11] = 42'h3e381a8c64b;
    stim[12] = 42'h18f4f9ba48e;
    stim[13] = 42'h1bc2e37bc32;
    stim[14] = 42'h1e950677751;
    stim[15] = 42'h3be5ca7fad1;
    stim[16] = 42'h28f5ddbce8c;
    stim[17] = 42'h0e5b3dc4fb6;
    stim[18] = 42'h00c13c1ddec;
    stim[19] = 42'h0b5fda5a1e9;
    stim[20] = 42'h029766806ad;
    stim[21] = 42'h14e35ae4ff0;
    stim[22] = 42'h31052ff6e6a;
    stim[23] = 42'h064d5f0338e;
    stim[24] = 42'h31f82043ac1;
    stim[25] = 42'h0a1252c0049;
    stim[26] = 42'h2d04f76ffc0;
    stim[27] = 42'h3492082e10a;
    stim[28] = 42'h3df1e09a209;
    stim[29] = 42'h226e9f64640;
    stim[30] = 42'h26e5069e0af;
    stim[31] = 42'h089bab98b33;
    stim[32] = 42'h221e683d505;
    stim[33] = 42'h1aa9fea1768;
    stim[34] = 42'h2ed66b30dd9;
    stim[35] = 42'h373a81a9518;
    stim[36] = 42'h2195adb78ff;
    stim[37] = 42'h129a5e774c0;
    stim[38] = 42'h3fd538e5a1b;
    stim[39] = 42'h3dc60085ff9;
    stim[40] = 42'h1be1acdc5fd;
    stim[41] = 42'h032dbcb93b2;
    stim[42] = 42'h028f3e2b6c8;
    stim[43] = 42'h2afbdd5e9e8;
    stim[44] = 42'h376f780fbd0;
    stim[45] = 42'h300ad2baf11;
    stim[46] = 42'h14ca77aaa05;
    stim[47] = 42'h19bfd91c25a;
    stim[48] = 42'h2c9f7b60ea2;
    stim[49] = 42'h019a5ec6caf;
    stim[50] = 42'h0aa91212814;
    stim[51] = 42'h3c8a71df663;
    stim[52] = 42'h06c42bb1ed0;
    stim[53] = 42'h278a95c74ee;
    stim[54] = 42'h225e45d8bb3;
    stim[55] = 42'h2cc43cf1fd2;
    stim[56] = 42'h230dd256f30;
    stim[57] = 42'h24be25023ab;
    stim[58] = 42'h1b950f70f14;
    stim[59] = 42'h3ec170dce6a;
    stim[60] = 42'h22e6bbce15e;
    stim[61] = 42'h288e96670f3;
    stim[62] = 42'h3f4d352c41e;
    stim[63] = 42'h2eee18449f7;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxxxxx;
      expv[3] = 51'hxxxxxxxxxxxxx;
      expv[4] = 51'hxxxxxxxxxx000;
      expv[5] = 51'hxxxxxxxxxx000;
      expv[6] = 51'hxxxxxxxxxx000;
      expv[7] = 51'hxxxxxxxxxx000;
      expv[8] = 51'hxxxxxxxxxx000;
      expv[9] = 51'h5714c53308020;
      expv[10] = 51'h5714c53308000;
      expv[11] = 51'h5714c53308000;
      expv[12] = 51'h71c0d46324000;
      expv[13] = 51'h71c0d46324000;
      expv[14] = 51'h5e171bde18020;
      expv[15] = 51'h5e171bde18000;
      expv[16] = 51'h5e171bde18000;
      expv[17] = 51'h5e171bde18000;
      expv[18] = 51'h5e171bde18000;
      expv[19] = 51'h5e171bde18000;
      expv[20] = 51'h5e171bde18000;
      expv[21] = 51'h14bb340356100;
      expv[22] = 51'h14bb340356000;
      expv[23] = 51'h14bb340356000;
      expv[24] = 51'h14bb340356000;
      expv[25] = 51'h14bb340356000;
      expv[26] = 51'h5092960024000;
      expv[27] = 51'h5092960024000;
      expv[28] = 51'h5092960024000;
      expv[29] = 51'h5092960024000;
      expv[30] = 51'h5092960024000;
      expv[31] = 51'h372834f056000;
      expv[32] = 51'h372834f056000;
      expv[33] = 51'h372834f056000;
      expv[34] = 51'h554ff50bb4020;
      expv[35] = 51'h554ff50bb4000;
      expv[36] = 51'h554ff50bb4000;
      expv[37] = 51'h554ff50bb4000;
      expv[38] = 51'h554ff50bb4000;
      expv[39] = 51'h554ff50bb4000;
      expv[40] = 51'h6e30042ffc000;
      expv[41] = 51'h6e30042ffc000;
      expv[42] = 51'h196de5c9d8100;
      expv[43] = 51'h196de5c9d8000;
      expv[44] = 51'h196de5c9d8000;
      expv[45] = 51'h3b7bc07de8100;
      expv[46] = 51'h3b7bc07de8000;
      expv[47] = 51'h3b7bc07de8000;
      expv[48] = 51'h3b7bc07de8000;
      expv[49] = 51'h3b7bc07de8000;
      expv[50] = 51'h3b7bc07de8000;
      expv[51] = 51'h554890940b000;
      expv[52] = 51'h554890940a000;
      expv[53] = 51'h554890940a000;
      expv[54] = 51'h554890940a000;
      expv[55] = 51'h12f22ec5d8010;
      expv[56] = 51'h12f22ec5d8000;
      expv[57] = 51'h186e92b798010;
      expv[58] = 51'h186e92b798000;
      expv[59] = 51'h186e92b798000;
      expv[60] = 51'h186e92b798000;
      expv[61] = 51'h1735de70ae010;
      expv[62] = 51'h1735de70ae000;
      expv[63] = 51'h7a69a9620e400;
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
