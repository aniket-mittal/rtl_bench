// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03236 dut (
    .clk(clk),
    .rst(in_vec[39:39]),
    .OUT_rep_rdy(in_vec[38:38]),
    .v_dc_rep(in_vec[37:37]),
    .v_mem_rep(in_vec[36:36]),
    .dc_rep_flit(in_vec[35:20]),
    .mem_rep_flit(in_vec[19:4]),
    .dc_rep_ctrl(in_vec[3:2]),
    .mem_rep_ctrl(in_vec[1:0]),
    .ack_OUT_rep(out_vec[4:4]),
    .ack_dc_rep(out_vec[3:3]),
    .ack_mem_rep(out_vec[2:2]),
    .select(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'hae236ef97f;
    stim[1] = 40'hf5bc704d26;
    stim[2] = 40'h41a32a6b0b;
    stim[3] = 40'h72d4006fb7;
    stim[4] = 40'h2ee1a75993;
    stim[5] = 40'h57fb9b192a;
    stim[6] = 40'h2ab814b254;
    stim[7] = 40'h6a493d2eea;
    stim[8] = 40'h470bdc234c;
    stim[9] = 40'h1e520ba4ab;
    stim[10] = 40'h5f389ed9d3;
    stim[11] = 40'h4e98395ce6;
    stim[12] = 40'h00cf93bbab;
    stim[13] = 40'h48a5383ae9;
    stim[14] = 40'h79bd8e473e;
    stim[15] = 40'h6ef397b587;
    stim[16] = 40'h3b94f1c20c;
    stim[17] = 40'h4c421779a5;
    stim[18] = 40'h5522c74673;
    stim[19] = 40'h1c6a79af29;
    stim[20] = 40'h5aeba355f6;
    stim[21] = 40'h14afae549f;
    stim[22] = 40'h3d60f14793;
    stim[23] = 40'h1d280784ee;
    stim[24] = 40'h252d0bff8a;
    stim[25] = 40'h6b278ad531;
    stim[26] = 40'h50854abf69;
    stim[27] = 40'h34d70160e4;
    stim[28] = 40'h30c4b857ac;
    stim[29] = 40'h277e510520;
    stim[30] = 40'h25b447dc1a;
    stim[31] = 40'h7aab3a65a0;
    stim[32] = 40'h51bc8da2e7;
    stim[33] = 40'h7400c26048;
    stim[34] = 40'h641dd05d12;
    stim[35] = 40'h36f5d19789;
    stim[36] = 40'h4af856c837;
    stim[37] = 40'h06a7769f85;
    stim[38] = 40'h2f4db4d6de;
    stim[39] = 40'h4595ba9587;
    stim[40] = 40'h6d1878a1c1;
    stim[41] = 40'h256a13f503;
    stim[42] = 40'h77ddecbe7f;
    stim[43] = 40'h7bde6a2180;
    stim[44] = 40'h2118ae7c13;
    stim[45] = 40'h130cc4648f;
    stim[46] = 40'h1a687b0439;
    stim[47] = 40'h2df8c20cb4;
    stim[48] = 40'h73af6d0cb0;
    stim[49] = 40'h67be61aef2;
    stim[50] = 40'h37af719acd;
    stim[51] = 40'h24e560430b;
    stim[52] = 40'h3c704c3bf0;
    stim[53] = 40'h7ce68fd7fa;
    stim[54] = 40'h628afd3e27;
    stim[55] = 40'h5d7191cbd4;
    stim[56] = 40'h70feb0ae98;
    stim[57] = 40'h5c26c38455;
    stim[58] = 40'h1e169ebb63;
    stim[59] = 40'h6d37aa492e;
    stim[60] = 40'h10b600cfa8;
    stim[61] = 40'h5cdf07ca10;
    stim[62] = 40'h76bf65abe2;
    stim[63] = 40'h0a4e6571a6;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h16;
      expv[6] = 5'h00;
      expv[7] = 5'h16;
      expv[8] = 5'h16;
      expv[9] = 5'h00;
      expv[10] = 5'h16;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h19;
      expv[16] = 5'h00;
      expv[17] = 5'h19;
      expv[18] = 5'h19;
      expv[19] = 5'h00;
      expv[20] = 5'h19;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h16;
      expv[26] = 5'h16;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h16;
      expv[32] = 5'h16;
      expv[33] = 5'h00;
      expv[34] = 5'h16;
      expv[35] = 5'h00;
      expv[36] = 5'h16;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h19;
      expv[40] = 5'h19;
      expv[41] = 5'h00;
      expv[42] = 5'h19;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h00;
      expv[48] = 5'h19;
      expv[49] = 5'h19;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h19;
      expv[54] = 5'h19;
      expv[55] = 5'h19;
      expv[56] = 5'h19;
      expv[57] = 5'h19;
      expv[58] = 5'h00;
      expv[59] = 5'h19;
      expv[60] = 5'h00;
      expv[61] = 5'h16;
      expv[62] = 5'h16;
      expv[63] = 5'h00;
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
