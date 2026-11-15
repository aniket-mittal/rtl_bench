// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08497 dut (
    .clock(clk),
    .multiplicand(in_vec[8:5]),
    .multiplier(in_vec[4:1]),
    .start(in_vec[0:0]),
    .product(out_vec[8:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h089;
    stim[1] = 9'h1c7;
    stim[2] = 9'h172;
    stim[3] = 9'h0b2;
    stim[4] = 9'h076;
    stim[5] = 9'h072;
    stim[6] = 9'h111;
    stim[7] = 9'h088;
    stim[8] = 9'h06c;
    stim[9] = 9'h0c0;
    stim[10] = 9'h12e;
    stim[11] = 9'h168;
    stim[12] = 9'h130;
    stim[13] = 9'h1d0;
    stim[14] = 9'h1bc;
    stim[15] = 9'h1a6;
    stim[16] = 9'h1f8;
    stim[17] = 9'h050;
    stim[18] = 9'h006;
    stim[19] = 9'h09e;
    stim[20] = 9'h1d4;
    stim[21] = 9'h044;
    stim[22] = 9'h084;
    stim[23] = 9'h0ec;
    stim[24] = 9'h032;
    stim[25] = 9'h110;
    stim[26] = 9'h024;
    stim[27] = 9'h066;
    stim[28] = 9'h130;
    stim[29] = 9'h0e8;
    stim[30] = 9'h002;
    stim[31] = 9'h04a;
    stim[32] = 9'h132;
    stim[33] = 9'h196;
    stim[34] = 9'h0e8;
    stim[35] = 9'h10e;
    stim[36] = 9'h094;
    stim[37] = 9'h042;
    stim[38] = 9'h108;
    stim[39] = 9'h1c6;
    stim[40] = 9'h064;
    stim[41] = 9'h0f2;
    stim[42] = 9'h112;
    stim[43] = 9'h066;
    stim[44] = 9'h1be;
    stim[45] = 9'h19e;
    stim[46] = 9'h070;
    stim[47] = 9'h0cc;
    stim[48] = 9'h1ae;
    stim[49] = 9'h08e;
    stim[50] = 9'h012;
    stim[51] = 9'h104;
    stim[52] = 9'h05a;
    stim[53] = 9'h096;
    stim[54] = 9'h04e;
    stim[55] = 9'h0fc;
    stim[56] = 9'h0ec;
    stim[57] = 9'h0f8;
    stim[58] = 9'h0b4;
    stim[59] = 9'h10c;
    stim[60] = 9'h12a;
    stim[61] = 9'h1f6;
    stim[62] = 9'h198;
    stim[63] = 9'h0d4;
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
      expv[0] = 9'h1ff;
      expv[1] = 9'h1ff;
      expv[2] = 9'h1ff;
      expv[3] = 9'h1ff;
      expv[4] = 9'h1ff;
      expv[5] = 9'h1ff;
      expv[6] = 9'h1ff;
      expv[7] = 9'h1ff;
      expv[8] = 9'h1ff;
      expv[9] = 9'h1ff;
      expv[10] = 9'h1ff;
      expv[11] = 9'h1ff;
      expv[12] = 9'h180;
      expv[13] = 9'h180;
      expv[14] = 9'h180;
      expv[15] = 9'h180;
      expv[16] = 9'h180;
      expv[17] = 9'h180;
      expv[18] = 9'h180;
      expv[19] = 9'h180;
      expv[20] = 9'h180;
      expv[21] = 9'h180;
      expv[22] = 9'h180;
      expv[23] = 9'h180;
      expv[24] = 9'h180;
      expv[25] = 9'h180;
      expv[26] = 9'h180;
      expv[27] = 9'h180;
      expv[28] = 9'h180;
      expv[29] = 9'h180;
      expv[30] = 9'h180;
      expv[31] = 9'h180;
      expv[32] = 9'h180;
      expv[33] = 9'h180;
      expv[34] = 9'h180;
      expv[35] = 9'h180;
      expv[36] = 9'h180;
      expv[37] = 9'h180;
      expv[38] = 9'h180;
      expv[39] = 9'h180;
      expv[40] = 9'h180;
      expv[41] = 9'h180;
      expv[42] = 9'h180;
      expv[43] = 9'h180;
      expv[44] = 9'h180;
      expv[45] = 9'h180;
      expv[46] = 9'h180;
      expv[47] = 9'h180;
      expv[48] = 9'h180;
      expv[49] = 9'h180;
      expv[50] = 9'h180;
      expv[51] = 9'h180;
      expv[52] = 9'h180;
      expv[53] = 9'h180;
      expv[54] = 9'h180;
      expv[55] = 9'h180;
      expv[56] = 9'h180;
      expv[57] = 9'h180;
      expv[58] = 9'h180;
      expv[59] = 9'h180;
      expv[60] = 9'h180;
      expv[61] = 9'h180;
      expv[62] = 9'h180;
      expv[63] = 9'h180;
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
