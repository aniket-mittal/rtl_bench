// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_020889 dut (
    .clk(clk),
    .rst(in_vec[2:2]),
    .cnvst(in_vec[1:1]),
    .cmp_out(in_vec[0:0]),
    .sar(out_vec[27:20]),
    .eoc(out_vec[19:19]),
    .cmp_clk(out_vec[18:18]),
    .s_clk(out_vec[17:17]),
    .fine_btm(out_vec[16:1]),
    .fine_switch_drain(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h6;
    stim[1] = 3'h6;
    stim[2] = 3'h1;
    stim[3] = 3'h3;
    stim[4] = 3'h0;
    stim[5] = 3'h1;
    stim[6] = 3'h2;
    stim[7] = 3'h2;
    stim[8] = 3'h3;
    stim[9] = 3'h0;
    stim[10] = 3'h2;
    stim[11] = 3'h2;
    stim[12] = 3'h2;
    stim[13] = 3'h1;
    stim[14] = 3'h5;
    stim[15] = 3'h3;
    stim[16] = 3'h1;
    stim[17] = 3'h3;
    stim[18] = 3'h3;
    stim[19] = 3'h3;
    stim[20] = 3'h0;
    stim[21] = 3'h3;
    stim[22] = 3'h2;
    stim[23] = 3'h0;
    stim[24] = 3'h0;
    stim[25] = 3'h2;
    stim[26] = 3'h0;
    stim[27] = 3'h2;
    stim[28] = 3'h0;
    stim[29] = 3'h1;
    stim[30] = 3'h3;
    stim[31] = 3'h2;
    stim[32] = 3'h3;
    stim[33] = 3'h3;
    stim[34] = 3'h1;
    stim[35] = 3'h2;
    stim[36] = 3'h1;
    stim[37] = 3'h1;
    stim[38] = 3'h2;
    stim[39] = 3'h1;
    stim[40] = 3'h0;
    stim[41] = 3'h1;
    stim[42] = 3'h1;
    stim[43] = 3'h3;
    stim[44] = 3'h2;
    stim[45] = 3'h0;
    stim[46] = 3'h1;
    stim[47] = 3'h1;
    stim[48] = 3'h1;
    stim[49] = 3'h1;
    stim[50] = 3'h1;
    stim[51] = 3'h1;
    stim[52] = 3'h1;
    stim[53] = 3'h3;
    stim[54] = 3'h3;
    stim[55] = 3'h2;
    stim[56] = 3'h0;
    stim[57] = 3'h1;
    stim[58] = 3'h1;
    stim[59] = 3'h1;
    stim[60] = 3'h0;
    stim[61] = 3'h1;
    stim[62] = 3'h1;
    stim[63] = 3'h3;
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
      expv[0] = 28'h0000000;
      expv[1] = 28'h0000000;
      expv[2] = 28'h0000000;
      expv[3] = 28'h0020000;
      expv[4] = 28'h8030000;
      expv[5] = 28'h8010001;
      expv[6] = 28'h8010001;
      expv[7] = 28'h8010001;
      expv[8] = 28'h8010001;
      expv[9] = 28'h8010001;
      expv[10] = 28'h8010001;
      expv[11] = 28'h8010001;
      expv[12] = 28'h8010001;
      expv[13] = 28'h8010001;
      expv[14] = 28'h0000000;
      expv[15] = 28'h0000000;
      expv[16] = 28'h8030000;
      expv[17] = 28'h8010001;
      expv[18] = 28'h8010001;
      expv[19] = 28'h8010001;
      expv[20] = 28'h8010001;
      expv[21] = 28'h8010001;
      expv[22] = 28'h8010001;
      expv[23] = 28'h8010001;
      expv[24] = 28'h8010001;
      expv[25] = 28'h8010001;
      expv[26] = 28'h8010001;
      expv[27] = 28'h8010001;
      expv[28] = 28'h8010001;
      expv[29] = 28'h8010001;
      expv[30] = 28'h8010001;
      expv[31] = 28'h8010001;
      expv[32] = 28'h8010001;
      expv[33] = 28'h8010001;
      expv[34] = 28'h8010001;
      expv[35] = 28'h8010001;
      expv[36] = 28'h8010001;
      expv[37] = 28'h8010001;
      expv[38] = 28'h8010001;
      expv[39] = 28'h8010001;
      expv[40] = 28'h8010001;
      expv[41] = 28'h8010001;
      expv[42] = 28'h8010001;
      expv[43] = 28'h8010001;
      expv[44] = 28'h8010001;
      expv[45] = 28'h8010001;
      expv[46] = 28'h8010001;
      expv[47] = 28'h8010001;
      expv[48] = 28'h8010001;
      expv[49] = 28'h8050000;
      expv[50] = 28'h8018000;
      expv[51] = 28'h8058000;
      expv[52] = 28'hc014000;
      expv[53] = 28'hc054000;
      expv[54] = 28'he01a000;
      expv[55] = 28'he05a000;
      expv[56] = 28'he014000;
      expv[57] = 28'he054000;
      expv[58] = 28'he81a800;
      expv[59] = 28'he85a800;
      expv[60] = 28'hec14400;
      expv[61] = 28'hec54400;
      expv[62] = 28'hee1aa00;
      expv[63] = 28'hee5aa00;
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
