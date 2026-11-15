// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_068656 dut (
    .digits(in_vec[4:0]),
    .HEX1(out_vec[13:7]),
    .HEX0(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1b;
    stim[1] = 5'h0f;
    stim[2] = 5'h01;
    stim[3] = 5'h1e;
    stim[4] = 5'h10;
    stim[5] = 5'h0b;
    stim[6] = 5'h1d;
    stim[7] = 5'h00;
    stim[8] = 5'h0f;
    stim[9] = 5'h0c;
    stim[10] = 5'h10;
    stim[11] = 5'h0b;
    stim[12] = 5'h19;
    stim[13] = 5'h1a;
    stim[14] = 5'h0b;
    stim[15] = 5'h0d;
    stim[16] = 5'h10;
    stim[17] = 5'h16;
    stim[18] = 5'h02;
    stim[19] = 5'h1b;
    stim[20] = 5'h03;
    stim[21] = 5'h13;
    stim[22] = 5'h14;
    stim[23] = 5'h18;
    stim[24] = 5'h16;
    stim[25] = 5'h18;
    stim[26] = 5'h13;
    stim[27] = 5'h17;
    stim[28] = 5'h1d;
    stim[29] = 5'h1f;
    stim[30] = 5'h17;
    stim[31] = 5'h0b;
    stim[32] = 5'h1d;
    stim[33] = 5'h01;
    stim[34] = 5'h09;
    stim[35] = 5'h03;
    stim[36] = 5'h11;
    stim[37] = 5'h19;
    stim[38] = 5'h0f;
    stim[39] = 5'h09;
    stim[40] = 5'h1b;
    stim[41] = 5'h07;
    stim[42] = 5'h01;
    stim[43] = 5'h10;
    stim[44] = 5'h08;
    stim[45] = 5'h09;
    stim[46] = 5'h02;
    stim[47] = 5'h17;
    stim[48] = 5'h0d;
    stim[49] = 5'h05;
    stim[50] = 5'h03;
    stim[51] = 5'h1d;
    stim[52] = 5'h1e;
    stim[53] = 5'h14;
    stim[54] = 5'h17;
    stim[55] = 5'h13;
    stim[56] = 5'h02;
    stim[57] = 5'h0a;
    stim[58] = 5'h03;
    stim[59] = 5'h06;
    stim[60] = 5'h05;
    stim[61] = 5'h0b;
    stim[62] = 5'h17;
    stim[63] = 5'h0a;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 14'h3c90;
      expv[1] = 14'h3c90;
      expv[2] = 14'h2079;
      expv[3] = 14'h3c80;
      expv[4] = 14'h3cc0;
      expv[5] = 14'h3c90;
      expv[6] = 14'h3c90;
      expv[7] = 14'h2040;
      expv[8] = 14'h3c90;
      expv[9] = 14'h3c80;
      expv[10] = 14'h3cc0;
      expv[11] = 14'h3c90;
      expv[12] = 14'h3c90;
      expv[13] = 14'h3c80;
      expv[14] = 14'h3c90;
      expv[15] = 14'h3c90;
      expv[16] = 14'h3cc0;
      expv[17] = 14'h3c82;
      expv[18] = 14'h2024;
      expv[19] = 14'h3c90;
      expv[20] = 14'h2030;
      expv[21] = 14'h3cb0;
      expv[22] = 14'h3c99;
      expv[23] = 14'h3c80;
      expv[24] = 14'h3c82;
      expv[25] = 14'h3c80;
      expv[26] = 14'h3cb0;
      expv[27] = 14'h3cf8;
      expv[28] = 14'h3c90;
      expv[29] = 14'h3c90;
      expv[30] = 14'h3cf8;
      expv[31] = 14'h3c90;
      expv[32] = 14'h3c90;
      expv[33] = 14'h2079;
      expv[34] = 14'h2010;
      expv[35] = 14'h2030;
      expv[36] = 14'h3cf9;
      expv[37] = 14'h3c90;
      expv[38] = 14'h3c90;
      expv[39] = 14'h2010;
      expv[40] = 14'h3c90;
      expv[41] = 14'h2078;
      expv[42] = 14'h2079;
      expv[43] = 14'h3cc0;
      expv[44] = 14'h2000;
      expv[45] = 14'h2010;
      expv[46] = 14'h2024;
      expv[47] = 14'h3cf8;
      expv[48] = 14'h3c90;
      expv[49] = 14'h2012;
      expv[50] = 14'h2030;
      expv[51] = 14'h3c90;
      expv[52] = 14'h3c80;
      expv[53] = 14'h3c99;
      expv[54] = 14'h3cf8;
      expv[55] = 14'h3cb0;
      expv[56] = 14'h2024;
      expv[57] = 14'h3c80;
      expv[58] = 14'h2030;
      expv[59] = 14'h2002;
      expv[60] = 14'h2012;
      expv[61] = 14'h3c90;
      expv[62] = 14'h3cf8;
      expv[63] = 14'h3c80;
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
