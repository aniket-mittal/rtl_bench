// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_017339 dut (
    .clk(clk),
    .reset(in_vec[6:6]),
    .digito(in_vec[5:1]),
    .cambio_digito(in_vec[0:0]),
    .u(out_vec[15:11]),
    .d(out_vec[10:6]),
    .c(out_vec[5:1]),
    .RGB_full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h50;
    stim[1] = 7'h64;
    stim[2] = 7'h09;
    stim[3] = 7'h34;
    stim[4] = 7'h21;
    stim[5] = 7'h26;
    stim[6] = 7'h19;
    stim[7] = 7'h32;
    stim[8] = 7'h20;
    stim[9] = 7'h3c;
    stim[10] = 7'h0d;
    stim[11] = 7'h31;
    stim[12] = 7'h03;
    stim[13] = 7'h0e;
    stim[14] = 7'h25;
    stim[15] = 7'h10;
    stim[16] = 7'h02;
    stim[17] = 7'h26;
    stim[18] = 7'h7d;
    stim[19] = 7'h10;
    stim[20] = 7'h08;
    stim[21] = 7'h6d;
    stim[22] = 7'h21;
    stim[23] = 7'h16;
    stim[24] = 7'h32;
    stim[25] = 7'h00;
    stim[26] = 7'h1a;
    stim[27] = 7'h20;
    stim[28] = 7'h09;
    stim[29] = 7'h24;
    stim[30] = 7'h25;
    stim[31] = 7'h0c;
    stim[32] = 7'h3b;
    stim[33] = 7'h6a;
    stim[34] = 7'h03;
    stim[35] = 7'h7d;
    stim[36] = 7'h18;
    stim[37] = 7'h31;
    stim[38] = 7'h24;
    stim[39] = 7'h12;
    stim[40] = 7'h27;
    stim[41] = 7'h2d;
    stim[42] = 7'h13;
    stim[43] = 7'h20;
    stim[44] = 7'h03;
    stim[45] = 7'h15;
    stim[46] = 7'h0f;
    stim[47] = 7'h25;
    stim[48] = 7'h0f;
    stim[49] = 7'h03;
    stim[50] = 7'h38;
    stim[51] = 7'h06;
    stim[52] = 7'h27;
    stim[53] = 7'h19;
    stim[54] = 7'h32;
    stim[55] = 7'h2b;
    stim[56] = 7'h1e;
    stim[57] = 7'h25;
    stim[58] = 7'h49;
    stim[59] = 7'h32;
    stim[60] = 7'h3f;
    stim[61] = 7'h35;
    stim[62] = 7'h2d;
    stim[63] = 7'h2d;
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
      expv[0] = 16'h8420;
      expv[1] = 16'h8420;
      expv[2] = 16'h8420;
      expv[3] = 16'h8420;
      expv[4] = 16'h8420;
      expv[5] = 16'h8420;
      expv[6] = 16'h8420;
      expv[7] = 16'h8420;
      expv[8] = 16'h8420;
      expv[9] = 16'h8420;
      expv[10] = 16'h8420;
      expv[11] = 16'h8420;
      expv[12] = 16'h8420;
      expv[13] = 16'h8420;
      expv[14] = 16'h8420;
      expv[15] = 16'h8420;
      expv[16] = 16'h8420;
      expv[17] = 16'h8420;
      expv[18] = 16'h8420;
      expv[19] = 16'h8420;
      expv[20] = 16'h8420;
      expv[21] = 16'h8420;
      expv[22] = 16'h8420;
      expv[23] = 16'h8420;
      expv[24] = 16'h8420;
      expv[25] = 16'h8420;
      expv[26] = 16'h8420;
      expv[27] = 16'h8420;
      expv[28] = 16'h8420;
      expv[29] = 16'h8420;
      expv[30] = 16'h8420;
      expv[31] = 16'h8420;
      expv[32] = 16'h8420;
      expv[33] = 16'h8420;
      expv[34] = 16'h8420;
      expv[35] = 16'h8420;
      expv[36] = 16'h8420;
      expv[37] = 16'h8420;
      expv[38] = 16'h8420;
      expv[39] = 16'h8420;
      expv[40] = 16'h8420;
      expv[41] = 16'h8420;
      expv[42] = 16'h8420;
      expv[43] = 16'h8420;
      expv[44] = 16'h8420;
      expv[45] = 16'h8420;
      expv[46] = 16'h8420;
      expv[47] = 16'h8420;
      expv[48] = 16'h8420;
      expv[49] = 16'h8420;
      expv[50] = 16'h8420;
      expv[51] = 16'h8420;
      expv[52] = 16'h8420;
      expv[53] = 16'h8420;
      expv[54] = 16'h8420;
      expv[55] = 16'h8420;
      expv[56] = 16'h8420;
      expv[57] = 16'h8420;
      expv[58] = 16'h8420;
      expv[59] = 16'h8420;
      expv[60] = 16'h8420;
      expv[61] = 16'h8420;
      expv[62] = 16'h8420;
      expv[63] = 16'h8420;
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
