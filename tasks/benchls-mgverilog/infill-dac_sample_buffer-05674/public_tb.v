// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05674 dut (
    .CLK(clk),
    .SampleDelayZero(in_vec[32:32]),
    .IFFTOutput(in_vec[31:20]),
    .DMLocationWritingTo(in_vec[19:10]),
    .IFFTOutputWE(in_vec[9:9]),
    .IFFTOutputIndex(in_vec[8:0]),
    .DACDataInput(out_vec[15:4]),
    .DACCS(out_vec[3:3]),
    .DACLDAC(out_vec[2:2]),
    .DACPD(out_vec[1:1]),
    .DACWE(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0c21e49dd;
    stim[1] = 33'h18ec77c58;
    stim[2] = 33'h1240294a1;
    stim[3] = 33'h0ab29f18a;
    stim[4] = 33'h194aa8b73;
    stim[5] = 33'h186a5fa9c;
    stim[6] = 33'h173ec3a44;
    stim[7] = 33'h0e0c3e502;
    stim[8] = 33'h19cbcc844;
    stim[9] = 33'h06b483bb3;
    stim[10] = 33'h1f007542f;
    stim[11] = 33'h00560ee9e;
    stim[12] = 33'h1acf42746;
    stim[13] = 33'h06610fe11;
    stim[14] = 33'h0ff140113;
    stim[15] = 33'h0d9750c17;
    stim[16] = 33'h127f02cca;
    stim[17] = 33'h133be8a9f;
    stim[18] = 33'h1dbb75c19;
    stim[19] = 33'h14673be48;
    stim[20] = 33'h0134dc75d;
    stim[21] = 33'h0f55234c8;
    stim[22] = 33'h0a1bdef3c;
    stim[23] = 33'h17d548197;
    stim[24] = 33'h070826b63;
    stim[25] = 33'h115fc9072;
    stim[26] = 33'h1b6d5e028;
    stim[27] = 33'h067c2109d;
    stim[28] = 33'h183ee7ea3;
    stim[29] = 33'h094c28f4e;
    stim[30] = 33'h0a0831df5;
    stim[31] = 33'h0da8aafcc;
    stim[32] = 33'h1e97c67d8;
    stim[33] = 33'h03e501b30;
    stim[34] = 33'h0cbb5491a;
    stim[35] = 33'h0aa0aac89;
    stim[36] = 33'h19ff84b4a;
    stim[37] = 33'h1879139de;
    stim[38] = 33'h1f76bb067;
    stim[39] = 33'h0817dfa6d;
    stim[40] = 33'h1467fdb77;
    stim[41] = 33'h05bee0473;
    stim[42] = 33'h0ac627231;
    stim[43] = 33'h03e11da8d;
    stim[44] = 33'h03481757f;
    stim[45] = 33'h050da75ca;
    stim[46] = 33'h025c146ee;
    stim[47] = 33'h06974743d;
    stim[48] = 33'h13dbf644f;
    stim[49] = 33'h072c749b5;
    stim[50] = 33'h0e4a38de8;
    stim[51] = 33'h04da52dea;
    stim[52] = 33'h1887e715c;
    stim[53] = 33'h1d2a8cba9;
    stim[54] = 33'h03de2a4e4;
    stim[55] = 33'h0665142d1;
    stim[56] = 33'h11659f515;
    stim[57] = 33'h10b0c59e9;
    stim[58] = 33'h1c589a84d;
    stim[59] = 33'h12a7e0b13;
    stim[60] = 33'h1eb77dc8b;
    stim[61] = 33'h16006a3f0;
    stim[62] = 33'h03865f7dd;
    stim[63] = 33'h1990ee60f;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxx2;
      expv[3] = 16'hxxx2;
      expv[4] = 16'hxxx2;
      expv[5] = 16'hxxx2;
      expv[6] = 16'hxxx2;
      expv[7] = 16'hxxx2;
      expv[8] = 16'hxxx2;
      expv[9] = 16'hxxx2;
      expv[10] = 16'hxxx2;
      expv[11] = 16'hxxx2;
      expv[12] = 16'hxxx2;
      expv[13] = 16'hxxx2;
      expv[14] = 16'hxxx2;
      expv[15] = 16'hxxx2;
      expv[16] = 16'hxxx2;
      expv[17] = 16'hxxx2;
      expv[18] = 16'hxxx2;
      expv[19] = 16'hxxx2;
      expv[20] = 16'hxxx2;
      expv[21] = 16'hxxx2;
      expv[22] = 16'hxxx2;
      expv[23] = 16'hxxx2;
      expv[24] = 16'hxxx2;
      expv[25] = 16'hxxx2;
      expv[26] = 16'hxxx2;
      expv[27] = 16'hxxx2;
      expv[28] = 16'hxxx2;
      expv[29] = 16'hxxx2;
      expv[30] = 16'hxxx2;
      expv[31] = 16'hxxx2;
      expv[32] = 16'hxxx2;
      expv[33] = 16'hxxx2;
      expv[34] = 16'hxxx2;
      expv[35] = 16'hxxx2;
      expv[36] = 16'hxxx2;
      expv[37] = 16'hxxx2;
      expv[38] = 16'hxxx2;
      expv[39] = 16'hxxx2;
      expv[40] = 16'hxxx2;
      expv[41] = 16'hxxx2;
      expv[42] = 16'hxxx2;
      expv[43] = 16'hxxx2;
      expv[44] = 16'hxxx2;
      expv[45] = 16'hxxx2;
      expv[46] = 16'hxxx2;
      expv[47] = 16'hxxx2;
      expv[48] = 16'hxxx2;
      expv[49] = 16'hxxx2;
      expv[50] = 16'hxxx2;
      expv[51] = 16'hxxx2;
      expv[52] = 16'hxxx2;
      expv[53] = 16'hxxx2;
      expv[54] = 16'hxxx2;
      expv[55] = 16'hxxx2;
      expv[56] = 16'hxxx2;
      expv[57] = 16'hxxx2;
      expv[58] = 16'hxxx2;
      expv[59] = 16'hxxx2;
      expv[60] = 16'hxxx2;
      expv[61] = 16'hxxx2;
      expv[62] = 16'hxxx2;
      expv[63] = 16'hxxx2;
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
