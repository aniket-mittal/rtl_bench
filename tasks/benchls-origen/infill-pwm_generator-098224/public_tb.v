// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_098224 dut (
    .clk(clk),
    .rst_n(in_vec[12:12]),
    .wrt(in_vec[11:11]),
    .SPEED(in_vec[10:0]),
    .PWM(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0e77;
    stim[1] = 13'h0ae3;
    stim[2] = 13'h1c9e;
    stim[3] = 13'h1ea8;
    stim[4] = 13'h1a64;
    stim[5] = 13'h1420;
    stim[6] = 13'h12fd;
    stim[7] = 13'h1f0b;
    stim[8] = 13'h1813;
    stim[9] = 13'h1d6c;
    stim[10] = 13'h1ae2;
    stim[11] = 13'h0488;
    stim[12] = 13'h1ff5;
    stim[13] = 13'h1950;
    stim[14] = 13'h1fa3;
    stim[15] = 13'h19dd;
    stim[16] = 13'h1f35;
    stim[17] = 13'h1ba6;
    stim[18] = 13'h1f78;
    stim[19] = 13'h1c26;
    stim[20] = 13'h1c1a;
    stim[21] = 13'h1dea;
    stim[22] = 13'h1be2;
    stim[23] = 13'h1a50;
    stim[24] = 13'h17f1;
    stim[25] = 13'h1b43;
    stim[26] = 13'h11c8;
    stim[27] = 13'h1416;
    stim[28] = 13'h138e;
    stim[29] = 13'h1fbc;
    stim[30] = 13'h1625;
    stim[31] = 13'h1b63;
    stim[32] = 13'h1768;
    stim[33] = 13'h1f7e;
    stim[34] = 13'h1c1d;
    stim[35] = 13'h1282;
    stim[36] = 13'h1ec5;
    stim[37] = 13'h1e9d;
    stim[38] = 13'h10f3;
    stim[39] = 13'h1d21;
    stim[40] = 13'h1638;
    stim[41] = 13'h1ca2;
    stim[42] = 13'h1a86;
    stim[43] = 13'h1a7c;
    stim[44] = 13'h12ce;
    stim[45] = 13'h1c37;
    stim[46] = 13'h128f;
    stim[47] = 13'h19bd;
    stim[48] = 13'h1029;
    stim[49] = 13'h1cf3;
    stim[50] = 13'h119c;
    stim[51] = 13'h1cb6;
    stim[52] = 13'h192f;
    stim[53] = 13'h102a;
    stim[54] = 13'h1af1;
    stim[55] = 13'h0e26;
    stim[56] = 13'h192c;
    stim[57] = 13'h180d;
    stim[58] = 13'h1c4f;
    stim[59] = 13'h1e34;
    stim[60] = 13'h1dee;
    stim[61] = 13'h10f3;
    stim[62] = 13'h1c24;
    stim[63] = 13'h15dc;
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
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
