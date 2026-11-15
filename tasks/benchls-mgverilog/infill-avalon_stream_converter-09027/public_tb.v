// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09027 dut (
    .clk(clk),
    .reset(in_vec[38:38]),
    .stream_in_data(in_vec[37:6]),
    .stream_in_startofpacket(in_vec[5:5]),
    .stream_in_endofpacket(in_vec[4:4]),
    .stream_in_empty(in_vec[3:2]),
    .stream_in_valid(in_vec[1:1]),
    .stream_out_ready(in_vec[0:0]),
    .stream_in_ready(out_vec[35:35]),
    .stream_out_data(out_vec[34:5]),
    .stream_out_startofpacket(out_vec[4:4]),
    .stream_out_endofpacket(out_vec[3:3]),
    .stream_out_empty(out_vec[2:1]),
    .stream_out_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h42fe99e2a2;
    stim[1] = 39'h4a2bc6dcb0;
    stim[2] = 39'h2dbde4455a;
    stim[3] = 39'h321fd59185;
    stim[4] = 39'h127a269b19;
    stim[5] = 39'h0c977e80d5;
    stim[6] = 39'h2a3596aa92;
    stim[7] = 39'h1a87be72ca;
    stim[8] = 39'h06c48bb810;
    stim[9] = 39'h38a20d39b7;
    stim[10] = 39'h1998e70414;
    stim[11] = 39'h2e3b735394;
    stim[12] = 39'h07311ef6bc;
    stim[13] = 39'h0c570310af;
    stim[14] = 39'h2f33f0960b;
    stim[15] = 39'h010ab73eb8;
    stim[16] = 39'h2b414f9d9b;
    stim[17] = 39'h0a508d4530;
    stim[18] = 39'h035d1b7366;
    stim[19] = 39'h2916d09420;
    stim[20] = 39'h2d0667bac5;
    stim[21] = 39'h055ed0625e;
    stim[22] = 39'h3bde99a841;
    stim[23] = 39'h2cde415362;
    stim[24] = 39'h09c3a93d45;
    stim[25] = 39'h369e306a88;
    stim[26] = 39'h0f0239e358;
    stim[27] = 39'h26e2164c11;
    stim[28] = 39'h01354046c8;
    stim[29] = 39'h37ec49a7d3;
    stim[30] = 39'h23a7edd3c9;
    stim[31] = 39'h3ef20f9954;
    stim[32] = 39'h0b45324097;
    stim[33] = 39'h04656817ba;
    stim[34] = 39'h30f71ad077;
    stim[35] = 39'h094ca26183;
    stim[36] = 39'h0510958773;
    stim[37] = 39'h03f94ec988;
    stim[38] = 39'h17a262a404;
    stim[39] = 39'h181952a260;
    stim[40] = 39'h12ce1d5028;
    stim[41] = 39'h0b8305d134;
    stim[42] = 39'h0a2d326a1d;
    stim[43] = 39'h34d8967af1;
    stim[44] = 39'h17d65b4321;
    stim[45] = 39'h3ad5496aeb;
    stim[46] = 39'h086ba88b17;
    stim[47] = 39'h16b43c8438;
    stim[48] = 39'h0a67376978;
    stim[49] = 39'h13659f11f3;
    stim[50] = 39'h02ff64ee33;
    stim[51] = 39'h35c9ed8e3e;
    stim[52] = 39'h0707793956;
    stim[53] = 39'h0579d85a59;
    stim[54] = 39'h29da339db7;
    stim[55] = 39'h2f743af970;
    stim[56] = 39'h3f2192b823;
    stim[57] = 39'h55d9450ee5;
    stim[58] = 39'h0ba9d57422;
    stim[59] = 39'h0c5238df7c;
    stim[60] = 39'h0ebc5773f6;
    stim[61] = 39'h29de167ae0;
    stim[62] = 39'h023a51c410;
    stim[63] = 39'h3b7de46e21;
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
      expv[0] = 36'hxxxxxxxxx;
      expv[1] = 36'h800000000;
      expv[2] = 36'h800000000;
      expv[3] = 36'hfbf230a8d;
      expv[4] = 36'hbfaaca322;
      expv[5] = 36'hf4735362c;
      expv[6] = 36'haebf5818a;
      expv[7] = 36'h6b6b4d549;
      expv[8] = 36'h6b6b4d549;
      expv[9] = 36'heb6b4d549;
      expv[10] = 36'h44468737b;
      expv[11] = 36'h44468737b;
      expv[12] = 36'h44468737b;
      expv[13] = 36'hc4468737b;
      expv[14] = 36'hae2182137;
      expv[15] = 36'h67f85ac25;
      expv[16] = 36'he7f85ac25;
      expv[17] = 36'h0287c3b2d;
      expv[18] = 36'h0287c3b2d;
      expv[19] = 36'h0287c3b2d;
      expv[20] = 36'h8287c3b2d;
      expv[21] = 36'h8c93d75e2;
      expv[22] = 36'hbda82c4cf;
      expv[23] = 36'hbd2ccd0c0;
      expv[24] = 36'hbca0a26b1;
      expv[25] = 36'h871497ae2;
      expv[26] = 36'hbc383d544;
      expv[27] = 36'h841cfc6cc;
      expv[28] = 36'hc44b29808;
      expv[29] = 36'heae020d84;
      expv[30] = 36'hd8c4c4fc9;
      expv[31] = 36'hcfd6f27a4;
      expv[32] = 36'he467c32aa;
      expv[33] = 36'h0a193810b;
      expv[34] = 36'h8a193810b;
      expv[35] = 36'hee6d6a0bb;
      expv[36] = 36'h991134341;
      expv[37] = 36'h212ac8e99;
      expv[38] = 36'h212ac8e99;
      expv[39] = 36'h212ac8e99;
      expv[40] = 36'h212ac8e99;
      expv[41] = 36'h212ac8e99;
      expv[42] = 36'ha12ac8e99;
      expv[43] = 36'hda593d44e;
      expv[44] = 36'hb12b2f5f8;
      expv[45] = 36'hacada8610;
      expv[46] = 36'haaa4a55d5;
      expv[47] = 36'h57545160b;
      expv[48] = 36'h57545160b;
      expv[49] = 36'hd7545160b;
      expv[50] = 36'hcb4f8a3b9;
      expv[51] = 36'h7ef275c59;
      expv[52] = 36'h7ef275c59;
      expv[53] = 36'hfef275c59;
      expv[54] = 36'hf3ec2b4ac;
      expv[55] = 36'h3439dbb3b;
      expv[56] = 36'hb439dbb3b;
      expv[57] = 36'hc3494f071;
      expv[58] = 36'h800000000;
      expv[59] = 36'h53caae871;
      expv[60] = 36'h53caae871;
      expv[61] = 36'h53caae871;
      expv[62] = 36'h53caae871;
      expv[63] = 36'hd3caae871;
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
