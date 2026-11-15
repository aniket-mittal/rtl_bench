// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061170 dut (
    .wb_pr_CCR_write(in_vec[32:32]),
    .wb_pr_op(in_vec[31:26]),
    .wb_pr_regC(in_vec[25:23]),
    .mem_wb_op(in_vec[22:17]),
    .mem_wb_regA(in_vec[16:14]),
    .mem_wb_regC(in_vec[13:11]),
    .ex_mem_op(in_vec[10:5]),
    .ex_mem_regA(in_vec[4:2]),
    .mem_wb_CCR_write(in_vec[1:1]),
    .ex_mem_CCR_write(in_vec[0:0]),
    .F3(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0c457eaaf;
    stim[1] = 33'h0553d6ceb;
    stim[2] = 33'h0581662b3;
    stim[3] = 33'h138655356;
    stim[4] = 33'h15e7ea714;
    stim[5] = 33'h02fe8c95d;
    stim[6] = 33'h17e83eac4;
    stim[7] = 33'h13f94f8ec;
    stim[8] = 33'h0a3cbd399;
    stim[9] = 33'h066ab56c9;
    stim[10] = 33'h0aa996bde;
    stim[11] = 33'h15056e4ba;
    stim[12] = 33'h048fd1af8;
    stim[13] = 33'h01434ed49;
    stim[14] = 33'h0849e69e6;
    stim[15] = 33'h16dd386c0;
    stim[16] = 33'h092502c4f;
    stim[17] = 33'h0905f7ba8;
    stim[18] = 33'h09d55168c;
    stim[19] = 33'h17288cff7;
    stim[20] = 33'h0d17d4195;
    stim[21] = 33'h10ed65976;
    stim[22] = 33'h11a2df94c;
    stim[23] = 33'h0bc2ae5c4;
    stim[24] = 33'h062a6d2ea;
    stim[25] = 33'h0fc51bdde;
    stim[26] = 33'h096955bc4;
    stim[27] = 33'h1b2b95684;
    stim[28] = 33'h1737b33d2;
    stim[29] = 33'h110b0ffca;
    stim[30] = 33'h14f6c3e1a;
    stim[31] = 33'h06600fcbf;
    stim[32] = 33'h1d87bd70b;
    stim[33] = 33'h1a93ee34c;
    stim[34] = 33'h0c8cba232;
    stim[35] = 33'h152cc0f84;
    stim[36] = 33'h0362038eb;
    stim[37] = 33'h16a25fab7;
    stim[38] = 33'h0e9f8efd5;
    stim[39] = 33'h141a005a6;
    stim[40] = 33'h03a5d51f5;
    stim[41] = 33'h1dbd4db58;
    stim[42] = 33'h0302ee311;
    stim[43] = 33'h12438f973;
    stim[44] = 33'h16405b77b;
    stim[45] = 33'h15e104f5a;
    stim[46] = 33'h01fb9f149;
    stim[47] = 33'h1d190bdd6;
    stim[48] = 33'h00fd3aa7d;
    stim[49] = 33'h11aed4604;
    stim[50] = 33'h1ccc30194;
    stim[51] = 33'h04a9a7421;
    stim[52] = 33'h0c068e7c7;
    stim[53] = 33'h041b52835;
    stim[54] = 33'h08aaf4b27;
    stim[55] = 33'h1fcc3589a;
    stim[56] = 33'h11591a595;
    stim[57] = 33'h00a7f6fe2;
    stim[58] = 33'h00f86a130;
    stim[59] = 33'h0877bc105;
    stim[60] = 33'h15b74d077;
    stim[61] = 33'h00e23a44a;
    stim[62] = 33'h039cbbc5f;
    stim[63] = 33'h02bc52168;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
