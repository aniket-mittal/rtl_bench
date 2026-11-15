// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_064409 dut (
    .clk(clk),
    .datain(in_vec[16:1]),
    .areset(in_vec[0:0]),
    .datasync_r(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0a6c1;
    stim[1] = 17'h1070b;
    stim[2] = 17'h14936;
    stim[3] = 17'h0aa58;
    stim[4] = 17'h10586;
    stim[5] = 17'h05ef0;
    stim[6] = 17'h16288;
    stim[7] = 17'h02140;
    stim[8] = 17'h1c312;
    stim[9] = 17'h008e0;
    stim[10] = 17'h07c90;
    stim[11] = 17'h17caa;
    stim[12] = 17'h0283c;
    stim[13] = 17'h0a2b6;
    stim[14] = 17'h121da;
    stim[15] = 17'h16db6;
    stim[16] = 17'h07508;
    stim[17] = 17'h0daa0;
    stim[18] = 17'h0350c;
    stim[19] = 17'h14f62;
    stim[20] = 17'h10c8c;
    stim[21] = 17'h0810a;
    stim[22] = 17'h117ec;
    stim[23] = 17'h126e2;
    stim[24] = 17'h17b76;
    stim[25] = 17'h1eb6a;
    stim[26] = 17'h1694c;
    stim[27] = 17'h0613e;
    stim[28] = 17'h12440;
    stim[29] = 17'h0658a;
    stim[30] = 17'h15d6c;
    stim[31] = 17'h0b288;
    stim[32] = 17'h1d70a;
    stim[33] = 17'h09b26;
    stim[34] = 17'h17d38;
    stim[35] = 17'h187c6;
    stim[36] = 17'h190b0;
    stim[37] = 17'h1901a;
    stim[38] = 17'h1485c;
    stim[39] = 17'h0c32e;
    stim[40] = 17'h05b2e;
    stim[41] = 17'h0fbdc;
    stim[42] = 17'h00a3e;
    stim[43] = 17'h106d0;
    stim[44] = 17'h04114;
    stim[45] = 17'h0a112;
    stim[46] = 17'h19b16;
    stim[47] = 17'h13e82;
    stim[48] = 17'h072d4;
    stim[49] = 17'h149a4;
    stim[50] = 17'h1aa5a;
    stim[51] = 17'h0195e;
    stim[52] = 17'h1adc8;
    stim[53] = 17'h19de2;
    stim[54] = 17'h1d6f0;
    stim[55] = 17'h1c64c;
    stim[56] = 17'h1fa8a;
    stim[57] = 17'h0d0fa;
    stim[58] = 17'h14cc0;
    stim[59] = 17'h06bce;
    stim[60] = 17'h1027e;
    stim[61] = 17'h0c9b2;
    stim[62] = 17'h07a78;
    stim[63] = 17'h0b206;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
