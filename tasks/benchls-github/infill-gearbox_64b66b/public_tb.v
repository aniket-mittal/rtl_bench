// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gearbox_64b66b dut (
    .clk(clk),
    .reset(in_vec[64:64]),
    .i_data(in_vec[63:0]),
    .o_data(out_vec[66:1]),
    .o_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h1a4108f5a6bb69bd0;
    stim[1] = 65'h1f77d5f7032d38fd4;
    stim[2] = 65'h07e9a3d148400878f;
    stim[3] = 65'h0307198597184e36a;
    stim[4] = 65'h0af17982b3d548910;
    stim[5] = 65'h003cdb6df5e2d928f;
    stim[6] = 65'h06561cdfe5e3b74c0;
    stim[7] = 65'h083d1089f06df2660;
    stim[8] = 65'h14e33b0a9fb3a5240;
    stim[9] = 65'h03966bdcee76c8e61;
    stim[10] = 65'h0f5ea038a867f6eb5;
    stim[11] = 65'h0807c399a2d5d2a50;
    stim[12] = 65'h0001342bbb97d31a6;
    stim[13] = 65'h0e07f22b628f5cb4e;
    stim[14] = 65'h0b3d744e76b465083;
    stim[15] = 65'h0a56d2afebc7d2297;
    stim[16] = 65'h08dff8a2bac5a6743;
    stim[17] = 65'h07f08a651d4386636;
    stim[18] = 65'h00d3e75dd5511bd23;
    stim[19] = 65'h02c2756e3fde04294;
    stim[20] = 65'h08189519965970fb0;
    stim[21] = 65'h0f19503b6762294cb;
    stim[22] = 65'h045d7ca8b8754d8cb;
    stim[23] = 65'h09b8f3ce0b751b75b;
    stim[24] = 65'h029d88e18af9ca8eb;
    stim[25] = 65'h0b07aa8e8b132324c;
    stim[26] = 65'h023c7fceccdae0025;
    stim[27] = 65'h01895e0228a9c5330;
    stim[28] = 65'h0a224965a456bfed9;
    stim[29] = 65'h00eedd6ad0148df65;
    stim[30] = 65'h05a0f79cb603dc173;
    stim[31] = 65'h045203cc3cefb4188;
    stim[32] = 65'h0a1d40fbdd85ac653;
    stim[33] = 65'h099e06e1b6c622d7d;
    stim[34] = 65'h000c096736c86cf06;
    stim[35] = 65'h0c1b5f2207bd356c9;
    stim[36] = 65'h07e03c90ccee1939b;
    stim[37] = 65'h0753be4230ee74d6e;
    stim[38] = 65'h05f164c8535f11d99;
    stim[39] = 65'h00b8fa84c08fa5285;
    stim[40] = 65'h1e3a766d36bf1cb0f;
    stim[41] = 65'h17da8cb228ee96bc0;
    stim[42] = 65'h02054e8cdf5d070b4;
    stim[43] = 65'h05da899d8403511e9;
    stim[44] = 65'h00bea47d97e6cfb60;
    stim[45] = 65'h05fd06faab31940a3;
    stim[46] = 65'h0c7e12d6700a47d18;
    stim[47] = 65'h00108228c53edf4a5;
    stim[48] = 65'h09b03976cf6b8b7c3;
    stim[49] = 65'h0ed19b84225db7482;
    stim[50] = 65'h003ff9774f4811c4c;
    stim[51] = 65'h0c174b86c656285e4;
    stim[52] = 65'h0e76ad3b390b1a5eb;
    stim[53] = 65'h019e32f57625be2c1;
    stim[54] = 65'h061ea93fdaef7c7a5;
    stim[55] = 65'h077ebc5168582f6e0;
    stim[56] = 65'h0c1814b3d7ba84774;
    stim[57] = 65'h0d3cfd8080be901eb;
    stim[58] = 65'h09278d8eb7bd56e6d;
    stim[59] = 65'h09b8e4f5719908b47;
    stim[60] = 65'h08dd18db0aace55cf;
    stim[61] = 65'h07cbac758d6b36a89;
    stim[62] = 65'h07c2bd907122cc095;
    stim[63] = 65'h0d594cc4c78354d67;
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
      expv[0] = 67'hxxxxxxxxxxxxxxxxx;
      expv[1] = 67'hxxxxxxxxxxxxxxxxx;
      expv[2] = 67'hxxxxxxxxxxxxxxxxx;
      expv[3] = 67'hxxxxxxxxxxxxxxxxx;
      expv[4] = 67'h4fd347a2908010f1f;
      expv[5] = 67'h01838cc2cb8c271b5;
      expv[6] = 67'h1f5e2f30567aa9123;
      expv[7] = 67'h6001e6db6faf16c95;
      expv[8] = 67'h4c0cac39bfcbc76e9;
      expv[9] = 67'h12041e8844f836f93;
      expv[10] = 67'hxxxxxxxxxxxxxxxxx;
      expv[11] = 67'h272cd7b9dced91cc3;
      expv[12] = 67'h07af501c5433fb75b;
      expv[13] = 67'h4d00f873345aba54b;
      expv[14] = 67'h270009a15ddcbe98d;
      expv[15] = 67'h107c0fe456c51eb97;
      expv[16] = 67'h14bd9eba273b5a329;
      expv[17] = 67'h4e874ada55fd78fa5;
      expv[18] = 67'h331b46ffc515d62d3;
      expv[19] = 67'h37a46fe114ca3a871;
      expv[20] = 67'h0214a069f3aeeaa89;
      expv[21] = 67'h2e1f60584eadc7fbd;
      expv[22] = 67'h114a65c0c4a8ccb2d;
      expv[23] = 67'h6a9b197e32a076ced;
      expv[24] = 67'h3a8dbada2ebe545c3;
      expv[25] = 67'h5f3951d7371e79c17;
      expv[26] = 67'h5899192614ec470c5;
      expv[27] = 67'h19b5c004b60f551d1;
      expv[28] = 67'h1454e299811e3fe77;
      expv[29] = 67'h348ad7fdb2312bc05;
      expv[30] = 67'h5680a46fb2d1124b3;
      expv[31] = 67'h396c07b82e61ddbad;
      expv[32] = 67'h661e77da0c42d07bd;
      expv[33] = 67'h1f7bb0b58ca68a407;
      expv[34] = 67'h370db63116bed0ea1;
      expv[35] = 67'h12ce6d90d9e0d33c1;
      expv[36] = 67'h2f9103de9ab648061;
      expv[37] = 67'h0792199dc32737837;
      expv[38] = 67'h1df2118773a6b73f1;
      expv[39] = 67'h62c990a6be23b32eb;
      expv[40] = 67'h5c7d426047d2942af;
      expv[41] = 67'h474ecda6d7e3961e1;
      expv[42] = 67'hxxxxxxxxxxxxxxxxx;
      expv[43] = 67'hxxxxxxxxxxxxxxxxx;
      expv[44] = 67'h240a9d19beba0e169;
      expv[45] = 67'h02ed44cec201a88f5;
      expv[46] = 67'h4617d48fb2fcd9f6d;
      expv[47] = 67'h0c2fe837d5598ca05;
      expv[48] = 67'h14b8fc25ace0148fb;
      expv[49] = 67'h3e18084114629f6fb;
      expv[50] = 67'h690536072ed9ed717;
      expv[51] = 67'h0e26768cdc2112edb;
      expv[52] = 67'h50bc807ff2ee9e903;
      expv[53] = 67'h0d2f5e0ba5c3632b1;
      expv[54] = 67'h37c583ced5a767217;
      expv[55] = 67'h7be3d28cf197abb13;
      expv[56] = 67'h305edc0c3d527fb5d;
      expv[57] = 67'h5d423ba3bf5e28b43;
      expv[58] = 67'h17d203d78302967af;
      expv[59] = 67'h3deab736e9e7ec041;
      expv[60] = 67'h63321168f24f1b1d7;
      expv[61] = 67'h055672ae7cdc727ab;
      expv[62] = 67'h31ad66d5131ba31b7;
      expv[63] = 67'h038916604abe5d63b;
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
