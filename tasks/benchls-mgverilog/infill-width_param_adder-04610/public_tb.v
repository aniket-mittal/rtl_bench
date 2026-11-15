// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04610 dut (
    .a(in_vec[12:7]),
    .b(in_vec[6:1]),
    .cin(in_vec[0:0]),
    .o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h094c;
    stim[1] = 13'h08fe;
    stim[2] = 13'h0ffa;
    stim[3] = 13'h036a;
    stim[4] = 13'h11f5;
    stim[5] = 13'h1b3a;
    stim[6] = 13'h0854;
    stim[7] = 13'h0763;
    stim[8] = 13'h19d6;
    stim[9] = 13'h11e4;
    stim[10] = 13'h1bc4;
    stim[11] = 13'h0073;
    stim[12] = 13'h0afe;
    stim[13] = 13'h08ff;
    stim[14] = 13'h1cba;
    stim[15] = 13'h1c9f;
    stim[16] = 13'h0318;
    stim[17] = 13'h1a94;
    stim[18] = 13'h1746;
    stim[19] = 13'h155e;
    stim[20] = 13'h1ed2;
    stim[21] = 13'h1a02;
    stim[22] = 13'h0f08;
    stim[23] = 13'h0d88;
    stim[24] = 13'h037e;
    stim[25] = 13'h061c;
    stim[26] = 13'h0390;
    stim[27] = 13'h0cb1;
    stim[28] = 13'h0cb4;
    stim[29] = 13'h0151;
    stim[30] = 13'h1efd;
    stim[31] = 13'h135d;
    stim[32] = 13'h00a8;
    stim[33] = 13'h0c2a;
    stim[34] = 13'h0d58;
    stim[35] = 13'h098b;
    stim[36] = 13'h1f90;
    stim[37] = 13'h01ec;
    stim[38] = 13'h1f49;
    stim[39] = 13'h00bc;
    stim[40] = 13'h1a62;
    stim[41] = 13'h1a45;
    stim[42] = 13'h06f7;
    stim[43] = 13'h1dff;
    stim[44] = 13'h17cf;
    stim[45] = 13'h1f0e;
    stim[46] = 13'h1986;
    stim[47] = 13'h1edf;
    stim[48] = 13'h04d4;
    stim[49] = 13'h13b1;
    stim[50] = 13'h1df2;
    stim[51] = 13'h1be6;
    stim[52] = 13'h1e08;
    stim[53] = 13'h1547;
    stim[54] = 13'h064e;
    stim[55] = 13'h0ad6;
    stim[56] = 13'h1878;
    stim[57] = 13'h1182;
    stim[58] = 13'h0850;
    stim[59] = 13'h13da;
    stim[60] = 13'h0b87;
    stim[61] = 13'h0a10;
    stim[62] = 13'h0161;
    stim[63] = 13'h0350;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h0;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h1;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
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
