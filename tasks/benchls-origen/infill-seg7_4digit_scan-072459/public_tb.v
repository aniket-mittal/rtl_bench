// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_072459 dut (
    .clk(clk),
    .rst(in_vec[22:22]),
    .DEV_Add(in_vec[21:16]),
    .Input(in_vec[15:0]),
    .ds(out_vec[11:8]),
    .seg(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h493110;
    stim[1] = 23'h504985;
    stim[2] = 23'h0967c6;
    stim[3] = 23'h3388c6;
    stim[4] = 23'h334775;
    stim[5] = 23'h1cb731;
    stim[6] = 23'h1e42c3;
    stim[7] = 23'h2e2da1;
    stim[8] = 23'h1eff0f;
    stim[9] = 23'h3122ee;
    stim[10] = 23'h03cb1a;
    stim[11] = 23'h1edc3e;
    stim[12] = 23'h1c2fd5;
    stim[13] = 23'h39296d;
    stim[14] = 23'h0fa076;
    stim[15] = 23'h31c81c;
    stim[16] = 23'h335eff;
    stim[17] = 23'h2ff387;
    stim[18] = 23'h34de46;
    stim[19] = 23'h18f448;
    stim[20] = 23'h182962;
    stim[21] = 23'h3c21c4;
    stim[22] = 23'h20baa6;
    stim[23] = 23'h357516;
    stim[24] = 23'h151e23;
    stim[25] = 23'h2d3ee5;
    stim[26] = 23'h298723;
    stim[27] = 23'h29b569;
    stim[28] = 23'h0f455a;
    stim[29] = 23'h36edb3;
    stim[30] = 23'h06a94a;
    stim[31] = 23'h0594e0;
    stim[32] = 23'h02449b;
    stim[33] = 23'h39b3ce;
    stim[34] = 23'h17a877;
    stim[35] = 23'h1875ed;
    stim[36] = 23'h0e9be6;
    stim[37] = 23'h29bce0;
    stim[38] = 23'h182660;
    stim[39] = 23'h1d1e7e;
    stim[40] = 23'h235f82;
    stim[41] = 23'h0c7edc;
    stim[42] = 23'h36a078;
    stim[43] = 23'h272b04;
    stim[44] = 23'h256da4;
    stim[45] = 23'h2af930;
    stim[46] = 23'h00cd3f;
    stim[47] = 23'h1ac9d6;
    stim[48] = 23'h090c33;
    stim[49] = 23'h1bd8b5;
    stim[50] = 23'h125216;
    stim[51] = 23'h1c8b05;
    stim[52] = 23'h2b359a;
    stim[53] = 23'h2aaa86;
    stim[54] = 23'h36c856;
    stim[55] = 23'h29e368;
    stim[56] = 23'h1bac4d;
    stim[57] = 23'h058e18;
    stim[58] = 23'h254ef3;
    stim[59] = 23'h00eec1;
    stim[60] = 23'h0272c9;
    stim[61] = 23'h061186;
    stim[62] = 23'h2670b7;
    stim[63] = 23'h0fceb0;
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
      expv[0] = 12'h1fc;
      expv[1] = 12'h260;
      expv[2] = 12'h1be;
      expv[3] = 12'h1be;
      expv[4] = 12'h1be;
      expv[5] = 12'h1b6;
      expv[6] = 12'h160;
      expv[7] = 12'h1f2;
      expv[8] = 12'h160;
      expv[9] = 12'h18e;
      expv[10] = 12'h19e;
      expv[11] = 12'h1ee;
      expv[12] = 12'h19e;
      expv[13] = 12'h1b6;
      expv[14] = 12'h17a;
      expv[15] = 12'h1be;
      expv[16] = 12'h19c;
      expv[17] = 12'h18e;
      expv[18] = 12'h1e0;
      expv[19] = 12'h1be;
      expv[20] = 12'h1fe;
      expv[21] = 12'h1da;
      expv[22] = 12'h166;
      expv[23] = 12'h1be;
      expv[24] = 12'h1be;
      expv[25] = 12'h1f2;
      expv[26] = 12'h1b6;
      expv[27] = 12'h1f2;
      expv[28] = 12'h1f6;
      expv[29] = 12'h1ee;
      expv[30] = 12'h1f2;
      expv[31] = 12'h1ee;
      expv[32] = 12'h1fc;
      expv[33] = 12'h13e;
      expv[34] = 12'h19e;
      expv[35] = 12'h1e0;
      expv[36] = 12'h17a;
      expv[37] = 12'h1be;
      expv[38] = 12'h1fc;
      expv[39] = 12'h1fc;
      expv[40] = 12'h19e;
      expv[41] = 12'h1da;
      expv[42] = 12'h19c;
      expv[43] = 12'h1fe;
      expv[44] = 12'h166;
      expv[45] = 12'h166;
      expv[46] = 12'h1fc;
      expv[47] = 12'h18e;
      expv[48] = 12'h1be;
      expv[49] = 12'h1f2;
      expv[50] = 12'h1b6;
      expv[51] = 12'h1be;
      expv[52] = 12'h1b6;
      expv[53] = 12'h1ee;
      expv[54] = 12'h1be;
      expv[55] = 12'h1be;
      expv[56] = 12'h1fe;
      expv[57] = 12'h17a;
      expv[58] = 12'h1fe;
      expv[59] = 12'h1f2;
      expv[60] = 12'h160;
      expv[61] = 12'h1f6;
      expv[62] = 12'h1be;
      expv[63] = 12'h1e0;
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
