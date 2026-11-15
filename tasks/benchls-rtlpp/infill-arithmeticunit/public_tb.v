// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  arithmeticUnit dut (
    .x(in_vec[10:7]),
    .y(in_vec[6:3]),
    .select(in_vec[2:0]),
    .out(out_vec[4:1]),
    .c_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h31f;
    stim[1] = 11'h252;
    stim[2] = 11'h7de;
    stim[3] = 11'h4f1;
    stim[4] = 11'h7f8;
    stim[5] = 11'h260;
    stim[6] = 11'h654;
    stim[7] = 11'h6bb;
    stim[8] = 11'h69b;
    stim[9] = 11'h67b;
    stim[10] = 11'h097;
    stim[11] = 11'h761;
    stim[12] = 11'h3eb;
    stim[13] = 11'h377;
    stim[14] = 11'h544;
    stim[15] = 11'h4d7;
    stim[16] = 11'h42d;
    stim[17] = 11'h4c2;
    stim[18] = 11'h2f6;
    stim[19] = 11'h029;
    stim[20] = 11'h0d6;
    stim[21] = 11'h422;
    stim[22] = 11'h0be;
    stim[23] = 11'h776;
    stim[24] = 11'h576;
    stim[25] = 11'h3c3;
    stim[26] = 11'h2c1;
    stim[27] = 11'h15a;
    stim[28] = 11'h3d5;
    stim[29] = 11'h0ae;
    stim[30] = 11'h03b;
    stim[31] = 11'h30d;
    stim[32] = 11'h117;
    stim[33] = 11'h19f;
    stim[34] = 11'h562;
    stim[35] = 11'h26f;
    stim[36] = 11'h176;
    stim[37] = 11'h4c8;
    stim[38] = 11'h7a2;
    stim[39] = 11'h08d;
    stim[40] = 11'h5bf;
    stim[41] = 11'h335;
    stim[42] = 11'h4f3;
    stim[43] = 11'h7c1;
    stim[44] = 11'h642;
    stim[45] = 11'h3ee;
    stim[46] = 11'h105;
    stim[47] = 11'h5cb;
    stim[48] = 11'h551;
    stim[49] = 11'h578;
    stim[50] = 11'h6eb;
    stim[51] = 11'h298;
    stim[52] = 11'h14a;
    stim[53] = 11'h3b6;
    stim[54] = 11'h2f3;
    stim[55] = 11'h719;
    stim[56] = 11'h138;
    stim[57] = 11'h5b5;
    stim[58] = 11'h4a9;
    stim[59] = 11'h5f8;
    stim[60] = 11'h16b;
    stim[61] = 11'h7d0;
    stim[62] = 11'h359;
    stim[63] = 11'h421;
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
      expv[0] = 5'h0f;
      expv[1] = 5'h09;
      expv[2] = 5'h1e;
      expv[3] = 5'h03;
      expv[4] = 5'h14;
      expv[5] = 5'h01;
      expv[6] = 5'h18;
      expv[7] = 5'h0f;
      expv[8] = 5'h16;
      expv[9] = 5'h1b;
      expv[10] = 5'h16;
      expv[11] = 5'h14;
      expv[12] = 5'h0f;
      expv[13] = 5'h0f;
      expv[14] = 5'h0d;
      expv[15] = 5'h17;
      expv[16] = 5'h14;
      expv[17] = 5'h11;
      expv[18] = 5'h1a;
      expv[19] = 5'h01;
      expv[20] = 5'h0b;
      expv[21] = 5'h10;
      expv[22] = 5'h0b;
      expv[23] = 5'h1d;
      expv[24] = 5'h1c;
      expv[25] = 5'h0b;
      expv[26] = 5'h03;
      expv[27] = 5'h14;
      expv[28] = 5'h0e;
      expv[29] = 5'h0b;
      expv[30] = 5'h0a;
      expv[31] = 5'h1c;
      expv[32] = 5'h16;
      expv[33] = 5'h0f;
      expv[34] = 5'h18;
      expv[35] = 5'h1a;
      expv[36] = 5'h0d;
      expv[37] = 5'h10;
      expv[38] = 5'h0d;
      expv[39] = 5'h0b;
      expv[40] = 5'h1e;
      expv[41] = 5'h0b;
      expv[42] = 5'h1a;
      expv[43] = 5'h0b;
      expv[44] = 5'h11;
      expv[45] = 5'h0f;
      expv[46] = 5'h16;
      expv[47] = 5'h16;
      expv[48] = 5'h05;
      expv[49] = 5'h10;
      expv[50] = 5'h1b;
      expv[51] = 5'h08;
      expv[52] = 5'h05;
      expv[53] = 5'h0f;
      expv[54] = 5'h1a;
      expv[55] = 5'h14;
      expv[56] = 5'h01;
      expv[57] = 5'h16;
      expv[58] = 5'h03;
      expv[59] = 5'h05;
      expv[60] = 5'h0b;
      expv[61] = 5'h14;
      expv[62] = 5'h05;
      expv[63] = 5'h10;
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
