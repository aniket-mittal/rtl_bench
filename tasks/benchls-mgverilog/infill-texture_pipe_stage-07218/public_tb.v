// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 63;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07218 dut (
    .sys_clk(clk),
    .sys_rst(in_vec[98:98]),
    .pipe_stb_i(in_vec[97:97]),
    .dx(in_vec[96:85]),
    .dy(in_vec[84:73]),
    .tx(in_vec[72:55]),
    .ty(in_vec[54:37]),
    .tex_hmask(in_vec[36:19]),
    .tex_vmask(in_vec[18:1]),
    .pipe_ack_i(in_vec[0:0]),
    .busy(out_vec[62:62]),
    .pipe_ack_o(out_vec[61:61]),
    .pipe_stb_o(out_vec[60:60]),
    .dx_f(out_vec[59:48]),
    .dy_f(out_vec[47:36]),
    .tx_m(out_vec[35:18]),
    .ty_m(out_vec[17:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h7db93287f9b861d32ceb2efc8;
    stim[1] = 99'h4c3799c45d876efccc531f4d9;
    stim[2] = 99'h1755cd49349dc61519635f87b;
    stim[3] = 99'h1a87feab6430c33defcb2a4e5;
    stim[4] = 99'h2c940d225d9fa9da2073e2679;
    stim[5] = 99'h2e4b5c5c57525ae069abdeffc;
    stim[6] = 99'h2ae5a78ac624a7b44d4b9ce7d;
    stim[7] = 99'h02aec2f27b1d7e07b474b6ba1;
    stim[8] = 99'h3993cd16ce8ccac080f298fd7;
    stim[9] = 99'h0ec1c92413e885a14e73588c1;
    stim[10] = 99'h2ba9e57d3c1f5e3e3923d6af8;
    stim[11] = 99'h22ae0b6b8913e65fefce393d0;
    stim[12] = 99'h0269e12bc4b913ff467117e54;
    stim[13] = 99'h1756b7ccffe3add2cb24f3d25;
    stim[14] = 99'h1bcffd32cca785cd3344752ba;
    stim[15] = 99'h0944dad43f133467d2209e697;
    stim[16] = 99'h1274878d57c2ea797f904c341;
    stim[17] = 99'h146c2558391cb4a8bc4e6eac8;
    stim[18] = 99'h19862dcd3b9bd3db3af359e10;
    stim[19] = 99'h0d86d56089a1239589928553e;
    stim[20] = 99'h0668d4014f0db888cd2236335;
    stim[21] = 99'h3f98ce0abfe74a50ff4514bed;
    stim[22] = 99'h2681ec9d1682534a7f333aa22;
    stim[23] = 99'h1535b3dc40fec76159f4aff06;
    stim[24] = 99'h02e4613cd08218ce7685b784a;
    stim[25] = 99'h1965c3be26e13594de99baec2;
    stim[26] = 99'h310d3a9d233f54c4e314b3bf0;
    stim[27] = 99'h04f56aa185ea27d2ef83fc7dd;
    stim[28] = 99'h2a1138b63188eb745baa9a404;
    stim[29] = 99'h1d73d289843a93c0fad8f74ea;
    stim[30] = 99'h069227533ad669970828ff32b;
    stim[31] = 99'h170bd35ac5f27058ebddeeeb0;
    stim[32] = 99'h31d673a8f85432cda76f8c156;
    stim[33] = 99'h17ecc18613c9c1ffba5715b97;
    stim[34] = 99'h19f5186db1cb9d3f05d0ff10f;
    stim[35] = 99'h06d0d355f1f676094cc49e10a;
    stim[36] = 99'h338c2ff3d834d6aa6caa8ea05;
    stim[37] = 99'h3b495d4328101676b91c09f16;
    stim[38] = 99'h0c9a900c29dda62790953a8ab;
    stim[39] = 99'h0da2389f5a9b0e3d061946435;
    stim[40] = 99'h0bade8e91f8c905c92954fe2b;
    stim[41] = 99'h3008c8da8b2c5da05cf37334f;
    stim[42] = 99'h053538d1b792bdc56a5056365;
    stim[43] = 99'h2b45e0d1bd400bd55752ef9f2;
    stim[44] = 99'h38dea36bea0dd858966c400f1;
    stim[45] = 99'h16308782a3efe31c6288d58da;
    stim[46] = 99'h2454ead2c749eb6cac9a56573;
    stim[47] = 99'h1170ee75a1ebb68b4d37f6a7b;
    stim[48] = 99'h2309e6929088bdf0e79f780e8;
    stim[49] = 99'h14c5d5990d4fe8a46769ad9de;
    stim[50] = 99'h00f6b23c024fb725f8f6a9d71;
    stim[51] = 99'h133a14dc67d2ae1bdd0d4d6c3;
    stim[52] = 99'h1bace7970b1be54e723742459;
    stim[53] = 99'h38e19dc428c2b41d40978004e;
    stim[54] = 99'h2a01bd077af0209e026f33668;
    stim[55] = 99'h69e5bcd6f428d9abc8e667d5f;
    stim[56] = 99'h0ce77d8db226e671676db7c26;
    stim[57] = 99'h0a9f5cd4d8ef01f0499e85dab;
    stim[58] = 99'h2c719254659bd3dd993038320;
    stim[59] = 99'h3118b22ceb85c7631f9f712ce;
    stim[60] = 99'h344c6f50744d88683085e3519;
    stim[61] = 99'h311f4a52a1770192304a762fd;
    stim[62] = 99'h3dc004ad9622666d407c9e53e;
    stim[63] = 99'h082b1084c7219ca1274a1c9fe;
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
      expv[0] = 63'hxxxxxxxxxxxxxxxx;
      expv[1] = 63'h2xxxxxxxxxxxxxxx;
      expv[2] = 63'h2xxxxxxxxxxxxxxx;
      expv[3] = 63'h2xxxxxxxxxxxxxxx;
      expv[4] = 63'h2xxxxxxxxxxxxxxx;
      expv[5] = 63'h564a0691028f102c;
      expv[6] = 63'h764a0691028f102c;
      expv[7] = 63'h7572d3c06210431a;
      expv[8] = 63'h2572d3c06210431a;
      expv[9] = 63'h7cc9e68007044560;
      expv[10] = 63'h2cc9e68007044560;
      expv[11] = 63'h55d4f2b0880ea51c;
      expv[12] = 63'h55d4f2b0880ea51c;
      expv[13] = 63'h75d4f2b0880ea51c;
      expv[14] = 63'h25d4f2b0880ea51c;
      expv[15] = 63'h25d4f2b0880ea51c;
      expv[16] = 63'h25d4f2b0880ea51c;
      expv[17] = 63'h25d4f2b0880ea51c;
      expv[18] = 63'h25d4f2b0880ea51c;
      expv[19] = 63'h25d4f2b0880ea51c;
      expv[20] = 63'h25d4f2b0880ea51c;
      expv[21] = 63'h25d4f2b0880ea51c;
      expv[22] = 63'h5fcc67055a20a520;
      expv[23] = 63'h5fcc67055a20a520;
      expv[24] = 63'h5fcc67055a20a520;
      expv[25] = 63'h5fcc67055a20a520;
      expv[26] = 63'h5fcc67055a20a520;
      expv[27] = 63'h7fcc67055a20a520;
      expv[28] = 63'h2fcc67055a20a520;
      expv[29] = 63'h55089c5218445002;
      expv[30] = 63'h75089c5218445002;
      expv[31] = 63'h25089c5218445002;
      expv[32] = 63'h25089c5218445002;
      expv[33] = 63'h78eb39d438280022;
      expv[34] = 63'h28eb39d438280022;
      expv[35] = 63'h28eb39d438280022;
      expv[36] = 63'h28eb39d438280022;
      expv[37] = 63'h59c617f164106100;
      expv[38] = 63'h79c617f164106100;
      expv[39] = 63'h29c617f164106100;
      expv[40] = 63'h29c617f164106100;
      expv[41] = 63'h29c617f164106100;
      expv[42] = 63'h7804646045920880;
      expv[43] = 63'h2804646045920880;
      expv[44] = 63'h75a2f0689a8004e8;
      expv[45] = 63'h5c6f51b4b1020028;
      expv[46] = 63'h7c6f51b4b1020028;
      expv[47] = 63'h722a75616080b0b0;
      expv[48] = 63'h222a75616080b0b0;
      expv[49] = 63'h5184f34108404070;
      expv[50] = 63'h7184f34108404070;
      expv[51] = 63'h2184f34108404070;
      expv[52] = 63'h2184f34108404070;
      expv[53] = 63'h2184f34108404070;
      expv[54] = 63'h5c70cee204200006;
      expv[55] = 63'h7c70cee204200006;
      expv[56] = 63'h2c70cee204200006;
      expv[57] = 63'h2c70cee204200006;
      expv[58] = 63'h2c70cee204200006;
      expv[59] = 63'h5638c9280081c180;
      expv[60] = 63'h7638c9280081c180;
      expv[61] = 63'h7a2637a000260004;
      expv[62] = 63'h588fa52100138048;
      expv[63] = 63'h588fa52100138048;
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
