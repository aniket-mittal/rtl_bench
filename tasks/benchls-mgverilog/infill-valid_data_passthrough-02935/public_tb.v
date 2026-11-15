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

  mg_02935 dut (
    .vz(in_vec[8:8]),
    .z(in_vec[7:0]),
    .vd(out_vec[8:8]),
    .d(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h002;
    stim[1] = 9'h18d;
    stim[2] = 9'h054;
    stim[3] = 9'h1fc;
    stim[4] = 9'h0e7;
    stim[5] = 9'h19c;
    stim[6] = 9'h050;
    stim[7] = 9'h086;
    stim[8] = 9'h09d;
    stim[9] = 9'h165;
    stim[10] = 9'h1e9;
    stim[11] = 9'h11b;
    stim[12] = 9'h043;
    stim[13] = 9'h0d7;
    stim[14] = 9'h1f2;
    stim[15] = 9'h001;
    stim[16] = 9'h1af;
    stim[17] = 9'h1fa;
    stim[18] = 9'h038;
    stim[19] = 9'h029;
    stim[20] = 9'h062;
    stim[21] = 9'h08e;
    stim[22] = 9'h159;
    stim[23] = 9'h1e8;
    stim[24] = 9'h197;
    stim[25] = 9'h19f;
    stim[26] = 9'h0d3;
    stim[27] = 9'h1e8;
    stim[28] = 9'h05b;
    stim[29] = 9'h010;
    stim[30] = 9'h086;
    stim[31] = 9'h0f5;
    stim[32] = 9'h197;
    stim[33] = 9'h07c;
    stim[34] = 9'h17f;
    stim[35] = 9'h132;
    stim[36] = 9'h1b0;
    stim[37] = 9'h1dd;
    stim[38] = 9'h1f0;
    stim[39] = 9'h09e;
    stim[40] = 9'h157;
    stim[41] = 9'h1b0;
    stim[42] = 9'h00f;
    stim[43] = 9'h1ed;
    stim[44] = 9'h14d;
    stim[45] = 9'h056;
    stim[46] = 9'h056;
    stim[47] = 9'h095;
    stim[48] = 9'h1e3;
    stim[49] = 9'h02f;
    stim[50] = 9'h172;
    stim[51] = 9'h0ea;
    stim[52] = 9'h0bb;
    stim[53] = 9'h1c4;
    stim[54] = 9'h057;
    stim[55] = 9'h1d3;
    stim[56] = 9'h093;
    stim[57] = 9'h111;
    stim[58] = 9'h146;
    stim[59] = 9'h103;
    stim[60] = 9'h1b2;
    stim[61] = 9'h134;
    stim[62] = 9'h02c;
    stim[63] = 9'h1b9;
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
      expv[0] = 9'h002;
      expv[1] = 9'h18d;
      expv[2] = 9'h054;
      expv[3] = 9'h1fc;
      expv[4] = 9'h0e7;
      expv[5] = 9'h19c;
      expv[6] = 9'h050;
      expv[7] = 9'h086;
      expv[8] = 9'h09d;
      expv[9] = 9'h165;
      expv[10] = 9'h1e9;
      expv[11] = 9'h11b;
      expv[12] = 9'h043;
      expv[13] = 9'h0d7;
      expv[14] = 9'h1f2;
      expv[15] = 9'h001;
      expv[16] = 9'h1af;
      expv[17] = 9'h1fa;
      expv[18] = 9'h038;
      expv[19] = 9'h029;
      expv[20] = 9'h062;
      expv[21] = 9'h08e;
      expv[22] = 9'h159;
      expv[23] = 9'h1e8;
      expv[24] = 9'h197;
      expv[25] = 9'h19f;
      expv[26] = 9'h0d3;
      expv[27] = 9'h1e8;
      expv[28] = 9'h05b;
      expv[29] = 9'h010;
      expv[30] = 9'h086;
      expv[31] = 9'h0f5;
      expv[32] = 9'h197;
      expv[33] = 9'h07c;
      expv[34] = 9'h17f;
      expv[35] = 9'h132;
      expv[36] = 9'h1b0;
      expv[37] = 9'h1dd;
      expv[38] = 9'h1f0;
      expv[39] = 9'h09e;
      expv[40] = 9'h157;
      expv[41] = 9'h1b0;
      expv[42] = 9'h00f;
      expv[43] = 9'h1ed;
      expv[44] = 9'h14d;
      expv[45] = 9'h056;
      expv[46] = 9'h056;
      expv[47] = 9'h095;
      expv[48] = 9'h1e3;
      expv[49] = 9'h02f;
      expv[50] = 9'h172;
      expv[51] = 9'h0ea;
      expv[52] = 9'h0bb;
      expv[53] = 9'h1c4;
      expv[54] = 9'h057;
      expv[55] = 9'h1d3;
      expv[56] = 9'h093;
      expv[57] = 9'h111;
      expv[58] = 9'h146;
      expv[59] = 9'h103;
      expv[60] = 9'h1b2;
      expv[61] = 9'h134;
      expv[62] = 9'h02c;
      expv[63] = 9'h1b9;
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
