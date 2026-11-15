// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_157073 dut (
    .clk(clk),
    .MK(in_vec[129:2]),
    .reset(in_vec[1:1]),
    .ed(in_vec[0:0]),
    .WK0_4(out_vec[31:24]),
    .WK1_5(out_vec[23:16]),
    .WK2_6(out_vec[15:8]),
    .WK3_7(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h00ff26b7b5bf98224e04f58eb3320e2a2;
    stim[1] = 130'h2855f9dcb4a61e6585f0f78aba8bc290b;
    stim[2] = 130'h0466a13dfccb2128941968799d26b8b4c;
    stim[3] = 130'h0fe4f951b2ef82577c7ec1694ac4d9795;
    stim[4] = 130'h2a9c55327db50f677bd620c7a4d6e825d;
    stim[5] = 130'h099b5970218fa99c0939a6633e5767160;
    stim[6] = 130'h04000b01ad44502a707bf02912e100fdc;
    stim[7] = 130'h0dd7f8d66d97379eb03fbc85832c0f249;
    stim[8] = 130'h2535add818fb4035974810a7c12f0f6ac;
    stim[9] = 130'h1e91a05bd312050c5876d5264de53f621;
    stim[10] = 130'h02620a11865e2a81ceecd78fc2022b3e8;
    stim[11] = 130'h097d2695eac7e7ced74bee68ab619d589;
    stim[12] = 130'h2e5c18714fc954d7d9b9a4b993a19a848;
    stim[13] = 130'h11941d989109acdf7850d123f6db38338;
    stim[14] = 130'h1c16c215198c9ab40bde4b640ad69bded;
    stim[15] = 130'h31f7c55776f03e678a9cfaf08ab017dbc;
    stim[16] = 130'h0807f10ed97ae2a76b0f886d5934e4f80;
    stim[17] = 130'h0b217324e85e3e532cd9838f59d90ec79;
    stim[18] = 130'h182efb4b9ec4c72a8c75fc5774a77f1c5;
    stim[19] = 130'h32465b4087ac5f604f4763a3181d2f325;
    stim[20] = 130'h3f487a997cf7244702f94c357b2f3ad49;
    stim[21] = 130'h116ff42c1f152f95eca0076c75b2cda7d;
    stim[22] = 130'h3ed2191209ecd107806f5b20b6da13c78;
    stim[23] = 130'h006ffc316f0efc7cc55575c567c40db74;
    stim[24] = 130'h155b88b9411e873a46735690fa8044161;
    stim[25] = 130'h154f992982333771198f997ef9f7b0795;
    stim[26] = 130'h369e95b17963b8caf51c23b5b0bb53564;
    stim[27] = 130'h0f339e50b96d15b9b535b8aa3eba18b5d;
    stim[28] = 130'h29e40c19b43ff3c7d0de1a17a157d4628;
    stim[29] = 130'h3aa72cac1f0354a17ea1aa3ff04376bc0;
    stim[30] = 130'h37f1b11f34d6e65279f8e5ffa4a97e744;
    stim[31] = 130'h235fcbd62d120ae8522772c5026b09914;
    stim[32] = 130'h0ae6dd738f54e5ae1073bcc9fad455898;
    stim[33] = 130'h2ff9fae35911eafca902e74466b387ae0;
    stim[34] = 130'h0ec64e197a91eda597ede4a58637fe4d4;
    stim[35] = 130'h3f6cf7941635efbaddba2621e63ffcbc0;
    stim[36] = 130'h054c4efc793427842cc617e5474b1d349;
    stim[37] = 130'h032337fcd626c19cce953d36323caff48;
    stim[38] = 130'h1697e7558024d260d53d77922ecccece4;
    stim[39] = 130'h2bb5ac58ad176aa507e50677fcb7c773d;
    stim[40] = 130'h32fd01afca1fc5acef4b8ee9f98024c88;
    stim[41] = 130'h2ff409ef0bb5200f083f68675fbdfd930;
    stim[42] = 130'h220ef537bf425fe6b50fa22aa90cf54c0;
    stim[43] = 130'h0b147190c5ea4243777312fb30cf8338c;
    stim[44] = 130'h2b9550c4500c74a1a3d438bd372004d04;
    stim[45] = 130'h03f25d4d29fd32948e1bf5815d9366f99;
    stim[46] = 130'h200756aadd8e5180ffa568294d9caad11;
    stim[47] = 130'h1b1bc0f2b24632040fadda76df6945a09;
    stim[48] = 130'h0b745b6544eea98c5cf14c53773732998;
    stim[49] = 130'h3f0264082748b14dfafa47e095f6577fc;
    stim[50] = 130'h1a55fe8639b73ac3f87b0d11bb1f23418;
    stim[51] = 130'h0b214b861bfb06f8662fba4b8f9684860;
    stim[52] = 130'h1106b018785c4c031080121112c60bed5;
    stim[53] = 130'h0e9860cddffc5acf6132def42fed94db4;
    stim[54] = 130'h3c72c8675848eaf3b661c276f940986c0;
    stim[55] = 130'h16ecf862f3d69997f129e54e28bf10030;
    stim[56] = 130'h2c6e2d33900720198b360fa1c7cef8a05;
    stim[57] = 130'h277f755551d18ecd38e3f2da10a330ec9;
    stim[58] = 130'h1278c3ecc82cf69578498773b543eec2d;
    stim[59] = 130'h2ba8a8bbf736b7a21438ec47e1d3a01a4;
    stim[60] = 130'h0cd9a29d1cf18897511e8d069044d79ed;
    stim[61] = 130'h25b881a5b4cec92b7b736aaad812bad2d;
    stim[62] = 130'h1e46cf003ceffa8e6f738dfb09cf7f954;
    stim[63] = 130'h3084e62dab914438652de9069f16761f7;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hccc838a8;
      expv[2] = 32'h72e757a1;
      expv[3] = 32'hd3e29a74;
      expv[4] = 32'h3f93e546;
      expv[5] = 32'haa7154c9;
      expv[6] = 32'hf95d9c58;
      expv[7] = 32'h4b8403f7;
      expv[8] = 32'h375fe359;
      expv[9] = 32'h04bc3dab;
      expv[10] = 32'h7a46816f;
      expv[11] = 32'h0808acfa;
      expv[12] = 32'h25f49a57;
      expv[13] = 32'h4e866a12;
      expv[14] = 32'hdb6ce0ce;
      expv[15] = 32'h705b0854;
      expv[16] = 32'h2ac05f6f;
      expv[17] = 32'h64d393e0;
      expv[18] = 32'h2c85cc93;
      expv[19] = 32'h60bbed2e;
      expv[20] = 32'hc9196d02;
      expv[21] = 32'hfd21ea65;
      expv[22] = 32'h45bfd0b0;
      expv[23] = 32'hdb684f1e;
      expv[24] = 32'h9f1036dd;
      expv[25] = 32'h556e22e5;
      expv[26] = 32'h553e64a6;
      expv[27] = 32'hc2ed4d59;
      expv[28] = 32'h3cce7942;
      expv[29] = 32'h855f518a;
      expv[30] = 32'hc10ddaf0;
      expv[31] = 32'h92a5f9d1;
      expv[32] = 32'h09ac2645;
      expv[33] = 32'heb515626;
      expv[34] = 32'h9ace1eb8;
      expv[35] = 32'h18dff935;
      expv[36] = 32'h98fff2f0;
      expv[37] = 32'h15313bf1;
      expv[38] = 32'hd2bff2c8;
      expv[39] = 32'hbb333b39;
      expv[40] = 32'haed6b162;
      expv[41] = 32'he6009322;
      expv[42] = 32'h7ef7f64c;
      expv[43] = 32'ha433d530;
      expv[44] = 32'hc33e0ce3;
      expv[45] = 32'hdc801341;
      expv[46] = 32'h0fc97534;
      expv[47] = 32'h801d5aab;
      expv[48] = 32'h6c6f03ca;
      expv[49] = 32'hdcdcca66;
      expv[50] = 32'h57d95dff;
      expv[51] = 32'hec7c8d06;
      expv[52] = 32'h3e5a1218;
      expv[53] = 32'h441ac061;
      expv[54] = 32'hbfb6536d;
      expv[55] = 32'he50261b0;
      expv[56] = 32'ha2fc400c;
      expv[57] = 32'hb1b8b4ce;
      expv[58] = 32'h9dfdd555;
      expv[59] = 32'h49e30fb3;
      expv[60] = 32'h874e8069;
      expv[61] = 32'h33668a74;
      expv[62] = 32'h96e20696;
      expv[63] = 32'h273dfe55;
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
