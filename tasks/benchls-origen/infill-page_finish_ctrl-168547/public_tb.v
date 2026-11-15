// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_168547 dut (
    .clk(clk),
    .rst_n(in_vec[28:28]),
    .start(in_vec[27:27]),
    .tf_empty(in_vec[26:26]),
    .ps_finish(in_vec[25:22]),
    .page_input_finish(in_vec[21:21]),
    .ps_empty(in_vec[20:17]),
    .ram_empty(in_vec[16:1]),
    .cl_finish(in_vec[0:0]),
    .page_finish(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h0f1cad8a;
    stim[1] = 29'h0931e640;
    stim[2] = 29'h19fcad5a;
    stim[3] = 29'h1534fc50;
    stim[4] = 29'h19e28b4b;
    stim[5] = 29'h1b7c1840;
    stim[6] = 29'h14c1822f;
    stim[7] = 29'h148c191a;
    stim[8] = 29'h1458131d;
    stim[9] = 29'h13e42b98;
    stim[10] = 29'h1bd6fd08;
    stim[11] = 29'h11622b27;
    stim[12] = 29'h1554a797;
    stim[13] = 29'h1da11426;
    stim[14] = 29'h1fbf026d;
    stim[15] = 29'h16d589f5;
    stim[16] = 29'h113049c1;
    stim[17] = 29'h146037b1;
    stim[18] = 29'h18700e91;
    stim[19] = 29'h1af164ab;
    stim[20] = 29'h1efaa4ff;
    stim[21] = 29'h1b5ae40a;
    stim[22] = 29'h18ae3cd2;
    stim[23] = 29'h1dba588b;
    stim[24] = 29'h127ea413;
    stim[25] = 29'h16a84c66;
    stim[26] = 29'h1b69c045;
    stim[27] = 29'h1f0374a2;
    stim[28] = 29'h158201ff;
    stim[29] = 29'h175528f4;
    stim[30] = 29'h196c898a;
    stim[31] = 29'h12b42404;
    stim[32] = 29'h1caeb469;
    stim[33] = 29'h1197bfa8;
    stim[34] = 29'h10974e8b;
    stim[35] = 29'h19d5cc94;
    stim[36] = 29'h12fd601a;
    stim[37] = 29'h1b08e11f;
    stim[38] = 29'h1ca9f517;
    stim[39] = 29'h169121cd;
    stim[40] = 29'h1e381b96;
    stim[41] = 29'h1a7824db;
    stim[42] = 29'h15082896;
    stim[43] = 29'h10579874;
    stim[44] = 29'h1c18f1ef;
    stim[45] = 29'h14150e22;
    stim[46] = 29'h16ace138;
    stim[47] = 29'h15292ae2;
    stim[48] = 29'h12e00861;
    stim[49] = 29'h1aa5125d;
    stim[50] = 29'h1e9a2f1c;
    stim[51] = 29'h156e9c39;
    stim[52] = 29'h13d1bbfd;
    stim[53] = 29'h1c1dee73;
    stim[54] = 29'h1f804017;
    stim[55] = 29'h17a53f4a;
    stim[56] = 29'h1e62e527;
    stim[57] = 29'h12012618;
    stim[58] = 29'h1c20edeb;
    stim[59] = 29'h177636f6;
    stim[60] = 29'h12cf2cb1;
    stim[61] = 29'h159c36b9;
    stim[62] = 29'h15424400;
    stim[63] = 29'h18942eeb;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
