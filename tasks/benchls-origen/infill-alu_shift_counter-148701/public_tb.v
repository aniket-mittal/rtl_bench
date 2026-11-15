// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148701 dut (
    .clk(clk),
    .a(in_vec[15:13]),
    .b(in_vec[12:10]),
    .reset_n(in_vec[9:9]),
    .load(in_vec[8:8]),
    .enable(in_vec[7:7]),
    .shift_left(in_vec[6:6]),
    .data_in(in_vec[5:2]),
    .select_calculator(in_vec[1:1]),
    .select_and(in_vec[0:0]),
    .outv(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h75f2;
    stim[1] = 16'hd027;
    stim[2] = 16'hdcec;
    stim[3] = 16'h0e9a;
    stim[4] = 16'h0ed2;
    stim[5] = 16'h0abd;
    stim[6] = 16'h2384;
    stim[7] = 16'h3eeb;
    stim[8] = 16'hab5c;
    stim[9] = 16'h220b;
    stim[10] = 16'h7b6a;
    stim[11] = 16'h3370;
    stim[12] = 16'hffa8;
    stim[13] = 16'hb6c6;
    stim[14] = 16'he794;
    stim[15] = 16'hc6ae;
    stim[16] = 16'hbbf7;
    stim[17] = 16'hd2b0;
    stim[18] = 16'h1e3e;
    stim[19] = 16'hb7bd;
    stim[20] = 16'hf6f8;
    stim[21] = 16'h2f79;
    stim[22] = 16'h9ac7;
    stim[23] = 16'hbf9f;
    stim[24] = 16'hdfb5;
    stim[25] = 16'h1e2f;
    stim[26] = 16'h8bdb;
    stim[27] = 16'h0329;
    stim[28] = 16'h56e8;
    stim[29] = 16'hd338;
    stim[30] = 16'hea1b;
    stim[31] = 16'h769e;
    stim[32] = 16'h333f;
    stim[33] = 16'hc660;
    stim[34] = 16'h43cc;
    stim[35] = 16'heee7;
    stim[36] = 16'ha36e;
    stim[37] = 16'he790;
    stim[38] = 16'hcf9b;
    stim[39] = 16'h1746;
    stim[40] = 16'h4fba;
    stim[41] = 16'hd6c7;
    stim[42] = 16'hd29d;
    stim[43] = 16'heaea;
    stim[44] = 16'h77b2;
    stim[45] = 16'h7210;
    stim[46] = 16'h87ea;
    stim[47] = 16'h6e6e;
    stim[48] = 16'hc78b;
    stim[49] = 16'ha6fa;
    stim[50] = 16'h8393;
    stim[51] = 16'h56d4;
    stim[52] = 16'ha64b;
    stim[53] = 16'h8b60;
    stim[54] = 16'h8ea8;
    stim[55] = 16'he21f;
    stim[56] = 16'hc2be;
    stim[57] = 16'h6ed8;
    stim[58] = 16'hba09;
    stim[59] = 16'h4732;
    stim[60] = 16'h2271;
    stim[61] = 16'h37e6;
    stim[62] = 16'hfe83;
    stim[63] = 16'h0e51;
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
      expv[0] = 4'h2;
      expv[1] = 4'h1;
      expv[2] = 4'h0;
      expv[3] = 4'h2;
      expv[4] = 4'h2;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h1;
      expv[8] = 4'h1;
      expv[9] = 4'h0;
      expv[10] = 4'h2;
      expv[11] = 4'h1;
      expv[12] = 4'h1;
      expv[13] = 4'h0;
      expv[14] = 4'h1;
      expv[15] = 4'h3;
      expv[16] = 4'h1;
      expv[17] = 4'h2;
      expv[18] = 4'h3;
      expv[19] = 4'h2;
      expv[20] = 4'h3;
      expv[21] = 4'h2;
      expv[22] = 4'h1;
      expv[23] = 4'h2;
      expv[24] = 4'h3;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h2;
      expv[28] = 4'h1;
      expv[29] = 4'h1;
      expv[30] = 4'h1;
      expv[31] = 4'h2;
      expv[32] = 4'h0;
      expv[33] = 4'h3;
      expv[34] = 4'h3;
      expv[35] = 4'h2;
      expv[36] = 4'h2;
      expv[37] = 4'h2;
      expv[38] = 4'h1;
      expv[39] = 4'h2;
      expv[40] = 4'h1;
      expv[41] = 4'h1;
      expv[42] = 4'h1;
      expv[43] = 4'h2;
      expv[44] = 4'h2;
      expv[45] = 4'h1;
      expv[46] = 4'h2;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h1;
      expv[50] = 4'h0;
      expv[51] = 4'h1;
      expv[52] = 4'h1;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h2;
      expv[57] = 4'h1;
      expv[58] = 4'h1;
      expv[59] = 4'h2;
      expv[60] = 4'h1;
      expv[61] = 4'h1;
      expv[62] = 4'h3;
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
