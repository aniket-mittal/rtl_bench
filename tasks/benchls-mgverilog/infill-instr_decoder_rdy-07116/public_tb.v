// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07116 dut (
    .inst(in_vec[9:2]),
    .ena_(in_vec[1:1]),
    .cond_dout(in_vec[0:0]),
    .rdy_nop_(out_vec[10:10]),
    .rdy_cpf_(out_vec[9:9]),
    .rdy_cpt_(out_vec[8:8]),
    .rdy_ld_(out_vec[7:7]),
    .rdy_st_(out_vec[6:6]),
    .rdy_clr_(out_vec[5:5]),
    .rdy_im_(out_vec[4:4]),
    .rdy_tce_(out_vec[3:3]),
    .rdy_ts_(out_vec[2:2]),
    .rdy_add_(out_vec[1:1]),
    .rdy_sub_(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h129;
    stim[1] = 10'h23f;
    stim[2] = 10'h31d;
    stim[3] = 10'h0ed;
    stim[4] = 10'h069;
    stim[5] = 10'h343;
    stim[6] = 10'h3a7;
    stim[7] = 10'h1dd;
    stim[8] = 10'h0b4;
    stim[9] = 10'h3db;
    stim[10] = 10'h127;
    stim[11] = 10'h3a9;
    stim[12] = 10'h14b;
    stim[13] = 10'h383;
    stim[14] = 10'h297;
    stim[15] = 10'h14a;
    stim[16] = 10'h018;
    stim[17] = 10'h02d;
    stim[18] = 10'h23f;
    stim[19] = 10'h29b;
    stim[20] = 10'h3ca;
    stim[21] = 10'h0d5;
    stim[22] = 10'h342;
    stim[23] = 10'h005;
    stim[24] = 10'h18c;
    stim[25] = 10'h01b;
    stim[26] = 10'h2a9;
    stim[27] = 10'h302;
    stim[28] = 10'h2f2;
    stim[29] = 10'h0f5;
    stim[30] = 10'h23b;
    stim[31] = 10'h0e4;
    stim[32] = 10'h051;
    stim[33] = 10'h11f;
    stim[34] = 10'h129;
    stim[35] = 10'h361;
    stim[36] = 10'h14a;
    stim[37] = 10'h2ff;
    stim[38] = 10'h190;
    stim[39] = 10'h15a;
    stim[40] = 10'h12f;
    stim[41] = 10'h2d4;
    stim[42] = 10'h346;
    stim[43] = 10'h2ce;
    stim[44] = 10'h0cf;
    stim[45] = 10'h1a1;
    stim[46] = 10'h326;
    stim[47] = 10'h39f;
    stim[48] = 10'h00f;
    stim[49] = 10'h3e4;
    stim[50] = 10'h147;
    stim[51] = 10'h343;
    stim[52] = 10'h2f5;
    stim[53] = 10'h141;
    stim[54] = 10'h247;
    stim[55] = 10'h076;
    stim[56] = 10'h3a8;
    stim[57] = 10'h1cd;
    stim[58] = 10'h187;
    stim[59] = 10'h07e;
    stim[60] = 10'h251;
    stim[61] = 10'h3cd;
    stim[62] = 10'h39e;
    stim[63] = 10'h373;
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
      expv[0] = 11'h3ff;
      expv[1] = 11'h7ff;
      expv[2] = 11'h7bf;
      expv[3] = 11'h3ff;
      expv[4] = 11'h3ff;
      expv[5] = 11'h7ff;
      expv[6] = 11'h7ff;
      expv[7] = 11'h3ff;
      expv[8] = 11'h5ff;
      expv[9] = 11'h7ff;
      expv[10] = 11'h7ff;
      expv[11] = 11'h7ef;
      expv[12] = 11'h7ff;
      expv[13] = 11'h7ff;
      expv[14] = 11'h7ff;
      expv[15] = 11'h7ff;
      expv[16] = 11'h7ff;
      expv[17] = 11'h3ff;
      expv[18] = 11'h7ff;
      expv[19] = 11'h7ff;
      expv[20] = 11'h7ff;
      expv[21] = 11'h3ff;
      expv[22] = 11'h7ff;
      expv[23] = 11'h3ff;
      expv[24] = 11'h7ef;
      expv[25] = 11'h7ff;
      expv[26] = 11'h5ff;
      expv[27] = 11'h7ff;
      expv[28] = 11'h7ff;
      expv[29] = 11'h3ff;
      expv[30] = 11'h7ff;
      expv[31] = 11'h6ff;
      expv[32] = 11'h3ff;
      expv[33] = 11'h7ff;
      expv[34] = 11'h3ff;
      expv[35] = 11'h7ff;
      expv[36] = 11'h7ff;
      expv[37] = 11'h7ff;
      expv[38] = 11'h7ef;
      expv[39] = 11'h7ff;
      expv[40] = 11'h7ff;
      expv[41] = 11'h3ff;
      expv[42] = 11'h7ff;
      expv[43] = 11'h7ff;
      expv[44] = 11'h7ff;
      expv[45] = 11'h3ff;
      expv[46] = 11'h7ff;
      expv[47] = 11'h7ff;
      expv[48] = 11'h7ff;
      expv[49] = 11'h3ff;
      expv[50] = 11'h7ff;
      expv[51] = 11'h7ff;
      expv[52] = 11'h6ff;
      expv[53] = 11'h3ff;
      expv[54] = 11'h7ff;
      expv[55] = 11'h7ff;
      expv[56] = 11'h3ff;
      expv[57] = 11'h3ff;
      expv[58] = 11'h7ff;
      expv[59] = 11'h7ff;
      expv[60] = 11'h7ff;
      expv[61] = 11'h7ef;
      expv[62] = 11'h7ff;
      expv[63] = 11'h7ff;
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
