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

  altera_avalon_st_idle_inserter dut (
    .clk(clk),
    .reset_n(in_vec[10:10]),
    .in_valid(in_vec[9:9]),
    .in_data(in_vec[8:1]),
    .out_ready(in_vec[0:0]),
    .in_ready(out_vec[9:9]),
    .out_valid(out_vec[8:8]),
    .out_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h0f7;
    stim[1] = 11'h34a;
    stim[2] = 11'h556;
    stim[3] = 11'h787;
    stim[4] = 11'h69f;
    stim[5] = 11'h47a;
    stim[6] = 11'h495;
    stim[7] = 11'h6f0;
    stim[8] = 11'h420;
    stim[9] = 11'h61f;
    stim[10] = 11'h7d9;
    stim[11] = 11'h7c3;
    stim[12] = 11'h7f6;
    stim[13] = 11'h7a9;
    stim[14] = 11'h4ed;
    stim[15] = 11'h494;
    stim[16] = 11'h685;
    stim[17] = 11'h5be;
    stim[18] = 11'h4af;
    stim[19] = 11'h76d;
    stim[20] = 11'h615;
    stim[21] = 11'h4cb;
    stim[22] = 11'h4e9;
    stim[23] = 11'h7e9;
    stim[24] = 11'h64f;
    stim[25] = 11'h454;
    stim[26] = 11'h797;
    stim[27] = 11'h79b;
    stim[28] = 11'h69d;
    stim[29] = 11'h5b2;
    stim[30] = 11'h6ac;
    stim[31] = 11'h6dc;
    stim[32] = 11'h61e;
    stim[33] = 11'h68d;
    stim[34] = 11'h7db;
    stim[35] = 11'h665;
    stim[36] = 11'h78a;
    stim[37] = 11'h4bb;
    stim[38] = 11'h47b;
    stim[39] = 11'h5c9;
    stim[40] = 11'h4b7;
    stim[41] = 11'h699;
    stim[42] = 11'h595;
    stim[43] = 11'h635;
    stim[44] = 11'h75c;
    stim[45] = 11'h5b7;
    stim[46] = 11'h7eb;
    stim[47] = 11'h726;
    stim[48] = 11'h77a;
    stim[49] = 11'h449;
    stim[50] = 11'h645;
    stim[51] = 11'h508;
    stim[52] = 11'h447;
    stim[53] = 11'h793;
    stim[54] = 11'h534;
    stim[55] = 11'h64d;
    stim[56] = 11'h53f;
    stim[57] = 11'h7c6;
    stim[58] = 11'h4a1;
    stim[59] = 11'h52a;
    stim[60] = 11'h5ce;
    stim[61] = 11'h74a;
    stim[62] = 11'h6ec;
    stim[63] = 11'h6dc;
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
      expv[0] = 10'h34a;
      expv[1] = 10'h1a5;
      expv[2] = 10'h14a;
      expv[3] = 10'h3c3;
      expv[4] = 10'h34f;
      expv[5] = 10'h14a;
      expv[6] = 10'h34a;
      expv[7] = 10'h178;
      expv[8] = 10'h14a;
      expv[9] = 10'h30f;
      expv[10] = 10'h3ec;
      expv[11] = 10'h3e1;
      expv[12] = 10'h1fb;
      expv[13] = 10'h3d4;
      expv[14] = 10'h34a;
      expv[15] = 10'h14a;
      expv[16] = 10'h342;
      expv[17] = 10'h14a;
      expv[18] = 10'h34a;
      expv[19] = 10'h3b6;
      expv[20] = 10'h30a;
      expv[21] = 10'h34a;
      expv[22] = 10'h34a;
      expv[23] = 10'h3f4;
      expv[24] = 10'h327;
      expv[25] = 10'h14a;
      expv[26] = 10'h3cb;
      expv[27] = 10'h3cd;
      expv[28] = 10'h34e;
      expv[29] = 10'h14a;
      expv[30] = 10'h156;
      expv[31] = 10'h16e;
      expv[32] = 10'h10f;
      expv[33] = 10'h346;
      expv[34] = 10'h3ed;
      expv[35] = 10'h332;
      expv[36] = 10'h1c5;
      expv[37] = 10'h34a;
      expv[38] = 10'h34a;
      expv[39] = 10'h34a;
      expv[40] = 10'h34a;
      expv[41] = 10'h34c;
      expv[42] = 10'h34a;
      expv[43] = 10'h31a;
      expv[44] = 10'h1ae;
      expv[45] = 10'h34a;
      expv[46] = 10'h3f5;
      expv[47] = 10'h193;
      expv[48] = 10'h1bd;
      expv[49] = 10'h34a;
      expv[50] = 10'h322;
      expv[51] = 10'h14a;
      expv[52] = 10'h34a;
      expv[53] = 10'h3c9;
      expv[54] = 10'h14a;
      expv[55] = 10'h326;
      expv[56] = 10'h34a;
      expv[57] = 10'h1e3;
      expv[58] = 10'h34a;
      expv[59] = 10'h14a;
      expv[60] = 10'h14a;
      expv[61] = 10'h1a5;
      expv[62] = 10'h176;
      expv[63] = 10'h16e;
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
