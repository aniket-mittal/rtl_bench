// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03273 dut (
    .CLK(clk),
    .DATA_IN(in_vec[42:35]),
    .RESET(in_vec[34:34]),
    .START(in_vec[33:33]),
    .LOAD(in_vec[32:32]),
    .CRC_IN(in_vec[31:0]),
    .CRC_OUT(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h70f686807c5;
    stim[1] = 43'h6fe3ee230e7;
    stim[2] = 43'h521b8294fb1;
    stim[3] = 43'h77259eaf797;
    stim[4] = 43'h110f37f81ec;
    stim[5] = 43'h0593f5e3963;
    stim[6] = 43'h5709c53bba7;
    stim[7] = 43'h7a238232959;
    stim[8] = 43'h4d08981e063;
    stim[9] = 43'h04115a14e8d;
    stim[10] = 43'h029a99d62af;
    stim[11] = 43'h59efb90bfeb;
    stim[12] = 43'h2b38d22a9c2;
    stim[13] = 43'h5a139c2e21b;
    stim[14] = 43'h5c34b2b1052;
    stim[15] = 43'h441593d126c;
    stim[16] = 43'h5632f286053;
    stim[17] = 43'h68a37b5a338;
    stim[18] = 43'h003afc2afc1;
    stim[19] = 43'h6c93ee0d4b9;
    stim[20] = 43'h1fbbbb21ec8;
    stim[21] = 43'h1346eac0599;
    stim[22] = 43'h72a0a9630a5;
    stim[23] = 43'h6c1ba49599c;
    stim[24] = 43'h4fb5fae67fc;
    stim[25] = 43'h47b08f068d6;
    stim[26] = 43'h2d3cc721778;
    stim[27] = 43'h31360737688;
    stim[28] = 43'h26869851eef;
    stim[29] = 43'h59878f5a770;
    stim[30] = 43'h1625ef2af9d;
    stim[31] = 43'h6ea4cfd186d;
    stim[32] = 43'h423b2df29dd;
    stim[33] = 43'h07088624e7d;
    stim[34] = 43'h392d678630e;
    stim[35] = 43'h73199f03546;
    stim[36] = 43'h5721165c283;
    stim[37] = 43'h363c42d35aa;
    stim[38] = 43'h46bb82db8f1;
    stim[39] = 43'h1a0e334dfef;
    stim[40] = 43'h1f9a9085850;
    stim[41] = 43'h26a7f0db13b;
    stim[42] = 43'h2f14536d36d;
    stim[43] = 43'h788e4956df4;
    stim[44] = 43'h1d218983019;
    stim[45] = 43'h362eec18394;
    stim[46] = 43'h10b7ff07598;
    stim[47] = 43'h3d00cab8bc5;
    stim[48] = 43'h30a3cb6f741;
    stim[49] = 43'h6fadd0822ea;
    stim[50] = 43'h292a9e84828;
    stim[51] = 43'h08a798ae478;
    stim[52] = 43'h74a03618664;
    stim[53] = 43'h073d607af59;
    stim[54] = 43'h62a0b0ca74b;
    stim[55] = 43'h6ca641b3e98;
    stim[56] = 43'h248ad6328d9;
    stim[57] = 43'h6a069e8e4aa;
    stim[58] = 43'h418bc0436c5;
    stim[59] = 43'h45b60c0a737;
    stim[60] = 43'h0b8201656f9;
    stim[61] = 43'h5c08386ce4b;
    stim[62] = 43'h36a6e5bba93;
    stim[63] = 43'h4838a1cbe12;
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
      expv[3] = 32'h29d4f0b4;
      expv[4] = 32'h29d4f0b4;
      expv[5] = 32'h973d72bc;
      expv[6] = 32'h3f5e3963;
      expv[7] = 32'h3f5e3963;
      expv[8] = 32'h3f5e3963;
      expv[9] = 32'h28f83eb8;
      expv[10] = 32'h15a14e8d;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'hb07dae2f;
      expv[14] = 32'ha28143e3;
      expv[15] = 32'h4b2b1052;
      expv[16] = 32'hafeb8e50;
      expv[17] = 32'h2f286053;
      expv[18] = 32'h4c2f913f;
      expv[19] = 32'h3b4186b5;
      expv[20] = 32'hbeff1229;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'hd26c4a22;
      expv[25] = 32'h5fae67fc;
      expv[26] = 32'hf3ed6a81;
      expv[27] = 32'h38d2046b;
      expv[28] = 32'h772395e1;
      expv[29] = 32'h784151b3;
      expv[30] = 32'h784151b3;
      expv[31] = 32'h784151b3;
      expv[32] = 32'h2ac26c73;
      expv[33] = 32'h5593d9ac;
      expv[34] = 32'h8683fcce;
      expv[35] = 32'h8683fcce;
      expv[36] = 32'h1940426d;
      expv[37] = 32'h1940426d;
      expv[38] = 32'he33bb5d3;
      expv[39] = 32'h6af68a3b;
      expv[40] = 32'h2d644a5c;
      expv[41] = 32'ha9085850;
      expv[42] = 32'ha9085850;
      expv[43] = 32'hdef5079d;
      expv[44] = 32'hdef5079d;
      expv[45] = 32'hdef5079d;
      expv[46] = 32'h23aaca9d;
      expv[47] = 32'ha60352ba;
      expv[48] = 32'h74190ec3;
      expv[49] = 32'h74190ec3;
      expv[50] = 32'h42da73b3;
      expv[51] = 32'hcea30ab5;
      expv[52] = 32'hb31b110a;
      expv[53] = 32'he3bc6260;
      expv[54] = 32'h93e8b686;
      expv[55] = 32'hfc663fb5;
      expv[56] = 32'h90c42957;
      expv[57] = 32'hd266d538;
      expv[58] = 32'hd266d538;
      expv[59] = 32'hd266d538;
      expv[60] = 32'h60c0a737;
      expv[61] = 32'h2e45dd58;
      expv[62] = 32'h2e45dd58;
      expv[63] = 32'h2e45dd58;
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
