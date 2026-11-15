// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00668 dut (
    .clk(clk),
    .a(in_vec[11:9]),
    .b(in_vec[8:3]),
    .en(in_vec[2:2]),
    .ce(in_vec[1:1]),
    .clr(in_vec[0:0]),
    .op(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hbfa;
    stim[1] = 12'h2a3;
    stim[2] = 12'he50;
    stim[3] = 12'h092;
    stim[4] = 12'hd2d;
    stim[5] = 12'hea9;
    stim[6] = 12'hb8c;
    stim[7] = 12'h53a;
    stim[8] = 12'h58e;
    stim[9] = 12'hb66;
    stim[10] = 12'h09e;
    stim[11] = 12'h902;
    stim[12] = 12'he48;
    stim[13] = 12'h29c;
    stim[14] = 12'hd6e;
    stim[15] = 12'h71d;
    stim[16] = 12'h7f9;
    stim[17] = 12'h53b;
    stim[18] = 12'haa8;
    stim[19] = 12'h75a;
    stim[20] = 12'h7a1;
    stim[21] = 12'h8ad;
    stim[22] = 12'h019;
    stim[23] = 12'h030;
    stim[24] = 12'hb7d;
    stim[25] = 12'hbd7;
    stim[26] = 12'h38c;
    stim[27] = 12'hf58;
    stim[28] = 12'hcb9;
    stim[29] = 12'hd50;
    stim[30] = 12'h2d5;
    stim[31] = 12'h239;
    stim[32] = 12'h8d1;
    stim[33] = 12'hbdd;
    stim[34] = 12'h695;
    stim[35] = 12'hb02;
    stim[36] = 12'h6a5;
    stim[37] = 12'h9c9;
    stim[38] = 12'hf60;
    stim[39] = 12'h2cd;
    stim[40] = 12'h8c4;
    stim[41] = 12'h02e;
    stim[42] = 12'he51;
    stim[43] = 12'h269;
    stim[44] = 12'h79b;
    stim[45] = 12'hc37;
    stim[46] = 12'hbd0;
    stim[47] = 12'h554;
    stim[48] = 12'h244;
    stim[49] = 12'h440;
    stim[50] = 12'hac1;
    stim[51] = 12'hf2a;
    stim[52] = 12'h553;
    stim[53] = 12'h849;
    stim[54] = 12'h958;
    stim[55] = 12'hf68;
    stim[56] = 12'haa5;
    stim[57] = 12'h364;
    stim[58] = 12'h735;
    stim[59] = 12'h41d;
    stim[60] = 12'he4f;
    stim[61] = 12'h294;
    stim[62] = 12'h3b1;
    stim[63] = 12'hfd7;
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
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
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
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
