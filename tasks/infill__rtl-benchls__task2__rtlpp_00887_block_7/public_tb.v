// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00887 dut (
    .clk(clk),
    .reset(in_vec[33:33]),
    .loadseed_i(in_vec[32:32]),
    .seed_i(in_vec[31:0]),
    .number_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h22c0d02a0;
    stim[1] = 34'h3cb62fc92;
    stim[2] = 34'h198a91b25;
    stim[3] = 34'h05c58f227;
    stim[4] = 34'h063d19014;
    stim[5] = 34'h178f3d737;
    stim[6] = 34'h0ca1a53a1;
    stim[7] = 34'h0439e44c7;
    stim[8] = 34'h01ccd447a;
    stim[9] = 34'h0ce924120;
    stim[10] = 34'h039c78db7;
    stim[11] = 34'h1ba75ea68;
    stim[12] = 34'h09c5bc541;
    stim[13] = 34'h03f14d4e3;
    stim[14] = 34'h18adf871e;
    stim[15] = 34'h17f9d35f2;
    stim[16] = 34'h161e1c5fb;
    stim[17] = 34'h095f24f1c;
    stim[18] = 34'h17b2f99d8;
    stim[19] = 34'h0554c6af1;
    stim[20] = 34'h146c8cb4a;
    stim[21] = 34'h0fb2a058c;
    stim[22] = 34'h10ff13e5d;
    stim[23] = 34'h0d88cb399;
    stim[24] = 34'h0b866fd6b;
    stim[25] = 34'h1eacdd36f;
    stim[26] = 34'h1cba333ee;
    stim[27] = 34'h1a8fa80cf;
    stim[28] = 34'h0fd6b5ac5;
    stim[29] = 34'h1376d89a9;
    stim[30] = 34'h09709424e;
    stim[31] = 34'h014e8831a;
    stim[32] = 34'h1309b59cb;
    stim[33] = 34'h1b5cfc83e;
    stim[34] = 34'h0ecf38985;
    stim[35] = 34'h0353ef574;
    stim[36] = 34'h023b9b598;
    stim[37] = 34'h06f263b97;
    stim[38] = 34'h187d77f66;
    stim[39] = 34'h12393f01e;
    stim[40] = 34'h06d137ea8;
    stim[41] = 34'h00f547604;
    stim[42] = 34'h02f68b277;
    stim[43] = 34'h1c054b8fb;
    stim[44] = 34'h140830f01;
    stim[45] = 34'h1db34f740;
    stim[46] = 34'h168571601;
    stim[47] = 34'h0f73e19a5;
    stim[48] = 34'h1989749fb;
    stim[49] = 34'h18af71b20;
    stim[50] = 34'h1bb6db7f1;
    stim[51] = 34'h0c077bdc6;
    stim[52] = 34'h0cea82a11;
    stim[53] = 34'h0e4524b0b;
    stim[54] = 34'h1263ccbf8;
    stim[55] = 34'h0a135923b;
    stim[56] = 34'h1de7e4065;
    stim[57] = 34'h1c9b49e07;
    stim[58] = 34'h0b3c5a7c0;
    stim[59] = 34'h05a35683f;
    stim[60] = 34'h194811234;
    stim[61] = 34'h155a38c9b;
    stim[62] = 34'h153c4b463;
    stim[63] = 34'h1f4155315;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h37ce9af9;
      expv[20] = 32'h80a75e16;
      expv[21] = 32'h368026d5;
      expv[22] = 32'h81e9e23a;
      expv[23] = 32'h341d5e8d;
      expv[24] = 32'h83749a62;
      expv[25] = 32'h3127ae3d;
      expv[26] = 32'h0e3524f4;
      expv[27] = 32'h3b524f5d;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h6dd199f7;
      expv[31] = 32'h5ce55432;
      expv[32] = 32'hd41b3193;
      expv[33] = 32'h5d7d9c33;
      expv[34] = 32'ha78e615b;
      expv[35] = 32'h00000000;
      expv[36] = 32'h184dace5;
      expv[37] = 32'h0426d672;
      expv[38] = 32'h6b68744a;
      expv[39] = 32'h2909b59c;
      expv[40] = 32'he60726a2;
      expv[41] = 32'h00000000;
      expv[42] = 32'h43ebbfb3;
      expv[43] = 32'h29f5dfd9;
      expv[44] = 32'h48bfae93;
      expv[45] = 32'h0813d971;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h659a7ba0;
      expv[50] = 32'h6d5d19c0;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h4d7b8d90;
      expv[54] = 32'h3ebdc6c8;
      expv[55] = 32'h77cb58b4;
      expv[56] = 32'h42d97348;
      expv[57] = 32'h8f0233b4;
      expv[58] = 32'hba101848;
      expv[59] = 32'h00000000;
      expv[60] = 32'h673f2032;
      expv[61] = 32'h2b9f9019;
      expv[62] = 32'ha23aa16c;
      expv[63] = 32'h00000000;
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
