// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_113000 dut (
    .clk(clk),
    .data_in(in_vec[10:1]),
    .load(in_vec[0:0]),
    .dac_sdi(out_vec[3:3]),
    .dac_cs(out_vec[2:2]),
    .dac_sck(out_vec[1:1]),
    .dac_ld(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h400;
    stim[1] = 11'h1ff;
    stim[2] = 11'h5bf;
    stim[3] = 11'h54a;
    stim[4] = 11'h1af;
    stim[5] = 11'h7bc;
    stim[6] = 11'h6eb;
    stim[7] = 11'h39c;
    stim[8] = 11'h32e;
    stim[9] = 11'h6cd;
    stim[10] = 11'h45b;
    stim[11] = 11'h1ff;
    stim[12] = 11'h526;
    stim[13] = 11'h488;
    stim[14] = 11'h37b;
    stim[15] = 11'h420;
    stim[16] = 11'h544;
    stim[17] = 11'h12e;
    stim[18] = 11'h1d1;
    stim[19] = 11'h61b;
    stim[20] = 11'h502;
    stim[21] = 11'h0f1;
    stim[22] = 11'h0d9;
    stim[23] = 11'h3f3;
    stim[24] = 11'h1d0;
    stim[25] = 11'h72f;
    stim[26] = 11'h6ca;
    stim[27] = 11'h0f0;
    stim[28] = 11'h1e0;
    stim[29] = 11'h316;
    stim[30] = 11'h15b;
    stim[31] = 11'h16e;
    stim[32] = 11'h3c1;
    stim[33] = 11'h0df;
    stim[34] = 11'h155;
    stim[35] = 11'h427;
    stim[36] = 11'h30f;
    stim[37] = 11'h35c;
    stim[38] = 11'h204;
    stim[39] = 11'h256;
    stim[40] = 11'h513;
    stim[41] = 11'h065;
    stim[42] = 11'h6f6;
    stim[43] = 11'h51f;
    stim[44] = 11'h0eb;
    stim[45] = 11'h2a5;
    stim[46] = 11'h3ba;
    stim[47] = 11'h4a6;
    stim[48] = 11'h33d;
    stim[49] = 11'h7f0;
    stim[50] = 11'h474;
    stim[51] = 11'h204;
    stim[52] = 11'h74f;
    stim[53] = 11'h440;
    stim[54] = 11'h073;
    stim[55] = 11'h32a;
    stim[56] = 11'h58d;
    stim[57] = 11'h644;
    stim[58] = 11'h213;
    stim[59] = 11'h673;
    stim[60] = 11'h2c3;
    stim[61] = 11'h773;
    stim[62] = 11'h582;
    stim[63] = 11'h4da;
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
      expv[0] = 4'h4;
      expv[1] = 4'h5;
      expv[2] = 4'h5;
      expv[3] = 4'h5;
      expv[4] = 4'h5;
      expv[5] = 4'h5;
      expv[6] = 4'h5;
      expv[7] = 4'h5;
      expv[8] = 4'h5;
      expv[9] = 4'h5;
      expv[10] = 4'h5;
      expv[11] = 4'h5;
      expv[12] = 4'h5;
      expv[13] = 4'h5;
      expv[14] = 4'h5;
      expv[15] = 4'h5;
      expv[16] = 4'h5;
      expv[17] = 4'h5;
      expv[18] = 4'h5;
      expv[19] = 4'h5;
      expv[20] = 4'h5;
      expv[21] = 4'h5;
      expv[22] = 4'h5;
      expv[23] = 4'h5;
      expv[24] = 4'h5;
      expv[25] = 4'h5;
      expv[26] = 4'h5;
      expv[27] = 4'h5;
      expv[28] = 4'h5;
      expv[29] = 4'h5;
      expv[30] = 4'h5;
      expv[31] = 4'h5;
      expv[32] = 4'h5;
      expv[33] = 4'h5;
      expv[34] = 4'h5;
      expv[35] = 4'h5;
      expv[36] = 4'h5;
      expv[37] = 4'h5;
      expv[38] = 4'h5;
      expv[39] = 4'h5;
      expv[40] = 4'h5;
      expv[41] = 4'h5;
      expv[42] = 4'h5;
      expv[43] = 4'h5;
      expv[44] = 4'h5;
      expv[45] = 4'h5;
      expv[46] = 4'h5;
      expv[47] = 4'h5;
      expv[48] = 4'h5;
      expv[49] = 4'h5;
      expv[50] = 4'h5;
      expv[51] = 4'h1;
      expv[52] = 4'h1;
      expv[53] = 4'h1;
      expv[54] = 4'h1;
      expv[55] = 4'h1;
      expv[56] = 4'h1;
      expv[57] = 4'h1;
      expv[58] = 4'h1;
      expv[59] = 4'h1;
      expv[60] = 4'h1;
      expv[61] = 4'h1;
      expv[62] = 4'h1;
      expv[63] = 4'h1;
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
