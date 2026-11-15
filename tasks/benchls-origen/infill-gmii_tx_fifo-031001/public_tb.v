// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_031001 dut (
    .clk_gmii_2x(clk),
    .mac_clk_tx(in_vec[11:11]),
    .resetn_tx(in_vec[10:10]),
    .gmii_mode(in_vec[9:9]),
    .txd_in(in_vec[8:1]),
    .txen_in(in_vec[0:0]),
    .txd_out(out_vec[9:2]),
    .txen_out(out_vec[1:1]),
    .txer_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hce3;
    stim[1] = 12'h6dd;
    stim[2] = 12'h90b;
    stim[3] = 12'ha38;
    stim[4] = 12'h346;
    stim[5] = 12'h3fc;
    stim[6] = 12'hb37;
    stim[7] = 12'h892;
    stim[8] = 12'ha6c;
    stim[9] = 12'h394;
    stim[10] = 12'h303;
    stim[11] = 12'h90f;
    stim[12] = 12'h825;
    stim[13] = 12'h0c5;
    stim[14] = 12'h9f0;
    stim[15] = 12'hb1e;
    stim[16] = 12'h8d5;
    stim[17] = 12'hb81;
    stim[18] = 12'hb4b;
    stim[19] = 12'h802;
    stim[20] = 12'hb87;
    stim[21] = 12'ha39;
    stim[22] = 12'h3da;
    stim[23] = 12'h917;
    stim[24] = 12'h01a;
    stim[25] = 12'h81b;
    stim[26] = 12'hb6c;
    stim[27] = 12'h986;
    stim[28] = 12'h26c;
    stim[29] = 12'ha90;
    stim[30] = 12'h006;
    stim[31] = 12'h099;
    stim[32] = 12'hb0b;
    stim[33] = 12'h0eb;
    stim[34] = 12'h2ed;
    stim[35] = 12'h0a0;
    stim[36] = 12'h2e1;
    stim[37] = 12'hb30;
    stim[38] = 12'h275;
    stim[39] = 12'h2fe;
    stim[40] = 12'h276;
    stim[41] = 12'h888;
    stim[42] = 12'h334;
    stim[43] = 12'h95b;
    stim[44] = 12'h983;
    stim[45] = 12'h992;
    stim[46] = 12'ha31;
    stim[47] = 12'hb31;
    stim[48] = 12'h2e0;
    stim[49] = 12'h154;
    stim[50] = 12'hb93;
    stim[51] = 12'hb8d;
    stim[52] = 12'h842;
    stim[53] = 12'h2e8;
    stim[54] = 12'ha1f;
    stim[55] = 12'h1aa;
    stim[56] = 12'h9ca;
    stim[57] = 12'h896;
    stim[58] = 12'ha90;
    stim[59] = 12'h8a2;
    stim[60] = 12'h1d7;
    stim[61] = 12'ha6f;
    stim[62] = 12'hb95;
    stim[63] = 12'h297;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h000;
      expv[2] = 10'h1ba;
      expv[3] = 10'h000;
      expv[4] = 10'h070;
      expv[5] = 10'h28c;
      expv[6] = 10'h3f8;
      expv[7] = 10'h26e;
      expv[8] = 10'h000;
      expv[9] = 10'h0d8;
      expv[10] = 10'h328;
      expv[11] = 10'h206;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h23c;
      expv[17] = 10'h000;
      expv[18] = 10'h302;
      expv[19] = 10'h296;
      expv[20] = 10'h000;
      expv[21] = 10'h30e;
      expv[22] = 10'h072;
      expv[23] = 10'h3b4;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h2d8;
      expv[28] = 10'h000;
      expv[29] = 10'h0d8;
      expv[30] = 10'h120;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h216;
      expv[34] = 10'h000;
      expv[35] = 10'h1da;
      expv[36] = 10'h000;
      expv[37] = 10'h1c2;
      expv[38] = 10'h260;
      expv[39] = 10'h0ea;
      expv[40] = 10'h1fc;
      expv[41] = 10'h0ec;
      expv[42] = 10'h000;
      expv[43] = 10'h268;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h062;
      expv[48] = 10'h262;
      expv[49] = 10'h1c0;
      expv[50] = 10'h000;
      expv[51] = 10'h326;
      expv[52] = 10'h31a;
      expv[53] = 10'h000;
      expv[54] = 10'h1d0;
      expv[55] = 10'h03e;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h120;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h0de;
      expv[63] = 10'h32a;
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
