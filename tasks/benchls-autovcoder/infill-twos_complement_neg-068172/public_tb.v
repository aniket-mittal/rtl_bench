// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_068172 dut (
    .clk(clk),
    .comin(in_vec[32:0]),
    .comout(out_vec[32:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h13a4349e0;
    stim[1] = 33'h13df0781d;
    stim[2] = 33'h0a3820d11;
    stim[3] = 33'h03c297cc6;
    stim[4] = 33'h1791c98ec;
    stim[5] = 33'h1bd974cd4;
    stim[6] = 33'h13f29d990;
    stim[7] = 33'h0aae9f023;
    stim[8] = 33'h186fb7796;
    stim[9] = 33'h0e97fde75;
    stim[10] = 33'h068eb866a;
    stim[11] = 33'h073f5bcdc;
    stim[12] = 33'h0387cc286;
    stim[13] = 33'h1569da1b6;
    stim[14] = 33'h1c3df6321;
    stim[15] = 33'h06029a403;
    stim[16] = 33'h1eb4b55a5;
    stim[17] = 33'h0554021ca;
    stim[18] = 33'h0828151a6;
    stim[19] = 33'h1e61d01a7;
    stim[20] = 33'h0a23c7e2e;
    stim[21] = 33'h00151f2c0;
    stim[22] = 33'h1ce76bf43;
    stim[23] = 33'h01f2db8cf;
    stim[24] = 33'h0d2bf2e47;
    stim[25] = 33'h192069f57;
    stim[26] = 33'h13cee6406;
    stim[27] = 33'h058a765bf;
    stim[28] = 33'h064ae4332;
    stim[29] = 33'h1d6811d8f;
    stim[30] = 33'h181e3d1ae;
    stim[31] = 33'h1deeb092f;
    stim[32] = 33'h19188e3ec;
    stim[33] = 33'h0849bee2f;
    stim[34] = 33'h1c6700dce;
    stim[35] = 33'h1251e6a41;
    stim[36] = 33'h001bad981;
    stim[37] = 33'h1106da6a3;
    stim[38] = 33'h136310c5a;
    stim[39] = 33'h1d6134efc;
    stim[40] = 33'h052ae3df6;
    stim[41] = 33'h1c2e25788;
    stim[42] = 33'h1df8a093d;
    stim[43] = 33'h19f47b668;
    stim[44] = 33'h1d17df634;
    stim[45] = 33'h04e36f9e1;
    stim[46] = 33'h1b04ba7d3;
    stim[47] = 33'h03be214e3;
    stim[48] = 33'h01404dd09;
    stim[49] = 33'h169aa939d;
    stim[50] = 33'h07bd7267f;
    stim[51] = 33'h0c0e90a86;
    stim[52] = 33'h10c5a8e16;
    stim[53] = 33'h1606c6c47;
    stim[54] = 33'h076d7de5e;
    stim[55] = 33'h19cf95cb2;
    stim[56] = 33'h0be0dc9c9;
    stim[57] = 33'h0df6278d9;
    stim[58] = 33'h0117d8103;
    stim[59] = 33'h030cf5176;
    stim[60] = 33'h1837e3da1;
    stim[61] = 33'h0db95d94d;
    stim[62] = 33'h0adc9ca30;
    stim[63] = 33'h0bae82d2d;
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
      expv[1] = 33'h0c5bcb620;
      expv[2] = 33'h0c20f87e3;
      expv[3] = 33'h1dc7df2ef;
      expv[4] = 33'h1c3d6833a;
      expv[5] = 33'h0c6e36714;
      expv[6] = 33'h0c268b32c;
      expv[7] = 33'h0c0d62670;
      expv[8] = 33'h1d5160fdd;
      expv[9] = 33'h03904886a;
      expv[10] = 33'h11680218b;
      expv[11] = 33'h117147996;
      expv[12] = 33'h1cc0a4324;
      expv[13] = 33'h107833d7a;
      expv[14] = 33'h0e9625e4a;
      expv[15] = 33'h03c209cdf;
      expv[16] = 33'h1dfd65bfd;
      expv[17] = 33'h0d4b4aa5b;
      expv[18] = 33'h1eabfde36;
      expv[19] = 33'h1fd7eae5a;
      expv[20] = 33'h0d9e2fe59;
      expv[21] = 33'h11dc381d2;
      expv[22] = 33'h13eae0d40;
      expv[23] = 33'h0318940bd;
      expv[24] = 33'h1e0d24731;
      expv[25] = 33'h12d40d1b9;
      expv[26] = 33'h02df960a9;
      expv[27] = 33'h0c3119bfa;
      expv[28] = 33'h1e7589a41;
      expv[29] = 33'h11b51bcce;
      expv[30] = 33'h0e97ee271;
      expv[31] = 33'h0fe1c2e52;
      expv[32] = 33'h0e114f6d1;
      expv[33] = 33'h02e771c14;
      expv[34] = 33'h13b6411d1;
      expv[35] = 33'h0f98ff232;
      expv[36] = 33'h01ae195bf;
      expv[37] = 33'h1fe45267f;
      expv[38] = 33'h02f92595d;
      expv[39] = 33'h0c9cef3a6;
      expv[40] = 33'h029ecb104;
      expv[41] = 33'h1ed51c20a;
      expv[42] = 33'h03d1da878;
      expv[43] = 33'h0e075f6c3;
      expv[44] = 33'h020b84998;
      expv[45] = 33'h02e8209cc;
      expv[46] = 33'h1f1c9061f;
      expv[47] = 33'h00fb4582d;
      expv[48] = 33'h1c41deb1d;
      expv[49] = 33'h1ebfb22f7;
      expv[50] = 33'h016556c63;
      expv[51] = 33'h10428d981;
      expv[52] = 33'h13f16f57a;
      expv[53] = 33'h033a571ea;
      expv[54] = 33'h0df9393b9;
      expv[55] = 33'h1092821a2;
      expv[56] = 33'h0e306a34e;
      expv[57] = 33'h1c1f23637;
      expv[58] = 33'h1e09d8727;
      expv[59] = 33'h1ee827efd;
      expv[60] = 33'h1cf30ae8a;
      expv[61] = 33'h0fc81c25f;
      expv[62] = 33'h1e46a26b3;
      expv[63] = 33'h1123635d0;
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
