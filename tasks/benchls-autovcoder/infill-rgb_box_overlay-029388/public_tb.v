// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_029388 dut (
    .pixelclk(clk),
    .reset_n(in_vec[99:99]),
    .i_rgb(in_vec[98:75]),
    .i_hsync(in_vec[74:74]),
    .i_vsync(in_vec[73:73]),
    .i_de(in_vec[72:72]),
    .hcount(in_vec[71:60]),
    .vcount(in_vec[59:48]),
    .hcount_l(in_vec[47:36]),
    .hcount_r(in_vec[35:24]),
    .vcount_l(in_vec[23:12]),
    .vcount_r(in_vec[11:0]),
    .o_rgb(out_vec[26:3]),
    .o_hsync(out_vec[2:2]),
    .o_vsync(out_vec[1:1]),
    .o_de(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h0ce97211de1e212e46b583ee5;
    stim[1] = 100'h612a52d29a0f876c86ae283fe;
    stim[2] = 100'hba85a752a4e349f5b45eec2c1;
    stim[3] = 100'hd0347b55c6c0784c2a23e7fa7;
    stim[4] = 100'he9a3ae2a5ff76b87927abcb2d;
    stim[5] = 100'h80faf7a9cd3c663de8f57e9a6;
    stim[6] = 100'hd591c1cce83d791158f18d7fc;
    stim[7] = 100'hbec45d066807130dadf9b40c5;
    stim[8] = 100'h8f35838dc326c474749160795;
    stim[9] = 100'hcc2de7ee049e46fcb9f74f9fe;
    stim[10] = 100'h879576dd6afb375fd5c237d80;
    stim[11] = 100'haf658b5b1cb5c9291db12a72e;
    stim[12] = 100'hda2e6ae38d05770040c31d05f;
    stim[13] = 100'he81cbff4ffb5e2fdb5e54c302;
    stim[14] = 100'hd48ccd3b60d6c6ad425cbc5a9;
    stim[15] = 100'h9b209de80fc03920b6d1fd4f4;
    stim[16] = 100'he859ff1159b5c5a2e6dde3731;
    stim[17] = 100'hd32cfe331bdedd37b44af2869;
    stim[18] = 100'had630de503c3e76e972e4a79a;
    stim[19] = 100'hd87b0786f172ccb5145ce083b;
    stim[20] = 100'hdf6846764c194ffce84b79af2;
    stim[21] = 100'hac2a2e93071deb7190e43c723;
    stim[22] = 100'hc2ef183bb6f7af429dfedbc44;
    stim[23] = 100'ha5b45a6dc1d17f95471ff261d;
    stim[24] = 100'hf81acd465c65113d4fa4f2a28;
    stim[25] = 100'h31e1fd01f54456201e73fcfac;
    stim[26] = 100'h9c9f8f0c0b3e408fe77aafa43;
    stim[27] = 100'hd9645bb6ddb200e150c202156;
    stim[28] = 100'h8cafe8f720b91a4237b6b3ca6;
    stim[29] = 100'hefc21f6018f7f79df57ed4d13;
    stim[30] = 100'hd8c494b8fe3c258ead510ddf8;
    stim[31] = 100'hfa1120745dc81a05f7ee32b6a;
    stim[32] = 100'ha37c46fd83390e540159fc1a2;
    stim[33] = 100'h2bb3746b2371b669e174fbe4c;
    stim[34] = 100'h888b077ac2dbb6b535a71739f;
    stim[35] = 100'hd01da65238134c36ed9c9d78c;
    stim[36] = 100'heee319aa66d28ff4a7126ea5c;
    stim[37] = 100'h9220fe2dc740193514a2290ef;
    stim[38] = 100'hcd016585708d130bdc98c4c9d;
    stim[39] = 100'h999b5144f832181ef54350541;
    stim[40] = 100'heae8b807467d4283887d58cff;
    stim[41] = 100'ha2ad0833c1d7109154ce5af5d;
    stim[42] = 100'he354d2f9e13ffa1f61f70d27a;
    stim[43] = 100'hb199f5541c597094cea7e0183;
    stim[44] = 100'hedb96fc6268ce845ee5506a46;
    stim[45] = 100'hb82f716cc1c36983015496411;
    stim[46] = 100'hc7b58b3bc47ca3f23e65476a1;
    stim[47] = 100'h981c9bd335746c519ec137928;
    stim[48] = 100'hae7d0205b0af9c72add48afa2;
    stim[49] = 100'h999d9a887d1976c3142c881d5;
    stim[50] = 100'hfb17cd52b07117cc3174e9046;
    stim[51] = 100'he49a5e1c71fe9f3cc39459887;
    stim[52] = 100'hb6518a2aa605a5083e91147ae;
    stim[53] = 100'h96bf94f1c0228a2fcaaa73b81;
    stim[54] = 100'h47dbc02a5282e10918112b676;
    stim[55] = 100'hdcd2f6e28771c0df36be7faa2;
    stim[56] = 100'h96c2e10ad4334b16d86d47087;
    stim[57] = 100'hf89a311362fd9742fc17ac982;
    stim[58] = 100'h97a9f1cc80dea560d4d5ccc44;
    stim[59] = 100'hc46a260a716f8e8ee1f3aac4f;
    stim[60] = 100'ha2de336950ce8d31acdcfc5ca;
    stim[61] = 100'hbf485732cc4ba4f8b07cb8829;
    stim[62] = 100'he6b0a5e7ffcf32285d8da3910;
    stim[63] = 100'hd1560e6ad49942f7ea9fa0533;
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
      expv[0] = 27'h000000x;
      expv[1] = 27'h0000001;
      expv[2] = 27'h0000005;
      expv[3] = 27'h3a85a75;
      expv[4] = 27'h50347b5;
      expv[5] = 27'h69a3ae2;
      expv[6] = 27'h00faf7a;
      expv[7] = 27'h5591c1c;
      expv[8] = 27'h3ec45d0;
      expv[9] = 27'h0f35838;
      expv[10] = 27'h4c2de7e;
      expv[11] = 27'h079576d;
      expv[12] = 27'h2f658b5;
      expv[13] = 27'h5a2e6ae;
      expv[14] = 27'h681cbff;
      expv[15] = 27'h548ccd3;
      expv[16] = 27'h1b209de;
      expv[17] = 27'h6859ff1;
      expv[18] = 27'h532cfe3;
      expv[19] = 27'h2d630de;
      expv[20] = 27'h587b078;
      expv[21] = 27'h5f68467;
      expv[22] = 27'h2c2a2e9;
      expv[23] = 27'h42ef183;
      expv[24] = 27'h25b45a6;
      expv[25] = 27'h0000004;
      expv[26] = 27'h0000000;
      expv[27] = 27'h1c9f8f0;
      expv[28] = 27'h59645bb;
      expv[29] = 27'h0cafe8f;
      expv[30] = 27'h6fc21f6;
      expv[31] = 27'h58c494b;
      expv[32] = 27'h7a11207;
      expv[33] = 27'h0000007;
      expv[34] = 27'h0000006;
      expv[35] = 27'h088b077;
      expv[36] = 27'h501da65;
      expv[37] = 27'h6ee319a;
      expv[38] = 27'h1220fe2;
      expv[39] = 27'h4d01658;
      expv[40] = 27'h199b514;
      expv[41] = 27'h6ae8b80;
      expv[42] = 27'h22ad083;
      expv[43] = 27'h6354d2f;
      expv[44] = 27'h3199f55;
      expv[45] = 27'h6db96fc;
      expv[46] = 27'h382f716;
      expv[47] = 27'h47b58b3;
      expv[48] = 27'h181c9bd;
      expv[49] = 27'h2e7d020;
      expv[50] = 27'h199d9a8;
      expv[51] = 27'h7b17cd5;
      expv[52] = 27'h649a5e1;
      expv[53] = 27'h36518a2;
      expv[54] = 27'h0000007;
      expv[55] = 27'h0000002;
      expv[56] = 27'h5cd2f6e;
      expv[57] = 27'h16c2e10;
      expv[58] = 27'h789a311;
      expv[59] = 27'h17a9f1c;
      expv[60] = 27'h446a260;
      expv[61] = 27'h22de336;
      expv[62] = 27'h3f48573;
      expv[63] = 27'h66b0a5e;
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
