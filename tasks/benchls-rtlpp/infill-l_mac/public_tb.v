// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  L_mac dut (
    .a(in_vec[63:48]),
    .b(in_vec[47:32]),
    .c(in_vec[31:0]),
    .overflow(out_vec[32:32]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h5c58ed291a0bd3ca;
    stim[1] = 64'h03e3fe7c504e821d;
    stim[2] = 64'h69ef3328658705f9;
    stim[3] = 64'h5e944f95389e314e;
    stim[4] = 64'ha2a0dd112ea20ef1;
    stim[5] = 64'hd3bdc453287c71c6;
    stim[6] = 64'h71c73cdf4427cb29;
    stim[7] = 64'h8f30e6edd59e8b5f;
    stim[8] = 64'h1368c72e9cdfa9d3;
    stim[9] = 64'hf429f5bfd1f13b85;
    stim[10] = 64'h20a62d65f5ec67a3;
    stim[11] = 64'hb9f58af482ef3201;
    stim[12] = 64'hdc671217141d2102;
    stim[13] = 64'h4091cacfc27fdff1;
    stim[14] = 64'h5d1f06cc6cdd0b0a;
    stim[15] = 64'he1f21f3693693707;
    stim[16] = 64'hbea7d0506cde276a;
    stim[17] = 64'h2400505595f8b831;
    stim[18] = 64'hae0c87e46a6a163e;
    stim[19] = 64'h542310dc966e49e1;
    stim[20] = 64'h3d9e4787f073b2c1;
    stim[21] = 64'hdd86f3b6cdcc5617;
    stim[22] = 64'h1c2ead58e2c6fab4;
    stim[23] = 64'h929216b5189b5de8;
    stim[24] = 64'h64190a1e17e6d632;
    stim[25] = 64'hd1ceb999d679a4a4;
    stim[26] = 64'h91decd7a354d0495;
    stim[27] = 64'h4e32651e7366ca07;
    stim[28] = 64'h4034010e41f6e0c4;
    stim[29] = 64'hc2df3ffffb46bee9;
    stim[30] = 64'h255817f66cb76722;
    stim[31] = 64'hb6752364161782e4;
    stim[32] = 64'h02a79e56c8c73384;
    stim[33] = 64'h3288f880442b4469;
    stim[34] = 64'h8982b9f94168222c;
    stim[35] = 64'h643a8d27284f85e1;
    stim[36] = 64'hcc89d7c664ac218a;
    stim[37] = 64'h5f0ed650cbfcd564;
    stim[38] = 64'h89ce99c08e03f033;
    stim[39] = 64'h6c1eb9001125dfcf;
    stim[40] = 64'hf9e4eeab130b73fa;
    stim[41] = 64'hcb3bbcf6094c0c18;
    stim[42] = 64'h9ebebe6900c20247;
    stim[43] = 64'hebdec805b8a49470;
    stim[44] = 64'he9f2df8be4aee465;
    stim[45] = 64'h38f1160be7cdb2ec;
    stim[46] = 64'h8ffefe1252d7276c;
    stim[47] = 64'he3aba62cbafb6f55;
    stim[48] = 64'he5bff3545f567331;
    stim[49] = 64'h338e13f2c228391c;
    stim[50] = 64'he4ca0282cf7b4d3b;
    stim[51] = 64'h7fa75e7339f60f2c;
    stim[52] = 64'h8558fd8cddfddb8f;
    stim[53] = 64'h519ffaf6af8afe3f;
    stim[54] = 64'h95d8ad4f28403928;
    stim[55] = 64'h1a0982ecf168bed4;
    stim[56] = 64'h370c68c88bd226d5;
    stim[57] = 64'h320dbe1c669c32dd;
    stim[58] = 64'h05a1cc744600ab1a;
    stim[59] = 64'ha2c074dd8dea8164;
    stim[60] = 64'h3fea974f4c097198;
    stim[61] = 64'h226b9554db76bdcb;
    stim[62] = 64'h94b180b2d3386acd;
    stim[63] = 64'hf8a392a31107e833;
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
      expv[0] = 33'h06f9815e2;
      expv[1] = 33'h0542b9e11;
      expv[2] = 33'h07ab23051;
      expv[3] = 33'h05604e972;
      expv[4] = 33'h0bb10fb91;
      expv[5] = 33'h0caddcc0d;
      expv[6] = 33'h05f358b82;
      expv[7] = 33'h156c83acf;
      expv[8] = 33'h0abf8fe83;
      expv[9] = 33'h1bc52a31c;
      expv[10] = 33'h0fbb67721;
      expv[11] = 33'h0e7de8185;
      expv[12] = 33'h023b02c43;
      expv[13] = 33'h0f5a67f30;
      expv[14] = 33'h06f55f9be;
      expv[15] = 33'h0aef52e13;
      expv[16] = 33'h108016b9a;
      expv[17] = 33'h0a144ac31;
      expv[18] = 33'h0c6cd6cee;
      expv[19] = 33'h09bf8c7f5;
      expv[20] = 33'h101ab0313;
      expv[21] = 33'h1a0b0055b;
      expv[22] = 33'h0f5dbc084;
      expv[23] = 33'h0259b8b22;
      expv[24] = 33'h01bdb8b20;
      expv[25] = 33'h16e94e6c2;
      expv[26] = 33'h0aa614e61;
      expv[27] = 33'h09249ade3;
      expv[28] = 33'h0423a979c;
      expv[29] = 33'h12bfdbc0a;
      expv[30] = 33'h0703631b2;
      expv[31] = 33'h02f50c798;
      expv[32] = 33'h0ca6b299e;
      expv[33] = 33'h075384869;
      expv[34] = 33'h0a54cd39e;
      expv[35] = 33'h05f92bcb7;
      expv[36] = 33'h111116280;
      expv[37] = 33'h11b903dc4;
      expv[38] = 33'h0e0c768b3;
      expv[39] = 33'h05f478dcf;
      expv[40] = 33'h0fc045746;
      expv[41] = 33'h09f4eaaca;
      expv[42] = 33'h076d42235;
      expv[43] = 33'h170ee9fc6;
      expv[44] = 33'h1b0f7b8cb;
      expv[45] = 33'h0ecb4db47;
      expv[46] = 33'h0e1bf4b48;
      expv[47] = 33'h14ec372b9;
      expv[48] = 33'h139b622dd;
      expv[49] = 33'h0c62c7f58;
      expv[50] = 33'h0d1b90fcf;
      expv[51] = 33'h0690eb931;
      expv[52] = 33'h1620ebfaf;
      expv[53] = 33'h0ff8eb309;
      expv[54] = 33'h08db16ed0;
      expv[55] = 33'h0feb95120;
      expv[56] = 33'h0a25a0835;
      expv[57] = 33'h08bc75249;
      expv[58] = 33'h04a7f840e;
      expv[59] = 33'h0d8360124;
      expv[60] = 33'h071d030ce;
      expv[61] = 33'h0ef8a4fe7;
      expv[62] = 33'h11df84ddf;
      expv[63] = 33'h09f732dfc;
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
