// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_146319 dut (
    .clk(clk),
    .reset(in_vec[35:35]),
    .cyc_i(in_vec[34:34]),
    .stb_i(in_vec[33:33]),
    .we_i(in_vec[32:32]),
    .dat_i(in_vec[31:0]),
    .ack_o(out_vec[32:32]),
    .dat_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'he67966a9d;
    stim[1] = 36'hedbaae31e;
    stim[2] = 36'h4ba7a29fa;
    stim[3] = 36'h3f510d4c7;
    stim[4] = 36'h613594633;
    stim[5] = 36'h0ec47ea8e;
    stim[6] = 36'h18401ec54;
    stim[7] = 36'h176b8d5aa;
    stim[8] = 36'h2372f9edd;
    stim[9] = 36'h4c3ac4a35;
    stim[10] = 36'h5a23d7437;
    stim[11] = 36'h5f95557b7;
    stim[12] = 36'h2ce7831e1;
    stim[13] = 36'h1237fdb71;
    stim[14] = 36'h74685ac44;
    stim[15] = 36'h0d13357c5;
    stim[16] = 36'h01b17c7e6;
    stim[17] = 36'h6b0001c3d;
    stim[18] = 36'h0c721daac;
    stim[19] = 36'h775ffd989;
    stim[20] = 36'h441cb5f7a;
    stim[21] = 36'h72b006f9c;
    stim[22] = 36'h0d8aab3db;
    stim[23] = 36'h2aa0a541a;
    stim[24] = 36'h22fa07e72;
    stim[25] = 36'h07075e7d8;
    stim[26] = 36'h44243dc8a;
    stim[27] = 36'h15961e0eb;
    stim[28] = 36'h69a8a5ce7;
    stim[29] = 36'h28c3299ab;
    stim[30] = 36'h2f6529b3a;
    stim[31] = 36'h5a508b5f3;
    stim[32] = 36'h4278a7521;
    stim[33] = 36'h4d51c348e;
    stim[34] = 36'h68a09c9a3;
    stim[35] = 36'h038273897;
    stim[36] = 36'h26d994564;
    stim[37] = 36'h4a5203084;
    stim[38] = 36'h14b8bec3a;
    stim[39] = 36'h3f926a5c9;
    stim[40] = 36'h16f5e894e;
    stim[41] = 36'h0191be65c;
    stim[42] = 36'h78056af3b;
    stim[43] = 36'h5ab9ce33e;
    stim[44] = 36'h5a9ee070a;
    stim[45] = 36'h18c2f7ca4;
    stim[46] = 36'h7b81a0b4d;
    stim[47] = 36'hf1979df6a;
    stim[48] = 36'h02db87ee5;
    stim[49] = 36'h16d4ea281;
    stim[50] = 36'h67dcbc70b;
    stim[51] = 36'h45dbc6bbd;
    stim[52] = 36'h47b8d4715;
    stim[53] = 36'h58c454335;
    stim[54] = 36'h232cfec6d;
    stim[55] = 36'h106fb9597;
    stim[56] = 36'h1782f82be;
    stim[57] = 36'h773942c14;
    stim[58] = 36'h073db2f51;
    stim[59] = 36'h12ab9ac58;
    stim[60] = 36'h51984f9b8;
    stim[61] = 36'h0d8f5555c;
    stim[62] = 36'h59855f575;
    stim[63] = 36'h6addc59cf;
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
      expv[7] = 33'h18401ec54;
      expv[8] = 33'h08401ec54;
      expv[9] = 33'h08401ec54;
      expv[10] = 33'h08401ec54;
      expv[11] = 33'h08401ec54;
      expv[12] = 33'h08401ec54;
      expv[13] = 33'h08401ec54;
      expv[14] = 33'h08401ec54;
      expv[15] = 33'h08401ec54;
      expv[16] = 33'h08401ec54;
      expv[17] = 33'h18401ec54;
      expv[18] = 33'h08401ec54;
      expv[19] = 33'h08401ec54;
      expv[20] = 33'h175ffd989;
      expv[21] = 33'h075ffd989;
      expv[22] = 33'h075ffd989;
      expv[23] = 33'h075ffd989;
      expv[24] = 33'h175ffd989;
      expv[25] = 33'h075ffd989;
      expv[26] = 33'h075ffd989;
      expv[27] = 33'h075ffd989;
      expv[28] = 33'h075ffd989;
      expv[29] = 33'h075ffd989;
      expv[30] = 33'h075ffd989;
      expv[31] = 33'h1f6529b3a;
      expv[32] = 33'h0f6529b3a;
      expv[33] = 33'h0f6529b3a;
      expv[34] = 33'h0f6529b3a;
      expv[35] = 33'h0f6529b3a;
      expv[36] = 33'h0f6529b3a;
      expv[37] = 33'h16d994564;
      expv[38] = 33'h06d994564;
      expv[39] = 33'h06d994564;
      expv[40] = 33'h06d994564;
      expv[41] = 33'h06d994564;
      expv[42] = 33'h06d994564;
      expv[43] = 33'h06d994564;
      expv[44] = 33'h06d994564;
      expv[45] = 33'h16d994564;
      expv[46] = 33'h06d994564;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h17b8d4715;
      expv[54] = 33'h07b8d4715;
      expv[55] = 33'h07b8d4715;
      expv[56] = 33'h07b8d4715;
      expv[57] = 33'h07b8d4715;
      expv[58] = 33'h07b8d4715;
      expv[59] = 33'h07b8d4715;
      expv[60] = 33'h17b8d4715;
      expv[61] = 33'h07b8d4715;
      expv[62] = 33'h07b8d4715;
      expv[63] = 33'h07b8d4715;
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
