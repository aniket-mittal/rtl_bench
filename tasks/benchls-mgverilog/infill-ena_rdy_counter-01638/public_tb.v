// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01638 dut (
    .CLK(clk),
    .nRST(in_vec[33:33]),
    .request$say__ENA(in_vec[32:32]),
    .request$say$va(in_vec[31:0]),
    .request$say__RDY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h3ac26bfc2;
    stim[1] = 34'h3a2e36018;
    stim[2] = 34'h0a8b763a2;
    stim[3] = 34'h072ab6995;
    stim[4] = 34'h082af890b;
    stim[5] = 34'h16a452abd;
    stim[6] = 34'h0e3a14e84;
    stim[7] = 34'h1e67b08d6;
    stim[8] = 34'h17d95e6f0;
    stim[9] = 34'h0dff0d7a2;
    stim[10] = 34'h16b578172;
    stim[11] = 34'h0f75850e9;
    stim[12] = 34'h0e56f261d;
    stim[13] = 34'h1e1663587;
    stim[14] = 34'h1b24498fb;
    stim[15] = 34'h173999117;
    stim[16] = 34'h0b6781d6e;
    stim[17] = 34'h1786004e0;
    stim[18] = 34'h015030b2d;
    stim[19] = 34'h10b181fde;
    stim[20] = 34'h02dc1f16a;
    stim[21] = 34'h03a62894a;
    stim[22] = 34'h0ebabd052;
    stim[23] = 34'h0d7c52f89;
    stim[24] = 34'h0f77725f1;
    stim[25] = 34'h14796cba2;
    stim[26] = 34'h12b79c2ba;
    stim[27] = 34'h08d658feb;
    stim[28] = 34'h18fe727b0;
    stim[29] = 34'h0915e0375;
    stim[30] = 34'h0acad7cf3;
    stim[31] = 34'h1de7a22c3;
    stim[32] = 34'h117d7d849;
    stim[33] = 34'h0e2451c7f;
    stim[34] = 34'h1d66ec2ae;
    stim[35] = 34'h1c4241d46;
    stim[36] = 34'h098e71512;
    stim[37] = 34'h0fc0b7812;
    stim[38] = 34'h0e810b66c;
    stim[39] = 34'h0ec1f9f21;
    stim[40] = 34'h168ecafb3;
    stim[41] = 34'h0d1680f75;
    stim[42] = 34'h096f9459e;
    stim[43] = 34'h109a5cb2e;
    stim[44] = 34'h02d6ca176;
    stim[45] = 34'h099db0057;
    stim[46] = 34'h0abbf6fd2;
    stim[47] = 34'h0fc1f7de9;
    stim[48] = 34'h068d0947a;
    stim[49] = 34'h0c98aa7a1;
    stim[50] = 34'h1115551fb;
    stim[51] = 34'h0035abb58;
    stim[52] = 34'h02b09157b;
    stim[53] = 34'h0c71e6e31;
    stim[54] = 34'h1070b52f8;
    stim[55] = 34'h18c8059dc;
    stim[56] = 34'h05d9d18dd;
    stim[57] = 34'h086989871;
    stim[58] = 34'h05ddf6e9b;
    stim[59] = 34'h0447f4c95;
    stim[60] = 34'h198ab0a89;
    stim[61] = 34'h0dcd1e2b7;
    stim[62] = 34'h19e1320d8;
    stim[63] = 34'h1147192ef;
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
      expv[0] = 1'hx;
      expv[1] = 1'hx;
      expv[2] = 1'hx;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
