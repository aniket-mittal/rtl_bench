// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02219 dut (
    .select_ms(in_vec[41:40]),
    .Hmm(in_vec[39:32]),
    .Hmc(in_vec[31:24]),
    .Hcm(in_vec[23:16]),
    .Ecm(in_vec[15:8]),
    .Fmc(in_vec[7:0]),
    .Hcc(out_vec[23:16]),
    .Ecc(out_vec[15:8]),
    .Fcc(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h295476cb0a6;
    stim[1] = 42'h18e995bd244;
    stim[2] = 42'h363e2218012;
    stim[3] = 42'h0010b5170ef;
    stim[4] = 42'h3fd31fc0091;
    stim[5] = 42'h0ad22a15d9f;
    stim[6] = 42'h1c6c52329d5;
    stim[7] = 42'h1dc7dc62353;
    stim[8] = 42'h1d848356a59;
    stim[9] = 42'h2ce261e7901;
    stim[10] = 42'h1a94e846f8c;
    stim[11] = 42'h0c21d1e73cf;
    stim[12] = 42'h23af089e0a5;
    stim[13] = 42'h28a7ce1d90d;
    stim[14] = 42'h18fa11d548f;
    stim[15] = 42'h1c3852083af;
    stim[16] = 42'h1282e2544ba;
    stim[17] = 42'h037730e4b43;
    stim[18] = 42'h21bfbe43c30;
    stim[19] = 42'h136d8d6ab16;
    stim[20] = 42'h0a47a8559e2;
    stim[21] = 42'h221e1b0821e;
    stim[22] = 42'h141cae34d41;
    stim[23] = 42'h1c46259d827;
    stim[24] = 42'h0187ee75786;
    stim[25] = 42'h06bdff8e2e2;
    stim[26] = 42'h1df934bf48d;
    stim[27] = 42'h32c66418c52;
    stim[28] = 42'h1e451e8b5c6;
    stim[29] = 42'h3c532790bc0;
    stim[30] = 42'h18846fb6c0b;
    stim[31] = 42'h1169fb38290;
    stim[32] = 42'h288c414bee9;
    stim[33] = 42'h01b2df8c829;
    stim[34] = 42'h0a644f5c254;
    stim[35] = 42'h3cbd3351736;
    stim[36] = 42'h3d9b87c911f;
    stim[37] = 42'h32592cf4b7f;
    stim[38] = 42'h207a88535c6;
    stim[39] = 42'h162c2560920;
    stim[40] = 42'h17cdac65d40;
    stim[41] = 42'h218b21a70c6;
    stim[42] = 42'h3f4f6740b33;
    stim[43] = 42'h12fa297401e;
    stim[44] = 42'h05027ccbeb0;
    stim[45] = 42'h0d18d9f40b9;
    stim[46] = 42'h16d22c328bc;
    stim[47] = 42'h3d73fdd5150;
    stim[48] = 42'h322dc651db2;
    stim[49] = 42'h1956b770031;
    stim[50] = 42'h0834990fd88;
    stim[51] = 42'h3a07cba772d;
    stim[52] = 42'h25c0ed6214c;
    stim[53] = 42'h0c03d5af905;
    stim[54] = 42'h1cfd4e580c3;
    stim[55] = 42'h0cfadf76628;
    stim[56] = 42'h2e161b19dc5;
    stim[57] = 42'h02d253ee3c0;
    stim[58] = 42'h09f843bda8a;
    stim[59] = 42'h107dfc2156a;
    stim[60] = 42'h02780de7de9;
    stim[61] = 42'h3bd36da6997;
    stim[62] = 42'h39f951c5c1f;
    stim[63] = 42'h00e139ad1d1;
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
      expv[0] = 24'hafafa5;
      expv[1] = 24'hd1d193;
      expv[2] = 24'hdc7fdc;
      expv[3] = 24'hfd6fee;
      expv[4] = 24'hffff90;
      expv[5] = 24'ha99b9e;
      expv[6] = 24'hd428d4;
      expv[7] = 24'hdbc077;
      expv[8] = 24'hd76958;
      expv[9] = 24'hcf7820;
      expv[10] = 24'ha87e8b;
      expv[11] = 24'hce72ce;
      expv[12] = 24'headfea;
      expv[13] = 24'hdbdb76;
      expv[14] = 24'h9b539b;
      expv[15] = 24'hc282ae;
      expv[16] = 24'hb943b9;
      expv[17] = 24'h6d4a6d;
      expv[18] = 24'hf5def5;
      expv[19] = 24'hd2d0d2;
      expv[20] = 24'he17fe1;
      expv[21] = 24'hdbaadb;
      expv[22] = 24'hddddc4;
      expv[23] = 24'hd7d75c;
      expv[24] = 24'he1e185;
      expv[25] = 24'hf2f2e1;
      expv[26] = 24'hf3f38d;
      expv[27] = 24'h8b8b60;
      expv[28] = 24'he3e2c5;
      expv[29] = 24'hc673bf;
      expv[30] = 24'hf5f540;
      expv[31] = 24'hadad99;
      expv[32] = 24'he8bde8;
      expv[33] = 24'hf2f228;
      expv[34] = 24'hefef53;
      expv[35] = 24'hcd2fcd;
      expv[36] = 24'hda90b2;
      expv[37] = 24'hc9c98c;
      expv[38] = 24'hc57fc5;
      expv[39] = 24'hbc50bc;
      expv[40] = 24'hd4c0d4;
      expv[41] = 24'hc56fc5;
      expv[42] = 24'hf56ef0;
      expv[43] = 24'h9c919c;
      expv[44] = 24'hc6c6af;
      expv[45] = 24'hcd99b8;
      expv[46] = 24'hbdbdbb;
      expv[47] = 24'hd8d74f;
      expv[48] = 24'hd65fd6;
      expv[49] = 24'hffff65;
      expv[50] = 24'hfcfc87;
      expv[51] = 24'hb4b476;
      expv[52] = 24'hd0d04b;
      expv[53] = 24'hf8f837;
      expv[54] = 24'hdfdfce;
      expv[55] = 24'hf1f1a7;
      expv[56] = 24'he2abc4;
      expv[57] = 24'he2e2bf;
      expv[58] = 24'hd9d989;
      expv[59] = 24'hd9bcd9;
      expv[60] = 24'he8d8e8;
      expv[61] = 24'hd4d496;
      expv[62] = 24'ha05b8f;
      expv[63] = 24'hd0d0d0;
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
