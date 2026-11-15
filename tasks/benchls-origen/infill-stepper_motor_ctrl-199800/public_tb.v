// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_199800 dut (
    .clk(clk),
    .step_clk(in_vec[2:2]),
    .direction(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .sem0(out_vec[11:11]),
    .sem1(out_vec[10:10]),
    .sem2(out_vec[9:9]),
    .sem3(out_vec[8:8]),
    .tick_count(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h7;
    stim[1] = 3'h1;
    stim[2] = 3'h0;
    stim[3] = 3'h4;
    stim[4] = 3'h2;
    stim[5] = 3'h6;
    stim[6] = 3'h5;
    stim[7] = 3'h0;
    stim[8] = 3'h2;
    stim[9] = 3'h2;
    stim[10] = 3'h4;
    stim[11] = 3'h6;
    stim[12] = 3'h2;
    stim[13] = 3'h2;
    stim[14] = 3'h2;
    stim[15] = 3'h6;
    stim[16] = 3'h0;
    stim[17] = 3'h4;
    stim[18] = 3'h6;
    stim[19] = 3'h6;
    stim[20] = 3'h0;
    stim[21] = 3'h6;
    stim[22] = 3'h6;
    stim[23] = 3'h4;
    stim[24] = 3'h6;
    stim[25] = 3'h0;
    stim[26] = 3'h0;
    stim[27] = 3'h3;
    stim[28] = 3'h4;
    stim[29] = 3'h0;
    stim[30] = 3'h4;
    stim[31] = 3'h2;
    stim[32] = 3'h0;
    stim[33] = 3'h6;
    stim[34] = 3'h0;
    stim[35] = 3'h3;
    stim[36] = 3'h2;
    stim[37] = 3'h6;
    stim[38] = 3'h0;
    stim[39] = 3'h2;
    stim[40] = 3'h4;
    stim[41] = 3'h6;
    stim[42] = 3'h4;
    stim[43] = 3'h6;
    stim[44] = 3'h6;
    stim[45] = 3'h2;
    stim[46] = 3'h0;
    stim[47] = 3'h2;
    stim[48] = 3'h6;
    stim[49] = 3'h4;
    stim[50] = 3'h6;
    stim[51] = 3'h4;
    stim[52] = 3'h6;
    stim[53] = 3'h4;
    stim[54] = 3'h4;
    stim[55] = 3'h6;
    stim[56] = 3'h2;
    stim[57] = 3'h6;
    stim[58] = 3'h6;
    stim[59] = 3'h4;
    stim[60] = 3'h0;
    stim[61] = 3'h0;
    stim[62] = 3'h4;
    stim[63] = 3'h2;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h600;
      expv[4] = 12'hc01;
      expv[5] = 12'h601;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h600;
      expv[9] = 12'h300;
      expv[10] = 12'h900;
      expv[11] = 12'h301;
      expv[12] = 12'h901;
      expv[13] = 12'hc01;
      expv[14] = 12'h601;
      expv[15] = 12'h301;
      expv[16] = 12'h902;
      expv[17] = 12'h302;
      expv[18] = 12'h603;
      expv[19] = 12'h303;
      expv[20] = 12'h903;
      expv[21] = 12'h303;
      expv[22] = 12'h904;
      expv[23] = 12'hc04;
      expv[24] = 12'h904;
      expv[25] = 12'hc04;
      expv[26] = 12'h904;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h601;
      expv[30] = 12'hc01;
      expv[31] = 12'h902;
      expv[32] = 12'hc02;
      expv[33] = 12'h902;
      expv[34] = 12'hc03;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h900;
      expv[38] = 12'hc01;
      expv[39] = 12'h901;
      expv[40] = 12'hc01;
      expv[41] = 12'h902;
      expv[42] = 12'hc02;
      expv[43] = 12'h902;
      expv[44] = 12'hc02;
      expv[45] = 12'h602;
      expv[46] = 12'h302;
      expv[47] = 12'h602;
      expv[48] = 12'h302;
      expv[49] = 12'h903;
      expv[50] = 12'h303;
      expv[51] = 12'h903;
      expv[52] = 12'h303;
      expv[53] = 12'h903;
      expv[54] = 12'h303;
      expv[55] = 12'h603;
      expv[56] = 12'h303;
      expv[57] = 12'h903;
      expv[58] = 12'hc04;
      expv[59] = 12'h604;
      expv[60] = 12'hc04;
      expv[61] = 12'h904;
      expv[62] = 12'h304;
      expv[63] = 12'h605;
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
