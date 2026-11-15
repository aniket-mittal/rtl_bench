// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_052269 dut (
    .SrcA(in_vec[68:37]),
    .SrcB(in_vec[36:5]),
    .AluCtrl(in_vec[4:1]),
    .Alu_en(in_vec[0:0]),
    .zero(out_vec[34:34]),
    .positive(out_vec[33:33]),
    .negative(out_vec[32:32]),
    .AluResult(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h146cdafd6048aadb60;
    stim[1] = 69'h1819d9e1ff856c0d94;
    stim[2] = 69'h1ccaef32ccc95c8d01;
    stim[3] = 69'h1d8afed81780b847eb;
    stim[4] = 69'h03d922513ac3523935;
    stim[5] = 69'h092dbafa45d1f36551;
    stim[6] = 69'h0a1bf0be3b674c7e07;
    stim[7] = 69'h14b490a0a979d0a0ce;
    stim[8] = 69'h0574cf19726ec6a092;
    stim[9] = 69'h0956c346b2c0994fcf;
    stim[10] = 69'h0faa21fab445b69a9d;
    stim[11] = 69'h0ffab7f1692f4924ff;
    stim[12] = 69'h16b8fa5bd7efdd4067;
    stim[13] = 69'h0faff64b6e60553548;
    stim[14] = 69'h0a44421a9b43e3b213;
    stim[15] = 69'h0fc06811c78d85b762;
    stim[16] = 69'h17fafaff0c26cc52f1;
    stim[17] = 69'h09219834686df7a83f;
    stim[18] = 69'h075feb4ad43a4ba1be;
    stim[19] = 69'h052213fc8e0c0fe4e8;
    stim[20] = 69'h1e9877846f6dbd019a;
    stim[21] = 69'h1a32a4b677264befc8;
    stim[22] = 69'h17d293844c1736561d;
    stim[23] = 69'h00eb17c23019383c03;
    stim[24] = 69'h1e040a07ea5422c873;
    stim[25] = 69'h09f1c047bad465406d;
    stim[26] = 69'h0f7722cdf3c5e4c2ec;
    stim[27] = 69'h16bf5d99edf1ebcfda;
    stim[28] = 69'h0056a4b4cf152f617f;
    stim[29] = 69'h16fe6984534c9fd0f1;
    stim[30] = 69'h1be736b0a55fba6b73;
    stim[31] = 69'h1357227c52461f1c2e;
    stim[32] = 69'h1995d8291120022362;
    stim[33] = 69'h092348384ef3d26bfb;
    stim[34] = 69'h05a3603e4a41207957;
    stim[35] = 69'h02ac956163eda2d8da;
    stim[36] = 69'h1d819b8108ebe11996;
    stim[37] = 69'h1c6a3edceed8979ac9;
    stim[38] = 69'h14fa32b693ac759328;
    stim[39] = 69'h1cb9d44a7111c7c96c;
    stim[40] = 69'h09d3ff577b83b1227a;
    stim[41] = 69'h11e89988b7efd4c83f;
    stim[42] = 69'h1ddd433610724619ba;
    stim[43] = 69'h1949de1ae83cd3fda5;
    stim[44] = 69'h01e3ffd59c48e9bea0;
    stim[45] = 69'h0cbfa7857b6c44182c;
    stim[46] = 69'h066287e708edf232dc;
    stim[47] = 69'h1c94d10224974b2132;
    stim[48] = 69'h0fdfce3fc4afb88a43;
    stim[49] = 69'h19af8996e19141cbe3;
    stim[50] = 69'h09be85ed7b779d9653;
    stim[51] = 69'h15795c762b20818fc2;
    stim[52] = 69'h0c0d9de28737992697;
    stim[53] = 69'h11f3916e30428a2f16;
    stim[54] = 69'h0dcef7688faccad700;
    stim[55] = 69'h17775e2269a3f57fea;
    stim[56] = 69'h1c4c26a861a91a3ff3;
    stim[57] = 69'h16563fc3001583e40b;
    stim[58] = 69'h17729029ed0b30e9db;
    stim[59] = 69'h084550466daf3eafa9;
    stim[60] = 69'h18fb4b8086a2bb7248;
    stim[61] = 69'h179764aa4fe5633a35;
    stim[62] = 69'h12e2fad8b05dde4fda;
    stim[63] = 69'h122046bf8f059bf087;
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
      expv[0] = 35'h400000000;
      expv[1] = 35'h400000000;
      expv[2] = 35'h24ca25dfe;
      expv[3] = 35'h400000000;
      expv[4] = 35'h221246c36;
      expv[5] = 35'h200125b75;
      expv[6] = 35'h1dbffe7f1;
      expv[7] = 35'h400000000;
      expv[8] = 35'h400000000;
      expv[9] = 35'h240000000;
      expv[10] = 35'h400000000;
      expv[11] = 35'h400000000;
      expv[12] = 35'h1bffffadf;
      expv[13] = 35'h400000000;
      expv[14] = 35'h200005222;
      expv[15] = 35'h400000000;
      expv[16] = 35'h20000017f;
      expv[17] = 35'h400000000;
      expv[18] = 35'h400000000;
      expv[19] = 35'h400000000;
      expv[20] = 35'h400000000;
      expv[21] = 35'h400000000;
      expv[22] = 35'h400000000;
      expv[23] = 35'h1868efc31;
      expv[24] = 35'h1fe040a07;
      expv[25] = 35'h22a030000;
      expv[26] = 35'h400000000;
      expv[27] = 35'h400000000;
      expv[28] = 35'h400000000;
      expv[29] = 35'h2016fe698;
      expv[30] = 35'h1fffffffb;
      expv[31] = 35'h400000000;
      expv[32] = 35'h400000000;
      expv[33] = 35'h400000000;
      expv[34] = 35'h400000000;
      expv[35] = 35'h400000000;
      expv[36] = 35'h400000000;
      expv[37] = 35'h195954a31;
      expv[38] = 35'h400000000;
      expv[39] = 35'h400000000;
      expv[40] = 35'h400000000;
      expv[41] = 35'h400000000;
      expv[42] = 35'h400000000;
      expv[43] = 35'h2404690c5;
      expv[44] = 35'h400000000;
      expv[45] = 35'h400000000;
      expv[46] = 35'h400000000;
      expv[47] = 35'h400000000;
      expv[48] = 35'h25980adac;
      expv[49] = 35'h1c0f23e58;
      expv[50] = 35'h20000137d;
      expv[51] = 35'h400000000;
      expv[52] = 35'h400000000;
      expv[53] = 35'h400000000;
      expv[54] = 35'h400000000;
      expv[55] = 35'h400000000;
      expv[56] = 35'h1ffffffff;
      expv[57] = 35'h400000000;
      expv[58] = 35'h400000000;
      expv[59] = 35'h22f53774e;
      expv[60] = 35'h400000000;
      expv[61] = 35'h20044c22c;
      expv[62] = 35'h400000000;
      expv[63] = 35'h1f92efffc;
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
