// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 26;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05723 dut (
    .clk_i(clk),
    .rst_i(in_vec[24:24]),
    .timer_control(in_vec[23:16]),
    .timer_limit(in_vec[15:0]),
    .timer_status(out_vec[25:18]),
    .timer_count(out_vec[17:2]),
    .timer_disable(out_vec[1:1]),
    .int_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h115a9e7;
    stim[1] = 25'h11a196c;
    stim[2] = 25'h0037906;
    stim[3] = 25'h06cbb2a;
    stim[4] = 25'h07a9f74;
    stim[5] = 25'h0f0e195;
    stim[6] = 25'h0d6bd0c;
    stim[7] = 25'h07ed768;
    stim[8] = 25'h0a6cb1f;
    stim[9] = 25'h0e072aa;
    stim[10] = 25'h016e5fb;
    stim[11] = 25'h0d8e777;
    stim[12] = 25'h0104942;
    stim[13] = 25'h04fd56c;
    stim[14] = 25'h004ab87;
    stim[15] = 25'h0c05218;
    stim[16] = 25'h01e0c45;
    stim[17] = 25'h010dd61;
    stim[18] = 25'h0d4a4f4;
    stim[19] = 25'h09a5b80;
    stim[20] = 25'h08b2286;
    stim[21] = 25'h012d544;
    stim[22] = 25'h070e967;
    stim[23] = 25'h0812824;
    stim[24] = 25'h0fa8c8e;
    stim[25] = 25'h05ba064;
    stim[26] = 25'h018dacb;
    stim[27] = 25'h0154bf0;
    stim[28] = 25'h00cb98d;
    stim[29] = 25'h04fb5c7;
    stim[30] = 25'h0b499e1;
    stim[31] = 25'h02df752;
    stim[32] = 25'h0330493;
    stim[33] = 25'h0ea73ba;
    stim[34] = 25'h0a3a39c;
    stim[35] = 25'h0ea97d3;
    stim[36] = 25'h0c7ceec;
    stim[37] = 25'h0d9d4d8;
    stim[38] = 25'h09d7dcf;
    stim[39] = 25'h0e90a92;
    stim[40] = 25'h1e8f54b;
    stim[41] = 25'h0b219c4;
    stim[42] = 25'h055d842;
    stim[43] = 25'h0f59255;
    stim[44] = 25'h0a55ae7;
    stim[45] = 25'h0ad9547;
    stim[46] = 25'h0be45f7;
    stim[47] = 25'h0eac929;
    stim[48] = 25'h06ac038;
    stim[49] = 25'h08aff9f;
    stim[50] = 25'h0d704d0;
    stim[51] = 25'h0c144d2;
    stim[52] = 25'h0b35273;
    stim[53] = 25'h0c57fab;
    stim[54] = 25'h0f211f1;
    stim[55] = 25'h01090ab;
    stim[56] = 25'h19e803d;
    stim[57] = 25'h077ab44;
    stim[58] = 25'h0efb429;
    stim[59] = 25'h03e3ea8;
    stim[60] = 25'h07e7e59;
    stim[61] = 25'h0d85668;
    stim[62] = 25'h09775a3;
    stim[63] = 25'h01174f2;
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
      expv[0] = 26'hxxxxxxx;
      expv[1] = 26'h0000000;
      expv[2] = 26'h0000000;
      expv[3] = 26'h0000000;
      expv[4] = 26'h0000000;
      expv[5] = 26'h0000000;
      expv[6] = 26'h0000004;
      expv[7] = 26'h0000004;
      expv[8] = 26'h0000000;
      expv[9] = 26'h0000000;
      expv[10] = 26'h0000004;
      expv[11] = 26'h0000000;
      expv[12] = 26'h0000004;
      expv[13] = 26'h0000000;
      expv[14] = 26'h0000000;
      expv[15] = 26'h0000000;
      expv[16] = 26'h0000004;
      expv[17] = 26'h0000000;
      expv[18] = 26'h0000000;
      expv[19] = 26'h0000000;
      expv[20] = 26'h0000000;
      expv[21] = 26'h0000000;
      expv[22] = 26'h0000000;
      expv[23] = 26'h0000000;
      expv[24] = 26'h0000000;
      expv[25] = 26'h0000000;
      expv[26] = 26'h0000000;
      expv[27] = 26'h0000000;
      expv[28] = 26'h0000000;
      expv[29] = 26'h0000000;
      expv[30] = 26'h0000000;
      expv[31] = 26'h0000000;
      expv[32] = 26'h0000000;
      expv[33] = 26'h0000000;
      expv[34] = 26'h0000000;
      expv[35] = 26'h0000000;
      expv[36] = 26'h0000004;
      expv[37] = 26'h0000004;
      expv[38] = 26'h0000008;
      expv[39] = 26'h0000008;
      expv[40] = 26'h000000c;
      expv[41] = 26'h0000000;
      expv[42] = 26'h0000000;
      expv[43] = 26'h0000000;
      expv[44] = 26'h0000000;
      expv[45] = 26'h0000000;
      expv[46] = 26'h0000000;
      expv[47] = 26'h0000000;
      expv[48] = 26'h0000004;
      expv[49] = 26'h0000000;
      expv[50] = 26'h0000000;
      expv[51] = 26'h0000000;
      expv[52] = 26'h0000004;
      expv[53] = 26'h0000004;
      expv[54] = 26'h0000004;
      expv[55] = 26'h0000008;
      expv[56] = 26'h0000000;
      expv[57] = 26'h0000000;
      expv[58] = 26'h0000000;
      expv[59] = 26'h0000000;
      expv[60] = 26'h0000000;
      expv[61] = 26'h0000000;
      expv[62] = 26'h0000004;
      expv[63] = 26'h0000004;
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
