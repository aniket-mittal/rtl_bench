// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 69;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_190982 dut (
    .clk(clk),
    .instruction(in_vec[32:1]),
    .ir_w(in_vec[0:0]),
    .jumpAddress(out_vec[68:43]),
    .opcode(out_vec[42:37]),
    .funct(out_vec[36:31]),
    .rs(out_vec[30:26]),
    .rt(out_vec[25:21]),
    .rd(out_vec[20:16]),
    .immediate(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1e6e36254;
    stim[1] = 33'h03025e799;
    stim[2] = 33'h0204b76cd;
    stim[3] = 33'h0e3b24dae;
    stim[4] = 33'h14eae8d15;
    stim[5] = 33'h0432ee9d3;
    stim[6] = 33'h1bfa0fe17;
    stim[7] = 33'h08b9db2e6;
    stim[8] = 33'h135777818;
    stim[9] = 33'h1f06a8aeb;
    stim[10] = 33'h0f52b6a9e;
    stim[11] = 33'h0eaf1fd79;
    stim[12] = 33'h1ba02c31b;
    stim[13] = 33'h0d5d01ebc;
    stim[14] = 33'h0b6800a7c;
    stim[15] = 33'h1f6a97010;
    stim[16] = 33'h1734125ce;
    stim[17] = 33'h0c5945f10;
    stim[18] = 33'h1af7674c8;
    stim[19] = 33'h1d35afb5b;
    stim[20] = 33'h121e85dcc;
    stim[21] = 33'h0c2a628f9;
    stim[22] = 33'h1c1ed29d4;
    stim[23] = 33'h020867268;
    stim[24] = 33'h03b78e795;
    stim[25] = 33'h1b5a8bb69;
    stim[26] = 33'h02dd6a391;
    stim[27] = 33'h18c4dac15;
    stim[28] = 33'h06274919e;
    stim[29] = 33'h1d6dfbb3a;
    stim[30] = 33'h0226b1da0;
    stim[31] = 33'h091884afa;
    stim[32] = 33'h014758bdb;
    stim[33] = 33'h113297565;
    stim[34] = 33'h12c730f5c;
    stim[35] = 33'h1285b6181;
    stim[36] = 33'h0797d8302;
    stim[37] = 33'h092188d36;
    stim[38] = 33'h00ca1b95c;
    stim[39] = 33'h102d01c41;
    stim[40] = 33'h19e33ac4a;
    stim[41] = 33'h1ef1568ae;
    stim[42] = 33'h14da64b73;
    stim[43] = 33'h03b2b3fa7;
    stim[44] = 33'h004ca9b12;
    stim[45] = 33'h15accc6bd;
    stim[46] = 33'h08a7a2a99;
    stim[47] = 33'h0880ee911;
    stim[48] = 33'h197f2553e;
    stim[49] = 33'h0b2e5d62e;
    stim[50] = 33'h1c0e959f7;
    stim[51] = 33'h1c9aa645a;
    stim[52] = 33'h175bd2f23;
    stim[53] = 33'h1b44c03f6;
    stim[54] = 33'h0c6d2784e;
    stim[55] = 33'h0c2e67dd2;
    stim[56] = 33'h1821e5959;
    stim[57] = 33'h0d9282cfa;
    stim[58] = 33'h0fd3ff77a;
    stim[59] = 33'h1d4acae8f;
    stim[60] = 33'h19439aa75;
    stim[61] = 33'h1578adffc;
    stim[62] = 33'h15912bec6;
    stim[63] = 33'h1b9eb37ea;
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
      expv[0] = 69'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 69'hxxxxxxxxxxxxxxxxxx;
      expv[2] = 69'h00979e60c6025ef3cc;
      expv[3] = 69'h012ddb309304b7bb66;
      expv[4] = 69'h012ddb309304b7bb66;
      expv[5] = 69'h1aba3455256ae8468a;
      expv[6] = 69'h0cbba74914b2ee74e9;
      expv[7] = 69'h1e83f85ee5fa0f7f0b;
      expv[8] = 69'h1e83f85ee5fa0f7f0b;
      expv[9] = 69'h1e83f85ee5fa0f7f0b;
      expv[10] = 69'h01aa2bafda86a84575;
      expv[11] = 69'h01aa2bafda86a84575;
      expv[12] = 69'h0bc7f5e3be2f1ffebc;
      expv[13] = 69'h080b0c6ee6a02c618d;
      expv[14] = 69'h080b0c6ee6a02c618d;
      expv[15] = 69'h080b0c6ee6a02c618d;
      expv[16] = 69'h080b0c6ee6a02c618d;
      expv[17] = 69'h080b0c6ee6a02c618d;
      expv[18] = 69'h080b0c6ee6a02c618d;
      expv[19] = 69'h080b0c6ee6a02c618d;
      expv[20] = 69'h0d6bed6f56b5af7dad;
      expv[21] = 69'h0d6bed6f56b5af7dad;
      expv[22] = 69'h0a98a3e31e2a62147c;
      expv[23] = 69'h0a98a3e31e2a62147c;
      expv[24] = 69'h0a98a3e31e2a62147c;
      expv[25] = 69'h0de39e50e5378e73ca;
      expv[26] = 69'h16a2eda6da5a8b5db4;
      expv[27] = 69'h175a8e40a45d6a51c8;
      expv[28] = 69'h1136b0562544dad60a;
      expv[29] = 69'h1136b0562544dad60a;
      expv[30] = 69'h1136b0562544dad60a;
      expv[31] = 69'h1136b0562544dad60a;
      expv[32] = 69'h1136b0562544dad60a;
      expv[33] = 69'h11d62f6856c758c5ed;
      expv[34] = 69'h0ca5d594593297bab2;
      expv[35] = 69'h0ca5d594593297bab2;
      expv[36] = 69'h016d8604a005b6b0c0;
      expv[37] = 69'h016d8604a005b6b0c0;
      expv[38] = 69'h016d8604a005b6b0c0;
      expv[39] = 69'h016d8604a005b6b0c0;
      expv[40] = 69'h0b407104102d010e20;
      expv[41] = 69'h0b407104102d010e20;
      expv[42] = 69'h0b407104102d010e20;
      expv[43] = 69'h16992dcd3cda6425b9;
      expv[44] = 69'h0cacfe98e9b2b39fd3;
      expv[45] = 69'h0cacfe98e9b2b39fd3;
      expv[46] = 69'h0b331af56f2ccc635e;
      expv[47] = 69'h09e8aa622627a2154c;
      expv[48] = 69'h003ba4422400ee7488;
      expv[49] = 69'h003ba4422400ee7488;
      expv[50] = 69'h003ba4422400ee7488;
      expv[51] = 69'h03a567df1d8e95acfb;
      expv[52] = 69'h03a567df1d8e95acfb;
      expv[53] = 69'h16f4bc8dc8dbd29791;
      expv[54] = 69'h16f4bc8dc8dbd29791;
      expv[55] = 69'h16f4bc8dc8dbd29791;
      expv[56] = 69'h16f4bc8dc8dbd29791;
      expv[57] = 69'h087965661621e52cac;
      expv[58] = 69'h087965661621e52cac;
      expv[59] = 69'h087965661621e52cac;
      expv[60] = 69'h12b2ba3f43caca5747;
      expv[61] = 69'h10e6a9d65d439ad53a;
      expv[62] = 69'h10e6a9d65d439ad53a;
      expv[63] = 69'h10e6a9d65d439ad53a;
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
