// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06433 dut (
    .clk(clk),
    .data_in(in_vec[9:2]),
    .we(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h29d;
    stim[1] = 10'h1c7;
    stim[2] = 10'h220;
    stim[3] = 10'h024;
    stim[4] = 10'h2f2;
    stim[5] = 10'h348;
    stim[6] = 10'h3ea;
    stim[7] = 10'h330;
    stim[8] = 10'h172;
    stim[9] = 10'h018;
    stim[10] = 10'h01a;
    stim[11] = 10'h2be;
    stim[12] = 10'h012;
    stim[13] = 10'h380;
    stim[14] = 10'h3e4;
    stim[15] = 10'h0b8;
    stim[16] = 10'h3da;
    stim[17] = 10'h25f;
    stim[18] = 10'h30c;
    stim[19] = 10'h040;
    stim[20] = 10'h158;
    stim[21] = 10'h124;
    stim[22] = 10'h38e;
    stim[23] = 10'h0e8;
    stim[24] = 10'h396;
    stim[25] = 10'h1e4;
    stim[26] = 10'h1cc;
    stim[27] = 10'h1ae;
    stim[28] = 10'h12c;
    stim[29] = 10'h1e4;
    stim[30] = 10'h0a2;
    stim[31] = 10'h144;
    stim[32] = 10'h00e;
    stim[33] = 10'h02c;
    stim[34] = 10'h388;
    stim[35] = 10'h3ac;
    stim[36] = 10'h2fc;
    stim[37] = 10'h152;
    stim[38] = 10'h2cc;
    stim[39] = 10'h043;
    stim[40] = 10'h1ec;
    stim[41] = 10'h3ac;
    stim[42] = 10'h190;
    stim[43] = 10'h1d0;
    stim[44] = 10'h224;
    stim[45] = 10'h1a6;
    stim[46] = 10'h148;
    stim[47] = 10'h2c2;
    stim[48] = 10'h078;
    stim[49] = 10'h3de;
    stim[50] = 10'h10e;
    stim[51] = 10'h0d6;
    stim[52] = 10'h0b6;
    stim[53] = 10'h0e2;
    stim[54] = 10'h24e;
    stim[55] = 10'h1b2;
    stim[56] = 10'h052;
    stim[57] = 10'h3fe;
    stim[58] = 10'h2ac;
    stim[59] = 10'h04c;
    stim[60] = 10'h296;
    stim[61] = 10'h3f8;
    stim[62] = 10'h260;
    stim[63] = 10'h19a;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'hbc;
      expv[6] = 8'hbc;
      expv[7] = 8'hfa;
      expv[8] = 8'hfa;
      expv[9] = 8'h5c;
      expv[10] = 8'h5c;
      expv[11] = 8'h06;
      expv[12] = 8'haf;
      expv[13] = 8'h04;
      expv[14] = 8'h04;
      expv[15] = 8'h04;
      expv[16] = 8'h04;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'he3;
      expv[24] = 8'he3;
      expv[25] = 8'he5;
      expv[26] = 8'he5;
      expv[27] = 8'he5;
      expv[28] = 8'h6b;
      expv[29] = 8'h6b;
      expv[30] = 8'h6b;
      expv[31] = 8'h28;
      expv[32] = 8'h28;
      expv[33] = 8'h03;
      expv[34] = 8'h03;
      expv[35] = 8'h03;
      expv[36] = 8'h03;
      expv[37] = 8'h03;
      expv[38] = 8'h54;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h69;
      expv[47] = 8'h69;
      expv[48] = 8'hb0;
      expv[49] = 8'hb0;
      expv[50] = 8'hf7;
      expv[51] = 8'h43;
      expv[52] = 8'h35;
      expv[53] = 8'h2d;
      expv[54] = 8'h38;
      expv[55] = 8'h93;
      expv[56] = 8'h6c;
      expv[57] = 8'h14;
      expv[58] = 8'hff;
      expv[59] = 8'hff;
      expv[60] = 8'hff;
      expv[61] = 8'ha5;
      expv[62] = 8'ha5;
      expv[63] = 8'ha5;
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
