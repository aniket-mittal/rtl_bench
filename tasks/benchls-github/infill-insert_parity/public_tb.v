// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  insert_parity dut (
    .din(in_vec[44:0]),
    .dout(out_vec[49:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h117645c2f5d7;
    stim[1] = 45'h0bd4d8fcd4b8;
    stim[2] = 45'h1d6e359afe5c;
    stim[3] = 45'h16f97f97e308;
    stim[4] = 45'h1c20bc5f56f3;
    stim[5] = 45'h039fb0225641;
    stim[6] = 45'h07827d0c3c6b;
    stim[7] = 45'h12940c32da33;
    stim[8] = 45'h13ca72c172b1;
    stim[9] = 45'h071b1b273c75;
    stim[10] = 45'h0dae7781f6fd;
    stim[11] = 45'h0a83382efb84;
    stim[12] = 45'h163c6eeb4e9d;
    stim[13] = 45'h0b24fdf332fa;
    stim[14] = 45'h1769609402d9;
    stim[15] = 45'h0c696be624e4;
    stim[16] = 45'h1218d50d21f2;
    stim[17] = 45'h1a4d968d7d39;
    stim[18] = 45'h1a8216878a7d;
    stim[19] = 45'h147f8ca3d470;
    stim[20] = 45'h0920bfe98752;
    stim[21] = 45'h02a91a0a6e48;
    stim[22] = 45'h1dcc6a619c1a;
    stim[23] = 45'h0602b3892b42;
    stim[24] = 45'h05cda2d26857;
    stim[25] = 45'h1163a0692fee;
    stim[26] = 45'h10749cc877dd;
    stim[27] = 45'h0742c91e4cbd;
    stim[28] = 45'h12effa570202;
    stim[29] = 45'h0d09e7a5964c;
    stim[30] = 45'h1b23b77e31c5;
    stim[31] = 45'h1df690cadb04;
    stim[32] = 45'h1447ba9fc349;
    stim[33] = 45'h0c619c588849;
    stim[34] = 45'h0c62dbbe6991;
    stim[35] = 45'h04af5722a38c;
    stim[36] = 45'h12f2ca579917;
    stim[37] = 45'h1cd619da2684;
    stim[38] = 45'h00bfa2ad98c5;
    stim[39] = 45'h14a1abd83f26;
    stim[40] = 45'h0186bbdd5276;
    stim[41] = 45'h1fc24548b78c;
    stim[42] = 45'h14598274fb82;
    stim[43] = 45'h1b528dad07ae;
    stim[44] = 45'h0e7745e148a4;
    stim[45] = 45'h171a1058ea63;
    stim[46] = 45'h0fd72ec64264;
    stim[47] = 45'h113099812818;
    stim[48] = 45'h1129f4084550;
    stim[49] = 45'h12c5bc37ee2e;
    stim[50] = 45'h049ff163ad98;
    stim[51] = 45'h18f9ec48859f;
    stim[52] = 45'h13f44045063b;
    stim[53] = 45'h169deb0c1f14;
    stim[54] = 45'h1e2b4311a1e7;
    stim[55] = 45'h01c28a987e54;
    stim[56] = 45'h015cf5647af6;
    stim[57] = 45'h16dd398dc934;
    stim[58] = 45'h0bda5bfbdc2d;
    stim[59] = 45'h0a7f1c197cda;
    stim[60] = 45'h1ab6272c29a0;
    stim[61] = 45'h0aad84fdd8d4;
    stim[62] = 45'h0142ac782d8d;
    stim[63] = 45'h0e521727270b;
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
      expv[0] = 50'h11732370de9d7;
      expv[1] = 50'h2bd26e3f9aab8;
      expv[2] = 50'h3d671966dfe5c;
      expv[3] = 50'h16fcbfe5fc708;
      expv[4] = 50'h3c285d17eaef3;
      expv[5] = 50'h2397d8084ae41;
      expv[6] = 50'h27813f438786b;
      expv[7] = 50'h329a050cdb633;
      expv[8] = 50'h13c538b02e6b1;
      expv[9] = 50'h27158ec9e7875;
      expv[10] = 50'h0daf3be03ecfd;
      expv[11] = 50'h0a819c0b5f584;
      expv[12] = 50'h163637bae9c9d;
      expv[13] = 50'h2b2a7f7c666fa;
      expv[14] = 50'h376cb025004d9;
      expv[15] = 50'h2c64b6f944ae4;
      expv[16] = 50'h121c6b43a43f2;
      expv[17] = 50'h3a46c9a3af939;
      expv[18] = 50'h3a890ba17167d;
      expv[19] = 50'h147fc528fa870;
      expv[20] = 50'h09285dfab0f52;
      expv[21] = 50'h02ac8e82cde48;
      expv[22] = 50'h3dc634983381a;
      expv[23] = 50'h26095ae2a5542;
      expv[24] = 50'h25c6d2b4cd057;
      expv[25] = 50'h3169d01a25dee;
      expv[26] = 50'h307a4f320eddd;
      expv[27] = 50'h27496647c9abd;
      expv[28] = 50'h12e7fe9560402;
      expv[29] = 50'h0d04f3e932c4c;
      expv[30] = 50'h1b21dbdf461c5;
      expv[31] = 50'h3dfb4832db704;
      expv[32] = 50'h1443dca778749;
      expv[33] = 50'h2c68cf1691049;
      expv[34] = 50'h2c616cefcd391;
      expv[35] = 50'h04afabc8d478c;
      expv[36] = 50'h32f9669573117;
      expv[37] = 50'h3cdb0c76c4e84;
      expv[38] = 50'h00bfd0abb32c5;
      expv[39] = 50'h34a8d6f607f26;
      expv[40] = 50'h218b5cf7aa476;
      expv[41] = 50'h1fc9235216f8c;
      expv[42] = 50'h3454c09d9f582;
      expv[43] = 50'h3b51476b20fae;
      expv[44] = 50'h2e7ba178290a4;
      expv[45] = 50'h171508161d663;
      expv[46] = 50'h0fd395b148464;
      expv[47] = 50'h31304e6025218;
      expv[48] = 50'h112cfb0288950;
      expv[49] = 50'h32cadf0dfde2e;
      expv[50] = 50'h049ff858f5b98;
      expv[51] = 50'h38fcf5129099f;
      expv[52] = 50'h13fa221120c3b;
      expv[53] = 50'h1696f6c383d14;
      expv[54] = 50'h1e2da0c4341e7;
      expv[55] = 50'h01c146a68fc54;
      expv[56] = 50'h015e79590f6f6;
      expv[57] = 50'h36de9e63b9334;
      expv[58] = 50'h2bd52cfe7ba2d;
      expv[59] = 50'h0a7f8d06af8da;
      expv[60] = 50'h3ab313cb851a0;
      expv[61] = 50'h2aaec13f3b2d4;
      expv[62] = 50'h2149551e0598d;
      expv[63] = 50'h0e5909c964f0b;
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
