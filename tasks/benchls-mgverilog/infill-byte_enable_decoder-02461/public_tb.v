// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02461 dut (
    .byte_access(in_vec[13:13]),
    .hw(in_vec[12:12]),
    .word(in_vec[11:11]),
    .write_address(in_vec[10:0]),
    .write_byteenable(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3c47;
    stim[1] = 14'h3824;
    stim[2] = 14'h1c45;
    stim[3] = 14'h3e41;
    stim[4] = 14'h3e4b;
    stim[5] = 14'h3791;
    stim[6] = 14'h0b01;
    stim[7] = 14'h22c0;
    stim[8] = 14'h173a;
    stim[9] = 14'h385c;
    stim[10] = 14'h305f;
    stim[11] = 14'h2750;
    stim[12] = 14'h215d;
    stim[13] = 14'h3982;
    stim[14] = 14'h28f0;
    stim[15] = 14'h2e40;
    stim[16] = 14'h2fcb;
    stim[17] = 14'h0220;
    stim[18] = 14'h1034;
    stim[19] = 14'h26cf;
    stim[20] = 14'h1f33;
    stim[21] = 14'h2f12;
    stim[22] = 14'h3977;
    stim[23] = 14'h1ad2;
    stim[24] = 14'h1278;
    stim[25] = 14'h072a;
    stim[26] = 14'h1088;
    stim[27] = 14'h3e33;
    stim[28] = 14'h23af;
    stim[29] = 14'h0216;
    stim[30] = 14'h1ad5;
    stim[31] = 14'h17dd;
    stim[32] = 14'h2a5f;
    stim[33] = 14'h05f8;
    stim[34] = 14'h1c7d;
    stim[35] = 14'h0150;
    stim[36] = 14'h3434;
    stim[37] = 14'h26c3;
    stim[38] = 14'h0d55;
    stim[39] = 14'h1d8c;
    stim[40] = 14'h006b;
    stim[41] = 14'h3ba1;
    stim[42] = 14'h223e;
    stim[43] = 14'h3980;
    stim[44] = 14'h18a8;
    stim[45] = 14'h138b;
    stim[46] = 14'h10a0;
    stim[47] = 14'h0855;
    stim[48] = 14'h2837;
    stim[49] = 14'h1426;
    stim[50] = 14'h260b;
    stim[51] = 14'h088c;
    stim[52] = 14'h20d6;
    stim[53] = 14'h0555;
    stim[54] = 14'h2f1a;
    stim[55] = 14'h0a5e;
    stim[56] = 14'h16f7;
    stim[57] = 14'h1e61;
    stim[58] = 14'h339f;
    stim[59] = 14'h00e5;
    stim[60] = 14'h197a;
    stim[61] = 14'h26fd;
    stim[62] = 14'h1748;
    stim[63] = 14'h077b;
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
      expv[0] = 4'hf;
      expv[1] = 4'hf;
      expv[2] = 4'hf;
      expv[3] = 4'hf;
      expv[4] = 4'hf;
      expv[5] = 4'h3;
      expv[6] = 4'hf;
      expv[7] = 4'h1;
      expv[8] = 4'hc;
      expv[9] = 4'hf;
      expv[10] = 4'hc;
      expv[11] = 4'h1;
      expv[12] = 4'h2;
      expv[13] = 4'hf;
      expv[14] = 4'hf;
      expv[15] = 4'hf;
      expv[16] = 4'hf;
      expv[17] = 4'h0;
      expv[18] = 4'h3;
      expv[19] = 4'h8;
      expv[20] = 4'hf;
      expv[21] = 4'hf;
      expv[22] = 4'hf;
      expv[23] = 4'hf;
      expv[24] = 4'h3;
      expv[25] = 4'h0;
      expv[26] = 4'h3;
      expv[27] = 4'hf;
      expv[28] = 4'h8;
      expv[29] = 4'h0;
      expv[30] = 4'hf;
      expv[31] = 4'h3;
      expv[32] = 4'hf;
      expv[33] = 4'h0;
      expv[34] = 4'hf;
      expv[35] = 4'h0;
      expv[36] = 4'h3;
      expv[37] = 4'h8;
      expv[38] = 4'hf;
      expv[39] = 4'hf;
      expv[40] = 4'h0;
      expv[41] = 4'hf;
      expv[42] = 4'h4;
      expv[43] = 4'hf;
      expv[44] = 4'hf;
      expv[45] = 4'hc;
      expv[46] = 4'h3;
      expv[47] = 4'hf;
      expv[48] = 4'hf;
      expv[49] = 4'hc;
      expv[50] = 4'h8;
      expv[51] = 4'hf;
      expv[52] = 4'h4;
      expv[53] = 4'h0;
      expv[54] = 4'hf;
      expv[55] = 4'hf;
      expv[56] = 4'hc;
      expv[57] = 4'hf;
      expv[58] = 4'hc;
      expv[59] = 4'h0;
      expv[60] = 4'hf;
      expv[61] = 4'h2;
      expv[62] = 4'h3;
      expv[63] = 4'h0;
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
