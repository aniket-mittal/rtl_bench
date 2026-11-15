// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07974 dut (
    .clk(clk),
    .data_in(in_vec[10:3]),
    .push(in_vec[2:2]),
    .pop(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .data_out(out_vec[9:2]),
    .empty(out_vec[1:1]),
    .full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h309;
    stim[1] = 11'h3c9;
    stim[2] = 11'h076;
    stim[3] = 11'h4fa;
    stim[4] = 11'h544;
    stim[5] = 11'h160;
    stim[6] = 11'h0b8;
    stim[7] = 11'h284;
    stim[8] = 11'h7f6;
    stim[9] = 11'h00c;
    stim[10] = 11'h076;
    stim[11] = 11'h710;
    stim[12] = 11'h204;
    stim[13] = 11'h770;
    stim[14] = 11'h7ac;
    stim[15] = 11'h71c;
    stim[16] = 11'h384;
    stim[17] = 11'h49c;
    stim[18] = 11'h3ea;
    stim[19] = 11'h602;
    stim[20] = 11'h2dc;
    stim[21] = 11'h006;
    stim[22] = 11'h260;
    stim[23] = 11'h3fc;
    stim[24] = 11'h180;
    stim[25] = 11'h3ea;
    stim[26] = 11'h514;
    stim[27] = 11'h6da;
    stim[28] = 11'h254;
    stim[29] = 11'h7fe;
    stim[30] = 11'h15e;
    stim[31] = 11'h080;
    stim[32] = 11'h452;
    stim[33] = 11'h5e0;
    stim[34] = 11'h232;
    stim[35] = 11'h606;
    stim[36] = 11'h3e6;
    stim[37] = 11'h450;
    stim[38] = 11'h63c;
    stim[39] = 11'h39a;
    stim[40] = 11'h7a8;
    stim[41] = 11'h434;
    stim[42] = 11'h6b8;
    stim[43] = 11'h534;
    stim[44] = 11'h2b4;
    stim[45] = 11'h1ea;
    stim[46] = 11'h2bc;
    stim[47] = 11'h550;
    stim[48] = 11'h58a;
    stim[49] = 11'h220;
    stim[50] = 11'h626;
    stim[51] = 11'h714;
    stim[52] = 11'h2a4;
    stim[53] = 11'h54c;
    stim[54] = 11'h204;
    stim[55] = 11'h706;
    stim[56] = 11'h4fc;
    stim[57] = 11'h1d2;
    stim[58] = 11'h7da;
    stim[59] = 11'h26e;
    stim[60] = 11'h642;
    stim[61] = 11'h41e;
    stim[62] = 11'h570;
    stim[63] = 11'h1f0;
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
      expv[0] = 10'h002;
      expv[1] = 10'h002;
      expv[2] = 10'h002;
      expv[3] = 10'h002;
      expv[4] = 10'h002;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h2a2;
      expv[20] = 10'h2a2;
      expv[21] = 10'h2a0;
      expv[22] = 10'h2a0;
      expv[23] = 10'h2a0;
      expv[24] = 10'h2a1;
      expv[25] = 10'h2a1;
      expv[26] = 10'h1fc;
      expv[27] = 10'h1fd;
      expv[28] = 10'h288;
      expv[29] = 10'h289;
      expv[30] = 10'h289;
      expv[31] = 10'h289;
      expv[32] = 10'h289;
      expv[33] = 10'h128;
      expv[34] = 10'h128;
      expv[35] = 10'h3d6;
      expv[36] = 10'h3d6;
      expv[37] = 10'h3d6;
      expv[38] = 10'h3d6;
      expv[39] = 10'h3d4;
      expv[40] = 10'h38e;
      expv[41] = 10'h38e;
      expv[42] = 10'h38c;
      expv[43] = 10'h38c;
      expv[44] = 10'h38d;
      expv[45] = 10'h38d;
      expv[46] = 10'h298;
      expv[47] = 10'h299;
      expv[48] = 10'h299;
      expv[49] = 10'h15c;
      expv[50] = 10'h15c;
      expv[51] = 10'h15c;
      expv[52] = 10'h15d;
      expv[53] = 10'h15d;
      expv[54] = 10'h15d;
      expv[55] = 10'h15d;
      expv[56] = 10'h15d;
      expv[57] = 10'h15d;
      expv[58] = 10'h388;
      expv[59] = 10'h1fe;
      expv[60] = 10'h1fe;
      expv[61] = 10'h1fe;
      expv[62] = 10'h1fe;
      expv[63] = 10'h1fe;
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
