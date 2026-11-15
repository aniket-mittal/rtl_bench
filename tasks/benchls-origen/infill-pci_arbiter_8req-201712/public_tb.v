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

  origen_201712 dut (
    .clk(clk),
    .REQ(in_vec[10:3]),
    .FRAME(in_vec[2:2]),
    .IRDY(in_vec[1:1]),
    .TRDY(in_vec[0:0]),
    .GNT(out_vec[9:2]),
    .NEED_GNT(out_vec[1:1]),
    .RDY_GNT(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h13f;
    stim[1] = 11'h470;
    stim[2] = 11'h6b6;
    stim[3] = 11'h2ef;
    stim[4] = 11'h2b9;
    stim[5] = 11'h2cd;
    stim[6] = 11'h357;
    stim[7] = 11'h653;
    stim[8] = 11'h2f1;
    stim[9] = 11'h60d;
    stim[10] = 11'h318;
    stim[11] = 11'h3f6;
    stim[12] = 11'h223;
    stim[13] = 11'h259;
    stim[14] = 11'h647;
    stim[15] = 11'h357;
    stim[16] = 11'h39c;
    stim[17] = 11'h121;
    stim[18] = 11'h42a;
    stim[19] = 11'h7db;
    stim[20] = 11'h056;
    stim[21] = 11'h433;
    stim[22] = 11'h170;
    stim[23] = 11'h007;
    stim[24] = 11'h46f;
    stim[25] = 11'h564;
    stim[26] = 11'h12a;
    stim[27] = 11'h4a9;
    stim[28] = 11'h3b6;
    stim[29] = 11'h2a5;
    stim[30] = 11'h755;
    stim[31] = 11'h27f;
    stim[32] = 11'h4a2;
    stim[33] = 11'h6da;
    stim[34] = 11'h6c1;
    stim[35] = 11'h2d4;
    stim[36] = 11'h6a2;
    stim[37] = 11'h7ad;
    stim[38] = 11'h199;
    stim[39] = 11'h6ff;
    stim[40] = 11'h4d9;
    stim[41] = 11'h576;
    stim[42] = 11'h2e7;
    stim[43] = 11'h2ef;
    stim[44] = 11'h016;
    stim[45] = 11'h01d;
    stim[46] = 11'h21a;
    stim[47] = 11'h32c;
    stim[48] = 11'h659;
    stim[49] = 11'h59a;
    stim[50] = 11'h6b0;
    stim[51] = 11'h677;
    stim[52] = 11'h09b;
    stim[53] = 11'h661;
    stim[54] = 11'h3a1;
    stim[55] = 11'h462;
    stim[56] = 11'h191;
    stim[57] = 11'h334;
    stim[58] = 11'h030;
    stim[59] = 11'h43e;
    stim[60] = 11'h068;
    stim[61] = 11'h1dc;
    stim[62] = 11'h7da;
    stim[63] = 11'h1a3;
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
      expv[0] = 10'h3fd;
      expv[1] = 10'h3fe;
      expv[2] = 10'h3fe;
      expv[3] = 10'h3fe;
      expv[4] = 10'h3fe;
      expv[5] = 10'h3fe;
      expv[6] = 10'h3fe;
      expv[7] = 10'h3fe;
      expv[8] = 10'h3ff;
      expv[9] = 10'h020;
      expv[10] = 10'h022;
      expv[11] = 10'h022;
      expv[12] = 10'h022;
      expv[13] = 10'h023;
      expv[14] = 10'h020;
      expv[15] = 10'h022;
      expv[16] = 10'h022;
      expv[17] = 10'h022;
      expv[18] = 10'h022;
      expv[19] = 10'h022;
      expv[20] = 10'h023;
      expv[21] = 10'h200;
      expv[22] = 10'h203;
      expv[23] = 10'h080;
      expv[24] = 10'h082;
      expv[25] = 10'h082;
      expv[26] = 10'h082;
      expv[27] = 10'h082;
      expv[28] = 10'h082;
      expv[29] = 10'h082;
      expv[30] = 10'h082;
      expv[31] = 10'h082;
      expv[32] = 10'h082;
      expv[33] = 10'h082;
      expv[34] = 10'h082;
      expv[35] = 10'h082;
      expv[36] = 10'h082;
      expv[37] = 10'h082;
      expv[38] = 10'h082;
      expv[39] = 10'h082;
      expv[40] = 10'h082;
      expv[41] = 10'h082;
      expv[42] = 10'h082;
      expv[43] = 10'h082;
      expv[44] = 10'h082;
      expv[45] = 10'h082;
      expv[46] = 10'h082;
      expv[47] = 10'h082;
      expv[48] = 10'h082;
      expv[49] = 10'h082;
      expv[50] = 10'h082;
      expv[51] = 10'h082;
      expv[52] = 10'h082;
      expv[53] = 10'h083;
      expv[54] = 10'h004;
      expv[55] = 10'h006;
      expv[56] = 10'h006;
      expv[57] = 10'h006;
      expv[58] = 10'h006;
      expv[59] = 10'h006;
      expv[60] = 10'h006;
      expv[61] = 10'h006;
      expv[62] = 10'h006;
      expv[63] = 10'h006;
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
