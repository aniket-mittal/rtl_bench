// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10429 dut (
    .clk(clk),
    .E_src1(in_vec[65:34]),
    .E_src2(in_vec[33:2]),
    .M_en(in_vec[1:1]),
    .reset_n(in_vec[0:0]),
    .M_mul_cell_p1(out_vec[95:64]),
    .M_mul_cell_p2(out_vec[63:32]),
    .M_mul_cell_p3(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h32cf05e530eb0d7b4;
    stim[1] = 66'h329d6cff8c37b970e;
    stim[2] = 66'h2d04efe2190e46bd5;
    stim[3] = 66'h143f036313e884c43;
    stim[4] = 66'h0a6861e64339b0d0d;
    stim[5] = 66'h02d783cde2c07ad39;
    stim[6] = 66'h180a964bf3f1343c3;
    stim[7] = 66'h3cf979785364916a5;
    stim[8] = 66'h20e15d24200348879;
    stim[9] = 66'h1e668250a78b2ab07;
    stim[10] = 66'h0c7fbff788b60da45;
    stim[11] = 66'h0ca318f0dc80d6937;
    stim[12] = 66'h0691123b84673ac05;
    stim[13] = 66'h3221aedbd5b27c1f9;
    stim[14] = 66'h19ede7b47e7298f09;
    stim[15] = 66'h0f53d669b0bf930a1;
    stim[16] = 66'h3e033a00fb3e0f721;
    stim[17] = 66'h209a219ca080089a7;
    stim[18] = 66'h20dbbcb394af66317;
    stim[19] = 66'h05eb591876a32492f;
    stim[20] = 66'h19bdc10485580e649;
    stim[21] = 66'h3bba6dab5e9d0aad3;
    stim[22] = 66'h35c10c89e40fac5c5;
    stim[23] = 66'h022dc379fac706303;
    stim[24] = 66'h14381ad0a9f4c5b47;
    stim[25] = 66'h2583c86fb6c9f4fe5;
    stim[26] = 66'h11979851041a84019;
    stim[27] = 66'h182b2c608d814aaeb;
    stim[28] = 66'h39aabb4f6a39e4f27;
    stim[29] = 66'h213c79b8a5b1d6849;
    stim[30] = 66'h072c34822a7271431;
    stim[31] = 66'h20d6bc2a6b54576f5;
    stim[32] = 66'h1edc6e193f84a34cb;
    stim[33] = 66'h2a0545f083572c9af;
    stim[34] = 66'h3f6d5f3eabde48aa7;
    stim[35] = 66'h194787914a75536e5;
    stim[36] = 66'h2e4cd8e4e69b43dcb;
    stim[37] = 66'h0cac9eee221d908bb;
    stim[38] = 66'h3ba9ad00cb53faa65;
    stim[39] = 66'h324b87c70c152c965;
    stim[40] = 66'h0130a8743c760adc1;
    stim[41] = 66'h3b0ffe31862f57ef5;
    stim[42] = 66'h2e4adb75001c0c869;
    stim[43] = 66'h38bdd9f944eb440d3;
    stim[44] = 66'h38010560ec484a78d;
    stim[45] = 66'h0c2621c89ac39a085;
    stim[46] = 66'h058241e0a9d1e0221;
    stim[47] = 66'h24dfb22ee0ad22531;
    stim[48] = 66'h09058645f1e4a4ea5;
    stim[49] = 66'h100ba24f04d5d11ad;
    stim[50] = 66'h3f6e1e782514c0433;
    stim[51] = 66'h034a8c595007a38c1;
    stim[52] = 66'h26f1a089c2bf081a7;
    stim[53] = 66'h0dad4371d2af50431;
    stim[54] = 66'h2abf97bb35a68ef23;
    stim[55] = 66'h39d224aa25fe4e1ad;
    stim[56] = 66'h11ab3fa48815673c5;
    stim[57] = 66'h3b13eba65c881945d;
    stim[58] = 66'h3037c24c5350c5aed;
    stim[59] = 66'h1e90716a0addad01b;
    stim[60] = 66'h22ae053a94ff5d4b7;
    stim[61] = 66'h1e08ffe80ecfd0f09;
    stim[62] = 66'h0a983cd3c49e10393;
    stim[63] = 66'h09ca2dbab92bdb3f3;
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
      expv[0] = 96'h04f77804120593702acf928c;
      expv[1] = 96'ha18b507a225bb644b5b4e01f;
      expv[2] = 96'h142b1d284afbc54812f6442f;
      expv[3] = 96'h01023cc00436c6980607c3c0;
      expv[4] = 96'h676d080b06d4ff761fc08823;
      expv[5] = 96'h0dfc1fc20842ec370a72c0a4;
      expv[6] = 96'h48c9cc10486148fc4e7c4760;
      expv[7] = 96'h3e8d668945a7c752425dbb2d;
      expv[8] = 96'h0f88c8e03a4deb5011871396;
      expv[9] = 96'h062ccec205b85358511bf11a;
      expv[10] = 96'h3689c0be22d35f500aa7e4de;
      expv[11] = 96'h23308fa72c6e014911d46c1c;
      expv[12] = 96'h42f2c2ee05043f08181c8644;
      expv[13] = 96'hb01450a23f8a7427bc6051f4;
      expv[14] = 96'h3de32d629af699ea286a5dae;
      expv[15] = 96'h1aab49f04448beb4123d0858;
      expv[16] = 96'h37fdf958d6c386e83bdca560;
      expv[17] = 96'h121248c24445e40011874ca8;
      expv[18] = 96'h90e528864e793e164e6e73a6;
      expv[19] = 96'h395cba6b55b17f0c0d8799af;
      expv[20] = 96'h00ea5444005700c01727b7de;
      expv[21] = 96'h1e78d3a45761386427da35d4;
      expv[22] = 96'h22c31a371c4215729508acc4;
      expv[23] = 96'h015815400cc4924400d7b140;
      expv[24] = 96'h098f3ce246507566073546e0;
      expv[25] = 96'h1bf06bce1ce2adf27c405197;
      expv[26] = 96'h06168798063c862804678634;
      expv[27] = 96'h1da04c742574e38a102274f8;
      expv[28] = 96'h88f44be59c861a0b8528b97a;
      expv[29] = 96'h513bafe487fbe5ae2ec612f2;
      expv[30] = 96'ha1aa00608b4c30481614c840;
      expv[31] = 96'h581f11c5a2ee5a793018ab72;
      expv[32] = 96'h65b31788b7002f0844155912;
      expv[33] = 96'h108ed216013d63b87524dac7;
      expv[34] = 96'h10ebb50a55a9f82a2259867d;
      expv[35] = 96'h0930a0dd04f23c691eb318ae;
      expv[36] = 96'h0601f4763c10d3970b2c75b6;
      expv[37] = 96'h1ffbab1041f2c6d00d1afffc;
      expv[38] = 96'ha4f653cb1fdc13eddab25d36;
      expv[39] = 96'h15ac48bc05df75308c27ecfe;
      expv[40] = 96'h1b74bb0098dd578000ceaae0;
      expv[41] = 96'h5d09242e180a3a2e5859cb83;
      expv[42] = 96'h157e8f8800300cc0243d345e;
      expv[43] = 96'h06936a8407fc34c10e5d8a2c;
      expv[44] = 96'h03850e290ee258e324a7478c;
      expv[45] = 96'h36f73b62388299dc13c40398;
      expv[46] = 96'h03c4fd1004e7e30e0b1034c8;
      expv[47] = 96'h6ba7aa84667c197c4f1a3768;
      expv[48] = 96'h0e78c52f138f301e14d07486;
      expv[49] = 96'h24ad4c140a5e176411270b3a;
      expv[50] = 96'h007f9680469d03a001099ca0;
      expv[51] = 96'h1b6f48f00c5f09d6074fc3e0;
      expv[52] = 96'h107a41ff0595a46413b8a436;
      expv[53] = 96'h03802c540405b1eb0de6857c;
      expv[54] = 96'h162a8c604f9261f827ee2070;
      expv[55] = 96'h20520c38570fbd6832f86b18;
      expv[56] = 96'h9c109f722026c67a2b5357ec;
      expv[57] = 96'h44f20cbf4dd5f5205d506619;
      expv[58] = 96'h00d0eccb02c624d311200ce5;
      expv[59] = 96'h8afec1f0218e537055f89186;
      expv[60] = 96'h09929f2206dc89423f7e7a58;
      expv[61] = 96'h43a897403b28c8601fcc3386;
      expv[62] = 96'h3dac725c118d9b080abdbd80;
      expv[63] = 96'h4ddec658a36571f610ab6b60;
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
