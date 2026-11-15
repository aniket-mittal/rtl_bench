// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 87;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_173937 dut (
    .aclk_i(clk),
    .bclk_i(in_vec[86:86]),
    .adat_i(in_vec[85:54]),
    .bdat_i(in_vec[53:22]),
    .aadr_i(in_vec[21:12]),
    .badr_i(in_vec[11:2]),
    .awr_i(in_vec[1:1]),
    .bwr_i(in_vec[0:0]),
    .adat_o(out_vec[63:32]),
    .bdat_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 87'h54867a9cae1b848a721030;
    stim[1] = 87'h2a83c7d0590ff285312ede;
    stim[2] = 87'h2b76baf63b619d9e06bb46;
    stim[3] = 87'h1405bdb6709cba62b7682e;
    stim[4] = 87'h0ecc0aca647e089a34bbd6;
    stim[5] = 87'h797a16a93be90c189f90a0;
    stim[6] = 87'h7865def861644a164d883f;
    stim[7] = 87'h4157fba0e42980c83eeb33;
    stim[8] = 87'h6317eee6c8bc4c29e35ff8;
    stim[9] = 87'h0256e598a9254aa1cf5db2;
    stim[10] = 87'h6d6612b913685a1fed3749;
    stim[11] = 87'h56d552e96abbd2fa5e0926;
    stim[12] = 87'h7afac7d9bd66176486c0b8;
    stim[13] = 87'h53ef08026430131c4f40e1;
    stim[14] = 87'h293054b4ecc416470a0e56;
    stim[15] = 87'h78286b858080a69c98a66f;
    stim[16] = 87'h063f0dc93d7df2de8ac196;
    stim[17] = 87'h6b43e3a7f74d081631e65c;
    stim[18] = 87'h35902db193a0c6ff5766e2;
    stim[19] = 87'h3128cd3a058abae1f2d846;
    stim[20] = 87'h199d1e976c5f554ff68605;
    stim[21] = 87'h146db70281330430868dfc;
    stim[22] = 87'h46bf89dd69c00a726190a3;
    stim[23] = 87'h7e2a7c553412ba1d473a72;
    stim[24] = 87'h7fa899a2386578ac24583a;
    stim[25] = 87'h22384a6040b95c511c7ec0;
    stim[26] = 87'h3e85083f83ea1088e599b7;
    stim[27] = 87'h66f9daa80050cc462019b2;
    stim[28] = 87'h6cfa5c67c71b12e1e03f38;
    stim[29] = 87'h5cc7d85cafaf435ebf6703;
    stim[30] = 87'h6c7f662d1a1f0aef3ec705;
    stim[31] = 87'h096c35624cf516bd259f7d;
    stim[32] = 87'h4feba3daa14e8a8ca4432c;
    stim[33] = 87'h3bc62ba9254a518c0567a9;
    stim[34] = 87'h4a368770bc3bbe814f29b0;
    stim[35] = 87'h7709345fcb377e999fd66c;
    stim[36] = 87'h26925858fa77c8587ccd4d;
    stim[37] = 87'h6fe46e28ca22c5970aa483;
    stim[38] = 87'h1b33c295a5b979006d459b;
    stim[39] = 87'h122608430686672a2f246c;
    stim[40] = 87'h764a9d029bd040f1608898;
    stim[41] = 87'h6a5e0b5550d65f04abb192;
    stim[42] = 87'h5e8eb18508d1d98db9ae2d;
    stim[43] = 87'h6a30240900e70879bec492;
    stim[44] = 87'h29ad98c70aa0df358474ca;
    stim[45] = 87'h02f0dd24cc1170d0942007;
    stim[46] = 87'h7162d3b8d2068bbc82c148;
    stim[47] = 87'h75a5febc7942d9bc832d9b;
    stim[48] = 87'h6a9b49fc447d815747216e;
    stim[49] = 87'h5115048939a0af05e29400;
    stim[50] = 87'h1f0561a5946494619a916d;
    stim[51] = 87'h10ad983202af4014903cd7;
    stim[52] = 87'h7f57eccc90eac80361de75;
    stim[53] = 87'h5b24d19fec69dacfca043f;
    stim[54] = 87'h622556ecb774ceeaecbff5;
    stim[55] = 87'h6d1fa2fd5b7c4832e4a459;
    stim[56] = 87'h73da0dc045aaa4bf011249;
    stim[57] = 87'h226568ac482e1e5dbad734;
    stim[58] = 87'h540b0152c40154ccb69abe;
    stim[59] = 87'h0984fc6cb521f604e0fb1d;
    stim[60] = 87'h0611525f8fa1793e934286;
    stim[61] = 87'h1a6db15b1aa56f2973d010;
    stim[62] = 87'h0310b66cc98906d50165b0;
    stim[63] = 87'h22f7e53eb44c5dc84a8911;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'haa0f1f41xxxxxxxx;
      expv[3] = 64'haddaebd8xxxxxxxx;
      expv[4] = 64'h5016f6d9xxxxxxxx;
      expv[5] = 64'h3b302b29xxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'he1977be1xxxxxxxx;
      expv[8] = 64'h055fee83xxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'h095b96624da1687f;
      expv[11] = 64'hxxxxxxxx4da1687f;
      expv[12] = 64'h5b554ba54da1687f;
      expv[13] = 64'hxxxxxxxx4da1687f;
      expv[14] = 64'hxxxxxxxx4da1687f;
      expv[15] = 64'ha4c152d302029a72;
      expv[16] = 64'he0a1ae1602029a72;
      expv[17] = 64'h18fc3724xxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'hd640b6c6xxxxxxxx;
      expv[20] = 64'hc4a334e8xxxxxxxx;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'hxxxxxxxxa70029c9;
      expv[23] = 64'h1afe2775a70029c9;
      expv[24] = 64'hf8a9f154a70029c9;
      expv[25] = 64'hfea26688a70029c9;
      expv[26] = 64'hxxxxxxxxa70029c9;
      expv[27] = 64'hfa1420fexxxxxxxx;
      expv[28] = 64'h9be76aa0xxxxxxxx;
      expv[29] = 64'hxxxxxxxxxxxxxxxx;
      expv[30] = 64'h731f6172xxxxxxxx;
      expv[31] = 64'hxxxxxxxxxxxxxxxx;
      expv[32] = 64'hfa1420fexxxxxxxx;
      expv[33] = 64'hxxxxxxxxxxxxxxxx;
      expv[34] = 64'hxxxxxxxxxxxxxxxx;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'hxxxxxxxxxxxxxxxx;
      expv[37] = 64'hxxxxxxxx288b165c;
      expv[38] = 64'hbf91b8a3288b165c;
      expv[39] = 64'h6ccf0a56288b165c;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'hxxxxxxxxxxxxxxxx;
      expv[42] = 64'ha9782d55xxxxxxxx;
      expv[43] = 64'hxxxxxxxxxxxxxxxx;
      expv[44] = 64'ha8c09024xxxxxxxx;
      expv[45] = 64'ha6b6631cxxxxxxxx;
      expv[46] = 64'h0bc37493xxxxxxxx;
      expv[47] = 64'hxxxxxxxxxxxxxxxx;
      expv[48] = 64'hd697faf1xxxxxxxx;
      expv[49] = 64'haa6d27f1xxxxxxxx;
      expv[50] = 64'hxxxxxxxxxxxxxxxx;
      expv[51] = 64'hxxxxxxxxxxxxxxxx;
      expv[52] = 64'h42b660c843ab200d;
      expv[53] = 64'hxxxxxxxx43ab200d;
      expv[54] = 64'h6c93467f43ab200d;
      expv[55] = 64'hxxxxxxxx43ab200d;
      expv[56] = 64'hxxxxxxxx43ab200d;
      expv[57] = 64'hxxxxxxxx43ab200d;
      expv[58] = 64'hxxxxxxxxxxxxxxxx;
      expv[59] = 64'h502c054bxxxxxxxx;
      expv[60] = 64'hxxxxxxxxxxxxxxxx;
      expv[61] = 64'h1845497exxxxxxxx;
      expv[62] = 64'hxxxxxxxxxxxxxxxx;
      expv[63] = 64'hxxxxxxxxxxxxxxxx;
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
