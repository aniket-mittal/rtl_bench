// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 133;
  localparam OW = 70;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_071009 dut (
    .clk(clk),
    .req0(in_vec[132:132]),
    .req1(in_vec[131:131]),
    .cmd0(in_vec[130:130]),
    .cmd1(in_vec[129:129]),
    .ack_i(in_vec[128:128]),
    .wdata0(in_vec[127:96]),
    .wdata1(in_vec[95:64]),
    .addr0(in_vec[63:32]),
    .addr1(in_vec[31:0]),
    .ack_o_0(out_vec[69:69]),
    .ack_o_1(out_vec[68:68]),
    .grant0(out_vec[67:67]),
    .grant1(out_vec[66:66]),
    .cmd(out_vec[65:65]),
    .req(out_vec[64:64]),
    .wdata(out_vec[63:32]),
    .addr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 133'h017b013cec7a9d7a3a8d851cdce5ef310a;
    stim[1] = 133'h15c441518b82dd0c95b5aed3d882ce5cad;
    stim[2] = 133'h1e933dfb08a449dfbd49fbf57ed33a0b41;
    stim[3] = 133'h1dbb62e397d3eb798724360ae6948cd640;
    stim[4] = 133'h08c4657d934982af446d33880d4e61a205;
    stim[5] = 133'h187d3ae84d7a219c4ae9d9916bda61ebd7;
    stim[6] = 133'h08b813ef8649d5e8c923bc6fd8f96f83df;
    stim[7] = 133'h1f5eeebcb8728c44665e07c5a6d6ca921f;
    stim[8] = 133'h034902216df119a5c222704480cd9f0cca;
    stim[9] = 133'h1f34d9060d2baf081dcfbcc44351803209;
    stim[10] = 133'h0d9c169666edf8b08d8aedaa94e160a4ad;
    stim[11] = 133'h1cbc44f2b55ac756aca818a6c3af41d892;
    stim[12] = 133'h01d0fd802d79ea67587cc170412063b627;
    stim[13] = 133'h09d051828e6427629818d95f63ee29a249;
    stim[14] = 133'h099b09e39dcc0c18774526f8a01f555f7c;
    stim[15] = 133'h1df4b2dd72b84317213651d1f436f096be;
    stim[16] = 133'h1ce9bc1134b8da8fda08097aee9e5e0786;
    stim[17] = 133'h0bf8c4eea9c12ce9f10ef62b375b20f6bf;
    stim[18] = 133'h195553dce11dae5f941e5de0c360078c89;
    stim[19] = 133'h0f072bc5801882b7d022d87db07e80212e;
    stim[20] = 133'h1bf9288f756e0d52d37cf2e50b3406f7ba;
    stim[21] = 133'h12ff4af7e2c6c7bc14c5379a529179d31e;
    stim[22] = 133'h0f85a94a8d1526ab60a5dac4ea439c2d52;
    stim[23] = 133'h1b4f65af91459da82988bd805bc990a68d;
    stim[24] = 133'h0961f7551d37749aa22ab263fada1eb588;
    stim[25] = 133'h101fe4f40eb93935767106d43bb5c6773a;
    stim[26] = 133'h09c00ebe23045ec8a057263ad9ecebd92a;
    stim[27] = 133'h0707030825d25d405397c78f5fde20b533;
    stim[28] = 133'h17dc5e1e92600e753dc8a1042f671a5568;
    stim[29] = 133'h08717cfab8537651e6f74534e79fcdc9f2;
    stim[30] = 133'h0a78634da8f52d0732f93751996251d09c;
    stim[31] = 133'h0160850a7fe4193ef4c7da49ac6b7dfafb;
    stim[32] = 133'h0fa485a4a65943402423855788d5023874;
    stim[33] = 133'h06a0e3e04b50f8f9b5555f02cb4e021862;
    stim[34] = 133'h129fe6fc04ed55d54379a108e44b65706e;
    stim[35] = 133'h069534d9eb075197afabf379fd94aadac9;
    stim[36] = 133'h05d62d7ae0c952983a9e70adaf7ee73499;
    stim[37] = 133'h078049243bea96cabbd540feb24c0886cd;
    stim[38] = 133'h1e3a3c4df849a580276aed5212f2c5537c;
    stim[39] = 133'h0f4580cd4c33980c4f16935b5a13261050;
    stim[40] = 133'h0e804ab8c7792b49e128decadcc379080e;
    stim[41] = 133'h148607cf22847571d8625caefbb076e007;
    stim[42] = 133'h08a52a171e16c1a1a8ce1212b62f68eab4;
    stim[43] = 133'h1c7c4cc815b28a5429869c201ac51dc487;
    stim[44] = 133'h06a29c34ed90038d0ae1089ba118217917;
    stim[45] = 133'h18cc16f0109aba5913557ad9da22e006d0;
    stim[46] = 133'h192abc2fffc49e9bbb57564f21e823ba2b;
    stim[47] = 133'h1e1c92e3f43ed50d5c8a1829ec14fd8a10;
    stim[48] = 133'h0b976da91673eb8ba43c956a37c537222c;
    stim[49] = 133'h08c4963f19eb0e6463db6fc5570af0a8fd;
    stim[50] = 133'h0d291528569b15c89e94023c8a47ec0a0c;
    stim[51] = 133'h1fe5ef03baa6f1ec3407b80f3dc3ace83a;
    stim[52] = 133'h07d04e8b9c606e03111db8efc40b7f346f;
    stim[53] = 133'h18acbe5db8b4c3af5340a6639485c62a7b;
    stim[54] = 133'h1c0582a61053c20701f15415bf244084e1;
    stim[55] = 133'h1bba63f20746932adf7f57c4ba34eb22c0;
    stim[56] = 133'h1a414aca4928bdfc7d76ab06acc0605fe9;
    stim[57] = 133'h1bc80f3d9606fe58ae7908740a7ac061b5;
    stim[58] = 133'h0ddec7400801e58d120093c56e5711d369;
    stim[59] = 133'h093ed94f3d432c83fc3ba7873e9bc6663c;
    stim[60] = 133'h14196e143d48a924299a52e43a53dbe99d;
    stim[61] = 133'h18e54a35841e1a6c723ff23e8f9b9ef6ee;
    stim[62] = 133'h1117506ae92db7a2afc6e14e1ac20c8d6f;
    stim[63] = 133'h16e81d83fc7a0248873b50f498fb603858;
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
      expv[0] = 70'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 70'h000000000000000000;
      expv[2] = 70'h000000000000000000;
      expv[3] = 70'h000000000000000000;
      expv[4] = 70'h000000000000000000;
      expv[5] = 70'h154982af444e61a205;
      expv[6] = 70'h000000000000000000;
      expv[7] = 70'h000000000000000000;
      expv[8] = 70'h000000000000000000;
      expv[9] = 70'h000000000000000000;
      expv[10] = 70'h000000000000000000;
      expv[11] = 70'h000000000000000000;
      expv[12] = 70'h000000000000000000;
      expv[13] = 70'h000000000000000000;
      expv[14] = 70'h000000000000000000;
      expv[15] = 70'h15cc0c18771f555f7c;
      expv[16] = 70'h2bf4b2dd723651d1f4;
      expv[17] = 70'h000000000000000000;
      expv[18] = 70'h17c12ce9f15b20f6bf;
      expv[19] = 70'h151dae5f9460078c89;
      expv[20] = 70'h171882b7d07e80212e;
      expv[21] = 70'h29f9288f757cf2e50b;
      expv[22] = 70'h000000000000000000;
      expv[23] = 70'h171526ab60439c2d52;
      expv[24] = 70'h000000000000000000;
      expv[25] = 70'h000000000000000000;
      expv[26] = 70'h291fe4f40e7106d43b;
      expv[27] = 70'h000000000000000000;
      expv[28] = 70'h000000000000000000;
      expv[29] = 70'h000000000000000000;
      expv[30] = 70'h000000000000000000;
      expv[31] = 70'h17f52d07326251d09c;
      expv[32] = 70'h000000000000000000;
      expv[33] = 70'h000000000000000000;
      expv[34] = 70'h000000000000000000;
      expv[35] = 70'h299fe6fc0479a108e4;
      expv[36] = 70'h000000000000000000;
      expv[37] = 70'h000000000000000000;
      expv[38] = 70'h000000000000000000;
      expv[39] = 70'h000000000000000000;
      expv[40] = 70'h1733980c4f13261050;
      expv[41] = 70'h000000000000000000;
      expv[42] = 70'h2b8607cf22625caefb;
      expv[43] = 70'h1516c1a1a82f68eab4;
      expv[44] = 70'h000000000000000000;
      expv[45] = 70'h000000000000000000;
      expv[46] = 70'h159aba591322e006d0;
      expv[47] = 70'h000000000000000000;
      expv[48] = 70'h000000000000000000;
      expv[49] = 70'h000000000000000000;
      expv[50] = 70'h15eb0e64630af0a8fd;
      expv[51] = 70'h159b15c89e47ec0a0c;
      expv[52] = 70'h000000000000000000;
      expv[53] = 70'h000000000000000000;
      expv[54] = 70'h000000000000000000;
      expv[55] = 70'h000000000000000000;
      expv[56] = 70'h29ba63f2077f57c4ba;
      expv[57] = 70'h000000000000000000;
      expv[58] = 70'h1706fe58ae7ac061b5;
      expv[59] = 70'h1501e58d125711d369;
      expv[60] = 70'h000000000000000000;
      expv[61] = 70'h000000000000000000;
      expv[62] = 70'h000000000000000000;
      expv[63] = 70'h000000000000000000;
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
