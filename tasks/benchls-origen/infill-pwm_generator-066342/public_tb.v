// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_066342 dut (
    .IN_CLOCK(clk),
    .IN_RESET(in_vec[11:11]),
    .IN_ENABLE(in_vec[10:10]),
    .IN_FILL_FACTOR(in_vec[9:0]),
    .OUT_PWM_SIGNAL(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hbef;
    stim[1] = 12'hedd;
    stim[2] = 12'h237;
    stim[3] = 12'h126;
    stim[4] = 12'h3c5;
    stim[5] = 12'h063;
    stim[6] = 12'h439;
    stim[7] = 12'h64d;
    stim[8] = 12'h0dd;
    stim[9] = 12'h768;
    stim[10] = 12'h5cc;
    stim[11] = 12'h183;
    stim[12] = 12'h10c;
    stim[13] = 12'h6d7;
    stim[14] = 12'h3af;
    stim[15] = 12'h2fd;
    stim[16] = 12'h077;
    stim[17] = 12'h5d9;
    stim[18] = 12'h482;
    stim[19] = 12'h16a;
    stim[20] = 12'h75f;
    stim[21] = 12'h24b;
    stim[22] = 12'h226;
    stim[23] = 12'h7ba;
    stim[24] = 12'h5bd;
    stim[25] = 12'h183;
    stim[26] = 12'h7c7;
    stim[27] = 12'h44b;
    stim[28] = 12'h4f7;
    stim[29] = 12'h798;
    stim[30] = 12'h644;
    stim[31] = 12'h348;
    stim[32] = 12'h337;
    stim[33] = 12'h60f;
    stim[34] = 12'h7f1;
    stim[35] = 12'h431;
    stim[36] = 12'h528;
    stim[37] = 12'h466;
    stim[38] = 12'h5cf;
    stim[39] = 12'h02a;
    stim[40] = 12'h6be;
    stim[41] = 12'h00f;
    stim[42] = 12'h33f;
    stim[43] = 12'h525;
    stim[44] = 12'h01a;
    stim[45] = 12'h4d7;
    stim[46] = 12'h2a0;
    stim[47] = 12'h73f;
    stim[48] = 12'h15d;
    stim[49] = 12'h326;
    stim[50] = 12'h519;
    stim[51] = 12'h208;
    stim[52] = 12'h43b;
    stim[53] = 12'he61;
    stim[54] = 12'h0d5;
    stim[55] = 12'h1af;
    stim[56] = 12'h597;
    stim[57] = 12'h642;
    stim[58] = 12'h109;
    stim[59] = 12'h2b9;
    stim[60] = 12'h423;
    stim[61] = 12'h59c;
    stim[62] = 12'h669;
    stim[63] = 12'h701;
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
      expv[0] = 1'hx;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h0;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h1;
      expv[45] = 1'h0;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h0;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
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
