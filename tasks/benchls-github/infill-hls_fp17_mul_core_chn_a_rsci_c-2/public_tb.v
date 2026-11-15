// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  HLS_fp17_mul_core_chn_a_rsci_chn_a_wait_dp dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[20:20]),
    .chn_a_rsci_oswt(in_vec[19:19]),
    .chn_a_rsci_biwt(in_vec[18:18]),
    .chn_a_rsci_bdwt(in_vec[17:17]),
    .chn_a_rsci_d(in_vec[16:0]),
    .chn_a_rsci_bawt(out_vec[18:18]),
    .chn_a_rsci_wen_comp(out_vec[17:17]),
    .chn_a_rsci_d_mxwt(out_vec[16:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h0de707;
    stim[1] = 21'h01f445;
    stim[2] = 21'h171447;
    stim[3] = 21'h1e8f2e;
    stim[4] = 21'h1fc13a;
    stim[5] = 21'h1310c9;
    stim[6] = 21'h0ee5e5;
    stim[7] = 21'h105600;
    stim[8] = 21'h1c3f76;
    stim[9] = 21'h1a8124;
    stim[10] = 21'h19a463;
    stim[11] = 21'h131d2b;
    stim[12] = 21'h121ebb;
    stim[13] = 21'h16b703;
    stim[14] = 21'h10ecee;
    stim[15] = 21'h181123;
    stim[16] = 21'h1292d0;
    stim[17] = 21'h145f59;
    stim[18] = 21'h1c17e0;
    stim[19] = 21'h104e36;
    stim[20] = 21'h1c21ce;
    stim[21] = 21'h1b7ae3;
    stim[22] = 21'h1f1679;
    stim[23] = 21'h15a1e5;
    stim[24] = 21'h116d3e;
    stim[25] = 21'h16d67a;
    stim[26] = 21'h13474a;
    stim[27] = 21'h1f5a8d;
    stim[28] = 21'h1d7cb8;
    stim[29] = 21'h1d5da2;
    stim[30] = 21'h1628d0;
    stim[31] = 21'h10928e;
    stim[32] = 21'h13127d;
    stim[33] = 21'h1cbadb;
    stim[34] = 21'h1a3373;
    stim[35] = 21'h111689;
    stim[36] = 21'h1729f9;
    stim[37] = 21'h1bdbd1;
    stim[38] = 21'h155cb4;
    stim[39] = 21'h148921;
    stim[40] = 21'h109467;
    stim[41] = 21'h12578f;
    stim[42] = 21'h158701;
    stim[43] = 21'h1b311f;
    stim[44] = 21'h109e1e;
    stim[45] = 21'h1793f9;
    stim[46] = 21'h18913c;
    stim[47] = 21'h15919d;
    stim[48] = 21'h1c239f;
    stim[49] = 21'h1a1588;
    stim[50] = 21'h15d492;
    stim[51] = 21'h1c888f;
    stim[52] = 21'h1a3268;
    stim[53] = 21'h15d6fa;
    stim[54] = 21'h1dc107;
    stim[55] = 21'h14bee7;
    stim[56] = 21'h167d59;
    stim[57] = 21'h127f96;
    stim[58] = 21'h1225e0;
    stim[59] = 21'h1a560d;
    stim[60] = 21'h1d66e2;
    stim[61] = 21'h123d06;
    stim[62] = 21'h1edb58;
    stim[63] = 21'h18c24c;
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
      expv[0] = 19'h7e707;
      expv[1] = 19'h3f445;
      expv[2] = 19'h71447;
      expv[3] = 19'h68f2e;
      expv[4] = 19'h7c13a;
      expv[5] = 19'h310c9;
      expv[6] = 19'h6e5e5;
      expv[7] = 19'h25600;
      expv[8] = 19'h63f76;
      expv[9] = 19'h63f76;
      expv[10] = 19'h1a463;
      expv[11] = 19'h31d2b;
      expv[12] = 19'h21ebb;
      expv[13] = 19'h6b703;
      expv[14] = 19'h2ecee;
      expv[15] = 19'h01123;
      expv[16] = 19'h292d0;
      expv[17] = 19'h65f59;
      expv[18] = 19'h65f59;
      expv[19] = 19'h65f59;
      expv[20] = 19'h65f59;
      expv[21] = 19'h65f59;
      expv[22] = 19'h71679;
      expv[23] = 19'h7a1e5;
      expv[24] = 19'h7a1e5;
      expv[25] = 19'h7a1e5;
      expv[26] = 19'h3474a;
      expv[27] = 19'h75a8d;
      expv[28] = 19'h77cb8;
      expv[29] = 19'h77cb8;
      expv[30] = 19'h77cb8;
      expv[31] = 19'h2928e;
      expv[32] = 19'h3127d;
      expv[33] = 19'h6badb;
      expv[34] = 19'h6badb;
      expv[35] = 19'h31689;
      expv[36] = 19'h729f9;
      expv[37] = 19'h1dbd1;
      expv[38] = 19'h75cb4;
      expv[39] = 19'h75cb4;
      expv[40] = 19'h75cb4;
      expv[41] = 19'h75cb4;
      expv[42] = 19'h78701;
      expv[43] = 19'h78701;
      expv[44] = 19'h29e1e;
      expv[45] = 19'h793f9;
      expv[46] = 19'h0913c;
      expv[47] = 19'h7919d;
      expv[48] = 19'h7919d;
      expv[49] = 19'h7919d;
      expv[50] = 19'h7d492;
      expv[51] = 19'h7d492;
      expv[52] = 19'h7d492;
      expv[53] = 19'h7d6fa;
      expv[54] = 19'h7d6fa;
      expv[55] = 19'h7d6fa;
      expv[56] = 19'h7d6fa;
      expv[57] = 19'h27f96;
      expv[58] = 19'h225e0;
      expv[59] = 19'h0560d;
      expv[60] = 19'h766e2;
      expv[61] = 19'h766e2;
      expv[62] = 19'h6db58;
      expv[63] = 19'h0c24c;
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
