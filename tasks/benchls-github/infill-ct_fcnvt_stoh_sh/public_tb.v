// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_fcnvt_stoh_sh dut (
    .stoh_sh_cnt(in_vec[30:23]),
    .stoh_sh_src(in_vec[22:0]),
    .stoh_sh_f_v(out_vec[35:25]),
    .stoh_sh_f_x(out_vec[24:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h022c2e4c;
    stim[1] = 31'h38fadff2;
    stim[2] = 31'h3031e0c1;
    stim[3] = 31'h519bee93;
    stim[4] = 31'h01e1823a;
    stim[5] = 31'h675d1d89;
    stim[6] = 31'h3fe3ff30;
    stim[7] = 31'h57cad9e9;
    stim[8] = 31'h0afe98a6;
    stim[9] = 31'h18abd1ac;
    stim[10] = 31'h4c23cf75;
    stim[11] = 31'h0e85b133;
    stim[12] = 31'h6b56a84c;
    stim[13] = 31'h239f0536;
    stim[14] = 31'h1c40c895;
    stim[15] = 31'h35689c7f;
    stim[16] = 31'h32a27722;
    stim[17] = 31'h419da0bd;
    stim[18] = 31'h1ca40efb;
    stim[19] = 31'h650da1e0;
    stim[20] = 31'h72b7d8d5;
    stim[21] = 31'h71424882;
    stim[22] = 31'h6c8d2394;
    stim[23] = 31'h4a423bf6;
    stim[24] = 31'h66f2910f;
    stim[25] = 31'h7e58aa64;
    stim[26] = 31'h2cbf5de0;
    stim[27] = 31'h3f7c73fb;
    stim[28] = 31'h23e194ca;
    stim[29] = 31'h61c8e3f4;
    stim[30] = 31'h2253b0bf;
    stim[31] = 31'h5987bd06;
    stim[32] = 31'h06532627;
    stim[33] = 31'h48cf2d8c;
    stim[34] = 31'h1ba34b79;
    stim[35] = 31'h5ebb38df;
    stim[36] = 31'h3bc3f03f;
    stim[37] = 31'h2da2739b;
    stim[38] = 31'h55e00827;
    stim[39] = 31'h2a9360f7;
    stim[40] = 31'h09f6634e;
    stim[41] = 31'h29018d6a;
    stim[42] = 31'h05d0c53f;
    stim[43] = 31'h0119f04a;
    stim[44] = 31'h0f24035c;
    stim[45] = 31'h3a7b830e;
    stim[46] = 31'h100cc2f4;
    stim[47] = 31'h3bc53387;
    stim[48] = 31'h43b017ea;
    stim[49] = 31'h08df7b41;
    stim[50] = 31'h154f3a66;
    stim[51] = 31'h20fd60b7;
    stim[52] = 31'h13edf119;
    stim[53] = 31'h3fc46076;
    stim[54] = 31'h7281d485;
    stim[55] = 31'h01a991b1;
    stim[56] = 31'h62537cc8;
    stim[57] = 31'h315b962c;
    stim[58] = 31'h66e3a672;
    stim[59] = 31'h09d007ab;
    stim[60] = 31'h122face9;
    stim[61] = 31'h2db8ca2d;
    stim[62] = 31'h08fbfd86;
    stim[63] = 31'h792d2e31;
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
      expv[0] = 36'h000400000;
      expv[1] = 36'h000400000;
      expv[2] = 36'h000400000;
      expv[3] = 36'h000400000;
      expv[4] = 36'h000400000;
      expv[5] = 36'h000400000;
      expv[6] = 36'h000400000;
      expv[7] = 36'h000400000;
      expv[8] = 36'h000400000;
      expv[9] = 36'h000400000;
      expv[10] = 36'h000400000;
      expv[11] = 36'h000400000;
      expv[12] = 36'h000400000;
      expv[13] = 36'h000400000;
      expv[14] = 36'h000400000;
      expv[15] = 36'h01d138fe0;
      expv[16] = 36'h000a27722;
      expv[17] = 36'h000400000;
      expv[18] = 36'h000400000;
      expv[19] = 36'h000400000;
      expv[20] = 36'h000400000;
      expv[21] = 36'h000400000;
      expv[22] = 36'h000400000;
      expv[23] = 36'h000400000;
      expv[24] = 36'h000400000;
      expv[25] = 36'h000400000;
      expv[26] = 36'h000400000;
      expv[27] = 36'h000400000;
      expv[28] = 36'h000400000;
      expv[29] = 36'h000400000;
      expv[30] = 36'h000400000;
      expv[31] = 36'h000400000;
      expv[32] = 36'h000400000;
      expv[33] = 36'h000400000;
      expv[34] = 36'h000400000;
      expv[35] = 36'h000400000;
      expv[36] = 36'h000400000;
      expv[37] = 36'h000400000;
      expv[38] = 36'h000400000;
      expv[39] = 36'h000400000;
      expv[40] = 36'h000400000;
      expv[41] = 36'h000400000;
      expv[42] = 36'h000400000;
      expv[43] = 36'h000400000;
      expv[44] = 36'h000400000;
      expv[45] = 36'h000400000;
      expv[46] = 36'h000400000;
      expv[47] = 36'h000400000;
      expv[48] = 36'h000400000;
      expv[49] = 36'h000400000;
      expv[50] = 36'h000400000;
      expv[51] = 36'h000400000;
      expv[52] = 36'h000400000;
      expv[53] = 36'h000400000;
      expv[54] = 36'h000400000;
      expv[55] = 36'h000400000;
      expv[56] = 36'h000400000;
      expv[57] = 36'h000400000;
      expv[58] = 36'h000400000;
      expv[59] = 36'h000400000;
      expv[60] = 36'h000400000;
      expv[61] = 36'h000400000;
      expv[62] = 36'h000400000;
      expv[63] = 36'h000400000;
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
