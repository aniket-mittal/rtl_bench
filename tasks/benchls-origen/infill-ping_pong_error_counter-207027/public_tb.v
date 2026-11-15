// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_207027 dut (
    .clk(clk),
    .nRST(in_vec[43:43]),
    .pingpong(in_vec[42:42]),
    .ram_data(in_vec[41:10]),
    .ram_addr(in_vec[9:0]),
    .err_count0(out_vec[32:17]),
    .err_count1(out_vec[16:1]),
    .err(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'hc2225459495;
    stim[1] = 44'h8db60230d79;
    stim[2] = 44'h51c776fdcd8;
    stim[3] = 44'h02e5a854ca7;
    stim[4] = 44'h797fd952e24;
    stim[5] = 44'h6996593213d;
    stim[6] = 44'h4f81ed933ba;
    stim[7] = 44'h4c95af8fb67;
    stim[8] = 44'h297183b539a;
    stim[9] = 44'h27a469cbba4;
    stim[10] = 44'h7376d108baf;
    stim[11] = 44'h5f2c3a57167;
    stim[12] = 44'h45b1907e369;
    stim[13] = 44'h62ebd77e50f;
    stim[14] = 44'h6f21c7f07f0;
    stim[15] = 44'h36ba5e10e39;
    stim[16] = 44'h2edc105a3c3;
    stim[17] = 44'h7eb4975e65b;
    stim[18] = 44'h09463b212c0;
    stim[19] = 44'h3df95d5a4af;
    stim[20] = 44'h57912497c47;
    stim[21] = 44'h2d9a0f03f8a;
    stim[22] = 44'h502ae6f03d4;
    stim[23] = 44'h04bdf9d92c5;
    stim[24] = 44'h5a21b8ef77e;
    stim[25] = 44'h2a00b6cbc3e;
    stim[26] = 44'h67df1616ce9;
    stim[27] = 44'h089d564aab6;
    stim[28] = 44'h5e66cc7ffe2;
    stim[29] = 44'h6c9870490da;
    stim[30] = 44'h6cf227105f5;
    stim[31] = 44'h42d4153f6be;
    stim[32] = 44'h3227bcdb956;
    stim[33] = 44'h753962a7cc8;
    stim[34] = 44'h32e1d98d1a3;
    stim[35] = 44'h2bf0cc4a72c;
    stim[36] = 44'h657bb272c5a;
    stim[37] = 44'h28ed30c6858;
    stim[38] = 44'he14e4c2b9f4;
    stim[39] = 44'h11a567e549a;
    stim[40] = 44'h78888744d23;
    stim[41] = 44'h16d8b3061ce;
    stim[42] = 44'h4a392b0eab3;
    stim[43] = 44'h0c2f40b6d75;
    stim[44] = 44'h0bab2370c43;
    stim[45] = 44'h42a765f9bce;
    stim[46] = 44'h13dd0bf83a7;
    stim[47] = 44'h783b48317da;
    stim[48] = 44'h4dff5d2d67d;
    stim[49] = 44'h75e640d48ee;
    stim[50] = 44'h1e897c59d11;
    stim[51] = 44'h0d13aad6c9a;
    stim[52] = 44'h0613da2db6c;
    stim[53] = 44'h149e8289704;
    stim[54] = 44'h7804dca7a58;
    stim[55] = 44'h3ad8538a2b0;
    stim[56] = 44'h0cd7ae2bd40;
    stim[57] = 44'h46741b514ad;
    stim[58] = 44'h1d21d3c8dae;
    stim[59] = 44'h7ab864f5a59;
    stim[60] = 44'h07f910279d1;
    stim[61] = 44'h90e2a87712e;
    stim[62] = 44'h256b462f1c1;
    stim[63] = 44'h3fecca8b245;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
