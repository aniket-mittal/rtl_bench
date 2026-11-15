// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06575 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[47:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h04abf43faba;
    stim[1] = 42'h3ec79b2147d;
    stim[2] = 42'h2103ef592b7;
    stim[3] = 42'h25bd12f9f94;
    stim[4] = 42'h0fdf5987df2;
    stim[5] = 42'h39c9c921c5a;
    stim[6] = 42'h1ff9007d9e2;
    stim[7] = 42'h1de590d80bf;
    stim[8] = 42'h06af8f94b00;
    stim[9] = 42'h1edd9e12dc5;
    stim[10] = 42'h29d050b6ab1;
    stim[11] = 42'h03a2b2136f9;
    stim[12] = 42'h3795b8b19ad;
    stim[13] = 42'h0bd2b7b68fd;
    stim[14] = 42'h30638b4c92a;
    stim[15] = 42'h13ebd442cf9;
    stim[16] = 42'h36f77322ad5;
    stim[17] = 42'h314fcac80f5;
    stim[18] = 42'h2ef6702b77c;
    stim[19] = 42'h10d844296f6;
    stim[20] = 42'h311eb4edfac;
    stim[21] = 42'h1477951bc9f;
    stim[22] = 42'h31d361f50dc;
    stim[23] = 42'h2a8b3e3f905;
    stim[24] = 42'h124e0f36e17;
    stim[25] = 42'h0657225fb02;
    stim[26] = 42'h31f0e63022e;
    stim[27] = 42'h0122946fdd7;
    stim[28] = 42'h191c6776ef0;
    stim[29] = 42'h30101fbd1a1;
    stim[30] = 42'h189bf752ce6;
    stim[31] = 42'h3b27acddba9;
    stim[32] = 42'h06e4df1f652;
    stim[33] = 42'h07b5d5ba9b7;
    stim[34] = 42'h0126edcfb7e;
    stim[35] = 42'h2a7137466ff;
    stim[36] = 42'h11b21e86a3a;
    stim[37] = 42'h3d0f9f4d0b8;
    stim[38] = 42'h2d5dffe630b;
    stim[39] = 42'h25741605ab6;
    stim[40] = 42'h1f01aa0ba30;
    stim[41] = 42'h2a609b65b65;
    stim[42] = 42'h3a2e5a2c3d7;
    stim[43] = 42'h019b2ee37a6;
    stim[44] = 42'h3e4462a24aa;
    stim[45] = 42'h050d680f439;
    stim[46] = 42'h07a32d9c35a;
    stim[47] = 42'h04408f581fa;
    stim[48] = 42'h299d040e870;
    stim[49] = 42'h19cf9622d15;
    stim[50] = 42'h2116f6b4da0;
    stim[51] = 42'h2e69b93da6a;
    stim[52] = 42'h372db2c3a02;
    stim[53] = 42'h16e93485044;
    stim[54] = 42'h2de01f410f7;
    stim[55] = 42'h29abaa1f0a3;
    stim[56] = 42'h08d70bb5369;
    stim[57] = 42'h3a3aec4b965;
    stim[58] = 42'h39b67313fb8;
    stim[59] = 42'h2ef85f7dd01;
    stim[60] = 42'h1304c4f5e1a;
    stim[61] = 42'h14969274567;
    stim[62] = 42'h3191d0022f4;
    stim[63] = 42'h2027b109711;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxx00;
      expv[4] = 48'h5bd12f9f9404;
      expv[5] = 48'h5bd12f9f9400;
      expv[6] = 48'h9c9c921c5a00;
      expv[7] = 48'h9c9c921c5800;
      expv[8] = 48'h9c9c921c5800;
      expv[9] = 48'h9c9c921c5800;
      expv[10] = 48'h9c9c921c5800;
      expv[11] = 48'h9c9c921c5800;
      expv[12] = 48'h9c9c921c5800;
      expv[13] = 48'h9c9c921c5800;
      expv[14] = 48'h9c9c921c5800;
      expv[15] = 48'h9c9c921c5800;
      expv[16] = 48'h3ebd442cf808;
      expv[17] = 48'h3ebd442cf800;
      expv[18] = 48'h3ebd442cf800;
      expv[19] = 48'h3ebd442cf800;
      expv[20] = 48'h3ebd442cf800;
      expv[21] = 48'h11eb4edfac10;
      expv[22] = 48'h11eb4edfac00;
      expv[23] = 48'h1d361f50dc10;
      expv[24] = 48'h1d361f50dc00;
      expv[25] = 48'h1d361f50dc00;
      expv[26] = 48'h657225fb0000;
      expv[27] = 48'h657225fb0000;
      expv[28] = 48'h657225fb0000;
      expv[29] = 48'h657225fb0000;
      expv[30] = 48'h657225fb0000;
      expv[31] = 48'h657225fb0000;
      expv[32] = 48'hb27acddba800;
      expv[33] = 48'hb27acddba800;
      expv[34] = 48'h7b5d5ba9b420;
      expv[35] = 48'h7b5d5ba9b400;
      expv[36] = 48'h7b5d5ba9b400;
      expv[37] = 48'h7b5d5ba9b400;
      expv[38] = 48'h7b5d5ba9b400;
      expv[39] = 48'h7b5d5ba9b400;
      expv[40] = 48'h5741605ab404;
      expv[41] = 48'h5741605ab400;
      expv[42] = 48'h5741605ab400;
      expv[43] = 48'h5741605ab400;
      expv[44] = 48'h19b2ee37a410;
      expv[45] = 48'h19b2ee37a400;
      expv[46] = 48'h19b2ee37a400;
      expv[47] = 48'h19b2ee37a400;
      expv[48] = 48'h4408f581f801;
      expv[49] = 48'h4408f581f800;
      expv[50] = 48'h4408f581f800;
      expv[51] = 48'h4408f581f800;
      expv[52] = 48'h4408f581f800;
      expv[53] = 48'h72db2c3a0002;
      expv[54] = 48'h72db2c3a0000;
      expv[55] = 48'h72db2c3a0000;
      expv[56] = 48'h9abaa1f0a200;
      expv[57] = 48'h9abaa1f0a000;
      expv[58] = 48'h9abaa1f0a000;
      expv[59] = 48'h9abaa1f0a000;
      expv[60] = 48'h9abaa1f0a000;
      expv[61] = 48'h9abaa1f0a000;
      expv[62] = 48'h496927456400;
      expv[63] = 48'h496927456400;
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
