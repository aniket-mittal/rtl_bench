// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 107;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_070793 dut (
    .clk(clk),
    .clrn(in_vec[107:107]),
    .ealu(in_vec[106:75]),
    .eb(in_vec[74:43]),
    .pce(in_vec[42:11]),
    .ern(in_vec[10:6]),
    .ewreg(in_vec[5:5]),
    .em2reg(in_vec[4:4]),
    .ewmem(in_vec[3:3]),
    .ermem(in_vec[2:2]),
    .erio(in_vec[1:1]),
    .ewio(in_vec[0:0]),
    .malu(out_vec[106:75]),
    .mb(out_vec[74:43]),
    .pcm(out_vec[42:11]),
    .mrn(out_vec[10:6]),
    .mwreg(out_vec[5:5]),
    .mm2reg(out_vec[4:4]),
    .mwmem(out_vec[3:3]),
    .mrmem(out_vec[2:2]),
    .mrio(out_vec[1:1]),
    .mwio(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'h4f1487fe8d7d3e313e90c04e0a1;
    stim[1] = 108'h0a4dcf1141844601dea29d844db;
    stim[2] = 108'hb255f3d3dd9bb79f60c08b16498;
    stim[3] = 108'hbc7bd829c3a8766203dfc311adb;
    stim[4] = 108'hd4f2a62851acd6ac3348d5dcba6;
    stim[5] = 108'hc20c7b58515d69224f07bc8a33c;
    stim[6] = 108'h8fa67a499806cf8f3010807e2b0;
    stim[7] = 108'hbedfdd2e7466a96efc19229dff0;
    stim[8] = 108'h9c3eada3efba7cfe1d7c74e6048;
    stim[9] = 108'h9c829f0af58b032887e04246400;
    stim[10] = 108'hce756d3e222a017f85f8367bee2;
    stim[11] = 108'had44fbc698c90ccbfc0cf342f81;
    stim[12] = 108'h9dde9a07fa9c1b314a77da50c92;
    stim[13] = 108'hfd611c0353cf412f7d27f227741;
    stim[14] = 108'haf0e9a03e424ab836b2291253ef;
    stim[15] = 108'haac2a77609bd9332c0e8319b4d3;
    stim[16] = 108'h89d7cd7431c886ef87d5337d443;
    stim[17] = 108'ha3722180db7b9aecb9c67fd9325;
    stim[18] = 108'hb9704ea920ef9574a1770e04c21;
    stim[19] = 108'h840e26ad23aa5f854c2cedee94f;
    stim[20] = 108'he7f4e0f83904bd4100db0db3e5b;
    stim[21] = 108'hcb199aa0abab1e521bb8c31a64e;
    stim[22] = 108'h9568c77fd7abfec0546dd4c8e2b;
    stim[23] = 108'hf44cbb447df76f447c55c8967cd;
    stim[24] = 108'hb57fffa355757682e2ad965f62d;
    stim[25] = 108'h92725e075dffe8a2f1a55435ffa;
    stim[26] = 108'ha32b3779697cf25a5853b7948e6;
    stim[27] = 108'h9b0848c98e88e61a378e0ebbef6;
    stim[28] = 108'he6d0faadfe801f4ca38e591e02f;
    stim[29] = 108'hac30b98b97359e21b0797bdb776;
    stim[30] = 108'hf1b545b30b9816e4890ab10db91;
    stim[31] = 108'hf8ffde4ce4e11e7bf9bd9018cbb;
    stim[32] = 108'h8079eff726b48e679898971b09e;
    stim[33] = 108'h8d77d75d0d6496a25abc096135d;
    stim[34] = 108'h9f46939382427bd095e46ea731b;
    stim[35] = 108'hfcad4bb25f724e16301a6dad1d3;
    stim[36] = 108'h88813cfe7df0989c22c7d833dab;
    stim[37] = 108'hb1523fd42481267be18468ecd97;
    stim[38] = 108'he7978e8cca34cd53ce47a8be562;
    stim[39] = 108'hf065072507f7cdfb4888c1f5114;
    stim[40] = 108'hc2ec1b452b63fc7e5d90ebcd199;
    stim[41] = 108'h996b02a547b15aed324b2cec348;
    stim[42] = 108'hbe7197f95192d4047f409e28501;
    stim[43] = 108'hc6a98d4e7d99adf448494557304;
    stim[44] = 108'hab0a4bc8b9fb2b49a1ecf86606a;
    stim[45] = 108'hf90eb164f7c91f8fbb58776e1d0;
    stim[46] = 108'h8bc5360971c6861a6de84d0eea2;
    stim[47] = 108'hfffd4b71add9312122796767c09;
    stim[48] = 108'hee6142878be945d005d50ed88fc;
    stim[49] = 108'ha780ba9ce5e3d96ddad949da225;
    stim[50] = 108'he41769a100463a725fd1ff006b3;
    stim[51] = 108'haa11643392c131b8c47da3b3ec8;
    stim[52] = 108'hd680e7cede99dc95a5a5ad1caf2;
    stim[53] = 108'hf44eafe774bb29c688ea3fd479d;
    stim[54] = 108'he745be0702faa00617791f409d4;
    stim[55] = 108'hedbf8dcbe32f7b9e668f03c868f;
    stim[56] = 108'hddffe987a1f16c723c65efb7cf5;
    stim[57] = 108'he1ff655bb7f40933f7d6269eb9a;
    stim[58] = 108'h87a1f12d1d1f0c2ddd693336793;
    stim[59] = 108'h84aedbd27e7fcb1b2659e6f5f36;
    stim[60] = 108'h8c3685007080c16698f74420ac3;
    stim[61] = 108'he50cc486df6df3d8e2225c8598e;
    stim[62] = 108'hdab49c8593dfb2f4a190c332fec;
    stim[63] = 108'haaed8490e00874fb3ffbc9d42f7;
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
      expv[0] = 107'h000000000000000000000000000;
      expv[1] = 107'h000000000000000000000000000;
      expv[2] = 107'h000000000000000000000000000;
      expv[3] = 107'h3255f3d3dd9bb79f60c08b16498;
      expv[4] = 107'h3c7bd829c3a8766203dfc311adb;
      expv[5] = 107'h54f2a62851acd6ac3348d5dcba6;
      expv[6] = 107'h420c7b58515d69224f07bc8a33c;
      expv[7] = 107'h0fa67a499806cf8f3010807e2b0;
      expv[8] = 107'h3edfdd2e7466a96efc19229dff0;
      expv[9] = 107'h1c3eada3efba7cfe1d7c74e6048;
      expv[10] = 107'h1c829f0af58b032887e04246400;
      expv[11] = 107'h4e756d3e222a017f85f8367bee2;
      expv[12] = 107'h2d44fbc698c90ccbfc0cf342f81;
      expv[13] = 107'h1dde9a07fa9c1b314a77da50c92;
      expv[14] = 107'h7d611c0353cf412f7d27f227741;
      expv[15] = 107'h2f0e9a03e424ab836b2291253ef;
      expv[16] = 107'h2ac2a77609bd9332c0e8319b4d3;
      expv[17] = 107'h09d7cd7431c886ef87d5337d443;
      expv[18] = 107'h23722180db7b9aecb9c67fd9325;
      expv[19] = 107'h39704ea920ef9574a1770e04c21;
      expv[20] = 107'h040e26ad23aa5f854c2cedee94f;
      expv[21] = 107'h67f4e0f83904bd4100db0db3e5b;
      expv[22] = 107'h4b199aa0abab1e521bb8c31a64e;
      expv[23] = 107'h1568c77fd7abfec0546dd4c8e2b;
      expv[24] = 107'h744cbb447df76f447c55c8967cd;
      expv[25] = 107'h357fffa355757682e2ad965f62d;
      expv[26] = 107'h12725e075dffe8a2f1a55435ffa;
      expv[27] = 107'h232b3779697cf25a5853b7948e6;
      expv[28] = 107'h1b0848c98e88e61a378e0ebbef6;
      expv[29] = 107'h66d0faadfe801f4ca38e591e02f;
      expv[30] = 107'h2c30b98b97359e21b0797bdb776;
      expv[31] = 107'h71b545b30b9816e4890ab10db91;
      expv[32] = 107'h78ffde4ce4e11e7bf9bd9018cbb;
      expv[33] = 107'h0079eff726b48e679898971b09e;
      expv[34] = 107'h0d77d75d0d6496a25abc096135d;
      expv[35] = 107'h1f46939382427bd095e46ea731b;
      expv[36] = 107'h7cad4bb25f724e16301a6dad1d3;
      expv[37] = 107'h08813cfe7df0989c22c7d833dab;
      expv[38] = 107'h31523fd42481267be18468ecd97;
      expv[39] = 107'h67978e8cca34cd53ce47a8be562;
      expv[40] = 107'h7065072507f7cdfb4888c1f5114;
      expv[41] = 107'h42ec1b452b63fc7e5d90ebcd199;
      expv[42] = 107'h196b02a547b15aed324b2cec348;
      expv[43] = 107'h3e7197f95192d4047f409e28501;
      expv[44] = 107'h46a98d4e7d99adf448494557304;
      expv[45] = 107'h2b0a4bc8b9fb2b49a1ecf86606a;
      expv[46] = 107'h790eb164f7c91f8fbb58776e1d0;
      expv[47] = 107'h0bc5360971c6861a6de84d0eea2;
      expv[48] = 107'h7ffd4b71add9312122796767c09;
      expv[49] = 107'h6e6142878be945d005d50ed88fc;
      expv[50] = 107'h2780ba9ce5e3d96ddad949da225;
      expv[51] = 107'h641769a100463a725fd1ff006b3;
      expv[52] = 107'h2a11643392c131b8c47da3b3ec8;
      expv[53] = 107'h5680e7cede99dc95a5a5ad1caf2;
      expv[54] = 107'h744eafe774bb29c688ea3fd479d;
      expv[55] = 107'h6745be0702faa00617791f409d4;
      expv[56] = 107'h6dbf8dcbe32f7b9e668f03c868f;
      expv[57] = 107'h5dffe987a1f16c723c65efb7cf5;
      expv[58] = 107'h61ff655bb7f40933f7d6269eb9a;
      expv[59] = 107'h07a1f12d1d1f0c2ddd693336793;
      expv[60] = 107'h04aedbd27e7fcb1b2659e6f5f36;
      expv[61] = 107'h0c3685007080c16698f74420ac3;
      expv[62] = 107'h650cc486df6df3d8e2225c8598e;
      expv[63] = 107'h5ab49c8593dfb2f4a190c332fec;
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
