// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_186199 dut (
    .s_clk(clk),
    .s_rst_n(in_vec[9:9]),
    .tx_data(in_vec[8:1]),
    .tx_trig(in_vec[0:0]),
    .rs232_tx(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h11f;
    stim[1] = 10'h1d7;
    stim[2] = 10'h22e;
    stim[3] = 10'h37f;
    stim[4] = 10'h34d;
    stim[5] = 10'h231;
    stim[6] = 10'h312;
    stim[7] = 10'h27f;
    stim[8] = 10'h28b;
    stim[9] = 10'h253;
    stim[10] = 10'h3a6;
    stim[11] = 10'h3a1;
    stim[12] = 10'h3e8;
    stim[13] = 10'h3fc;
    stim[14] = 10'h37f;
    stim[15] = 10'h3ac;
    stim[16] = 10'h390;
    stim[17] = 10'h36a;
    stim[18] = 10'h24a;
    stim[19] = 10'h3ef;
    stim[20] = 10'h2fc;
    stim[21] = 10'h3d2;
    stim[22] = 10'h3bb;
    stim[23] = 10'h3f9;
    stim[24] = 10'h265;
    stim[25] = 10'h312;
    stim[26] = 10'h276;
    stim[27] = 10'h16d;
    stim[28] = 10'h2c4;
    stim[29] = 10'h066;
    stim[30] = 10'h220;
    stim[31] = 10'h3b1;
    stim[32] = 10'h3b0;
    stim[33] = 10'h288;
    stim[34] = 10'h2dc;
    stim[35] = 10'h32a;
    stim[36] = 10'h2ee;
    stim[37] = 10'h2da;
    stim[38] = 10'h338;
    stim[39] = 10'h286;
    stim[40] = 10'h247;
    stim[41] = 10'h353;
    stim[42] = 10'h320;
    stim[43] = 10'h2bc;
    stim[44] = 10'h2cb;
    stim[45] = 10'h214;
    stim[46] = 10'h301;
    stim[47] = 10'h2bc;
    stim[48] = 10'h25b;
    stim[49] = 10'h3f5;
    stim[50] = 10'h362;
    stim[51] = 10'h38d;
    stim[52] = 10'h239;
    stim[53] = 10'h2c4;
    stim[54] = 10'h2e8;
    stim[55] = 10'h201;
    stim[56] = 10'h2da;
    stim[57] = 10'h39d;
    stim[58] = 10'h22a;
    stim[59] = 10'h2d5;
    stim[60] = 10'h339;
    stim[61] = 10'h2b0;
    stim[62] = 10'h3d7;
    stim[63] = 10'h34a;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
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
