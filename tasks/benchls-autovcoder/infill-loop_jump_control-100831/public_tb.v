// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 49;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_100831 dut (
    .ck(clk),
    .reset_n(in_vec[23:23]),
    .cntr_value(in_vec[22:15]),
    .cntr_load(in_vec[14:14]),
    .reg_select(in_vec[13:12]),
    .reg_load_select(in_vec[11:10]),
    .jump_value(in_vec[9:2]),
    .jump_load(in_vec[1:1]),
    .jump_check(in_vec[0:0]),
    .jump_taken(out_vec[48:48]),
    .jump_address(out_vec[47:40]),
    .cntr_3(out_vec[39:32]),
    .jump_ptr_0_export(out_vec[31:24]),
    .jump_ptr_1_export(out_vec[23:16]),
    .jump_cntr_0_export(out_vec[15:8]),
    .jump_cntr_1_export(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h501b80;
    stim[1] = 24'h7d7a7b;
    stim[2] = 24'h8a9f78;
    stim[3] = 24'hbd1da2;
    stim[4] = 24'hdb3794;
    stim[5] = 24'hc5f70d;
    stim[6] = 24'h87018c;
    stim[7] = 24'hed8a52;
    stim[8] = 24'h961247;
    stim[9] = 24'hef8902;
    stim[10] = 24'he1d685;
    stim[11] = 24'hf92bab;
    stim[12] = 24'he58307;
    stim[13] = 24'hf3d68f;
    stim[14] = 24'ha192ea;
    stim[15] = 24'hf20f42;
    stim[16] = 24'hbf8730;
    stim[17] = 24'haa8397;
    stim[18] = 24'h9e3bf9;
    stim[19] = 24'hfed83e;
    stim[20] = 24'he56648;
    stim[21] = 24'h95cb01;
    stim[22] = 24'hc3f4e2;
    stim[23] = 24'hc48c8c;
    stim[24] = 24'h93ce33;
    stim[25] = 24'h9292ea;
    stim[26] = 24'h9da69e;
    stim[27] = 24'h974891;
    stim[28] = 24'h989515;
    stim[29] = 24'ha45ff6;
    stim[30] = 24'ha91ec9;
    stim[31] = 24'h99ee15;
    stim[32] = 24'hffaebb;
    stim[33] = 24'hb8bc1f;
    stim[34] = 24'hb36699;
    stim[35] = 24'hadace4;
    stim[36] = 24'hce9713;
    stim[37] = 24'h117d28;
    stim[38] = 24'hbf306d;
    stim[39] = 24'hdd50db;
    stim[40] = 24'hed79a9;
    stim[41] = 24'hd1313b;
    stim[42] = 24'ha69b50;
    stim[43] = 24'hf331c1;
    stim[44] = 24'hab6e71;
    stim[45] = 24'h8d9064;
    stim[46] = 24'hf43259;
    stim[47] = 24'hb2d8d9;
    stim[48] = 24'hd72675;
    stim[49] = 24'hb683dd;
    stim[50] = 24'h820fff;
    stim[51] = 24'h911961;
    stim[52] = 24'hd0d7ed;
    stim[53] = 24'hfc62ca;
    stim[54] = 24'h903032;
    stim[55] = 24'hd77758;
    stim[56] = 24'h8e03c6;
    stim[57] = 24'hc0cc2e;
    stim[58] = 24'he79d69;
    stim[59] = 24'hd1ab79;
    stim[60] = 24'h8616d2;
    stim[61] = 24'hc04589;
    stim[62] = 24'he73a46;
    stim[63] = 24'ha310dd;
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
      expv[0] = 49'h0000000000000;
      expv[1] = 49'h0000000000000;
      expv[2] = 49'h0000000000000;
      expv[3] = 49'h0000000000000;
      expv[4] = 49'h0680000000000;
      expv[5] = 49'h0680000000000;
      expv[6] = 49'h000000000008b;
      expv[7] = 49'h000000000008b;
      expv[8] = 49'h100000000008b;
      expv[9] = 49'h091009100008a;
      expv[10] = 49'h100009100008a;
      expv[11] = 49'h04000910000c3;
      expv[12] = 49'h09100910000c3;
      expv[13] = 49'h10000c10000c3;
      expv[14] = 49'h0a300c1a300e7;
      expv[15] = 49'h0ba00baa300e7;
      expv[16] = 49'h0ba00baa300e7;
      expv[17] = 49'h0ba00baa300e7;
      expv[18] = 49'h0d000e5a300e7;
      expv[19] = 49'h0a300e5a300e7;
      expv[20] = 49'h00f00e5a300e7;
      expv[21] = 49'h0e500e5a300ca;
      expv[22] = 49'h0d000e5a300ca;
      expv[23] = 49'h0e500e5380087;
      expv[24] = 49'h0e500e5380087;
      expv[25] = 49'h03827e5380087;
      expv[26] = 49'h00f27ba380087;
      expv[27] = 49'h0ba27baa70087;
      expv[28] = 49'h1a727baa70087;
      expv[29] = 49'h0a727baa70086;
      expv[30] = 49'h1a748baa70086;
      expv[31] = 49'h10f48baa70085;
      expv[32] = 49'h10f33baa70085;
      expv[33] = 49'h1ae33baa70085;
      expv[34] = 49'h10f32baa70085;
      expv[35] = 49'h00f32baa70066;
      expv[36] = 49'h1a732baa70066;
      expv[37] = 49'h0000000000000;
      expv[38] = 49'h0000000000000;
      expv[39] = 49'h0000000000000;
      expv[40] = 49'h000003600ba00;
      expv[41] = 49'h000003600ba00;
      expv[42] = 49'h000004e00ba00;
      expv[43] = 49'h000004e00ba00;
      expv[44] = 49'h100004e00ba00;
      expv[45] = 49'h000564e00ba00;
      expv[46] = 49'h100564e00ba00;
      expv[47] = 49'h000554e00ba00;
      expv[48] = 49'h100554e00ba00;
      expv[49] = 49'h14e554e00ba00;
      expv[50] = 49'h14e554e00b900;
      expv[51] = 49'h000554e00b800;
      expv[52] = 49'h000554e00b800;
      expv[53] = 49'h000554e00b8a1;
      expv[54] = 49'h0ff55b200f8a1;
      expv[55] = 49'h0ff550c00f8a1;
      expv[56] = 49'h00c550c00f8ae;
      expv[57] = 49'h0f155f100f8ae;
      expv[58] = 49'h10081f100f8ae;
      expv[59] = 49'h10081f100f8ad;
      expv[60] = 49'h00081f100f8ad;
      expv[61] = 49'h1f181f1b4f8ad;
      expv[62] = 49'h00b81f1b4f780;
      expv[63] = 49'h1b481f1b4f780;
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
