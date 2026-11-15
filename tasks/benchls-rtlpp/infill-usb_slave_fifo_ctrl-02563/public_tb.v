// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02563 dut (
    .clk_i(clk),
    .rst_i(in_vec[10:10]),
    .done_i(in_vec[9:6]),
    .SLWRn_i(in_vec[5:3]),
    .PKTENDn_i(in_vec[2:0]),
    .strt_o(out_vec[11:8]),
    .SLADDR_o(out_vec[7:6]),
    .SLOEn_o(out_vec[5:5]),
    .SLCSn_o(out_vec[4:4]),
    .SLWRn_o(out_vec[3:3]),
    .PKTENDn_o(out_vec[2:2]),
    .dpoMuxSel_o(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h5c8;
    stim[1] = 11'h739;
    stim[2] = 11'h21e;
    stim[3] = 11'h1b4;
    stim[4] = 11'h283;
    stim[5] = 11'h156;
    stim[6] = 11'h16e;
    stim[7] = 11'h273;
    stim[8] = 11'h12b;
    stim[9] = 11'h2bd;
    stim[10] = 11'h081;
    stim[11] = 11'h106;
    stim[12] = 11'h2be;
    stim[13] = 11'h2e4;
    stim[14] = 11'h173;
    stim[15] = 11'h3da;
    stim[16] = 11'h241;
    stim[17] = 11'h190;
    stim[18] = 11'h033;
    stim[19] = 11'h070;
    stim[20] = 11'h027;
    stim[21] = 11'h251;
    stim[22] = 11'h359;
    stim[23] = 11'h113;
    stim[24] = 11'h049;
    stim[25] = 11'h348;
    stim[26] = 11'h0c1;
    stim[27] = 11'h1f8;
    stim[28] = 11'h0ac;
    stim[29] = 11'h2ea;
    stim[30] = 11'h1ad;
    stim[31] = 11'h121;
    stim[32] = 11'h341;
    stim[33] = 11'h217;
    stim[34] = 11'h3dd;
    stim[35] = 11'h132;
    stim[36] = 11'h083;
    stim[37] = 11'h3c6;
    stim[38] = 11'h122;
    stim[39] = 11'h282;
    stim[40] = 11'h2a6;
    stim[41] = 11'h135;
    stim[42] = 11'h19e;
    stim[43] = 11'h003;
    stim[44] = 11'h259;
    stim[45] = 11'h1d5;
    stim[46] = 11'h0e2;
    stim[47] = 11'h32b;
    stim[48] = 11'h16f;
    stim[49] = 11'h03d;
    stim[50] = 11'h394;
    stim[51] = 11'h166;
    stim[52] = 11'h03b;
    stim[53] = 11'h00c;
    stim[54] = 11'h182;
    stim[55] = 11'h6cd;
    stim[56] = 11'h2e7;
    stim[57] = 11'h318;
    stim[58] = 11'h364;
    stim[59] = 11'h3ff;
    stim[60] = 11'h181;
    stim[61] = 11'h388;
    stim[62] = 11'h170;
    stim[63] = 11'h06f;
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
      expv[0] = 12'h038;
      expv[1] = 12'h038;
      expv[2] = 12'h03c;
      expv[3] = 12'h108;
      expv[4] = 12'h000;
      expv[5] = 12'h004;
      expv[6] = 12'h260;
      expv[7] = 12'h068;
      expv[8] = 12'h064;
      expv[9] = 12'h06c;
      expv[10] = 12'h4a9;
      expv[11] = 12'h0a1;
      expv[12] = 12'h8e6;
      expv[13] = 12'h0ee;
      expv[14] = 12'h100;
      expv[15] = 12'h004;
      expv[16] = 12'h268;
      expv[17] = 12'h064;
      expv[18] = 12'h4a9;
      expv[19] = 12'h0ad;
      expv[20] = 12'h0a9;
      expv[21] = 12'h0a5;
      expv[22] = 12'h0a9;
      expv[23] = 12'h8e2;
      expv[24] = 12'h0e2;
      expv[25] = 12'h0e2;
      expv[26] = 12'h108;
      expv[27] = 12'h004;
      expv[28] = 12'h268;
      expv[29] = 12'h068;
      expv[30] = 12'h4a5;
      expv[31] = 12'h0a1;
      expv[32] = 12'h8ea;
      expv[33] = 12'h0e2;
      expv[34] = 12'h104;
      expv[35] = 12'h00c;
      expv[36] = 12'h000;
      expv[37] = 12'h004;
      expv[38] = 12'h260;
      expv[39] = 12'h060;
      expv[40] = 12'h4a5;
      expv[41] = 12'h0a5;
      expv[42] = 12'h8ee;
      expv[43] = 12'h0e6;
      expv[44] = 12'h0e2;
      expv[45] = 12'h10c;
      expv[46] = 12'h004;
      expv[47] = 12'h260;
      expv[48] = 12'h06c;
      expv[49] = 12'h06c;
      expv[50] = 12'h06c;
      expv[51] = 12'h4a9;
      expv[52] = 12'h0a5;
      expv[53] = 12'h0ad;
      expv[54] = 12'h0a1;
      expv[55] = 12'h03c;
      expv[56] = 12'h03c;
      expv[57] = 12'h104;
      expv[58] = 12'h008;
      expv[59] = 12'h260;
      expv[60] = 12'h06c;
      expv[61] = 12'h4a1;
      expv[62] = 12'h0a1;
      expv[63] = 12'h8ea;
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
