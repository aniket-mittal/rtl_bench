// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011729 dut (
    .clk(clk),
    .address(in_vec[69:38]),
    .write(in_vec[37:37]),
    .read(in_vec[36:36]),
    .writedata(in_vec[35:4]),
    .byteenable(in_vec[3:0]),
    .waitrequest(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h0968c2ec5f6dabcda7;
    stim[1] = 70'h15c5159fb201097aea;
    stim[2] = 70'h33a70513358c300dbb;
    stim[3] = 70'h0c92572d2cf9802dc1;
    stim[4] = 70'h069220e02a5d7cc744;
    stim[5] = 70'h39646f168a1a228676;
    stim[6] = 70'h36599d75900ea06e5f;
    stim[7] = 70'h0fd98b4765f2454d57;
    stim[8] = 70'h1e6f5d6c350544558a;
    stim[9] = 70'h11ef074b4997df0975;
    stim[10] = 70'h3a986337f9aa5f13b1;
    stim[11] = 70'h336afe49190866a7eb;
    stim[12] = 70'h35ddc7bf4bcbf8565d;
    stim[13] = 70'h3146db3c9342ac345c;
    stim[14] = 70'h0e5f06105ca32e716a;
    stim[15] = 70'h2a7ae1b2d88d7aecd0;
    stim[16] = 70'h2817fd589e746b8cda;
    stim[17] = 70'h214b0191e9109b7603;
    stim[18] = 70'h2704fb83dfaa8c5373;
    stim[19] = 70'h35c4b7e48990b94dbb;
    stim[20] = 70'h384aefbc06f58b6281;
    stim[21] = 70'h3497f58f5086772dc0;
    stim[22] = 70'h32110388f960f84405;
    stim[23] = 70'h000a2f452e78db2039;
    stim[24] = 70'h3bc0c54fdf551fa119;
    stim[25] = 70'h0fa06ce71b0234ec5e;
    stim[26] = 70'h00b791c6d7367f7504;
    stim[27] = 70'h387cc7e1bb7d1f0875;
    stim[28] = 70'h2ec86d6c028508469c;
    stim[29] = 70'h2ec6c12f2aee4389a9;
    stim[30] = 70'h05dece58e97d532196;
    stim[31] = 70'h3a97f9b3cb9d660b3c;
    stim[32] = 70'h051d7d317b542b1ab9;
    stim[33] = 70'h000177a1b735817286;
    stim[34] = 70'h3891b8f231c2edd462;
    stim[35] = 70'h059ab41dc55cf5f11c;
    stim[36] = 70'h19d8d264ceb4584275;
    stim[37] = 70'h3f372af9867f55dead;
    stim[38] = 70'h2909d73378e47494b4;
    stim[39] = 70'h097ded197a6e103ca3;
    stim[40] = 70'h244c3763976339e363;
    stim[41] = 70'h0aabf11e030e3199a1;
    stim[42] = 70'h1a43de9013626e038b;
    stim[43] = 70'h01f32066031eca4aa2;
    stim[44] = 70'h226f5b4f05db8716ce;
    stim[45] = 70'h3be86e7fd25a82af74;
    stim[46] = 70'h1c86a84dc570f80e87;
    stim[47] = 70'h30f76c4c218ba95265;
    stim[48] = 70'h2416963be17c69d11c;
    stim[49] = 70'h1945cf7c63c59ffb6d;
    stim[50] = 70'h2d72f44a41ae160ba1;
    stim[51] = 70'h0858753b2e7b7de8b2;
    stim[52] = 70'h1e9e6b39b48e4994b9;
    stim[53] = 70'h1029e202dc4fdd4e1c;
    stim[54] = 70'h2a6140770f905d0c8c;
    stim[55] = 70'h32a2fa0eeadba39612;
    stim[56] = 70'h25bbac848020b5fd0e;
    stim[57] = 70'h1801c9bda8ca0b5749;
    stim[58] = 70'h154a4adef8eedbf3ad;
    stim[59] = 70'h2d281f924589c43ea8;
    stim[60] = 70'h32c66872c0ca40e5a6;
    stim[61] = 70'h21c42fe34b7544623a;
    stim[62] = 70'h2c66032a8d3ccb06d3;
    stim[63] = 70'h0d49dd35b416d425bb;
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
      expv[0] = 33'h0xxxxxxxx;
      expv[1] = 33'h000xxxxxx;
      expv[2] = 33'h000xxxxxx;
      expv[3] = 33'h000xxxxxx;
      expv[4] = 33'h000xxxxxx;
      expv[5] = 33'h000xxxxxx;
      expv[6] = 33'h000xxxxxx;
      expv[7] = 33'h0xxxxxxxx;
      expv[8] = 33'h0xxxxxxxx;
      expv[9] = 33'h0xxxxxxxx;
      expv[10] = 33'h0xxxxxxxx;
      expv[11] = 33'h0xxxxxxxx;
      expv[12] = 33'h0xx00xxxx;
      expv[13] = 33'h0xx00xxxx;
      expv[14] = 33'h0xxxx0000;
      expv[15] = 33'h0xx00xx00;
      expv[16] = 33'h000000000;
      expv[17] = 33'h0xx00xx00;
      expv[18] = 33'h0xx00xx00;
      expv[19] = 33'h00000xxxx;
      expv[20] = 33'h00000xxxx;
      expv[21] = 33'h00000xxxx;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h0xx0000xx;
      expv[26] = 33'h0xxxxxx00;
      expv[27] = 33'h000xx0000;
      expv[28] = 33'h000xx0000;
      expv[29] = 33'h000xx0000;
      expv[30] = 33'h000xx0000;
      expv[31] = 33'h000xx0000;
      expv[32] = 33'h000xx0000;
      expv[33] = 33'h000xx0000;
      expv[34] = 33'h000xx0000;
      expv[35] = 33'h000xx0000;
      expv[36] = 33'h000xx0000;
      expv[37] = 33'h000xx0000;
      expv[38] = 33'h000xx0000;
      expv[39] = 33'h000xx0000;
      expv[40] = 33'h000xx0000;
      expv[41] = 33'h00000xxxx;
      expv[42] = 33'h00000xxxx;
      expv[43] = 33'h0xx00xxxx;
      expv[44] = 33'h0xx00xxxx;
      expv[45] = 33'h0xx00xxxx;
      expv[46] = 33'h000xx0000;
      expv[47] = 33'h000xx0000;
      expv[48] = 33'h000xx0000;
      expv[49] = 33'h000xx0000;
      expv[50] = 33'h000xx0000;
      expv[51] = 33'h000xx0000;
      expv[52] = 33'h000xx0000;
      expv[53] = 33'h000xx0000;
      expv[54] = 33'h0xxxx0000;
      expv[55] = 33'h0xxxx0000;
      expv[56] = 33'h0xxxx0000;
      expv[57] = 33'h0xxxx0000;
      expv[58] = 33'h0xxxx0000;
      expv[59] = 33'h0xxxx0000;
      expv[60] = 33'h0xxxx0000;
      expv[61] = 33'h0xxxx0000;
      expv[62] = 33'h0xxxx0000;
      expv[63] = 33'h0xxxx0000;
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
