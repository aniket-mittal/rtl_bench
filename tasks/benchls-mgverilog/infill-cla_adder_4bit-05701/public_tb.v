// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05701 dut (
    .A(in_vec[8:5]),
    .B(in_vec[4:1]),
    .C_in(in_vec[0:0]),
    .out(out_vec[5:2]),
    .carry_out(out_vec[1:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h016;
    stim[1] = 9'h122;
    stim[2] = 9'h0ca;
    stim[3] = 9'h052;
    stim[4] = 9'h064;
    stim[5] = 9'h1da;
    stim[6] = 9'h005;
    stim[7] = 9'h012;
    stim[8] = 9'h004;
    stim[9] = 9'h1f8;
    stim[10] = 9'h109;
    stim[11] = 9'h1c4;
    stim[12] = 9'h05b;
    stim[13] = 9'h098;
    stim[14] = 9'h161;
    stim[15] = 9'h03f;
    stim[16] = 9'h0d1;
    stim[17] = 9'h073;
    stim[18] = 9'h0de;
    stim[19] = 9'h12a;
    stim[20] = 9'h092;
    stim[21] = 9'h143;
    stim[22] = 9'h06b;
    stim[23] = 9'h018;
    stim[24] = 9'h12d;
    stim[25] = 9'h0eb;
    stim[26] = 9'h04e;
    stim[27] = 9'h012;
    stim[28] = 9'h0b3;
    stim[29] = 9'h1dc;
    stim[30] = 9'h073;
    stim[31] = 9'h15a;
    stim[32] = 9'h01f;
    stim[33] = 9'h1e5;
    stim[34] = 9'h105;
    stim[35] = 9'h0a2;
    stim[36] = 9'h127;
    stim[37] = 9'h143;
    stim[38] = 9'h019;
    stim[39] = 9'h053;
    stim[40] = 9'h1c2;
    stim[41] = 9'h182;
    stim[42] = 9'h091;
    stim[43] = 9'h0f0;
    stim[44] = 9'h18b;
    stim[45] = 9'h08b;
    stim[46] = 9'h118;
    stim[47] = 9'h1fc;
    stim[48] = 9'h055;
    stim[49] = 9'h1a9;
    stim[50] = 9'h12b;
    stim[51] = 9'h093;
    stim[52] = 9'h1c0;
    stim[53] = 9'h109;
    stim[54] = 9'h0a1;
    stim[55] = 9'h068;
    stim[56] = 9'h1fe;
    stim[57] = 9'h03f;
    stim[58] = 9'h19e;
    stim[59] = 9'h13f;
    stim[60] = 9'h0a9;
    stim[61] = 9'h0f1;
    stim[62] = 9'h13a;
    stim[63] = 9'h087;
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
      expv[0] = 6'h2c;
      expv[1] = 6'h28;
      expv[2] = 6'h2d;
      expv[3] = 6'h2c;
      expv[4] = 6'h14;
      expv[5] = 6'h2e;
      expv[6] = 6'h0c;
      expv[7] = 6'h24;
      expv[8] = 6'h08;
      expv[9] = 6'h2e;
      expv[10] = 6'h34;
      expv[11] = 6'h02;
      expv[12] = 6'h02;
      expv[13] = 6'h02;
      expv[14] = 6'h30;
      expv[15] = 6'h06;
      expv[16] = 6'h3c;
      expv[17] = 6'h34;
      expv[18] = 6'h16;
      expv[19] = 6'h38;
      expv[20] = 6'h34;
      expv[21] = 6'h30;
      expv[22] = 6'h25;
      expv[23] = 6'h30;
      expv[24] = 6'h02;
      expv[25] = 6'h35;
      expv[26] = 6'h25;
      expv[27] = 6'h24;
      expv[28] = 6'h3c;
      expv[29] = 6'h32;
      expv[30] = 6'h34;
      expv[31] = 6'h1f;
      expv[32] = 6'h02;
      expv[33] = 6'h0a;
      expv[34] = 6'h2c;
      expv[35] = 6'h18;
      expv[36] = 6'h34;
      expv[37] = 6'h30;
      expv[38] = 6'h34;
      expv[39] = 6'h30;
      expv[40] = 6'h3c;
      expv[41] = 6'h34;
      expv[42] = 6'h34;
      expv[43] = 6'h3c;
      expv[44] = 6'h0a;
      expv[45] = 6'h29;
      expv[46] = 6'h13;
      expv[47] = 6'h36;
      expv[48] = 6'h34;
      expv[49] = 6'h0a;
      expv[50] = 6'h3c;
      expv[51] = 6'h38;
      expv[52] = 6'h38;
      expv[53] = 6'h34;
      expv[54] = 6'h18;
      expv[55] = 6'h1c;
      expv[56] = 6'h3a;
      expv[57] = 6'h06;
      expv[58] = 6'h2e;
      expv[59] = 6'h26;
      expv[60] = 6'h29;
      expv[61] = 6'h02;
      expv[62] = 6'h1b;
      expv[63] = 6'h21;
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
