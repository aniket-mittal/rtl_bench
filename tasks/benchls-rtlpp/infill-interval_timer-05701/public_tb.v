// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05701 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h147da0;
    stim[1] = 22'h24bb04;
    stim[2] = 22'h0bb594;
    stim[3] = 22'h06eb31;
    stim[4] = 22'h3be8a0;
    stim[5] = 22'h0eb44c;
    stim[6] = 22'h2ee482;
    stim[7] = 22'h37f314;
    stim[8] = 22'h2b061e;
    stim[9] = 22'h12ecac;
    stim[10] = 22'h139ef3;
    stim[11] = 22'h335dbc;
    stim[12] = 22'h3fb512;
    stim[13] = 22'h0f4e06;
    stim[14] = 22'h2ad0c9;
    stim[15] = 22'h2f27b7;
    stim[16] = 22'h1fa3bc;
    stim[17] = 22'h23609b;
    stim[18] = 22'h2a65c5;
    stim[19] = 22'h1b9064;
    stim[20] = 22'h0719c2;
    stim[21] = 22'h0716d0;
    stim[22] = 22'h3b2751;
    stim[23] = 22'h162e65;
    stim[24] = 22'h0a44d2;
    stim[25] = 22'h124d98;
    stim[26] = 22'h16b70d;
    stim[27] = 22'h079214;
    stim[28] = 22'h1247ac;
    stim[29] = 22'h36847b;
    stim[30] = 22'h023430;
    stim[31] = 22'h0b354f;
    stim[32] = 22'h27c594;
    stim[33] = 22'h1f8c2b;
    stim[34] = 22'h2ae314;
    stim[35] = 22'h02651b;
    stim[36] = 22'h2ae3fd;
    stim[37] = 22'h37c8e1;
    stim[38] = 22'h0faa9c;
    stim[39] = 22'h0fe129;
    stim[40] = 22'h325e20;
    stim[41] = 22'h13eb98;
    stim[42] = 22'h020901;
    stim[43] = 22'h0ae840;
    stim[44] = 22'h3e677e;
    stim[45] = 22'h127774;
    stim[46] = 22'h0272b8;
    stim[47] = 22'h12ae93;
    stim[48] = 22'h03a877;
    stim[49] = 22'h2b4db4;
    stim[50] = 22'h12d4aa;
    stim[51] = 22'h00f1c2;
    stim[52] = 22'h0e0e88;
    stim[53] = 22'h16b839;
    stim[54] = 22'h167faa;
    stim[55] = 22'h260699;
    stim[56] = 22'h3b0cd6;
    stim[57] = 22'h12755e;
    stim[58] = 22'h3f5e28;
    stim[59] = 22'h3a83f6;
    stim[60] = 22'h07249a;
    stim[61] = 22'h32f56a;
    stim[62] = 22'h0bbc49;
    stim[63] = 22'h0a8c8d;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h0c34f;
      expv[11] = 17'h0c34f;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h0000c;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h0c34f;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00002;
      expv[22] = 17'h00002;
      expv[23] = 17'h00000;
      expv[24] = 17'h0c34f;
      expv[25] = 17'h0000c;
      expv[26] = 17'h02e65;
      expv[27] = 17'h02e65;
      expv[28] = 17'h00000;
      expv[29] = 17'h0b70d;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h0000c;
      expv[33] = 17'h0c34f;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h0000c;
      expv[40] = 17'h0000c;
      expv[41] = 17'h00000;
      expv[42] = 17'h0b70d;
      expv[43] = 17'h00000;
      expv[44] = 17'h0000c;
      expv[45] = 17'h00000;
      expv[46] = 17'h0b70d;
      expv[47] = 17'h00000;
      expv[48] = 17'h0b70d;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h0c34f;
      expv[55] = 17'h0b839;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h07faa;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00008;
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
