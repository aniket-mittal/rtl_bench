// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 82;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07415 dut (
    .BCLK(clk),
    .ENWR(in_vec[81:81]),
    .DOWR(in_vec[80:80]),
    .BYDIN(in_vec[79:48]),
    .DIN(in_vec[47:16]),
    .RADR(in_vec[15:8]),
    .WADR(in_vec[7:2]),
    .WMASKE(in_vec[1:0]),
    .DOUT(out_vec[32:1]),
    .SELI(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 82'h0458d386e0121502bb03f;
    stim[1] = 82'h2d662d47336948b2ec007;
    stim[2] = 82'h0614d908573e9060f37b1;
    stim[3] = 82'h1c4bab0e5659b76c09f1c;
    stim[4] = 82'h2d739ef617055d712afbd;
    stim[5] = 82'h1bf7d89efe12da566d4b4;
    stim[6] = 82'h3dc7e9baa9b917392f63f;
    stim[7] = 82'h2defdda6ba27d5ffb84d5;
    stim[8] = 82'h168865288392657577421;
    stim[9] = 82'h0ef0134ed10dfcd65b091;
    stim[10] = 82'h07ccbad4a913075b17922;
    stim[11] = 82'h2f7abb42f5cbfea1baf9c;
    stim[12] = 82'h358ae4602ed28fd04d110;
    stim[13] = 82'h3538f33921af64982dc4a;
    stim[14] = 82'h36a1557172167e743e692;
    stim[15] = 82'h3b3d3ec7995b7154545d7;
    stim[16] = 82'h2a02d3dd21602c85d0e62;
    stim[17] = 82'h2a46268c0102c8a7da9f5;
    stim[18] = 82'h02ec381ff42489a1eeda1;
    stim[19] = 82'h0684feeb253d7ac9e8783;
    stim[20] = 82'h17e2f0dcf01cde73146cf;
    stim[21] = 82'h3ac29211e5b3f2fa21a49;
    stim[22] = 82'h256568c5ab89c2f5e2c39;
    stim[23] = 82'h1e81385a093b73cd2ef12;
    stim[24] = 82'h171177e0c9c829f0c9537;
    stim[25] = 82'h2f2dbe41871d3d9915f4b;
    stim[26] = 82'h03c6ff9aa2024fbcbdcd1;
    stim[27] = 82'h09868eefb3e54feab68ac;
    stim[28] = 82'h27a1118c970dd9c15bdab;
    stim[29] = 82'h3b257805ae817d33e7ebe;
    stim[30] = 82'h04c1af7c5afa62944b4e5;
    stim[31] = 82'h3e49f06784da89167c7b2;
    stim[32] = 82'h3910bba0c9239803da44b;
    stim[33] = 82'h3f4a60009939bd119bff6;
    stim[34] = 82'h2c510f98fc73691c6606a;
    stim[35] = 82'h3e7a5aae54c4e6da7062c;
    stim[36] = 82'h0db4b206febd45f5cc130;
    stim[37] = 82'h15d29a75a0c5d1b86b48a;
    stim[38] = 82'h2939e0dc3714158aa8739;
    stim[39] = 82'h2a74202d5665feec13440;
    stim[40] = 82'h0efb3de412bdb9d6f92ed;
    stim[41] = 82'h07172352b89d08d9bfb66;
    stim[42] = 82'h120fadb78a69d31795106;
    stim[43] = 82'h2a8e115b82d0454260db4;
    stim[44] = 82'h149567a5fb8715f47b8ad;
    stim[45] = 82'h187e0feecde2808cb5605;
    stim[46] = 82'h2490d3f4fbb974ec96e3c;
    stim[47] = 82'h1c7a53933791e4e94a123;
    stim[48] = 82'h2cd3195801681258e4154;
    stim[49] = 82'h3d26d9ca35b5e1ff606a3;
    stim[50] = 82'h2f11fa068935e1c2aa99a;
    stim[51] = 82'h01994c4b0b8bd6218cffa;
    stim[52] = 82'h0d4e101821cb36cb7354d;
    stim[53] = 82'h088e48bb2106bbe5cf1a1;
    stim[54] = 82'h1771334e3bd5b4a216fbf;
    stim[55] = 82'h1da40436ac6496488c46c;
    stim[56] = 82'h1041ada8f4d4b7ca7dbcb;
    stim[57] = 82'h23a89ea2b9dc3de4d773b;
    stim[58] = 82'h26afa6fec90650c58ee50;
    stim[59] = 82'h2ab3d92ff4c9d2cb8b0a7;
    stim[60] = 82'h144e2ab013bea5d911c86;
    stim[61] = 82'h005143341af82f6b418bf;
    stim[62] = 82'h32a8ccd3cd9b3f8b228cd;
    stim[63] = 82'h28710053a91549ba463fc;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'hxxxxxxxxx;
      expv[3] = 33'hxxxxxxxxx;
      expv[4] = 33'hxxxxxxxxx;
      expv[5] = 33'hxxxxx13de;
      expv[6] = 33'hxxxxxxxxx;
      expv[7] = 33'hxxxxxxxxx;
      expv[8] = 33'hxxxxxxxxx;
      expv[9] = 33'hxxxxxxxxx;
      expv[10] = 33'hxxxxxxxxx;
      expv[11] = 33'hxxxxxxxxx;
      expv[12] = 33'hxxxxxxxxx;
      expv[13] = 33'hxxxxxxxxx;
      expv[14] = 33'hxxxxxxxxx;
      expv[15] = 33'hxxxxxxxxx;
      expv[16] = 33'hxxxxxxxxx;
      expv[17] = 33'hxxxxxxxxx;
      expv[18] = 33'hxxxxxxxxx;
      expv[19] = 33'hxxxxxxxcd;
      expv[20] = 33'hxxxxxxx80;
      expv[21] = 33'hxxxxxxx80;
      expv[22] = 33'hxxxxxxx80;
      expv[23] = 33'hxxxxxxx80;
      expv[24] = 33'hxxxxxxxxx;
      expv[25] = 33'hxxxxxxxxx;
      expv[26] = 33'hxxxxxxxxx;
      expv[27] = 33'hxxxxxxxxx;
      expv[28] = 33'hxxxxxxxxx;
      expv[29] = 33'hxxxxxxxxx;
      expv[30] = 33'hxxxxxxxxx;
      expv[31] = 33'hxxxxxxxxx;
      expv[32] = 33'hxxxxxxx81;
      expv[33] = 33'h042cfce86;
      expv[34] = 33'hxxxxxxxxx;
      expv[35] = 33'hxxxxxxxxx;
      expv[36] = 33'hxxxxxxxxx;
      expv[37] = 33'hxxxxxxxxx;
      expv[38] = 33'hxxxxxxxxx;
      expv[39] = 33'hxxxxxxx80;
      expv[40] = 33'hxxxxxxx80;
      expv[41] = 33'h12473007a;
      expv[42] = 33'hxxxxxxxxx;
      expv[43] = 33'hxxxxxxxxx;
      expv[44] = 33'hxxxxxxxxx;
      expv[45] = 33'hxxxxxxxxx;
      expv[46] = 33'hxxxxxxxxx;
      expv[47] = 33'hxxxxxxxxx;
      expv[48] = 33'hxxxxxxxxx;
      expv[49] = 33'hxxxxxxxxx;
      expv[50] = 33'hxxxxxxxxx;
      expv[51] = 33'hxxxxxxxxx;
      expv[52] = 33'h13722e725;
      expv[53] = 33'h13722e725;
      expv[54] = 33'hxxxxxxxxx;
      expv[55] = 33'hxxxxxxxxx;
      expv[56] = 33'h1276e79a5;
      expv[57] = 33'hxxxxxxx11;
      expv[58] = 33'hxxxxxxx11;
      expv[59] = 33'hxxxxxxxxx;
      expv[60] = 33'hxxxxxxxxx;
      expv[61] = 33'hxxxxxxxxx;
      expv[62] = 33'hxxxxxxxxx;
      expv[63] = 33'hxxxxxxxxx;
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
