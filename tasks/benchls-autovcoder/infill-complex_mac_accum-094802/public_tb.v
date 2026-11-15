// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 46;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_094802 dut (
    .clk(clk),
    .rst(in_vec[65:65]),
    .ena(in_vec[64:64]),
    .a_Re(in_vec[63:48]),
    .a_Im(in_vec[47:32]),
    .a_d_Re(in_vec[31:16]),
    .a_d_Im(in_vec[15:0]),
    .sum_out_Im(out_vec[45:23]),
    .sum_out_Re(out_vec[22:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h2909ff7cdc1fa05d0;
    stim[1] = 66'h2a3ff1950e7f0ffb2;
    stim[2] = 66'h088547670c243e438;
    stim[3] = 66'h16e216430cfd37956;
    stim[4] = 66'h045c733d0c4df1dc9;
    stim[5] = 66'h12d4ca4892860347d;
    stim[6] = 66'h007ba4cdcf91c8f4f;
    stim[7] = 66'h1dd9f8bf3f86ee463;
    stim[8] = 66'h1464a271c8611fd0c;
    stim[9] = 66'h17d7ae517445311fe;
    stim[10] = 66'h20b7bf8909cf67b4e;
    stim[11] = 66'h05b01b952fd67c7bd;
    stim[12] = 66'h0e86772443653d289;
    stim[13] = 66'h0a2c460fb597965b6;
    stim[14] = 66'h04e8e0187aaaa0c92;
    stim[15] = 66'h1752d77bdd2bb12be;
    stim[16] = 66'h0df018e93ca47442f;
    stim[17] = 66'h1c90becadcb8e9ca5;
    stim[18] = 66'h08e12e64f63adb630;
    stim[19] = 66'h103bbc2140bd2d90f;
    stim[20] = 66'h1f341cd85ad0f5497;
    stim[21] = 66'h03fce129fe3a5f1f5;
    stim[22] = 66'h1f4aac722b9f994d9;
    stim[23] = 66'h1422459239583db5c;
    stim[24] = 66'h019b149011b62c881;
    stim[25] = 66'h1682390b1e5b7c663;
    stim[26] = 66'h067c9949dc65011f4;
    stim[27] = 66'h135d8e45a52b8cdb4;
    stim[28] = 66'h0494ca791c8483642;
    stim[29] = 66'h1fe19a7d915dc79ae;
    stim[30] = 66'h1925b6284f58baf61;
    stim[31] = 66'h3b181bf5d5bc89117;
    stim[32] = 66'h1f4e602ad50d178ff;
    stim[33] = 66'h19a6e0fc2e7e6e368;
    stim[34] = 66'h123feba1404902f97;
    stim[35] = 66'h16d80f0230a14e036;
    stim[36] = 66'h107e7c14894481649;
    stim[37] = 66'h15ab97bc0f631e274;
    stim[38] = 66'h0d88e10f30b7241f1;
    stim[39] = 66'h0d0ae4659eea0b7c9;
    stim[40] = 66'h0d2e60b15b94ca9f9;
    stim[41] = 66'h1edb46cf5617918b9;
    stim[42] = 66'h12e143eaae5e51dc9;
    stim[43] = 66'h15c6767bdeda638f5;
    stim[44] = 66'h09eb70af923b538a3;
    stim[45] = 66'h1b5fec374eb2c004e;
    stim[46] = 66'h1cba65b322bfe23e4;
    stim[47] = 66'h1d51dfd235b417e2c;
    stim[48] = 66'h1040e0cf2fbab2694;
    stim[49] = 66'h16fc61b375e3319ac;
    stim[50] = 66'h25edf34e0113fea16;
    stim[51] = 66'h1222c4edff210cfc1;
    stim[52] = 66'h181113c9c2f2b8c7e;
    stim[53] = 66'h087f1205dae89f2cc;
    stim[54] = 66'h00838c2c50f0d8f1f;
    stim[55] = 66'h1a0d5d5b6b0508b60;
    stim[56] = 66'h1c58052886ad56cd9;
    stim[57] = 66'h3a74d2e6b67719c93;
    stim[58] = 66'h0a05894f173f2c512;
    stim[59] = 66'h0d6be99f6b9c6ea22;
    stim[60] = 66'h023e947238ac97922;
    stim[61] = 66'h0c28487922d675be8;
    stim[62] = 66'h1c858475a5baec503;
    stim[63] = 66'h04fa13ca1e37a3257;
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
      expv[0] = 46'hxxxxxxxxxxxx;
      expv[1] = 46'h000000000000;
      expv[2] = 46'h000000000000;
      expv[3] = 46'h000000000000;
      expv[4] = 46'h3ff56d009e4e;
      expv[5] = 46'h3ff56d009e4e;
      expv[6] = 46'h3fad7300a33a;
      expv[7] = 46'h3fad7300a33a;
      expv[8] = 46'h3f813b00886b;
      expv[9] = 46'h3f96430148a4;
      expv[10] = 46'h3f7fcf8181cb;
      expv[11] = 46'h000000000000;
      expv[12] = 46'h000000000000;
      expv[13] = 46'h000000000000;
      expv[14] = 46'h000000000000;
      expv[15] = 46'h000000000000;
      expv[16] = 46'h00327f80a272;
      expv[17] = 46'h00327f80a272;
      expv[18] = 46'h005a83809fef;
      expv[19] = 46'h005a83809fef;
      expv[20] = 46'h004f060097d8;
      expv[21] = 46'h000b7d00de0a;
      expv[22] = 46'h000b7d00de0a;
      expv[23] = 46'h0024a18118bb;
      expv[24] = 46'h00638501c55c;
      expv[25] = 46'h00638501c55c;
      expv[26] = 46'h0048ac0247c8;
      expv[27] = 46'h0048ac0247c8;
      expv[28] = 46'h0053ff022ae8;
      expv[29] = 46'h0053ff022ae8;
      expv[30] = 46'h3feb14821325;
      expv[31] = 46'h0044a601aff5;
      expv[32] = 46'h000000000000;
      expv[33] = 46'h3fc4d77fa415;
      expv[34] = 46'h3fdb047f569d;
      expv[35] = 46'h3fa042ff760b;
      expv[36] = 46'h3fa8397fd977;
      expv[37] = 46'h3f7db8804d16;
      expv[38] = 46'h3fca5e80b19e;
      expv[39] = 46'h3fca5e80b19e;
      expv[40] = 46'h3fca5e80b19e;
      expv[41] = 46'h3fca5e80b19e;
      expv[42] = 46'h3ff47c803dd9;
      expv[43] = 46'h0004ed008608;
      expv[44] = 46'h001c5100f4c9;
      expv[45] = 46'h001c5100f4c9;
      expv[46] = 46'h3ffde400bf9b;
      expv[47] = 46'h00198b005f43;
      expv[48] = 46'h3fd906ffd91f;
      expv[49] = 46'h3fcc35ffe182;
      expv[50] = 46'h3fccfb7ff315;
      expv[51] = 46'h000000000000;
      expv[52] = 46'h003f8f00301c;
      expv[53] = 46'h00979e7f8202;
      expv[54] = 46'h00979e7f8202;
      expv[55] = 46'h00979e7f8202;
      expv[56] = 46'h00bcc97f7287;
      expv[57] = 46'h00afa0fecd32;
      expv[58] = 46'h000000000000;
      expv[59] = 46'h000000000000;
      expv[60] = 46'h000000000000;
      expv[61] = 46'h000000000000;
      expv[62] = 46'h000000000000;
      expv[63] = 46'h00412bff6caa;
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
