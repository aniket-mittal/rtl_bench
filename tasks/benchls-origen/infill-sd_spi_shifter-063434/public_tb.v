// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_063434 dut (
    .CLOCK(clk),
    .nRESET(in_vec[13:13]),
    .CLKEN(in_vec[12:12]),
    .ENABLE(in_vec[11:11]),
    .nWR(in_vec[10:10]),
    .DI(in_vec[9:2]),
    .DUMMY(in_vec[1:1]),
    .SD_MISO(in_vec[0:0]),
    .DO(out_vec[11:4]),
    .DONE(out_vec[3:3]),
    .SD_CS(out_vec[2:2]),
    .SD_CLK(out_vec[1:1]),
    .SD_MOSI(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h39cd;
    stim[1] = 14'h3b82;
    stim[2] = 14'h0751;
    stim[3] = 14'h020c;
    stim[4] = 14'h0e2e;
    stim[5] = 14'h04ef;
    stim[6] = 14'h0cbf;
    stim[7] = 14'h1ede;
    stim[8] = 14'h09ce;
    stim[9] = 14'h05d4;
    stim[10] = 14'h04f6;
    stim[11] = 14'h0663;
    stim[12] = 14'h0b33;
    stim[13] = 14'h183f;
    stim[14] = 14'h02d3;
    stim[15] = 14'h1464;
    stim[16] = 14'h3145;
    stim[17] = 14'h19e3;
    stim[18] = 14'h0ee9;
    stim[19] = 14'h139b;
    stim[20] = 14'h1311;
    stim[21] = 14'h17e3;
    stim[22] = 14'h1baf;
    stim[23] = 14'h181c;
    stim[24] = 14'h056c;
    stim[25] = 14'h0993;
    stim[26] = 14'h0423;
    stim[27] = 14'h0876;
    stim[28] = 14'h0b6f;
    stim[29] = 14'h07bc;
    stim[30] = 14'h17d3;
    stim[31] = 14'h1d67;
    stim[32] = 14'h0954;
    stim[33] = 14'h07da;
    stim[34] = 14'h0cbd;
    stim[35] = 14'h1b05;
    stim[36] = 14'h07a9;
    stim[37] = 14'h05a7;
    stim[38] = 14'h134a;
    stim[39] = 14'h1d57;
    stim[40] = 14'h1947;
    stim[41] = 14'h0635;
    stim[42] = 14'h0b1d;
    stim[43] = 14'h1863;
    stim[44] = 14'h0a69;
    stim[45] = 14'h0696;
    stim[46] = 14'h0666;
    stim[47] = 14'h0de9;
    stim[48] = 14'h1725;
    stim[49] = 14'h0f98;
    stim[50] = 14'h0c46;
    stim[51] = 14'h1ac6;
    stim[52] = 14'h15ae;
    stim[53] = 14'h128d;
    stim[54] = 14'h19e3;
    stim[55] = 14'h1fe1;
    stim[56] = 14'h1d8e;
    stim[57] = 14'h1cf1;
    stim[58] = 14'h1e03;
    stim[59] = 14'h1448;
    stim[60] = 14'h1e00;
    stim[61] = 14'h167a;
    stim[62] = 14'h15b5;
    stim[63] = 14'h1797;
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
      expv[0] = 12'hff7;
      expv[1] = 12'hffd;
      expv[2] = 12'hff3;
      expv[3] = 12'hff3;
      expv[4] = 12'hff3;
      expv[5] = 12'hff3;
      expv[6] = 12'hff3;
      expv[7] = 12'hff3;
      expv[8] = 12'hff3;
      expv[9] = 12'hff3;
      expv[10] = 12'hff3;
      expv[11] = 12'hff3;
      expv[12] = 12'hff3;
      expv[13] = 12'hff3;
      expv[14] = 12'hff3;
      expv[15] = 12'hff3;
      expv[16] = 12'hff7;
      expv[17] = 12'hff3;
      expv[18] = 12'hff3;
      expv[19] = 12'hff3;
      expv[20] = 12'hff3;
      expv[21] = 12'hff3;
      expv[22] = 12'hff3;
      expv[23] = 12'hff3;
      expv[24] = 12'hff3;
      expv[25] = 12'hff3;
      expv[26] = 12'hff3;
      expv[27] = 12'hff3;
      expv[28] = 12'hff3;
      expv[29] = 12'hff3;
      expv[30] = 12'hff3;
      expv[31] = 12'hff3;
      expv[32] = 12'hff3;
      expv[33] = 12'hff3;
      expv[34] = 12'hff3;
      expv[35] = 12'hff3;
      expv[36] = 12'hff3;
      expv[37] = 12'hff3;
      expv[38] = 12'hff3;
      expv[39] = 12'hff3;
      expv[40] = 12'hff3;
      expv[41] = 12'hff3;
      expv[42] = 12'hff3;
      expv[43] = 12'hff3;
      expv[44] = 12'hff3;
      expv[45] = 12'hff3;
      expv[46] = 12'hff3;
      expv[47] = 12'hff3;
      expv[48] = 12'hff3;
      expv[49] = 12'hff3;
      expv[50] = 12'hff3;
      expv[51] = 12'hff3;
      expv[52] = 12'hff3;
      expv[53] = 12'hff3;
      expv[54] = 12'hff3;
      expv[55] = 12'hff3;
      expv[56] = 12'hff3;
      expv[57] = 12'hff3;
      expv[58] = 12'hff3;
      expv[59] = 12'hff3;
      expv[60] = 12'hff3;
      expv[61] = 12'hff3;
      expv[62] = 12'hff3;
      expv[63] = 12'hff3;
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
