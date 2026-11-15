// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_109049 dut (
    .clk_enabled(clk),
    .Top(in_vec[16:1]),
    .KEY(in_vec[0:0]),
    .GPIO_2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h095c6;
    stim[1] = 17'h099ce;
    stim[2] = 17'h1123b;
    stim[3] = 17'h03d3b;
    stim[4] = 17'h15653;
    stim[5] = 17'h12faf;
    stim[6] = 17'h1bc15;
    stim[7] = 17'h15731;
    stim[8] = 17'h030cd;
    stim[9] = 17'h0834d;
    stim[10] = 17'h05df3;
    stim[11] = 17'h01283;
    stim[12] = 17'h18cbd;
    stim[13] = 17'h0d119;
    stim[14] = 17'h15ae1;
    stim[15] = 17'h18793;
    stim[16] = 17'h1c217;
    stim[17] = 17'h1fd4b;
    stim[18] = 17'h0639d;
    stim[19] = 17'h1e505;
    stim[20] = 17'h13e01;
    stim[21] = 17'h18ac7;
    stim[22] = 17'h16903;
    stim[23] = 17'h17ef5;
    stim[24] = 17'h16c09;
    stim[25] = 17'h0dac5;
    stim[26] = 17'h03aa1;
    stim[27] = 17'h016d3;
    stim[28] = 17'h1a57d;
    stim[29] = 17'h094b9;
    stim[30] = 17'h14085;
    stim[31] = 17'h1d01d;
    stim[32] = 17'h1c4ed;
    stim[33] = 17'h1ef47;
    stim[34] = 17'h0fbc9;
    stim[35] = 17'h18b19;
    stim[36] = 17'h182ef;
    stim[37] = 17'h1f491;
    stim[38] = 17'h065b3;
    stim[39] = 17'h11b8b;
    stim[40] = 17'h0d777;
    stim[41] = 17'h10711;
    stim[42] = 17'h0f84f;
    stim[43] = 17'h0d8d7;
    stim[44] = 17'h107c5;
    stim[45] = 17'h1dbcb;
    stim[46] = 17'h1aa99;
    stim[47] = 17'h1a233;
    stim[48] = 17'h11343;
    stim[49] = 17'h1da01;
    stim[50] = 17'h170d6;
    stim[51] = 17'h035c7;
    stim[52] = 17'h0dc57;
    stim[53] = 17'h12225;
    stim[54] = 17'h1d863;
    stim[55] = 17'h1b59f;
    stim[56] = 17'h0d22f;
    stim[57] = 17'h1c2c7;
    stim[58] = 17'h05e49;
    stim[59] = 17'h025b3;
    stim[60] = 17'h17f7d;
    stim[61] = 17'h11017;
    stim[62] = 17'h1002b;
    stim[63] = 17'h15d75;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
