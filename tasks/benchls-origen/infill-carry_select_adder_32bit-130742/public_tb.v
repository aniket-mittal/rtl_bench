// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_130742 dut (
    .a(in_vec[64:33]),
    .b(in_vec[32:1]),
    .cin(in_vec[0:0]),
    .sum(out_vec[32:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h0adae1bdea01a48f1;
    stim[1] = 65'h15b9ae4f4b31e53a7;
    stim[2] = 65'h092c2f6e1f6bce81e;
    stim[3] = 65'h1ab0dce98d0aa7b19;
    stim[4] = 65'h0a22d54b37626b295;
    stim[5] = 65'h03b2fdc9e5321f0a4;
    stim[6] = 65'h0cc42d3b99e83dc68;
    stim[7] = 65'h0816025ae2ebd119f;
    stim[8] = 65'h1cf936eb9931452e8;
    stim[9] = 65'h094955e66e8f1b6bd;
    stim[10] = 65'h03e8e023169664c1f;
    stim[11] = 65'h09d0bf46091f61e28;
    stim[12] = 65'h146861302969a6cbb;
    stim[13] = 65'h0ff5eb33e0d02dcaf;
    stim[14] = 65'h12e1df9f9120e6afb;
    stim[15] = 65'h0c5a3eff21f67086b;
    stim[16] = 65'h1ab19980abe9b2aa1;
    stim[17] = 65'h18b34159e86a8cdb3;
    stim[18] = 65'h04b2472ee2c21cf4f;
    stim[19] = 65'h02d4db3da2b01becc;
    stim[20] = 65'h007a718cba977492c;
    stim[21] = 65'h1e1125b66c21b87e5;
    stim[22] = 65'h1bfd1455c0632e485;
    stim[23] = 65'h17fac685f7017dea0;
    stim[24] = 65'h0f5ed47a4d2724c7e;
    stim[25] = 65'h0bbdbad14ef89c2ed;
    stim[26] = 65'h19a17f8277870cf12;
    stim[27] = 65'h000654aeacc21ad5f;
    stim[28] = 65'h1825ec8d87335aa18;
    stim[29] = 65'h078c711f2e0c66e3d;
    stim[30] = 65'h1c6d0740f3d4e3e46;
    stim[31] = 65'h031eab475d1c7fd5a;
    stim[32] = 65'h03748bd08cb2ea7f7;
    stim[33] = 65'h044a3a193448dd6bf;
    stim[34] = 65'h0d1c3656f1ebc59c8;
    stim[35] = 65'h17ba465885fea8ae7;
    stim[36] = 65'h1f9866060821ede9f;
    stim[37] = 65'h175010dc03513ac65;
    stim[38] = 65'h0cfb639842e9e0373;
    stim[39] = 65'h17ec49f3e3b4f16f3;
    stim[40] = 65'h189f3f571f312cb89;
    stim[41] = 65'h150faa765ed191e3d;
    stim[42] = 65'h0ac03540fe696613d;
    stim[43] = 65'h1fd508ae16cc27843;
    stim[44] = 65'h0db7a281a48518a89;
    stim[45] = 65'h04cf2b30082c6b2a8;
    stim[46] = 65'h1844a0a1a3479e57d;
    stim[47] = 65'h0aa88925c46fe1ec2;
    stim[48] = 65'h140d9091ba70afef9;
    stim[49] = 65'h00623be9f907c1473;
    stim[50] = 65'h18fe55f9d77a656b7;
    stim[51] = 65'h081b9f35d3d4187d8;
    stim[52] = 65'h13266ab91d0ffacef;
    stim[53] = 65'h0aaa72a22dcf4d235;
    stim[54] = 65'h12bdfb40c8fb0096c;
    stim[55] = 65'h150321addc2c4dc71;
    stim[56] = 65'h071f3ef9f070d541c;
    stim[57] = 65'h08eb6a9f3c3fe7252;
    stim[58] = 65'h0ae25deb6a9798191;
    stim[59] = 65'h051428565a58f1b1a;
    stim[60] = 65'h0db30e3ab89833e22;
    stim[61] = 65'h1e78ca3631c425d85;
    stim[62] = 65'h11d1357de123ed146;
    stim[63] = 65'h1f310afcff8ae97c9;
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
      expv[0] = 33'h14dc864d0;
      expv[1] = 33'h00eb9389d;
      expv[2] = 33'h0897fdeff;
      expv[3] = 33'h07bb849b3;
      expv[4] = 33'h018540749;
      expv[5] = 33'h08e51cd42;
      expv[6] = 33'h06ac6b021;
      expv[7] = 33'h0b01d374e;
      expv[8] = 33'h162a7c1a1;
      expv[9] = 33'h17d871524;
      expv[10] = 33'h1a7f44e50;
      expv[11] = 33'h12f021288;
      expv[12] = 33'h1dd207fbe;
      expv[13] = 33'h10c618fee;
      expv[14] = 33'h0402c64f5;
      expv[15] = 33'h0e50af85e;
      expv[16] = 33'h069b4c2ad;
      expv[17] = 33'h011dce353;
      expv[18] = 33'h07746423e;
      expv[19] = 33'h0584f72a6;
      expv[20] = 33'h1b11e61f6;
      expv[21] = 33'h0a32de34d;
      expv[22] = 33'h1c60429e2;
      expv[23] = 33'h0efc446ff;
      expv[24] = 33'h1c85f9422;
      expv[25] = 33'h1ab657002;
      expv[26] = 33'h11288c739;
      expv[27] = 33'h0cc86f84a;
      expv[28] = 33'h1f59472f0;
      expv[29] = 33'h1598d8030;
      expv[30] = 33'h1041eb255;
      expv[31] = 33'h003b2b1cf;
      expv[32] = 33'h102776500;
      expv[33] = 33'h189317852;
      expv[34] = 33'h1f07fbf36;
      expv[35] = 33'h1db8ef070;
      expv[36] = 33'h07ba53f01;
      expv[37] = 33'h1aa14ba26;
      expv[38] = 33'h0fe543cf8;
      expv[39] = 33'h1ba13b632;
      expv[40] = 33'h17d06c0fb;
      expv[41] = 33'h13e13c5a3;
      expv[42] = 33'h09299b54d;
      expv[43] = 33'h16a130325;
      expv[44] = 33'h123cbb2a4;
      expv[45] = 33'h0cfb965a8;
      expv[46] = 33'h1b8c3ef98;
      expv[47] = 33'h0f186b11e;
      expv[48] = 33'h0e7e40815;
      expv[49] = 33'h1969fd312;
      expv[50] = 33'h1078bb655;
      expv[51] = 33'h1befb7b34;
      expv[52] = 33'h103665881;
      expv[53] = 33'h1879bfc58;
      expv[54] = 33'h1bb8fbd78;
      expv[55] = 33'h112f6f74f;
      expv[56] = 33'h1790143ba;
      expv[57] = 33'h052b51c45;
      expv[58] = 33'h1579f6048;
      expv[59] = 33'h1f6d1a07e;
      expv[60] = 33'h064b421cd;
      expv[61] = 33'h103cf00e9;
      expv[62] = 33'h12f522924;
      expv[63] = 33'h1ebbf4799;
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
