// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_145392 dut (
    .op(in_vec[12:7]),
    .func(in_vec[6:1]),
    .z(in_vec[0:0]),
    .wreg(out_vec[4:4]),
    .regrt(out_vec[3:3]),
    .jal(out_vec[2:2]),
    .pcsource(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0721;
    stim[1] = 13'h04e1;
    stim[2] = 13'h186c;
    stim[3] = 13'h16be;
    stim[4] = 13'h17dc;
    stim[5] = 13'h0378;
    stim[6] = 13'h110e;
    stim[7] = 13'h0251;
    stim[8] = 13'h1079;
    stim[9] = 13'h0fe2;
    stim[10] = 13'h1aaa;
    stim[11] = 13'h0929;
    stim[12] = 13'h1eea;
    stim[13] = 13'h0422;
    stim[14] = 13'h0e71;
    stim[15] = 13'h0e58;
    stim[16] = 13'h0e58;
    stim[17] = 13'h0fb2;
    stim[18] = 13'h0244;
    stim[19] = 13'h14e7;
    stim[20] = 13'h0dad;
    stim[21] = 13'h0042;
    stim[22] = 13'h1b54;
    stim[23] = 13'h1592;
    stim[24] = 13'h07c7;
    stim[25] = 13'h03ae;
    stim[26] = 13'h0d30;
    stim[27] = 13'h10c2;
    stim[28] = 13'h12ee;
    stim[29] = 13'h0e0c;
    stim[30] = 13'h1d7d;
    stim[31] = 13'h0636;
    stim[32] = 13'h1c88;
    stim[33] = 13'h1f49;
    stim[34] = 13'h05e3;
    stim[35] = 13'h1f65;
    stim[36] = 13'h0d0a;
    stim[37] = 13'h188d;
    stim[38] = 13'h0851;
    stim[39] = 13'h0aea;
    stim[40] = 13'h149c;
    stim[41] = 13'h1b26;
    stim[42] = 13'h1eba;
    stim[43] = 13'h037a;
    stim[44] = 13'h1f30;
    stim[45] = 13'h0665;
    stim[46] = 13'h0b2b;
    stim[47] = 13'h0dc5;
    stim[48] = 13'h08a2;
    stim[49] = 13'h1204;
    stim[50] = 13'h11a4;
    stim[51] = 13'h04c0;
    stim[52] = 13'h0057;
    stim[53] = 13'h02fc;
    stim[54] = 13'h05b3;
    stim[55] = 13'h0a09;
    stim[56] = 13'h0a11;
    stim[57] = 13'h15aa;
    stim[58] = 13'h1bd4;
    stim[59] = 13'h0db2;
    stim[60] = 13'h14b4;
    stim[61] = 13'h09e5;
    stim[62] = 13'h0a65;
    stim[63] = 13'h0168;
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
      expv[0] = 5'h18;
      expv[1] = 5'h18;
      expv[2] = 5'h18;
      expv[3] = 5'h18;
      expv[4] = 5'h18;
      expv[5] = 5'h18;
      expv[6] = 5'h18;
      expv[7] = 5'h01;
      expv[8] = 5'h18;
      expv[9] = 5'h18;
      expv[10] = 5'h18;
      expv[11] = 5'h18;
      expv[12] = 5'h18;
      expv[13] = 5'h18;
      expv[14] = 5'h18;
      expv[15] = 5'h18;
      expv[16] = 5'h18;
      expv[17] = 5'h18;
      expv[18] = 5'h00;
      expv[19] = 5'h18;
      expv[20] = 5'h18;
      expv[21] = 5'h10;
      expv[22] = 5'h18;
      expv[23] = 5'h08;
      expv[24] = 5'h18;
      expv[25] = 5'h18;
      expv[26] = 5'h18;
      expv[27] = 5'h18;
      expv[28] = 5'h18;
      expv[29] = 5'h18;
      expv[30] = 5'h18;
      expv[31] = 5'h18;
      expv[32] = 5'h18;
      expv[33] = 5'h18;
      expv[34] = 5'h18;
      expv[35] = 5'h18;
      expv[36] = 5'h18;
      expv[37] = 5'h18;
      expv[38] = 5'h18;
      expv[39] = 5'h18;
      expv[40] = 5'h18;
      expv[41] = 5'h18;
      expv[42] = 5'h18;
      expv[43] = 5'h18;
      expv[44] = 5'h18;
      expv[45] = 5'h18;
      expv[46] = 5'h18;
      expv[47] = 5'h18;
      expv[48] = 5'h18;
      expv[49] = 5'h18;
      expv[50] = 5'h18;
      expv[51] = 5'h18;
      expv[52] = 5'h10;
      expv[53] = 5'h01;
      expv[54] = 5'h18;
      expv[55] = 5'h18;
      expv[56] = 5'h18;
      expv[57] = 5'h08;
      expv[58] = 5'h18;
      expv[59] = 5'h18;
      expv[60] = 5'h18;
      expv[61] = 5'h18;
      expv[62] = 5'h18;
      expv[63] = 5'h02;
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
