// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04696 dut (
    .clk(clk),
    .dbrk_break(in_vec[48:48]),
    .debugreq(in_vec[47:47]),
    .hbreak_enabled(in_vec[46:46]),
    .jdo(in_vec[45:8]),
    .jrst_n(in_vec[7:7]),
    .ocireg_ers(in_vec[6:6]),
    .ocireg_mrs(in_vec[5:5]),
    .reset(in_vec[4:4]),
    .st_ready_test_idle(in_vec[3:3]),
    .take_action_ocimem_a(in_vec[2:2]),
    .take_action_ocireg(in_vec[1:1]),
    .xbrk_break(in_vec[0:0]),
    .debugack(out_vec[6:6]),
    .monitor_error(out_vec[5:5]),
    .monitor_go(out_vec[4:4]),
    .monitor_ready(out_vec[3:3]),
    .oci_hbreak_req(out_vec[2:2]),
    .resetlatch(out_vec[1:1]),
    .resetrequest(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h00da13d185017;
    stim[1] = 49'h1bd9a53a5c0d1;
    stim[2] = 49'h08e6e8f997526;
    stim[3] = 49'h15d5ddc4566c0;
    stim[4] = 49'h0549f8da920c6;
    stim[5] = 49'h1454ed97d1462;
    stim[6] = 49'h1ce8acda227c6;
    stim[7] = 49'h0c55f1b5d8c27;
    stim[8] = 49'h0858d5b366f2a;
    stim[9] = 49'h1611195458345;
    stim[10] = 49'h1f9b6b189a3e4;
    stim[11] = 49'h1651b9fa7bee6;
    stim[12] = 49'h162bed30dd40b;
    stim[13] = 49'h029c38c1a9269;
    stim[14] = 49'h022d58d57e3cc;
    stim[15] = 49'h1ed6bb949aa6c;
    stim[16] = 49'h07652cda229e9;
    stim[17] = 49'h007650df3a207;
    stim[18] = 49'h1dad145718f28;
    stim[19] = 49'h0d73cccca9b43;
    stim[20] = 49'h015ae6f0acd2a;
    stim[21] = 49'h0ca89cacd1e69;
    stim[22] = 49'h15cc07023ba8a;
    stim[23] = 49'h1cd5b6ac74ee5;
    stim[24] = 49'h0d18f74aae183;
    stim[25] = 49'h1fc317d439fe6;
    stim[26] = 49'h10dcc3bc84282;
    stim[27] = 49'h0269065d56d83;
    stim[28] = 49'h004b164deaa44;
    stim[29] = 49'h0e100f1fa7ac5;
    stim[30] = 49'h133798dcd59a2;
    stim[31] = 49'h0aa6e8a896c62;
    stim[32] = 49'h05e864ed8aae3;
    stim[33] = 49'h0e269b116fc67;
    stim[34] = 49'h1aa6bd36089c8;
    stim[35] = 49'h09a4037c262e2;
    stim[36] = 49'h0d54c056b6488;
    stim[37] = 49'h0f8bd3281a9eb;
    stim[38] = 49'h1861e93e53ec9;
    stim[39] = 49'h03b369ad45ea3;
    stim[40] = 49'h0accc30b3824f;
    stim[41] = 49'h0b2fd41a02505;
    stim[42] = 49'h0a37de350580b;
    stim[43] = 49'h07bfe62d023c9;
    stim[44] = 49'h0e38e4bf3a421;
    stim[45] = 49'h05529d91b6b88;
    stim[46] = 49'h1e0b4ed872c27;
    stim[47] = 49'h091f2ae34ed43;
    stim[48] = 49'h17dc0f72d4d49;
    stim[49] = 49'h1133472b809a4;
    stim[50] = 49'h1089d6ab6c26d;
    stim[51] = 49'h102e42cc3fcec;
    stim[52] = 49'h0a1371de334c1;
    stim[53] = 49'h02d40339e648a;
    stim[54] = 49'h0e12867651080;
    stim[55] = 49'h1e3e779f27de8;
    stim[56] = 49'h19acabfe92fae;
    stim[57] = 49'h1d5cba5d793e2;
    stim[58] = 49'h1795b1af3acaa;
    stim[59] = 49'h029542f8a1845;
    stim[60] = 49'h1e39da2dadf6a;
    stim[61] = 49'h0fc04328fa9ce;
    stim[62] = 49'h09a064817fc0b;
    stim[63] = 49'h07c1df69cc686;
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
      expv[0] = 7'h4x;
      expv[1] = 7'h4x;
      expv[2] = 7'h46;
      expv[3] = 7'h06;
      expv[4] = 7'h02;
      expv[5] = 7'h04;
      expv[6] = 7'h04;
      expv[7] = 7'h04;
      expv[8] = 7'h44;
      expv[9] = 7'h04;
      expv[10] = 7'h04;
      expv[11] = 7'h14;
      expv[12] = 7'h04;
      expv[13] = 7'h44;
      expv[14] = 7'h40;
      expv[15] = 7'h04;
      expv[16] = 7'h04;
      expv[17] = 7'h44;
      expv[18] = 7'h04;
      expv[19] = 7'h04;
      expv[20] = 7'h40;
      expv[21] = 7'h04;
      expv[22] = 7'h04;
      expv[23] = 7'h04;
      expv[24] = 7'h05;
      expv[25] = 7'h05;
      expv[26] = 7'h6d;
      expv[27] = 7'h6d;
      expv[28] = 7'h40;
      expv[29] = 7'h04;
      expv[30] = 7'h55;
      expv[31] = 7'h44;
      expv[32] = 7'h04;
      expv[33] = 7'h04;
      expv[34] = 7'h44;
      expv[35] = 7'h44;
      expv[36] = 7'h2c;
      expv[37] = 7'h2c;
      expv[38] = 7'h6c;
      expv[39] = 7'h6c;
      expv[40] = 7'h44;
      expv[41] = 7'h44;
      expv[42] = 7'h44;
      expv[43] = 7'h04;
      expv[44] = 7'h04;
      expv[45] = 7'h00;
      expv[46] = 7'h04;
      expv[47] = 7'h44;
      expv[48] = 7'h04;
      expv[49] = 7'h44;
      expv[50] = 7'h44;
      expv[51] = 7'h44;
      expv[52] = 7'h44;
      expv[53] = 7'h44;
      expv[54] = 7'h04;
      expv[55] = 7'h04;
      expv[56] = 7'h44;
      expv[57] = 7'h14;
      expv[58] = 7'h3c;
      expv[59] = 7'h44;
      expv[60] = 7'h04;
      expv[61] = 7'h04;
      expv[62] = 7'h44;
      expv[63] = 7'h00;
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
