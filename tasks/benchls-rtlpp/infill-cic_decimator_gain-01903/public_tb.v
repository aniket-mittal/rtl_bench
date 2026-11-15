// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01903 dut (
    .rate(in_vec[44:37]),
    .signal_in(in_vec[36:0]),
    .signal_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h0794273b1d84;
    stim[1] = 45'h0ada1302cdf2;
    stim[2] = 45'h1eac354d31bd;
    stim[3] = 45'h10498a779ced;
    stim[4] = 45'h1faeb520960a;
    stim[5] = 45'h18a968ea2f80;
    stim[6] = 45'h0f7be57acdec;
    stim[7] = 45'h03f70fd9b67d;
    stim[8] = 45'h0a745db108b5;
    stim[9] = 45'h0bd02ae7ddfd;
    stim[10] = 45'h0403f936142d;
    stim[11] = 45'h0e85623fc3b2;
    stim[12] = 45'h1ae8bddaa5b3;
    stim[13] = 45'h02976135faa0;
    stim[14] = 45'h1ad24a9f60d4;
    stim[15] = 45'h08f5e42ead46;
    stim[16] = 45'h13cda8bd7dd4;
    stim[17] = 45'h19974450401b;
    stim[18] = 45'h18755fd377cb;
    stim[19] = 45'h0b1a8760bd16;
    stim[20] = 45'h15ca134c1249;
    stim[21] = 45'h074ac8344a03;
    stim[22] = 45'h088d4dfe6d73;
    stim[23] = 45'h0da423fcc569;
    stim[24] = 45'h18022027646d;
    stim[25] = 45'h15365b01afeb;
    stim[26] = 45'h06c69ae8014c;
    stim[27] = 45'h1f11cbd22797;
    stim[28] = 45'h0fd09a1e70c4;
    stim[29] = 45'h11b98af7d663;
    stim[30] = 45'h173fc8901a29;
    stim[31] = 45'h1e536c088d5d;
    stim[32] = 45'h1287f6beab81;
    stim[33] = 45'h079070e2483e;
    stim[34] = 45'h158978e3b43e;
    stim[35] = 45'h086a08221670;
    stim[36] = 45'h00ed9f0534ff;
    stim[37] = 45'h02245c93f6bb;
    stim[38] = 45'h0d61f33a1366;
    stim[39] = 45'h0200c0ce3fcc;
    stim[40] = 45'h15b21a1f888d;
    stim[41] = 45'h049201560227;
    stim[42] = 45'h17846776fe41;
    stim[43] = 45'h0e4e40515bb0;
    stim[44] = 45'h15f3315ec785;
    stim[45] = 45'h1da116a91225;
    stim[46] = 45'h197db5b51f6e;
    stim[47] = 45'h189056555d5e;
    stim[48] = 45'h1465985ee656;
    stim[49] = 45'h13de538709e4;
    stim[50] = 45'h0871fb670e36;
    stim[51] = 45'h18190e763a5f;
    stim[52] = 45'h1eb47d732beb;
    stim[53] = 45'h1ce155cc1245;
    stim[54] = 45'h1756dc0ae109;
    stim[55] = 45'h123547342779;
    stim[56] = 45'h1dd8961d0e0c;
    stim[57] = 45'h119ce9371cd1;
    stim[58] = 45'h02c20809146f;
    stim[59] = 45'h06ea581bedc6;
    stim[60] = 45'h0fd46d89958e;
    stim[61] = 45'h11c0cd738929;
    stim[62] = 45'h10178d78dba7;
    stim[63] = 45'h0b5fb8bb7b52;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 16'h09ce;
      expv[1] = 16'ha130;
      expv[2] = 16'h61aa;
      expv[3] = 16'h4c53;
      expv[4] = 16'h75a9;
      expv[5] = 16'h4b47;
      expv[6] = 16'hdf2b;
      expv[7] = 16'h1fb3;
      expv[8] = 16'h45db;
      expv[9] = 16'h02ae;
      expv[10] = 16'hf936;
      expv[11] = 16'h2b11;
      expv[12] = 16'h45ee;
      expv[13] = 16'h84d7;
      expv[14] = 16'h9254;
      expv[15] = 16'hbc85;
      expv[16] = 16'h6d45;
      expv[17] = 16'hba22;
      expv[18] = 16'haafe;
      expv[19] = 16'ha876;
      expv[20] = 16'h509a;
      expv[21] = 16'hb20d;
      expv[22] = 16'ha9bf;
      expv[23] = 16'h211f;
      expv[24] = 16'h1101;
      expv[25] = 16'hb2d8;
      expv[26] = 16'ha6ba;
      expv[27] = 16'h8e5e;
      expv[28] = 16'h84d0;
      expv[29] = 16'hcc57;
      expv[30] = 16'hfe44;
      expv[31] = 16'h9b60;
      expv[32] = 16'h3fb5;
      expv[33] = 16'h1c38;
      expv[34] = 16'h4bc7;
      expv[35] = 16'h4104;
      expv[36] = 16'h829a;
      expv[37] = 16'he49f;
      expv[38] = 16'h0f99;
      expv[39] = 16'h0671;
      expv[40] = 16'h90d0;
      expv[41] = 16'h0156;
      expv[42] = 16'h233b;
      expv[43] = 16'h7202;
      expv[44] = 16'h998a;
      expv[45] = 16'h08b5;
      expv[46] = 16'hedad;
      expv[47] = 16'h82b2;
      expv[48] = 16'h2cc2;
      expv[49] = 16'hf29c;
      expv[50] = 16'h3f6c;
      expv[51] = 16'hc873;
      expv[52] = 16'ha3eb;
      expv[53] = 16'h0aae;
      expv[54] = 16'hb6e0;
      expv[55] = 16'haa39;
      expv[56] = 16'hc4b0;
      expv[57] = 16'he749;
      expv[58] = 16'h2024;
      expv[59] = 16'h9606;
      expv[60] = 16'ha36c;
      expv[61] = 16'h066b;
      expv[62] = 16'hbc6b;
      expv[63] = 16'hfb8b;
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
