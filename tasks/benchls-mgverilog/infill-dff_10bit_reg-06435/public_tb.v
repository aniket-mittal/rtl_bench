// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06435 dut (
    .clk(clk),
    .d(in_vec[9:0]),
    .q(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h23c;
    stim[1] = 10'h063;
    stim[2] = 10'h097;
    stim[3] = 10'h126;
    stim[4] = 10'h07c;
    stim[5] = 10'h0f9;
    stim[6] = 10'h1a8;
    stim[7] = 10'h190;
    stim[8] = 10'h392;
    stim[9] = 10'h3c0;
    stim[10] = 10'h3c1;
    stim[11] = 10'h17d;
    stim[12] = 10'h3e1;
    stim[13] = 10'h1ec;
    stim[14] = 10'h06a;
    stim[15] = 10'h2ac;
    stim[16] = 10'h1b7;
    stim[17] = 10'h258;
    stim[18] = 10'h0b6;
    stim[19] = 10'h080;
    stim[20] = 10'h02f;
    stim[21] = 10'h1ed;
    stim[22] = 10'h1a7;
    stim[23] = 10'h211;
    stim[24] = 10'h186;
    stim[25] = 10'h0f5;
    stim[26] = 10'h02b;
    stim[27] = 10'h257;
    stim[28] = 10'h3d3;
    stim[29] = 10'h08c;
    stim[30] = 10'h36d;
    stim[31] = 10'h059;
    stim[32] = 10'h0fb;
    stim[33] = 10'h388;
    stim[34] = 10'h11b;
    stim[35] = 10'h1e9;
    stim[36] = 10'h339;
    stim[37] = 10'h1be;
    stim[38] = 10'h1bf;
    stim[39] = 10'h148;
    stim[40] = 10'h2e6;
    stim[41] = 10'h04d;
    stim[42] = 10'h38e;
    stim[43] = 10'h395;
    stim[44] = 10'h199;
    stim[45] = 10'h3dd;
    stim[46] = 10'h216;
    stim[47] = 10'h006;
    stim[48] = 10'h2a2;
    stim[49] = 10'h1e5;
    stim[50] = 10'h2b2;
    stim[51] = 10'h35c;
    stim[52] = 10'h342;
    stim[53] = 10'h100;
    stim[54] = 10'h369;
    stim[55] = 10'h0e5;
    stim[56] = 10'h208;
    stim[57] = 10'h3fa;
    stim[58] = 10'h008;
    stim[59] = 10'h3bc;
    stim[60] = 10'h140;
    stim[61] = 10'h2c7;
    stim[62] = 10'h35c;
    stim[63] = 10'h283;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h23c;
      expv[2] = 10'h063;
      expv[3] = 10'h097;
      expv[4] = 10'h126;
      expv[5] = 10'h07c;
      expv[6] = 10'h0f9;
      expv[7] = 10'h1a8;
      expv[8] = 10'h190;
      expv[9] = 10'h392;
      expv[10] = 10'h3c0;
      expv[11] = 10'h3c1;
      expv[12] = 10'h17d;
      expv[13] = 10'h3e1;
      expv[14] = 10'h1ec;
      expv[15] = 10'h06a;
      expv[16] = 10'h2ac;
      expv[17] = 10'h1b7;
      expv[18] = 10'h258;
      expv[19] = 10'h0b6;
      expv[20] = 10'h080;
      expv[21] = 10'h02f;
      expv[22] = 10'h1ed;
      expv[23] = 10'h1a7;
      expv[24] = 10'h211;
      expv[25] = 10'h186;
      expv[26] = 10'h0f5;
      expv[27] = 10'h02b;
      expv[28] = 10'h257;
      expv[29] = 10'h3d3;
      expv[30] = 10'h08c;
      expv[31] = 10'h36d;
      expv[32] = 10'h059;
      expv[33] = 10'h0fb;
      expv[34] = 10'h388;
      expv[35] = 10'h11b;
      expv[36] = 10'h1e9;
      expv[37] = 10'h339;
      expv[38] = 10'h1be;
      expv[39] = 10'h1bf;
      expv[40] = 10'h148;
      expv[41] = 10'h2e6;
      expv[42] = 10'h04d;
      expv[43] = 10'h38e;
      expv[44] = 10'h395;
      expv[45] = 10'h199;
      expv[46] = 10'h3dd;
      expv[47] = 10'h216;
      expv[48] = 10'h006;
      expv[49] = 10'h2a2;
      expv[50] = 10'h1e5;
      expv[51] = 10'h2b2;
      expv[52] = 10'h35c;
      expv[53] = 10'h342;
      expv[54] = 10'h100;
      expv[55] = 10'h369;
      expv[56] = 10'h0e5;
      expv[57] = 10'h208;
      expv[58] = 10'h3fa;
      expv[59] = 10'h008;
      expv[60] = 10'h3bc;
      expv[61] = 10'h140;
      expv[62] = 10'h2c7;
      expv[63] = 10'h35c;
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
