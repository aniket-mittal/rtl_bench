// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[5:3]),
    .b(in_vec[2:0]),
    .out_or_bitwise(out_vec[9:7]),
    .out_or_logical(out_vec[6:6]),
    .out_not(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h0c;
    stim[1] = 6'h16;
    stim[2] = 6'h1b;
    stim[3] = 6'h17;
    stim[4] = 6'h0b;
    stim[5] = 6'h16;
    stim[6] = 6'h32;
    stim[7] = 6'h33;
    stim[8] = 6'h30;
    stim[9] = 6'h06;
    stim[10] = 6'h2f;
    stim[11] = 6'h3a;
    stim[12] = 6'h3b;
    stim[13] = 6'h2d;
    stim[14] = 6'h14;
    stim[15] = 6'h33;
    stim[16] = 6'h17;
    stim[17] = 6'h00;
    stim[18] = 6'h21;
    stim[19] = 6'h37;
    stim[20] = 6'h31;
    stim[21] = 6'h3d;
    stim[22] = 6'h23;
    stim[23] = 6'h1d;
    stim[24] = 6'h19;
    stim[25] = 6'h0a;
    stim[26] = 6'h2d;
    stim[27] = 6'h1c;
    stim[28] = 6'h08;
    stim[29] = 6'h24;
    stim[30] = 6'h0f;
    stim[31] = 6'h19;
    stim[32] = 6'h1a;
    stim[33] = 6'h2a;
    stim[34] = 6'h37;
    stim[35] = 6'h10;
    stim[36] = 6'h13;
    stim[37] = 6'h13;
    stim[38] = 6'h2a;
    stim[39] = 6'h36;
    stim[40] = 6'h12;
    stim[41] = 6'h2f;
    stim[42] = 6'h2b;
    stim[43] = 6'h10;
    stim[44] = 6'h1a;
    stim[45] = 6'h21;
    stim[46] = 6'h15;
    stim[47] = 6'h04;
    stim[48] = 6'h29;
    stim[49] = 6'h35;
    stim[50] = 6'h04;
    stim[51] = 6'h07;
    stim[52] = 6'h1b;
    stim[53] = 6'h0e;
    stim[54] = 6'h31;
    stim[55] = 6'h13;
    stim[56] = 6'h08;
    stim[57] = 6'h09;
    stim[58] = 6'h2f;
    stim[59] = 6'h30;
    stim[60] = 6'h05;
    stim[61] = 6'h09;
    stim[62] = 6'h3e;
    stim[63] = 6'h0f;
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
      expv[0] = 10'h2de;
      expv[1] = 10'h34d;
      expv[2] = 10'h1e4;
      expv[3] = 10'h3c5;
      expv[4] = 10'h1e6;
      expv[5] = 10'h34d;
      expv[6] = 10'h369;
      expv[7] = 10'h3e1;
      expv[8] = 10'h339;
      expv[9] = 10'h30f;
      expv[10] = 10'h3c2;
      expv[11] = 10'h3e8;
      expv[12] = 10'h3e0;
      expv[13] = 10'h2d2;
      expv[14] = 10'h35d;
      expv[15] = 10'h3e1;
      expv[16] = 10'h3c5;
      expv[17] = 10'h03f;
      expv[18] = 10'h2f3;
      expv[19] = 10'h3c1;
      expv[20] = 10'h3f1;
      expv[21] = 10'h3d0;
      expv[22] = 10'h3e3;
      expv[23] = 10'h3d4;
      expv[24] = 10'h1f4;
      expv[25] = 10'h1ee;
      expv[26] = 10'h2d2;
      expv[27] = 10'h3dc;
      expv[28] = 10'h0be;
      expv[29] = 10'h25b;
      expv[30] = 10'h3c6;
      expv[31] = 10'h1f4;
      expv[32] = 10'h1ec;
      expv[33] = 10'h3ea;
      expv[34] = 10'h3c1;
      expv[35] = 10'h13d;
      expv[36] = 10'h1e5;
      expv[37] = 10'h1e5;
      expv[38] = 10'h3ea;
      expv[39] = 10'h349;
      expv[40] = 10'h16d;
      expv[41] = 10'h3c2;
      expv[42] = 10'h3e2;
      expv[43] = 10'h13d;
      expv[44] = 10'h1ec;
      expv[45] = 10'h2f3;
      expv[46] = 10'h3d5;
      expv[47] = 10'h21f;
      expv[48] = 10'h2f2;
      expv[49] = 10'h3d1;
      expv[50] = 10'h21f;
      expv[51] = 10'h387;
      expv[52] = 10'h1e4;
      expv[53] = 10'h3ce;
      expv[54] = 10'h3f1;
      expv[55] = 10'h1e5;
      expv[56] = 10'h0be;
      expv[57] = 10'h0f6;
      expv[58] = 10'h3c2;
      expv[59] = 10'h339;
      expv[60] = 10'h297;
      expv[61] = 10'h0f6;
      expv[62] = 10'h3c8;
      expv[63] = 10'h3c6;
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
