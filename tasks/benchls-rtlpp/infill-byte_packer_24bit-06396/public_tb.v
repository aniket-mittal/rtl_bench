// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06396 dut (
    .clk(clk),
    .in(in_vec[8:1]),
    .reset(in_vec[0:0]),
    .out_bytes(out_vec[24:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h031;
    stim[1] = 9'h00f;
    stim[2] = 9'h046;
    stim[3] = 9'h12a;
    stim[4] = 9'h05d;
    stim[5] = 9'h1e8;
    stim[6] = 9'h096;
    stim[7] = 9'h0b6;
    stim[8] = 9'h0ae;
    stim[9] = 9'h176;
    stim[10] = 9'h0ac;
    stim[11] = 9'h116;
    stim[12] = 9'h16c;
    stim[13] = 9'h1aa;
    stim[14] = 9'h0de;
    stim[15] = 9'h004;
    stim[16] = 9'h1ac;
    stim[17] = 9'h114;
    stim[18] = 9'h168;
    stim[19] = 9'h028;
    stim[20] = 9'h158;
    stim[21] = 9'h0a8;
    stim[22] = 9'h1ca;
    stim[23] = 9'h136;
    stim[24] = 9'h1b2;
    stim[25] = 9'h13a;
    stim[26] = 9'h0cd;
    stim[27] = 9'h01c;
    stim[28] = 9'h142;
    stim[29] = 9'h18e;
    stim[30] = 9'h0e0;
    stim[31] = 9'h048;
    stim[32] = 9'h148;
    stim[33] = 9'h0de;
    stim[34] = 9'h058;
    stim[35] = 9'h040;
    stim[36] = 9'h190;
    stim[37] = 9'h152;
    stim[38] = 9'h16a;
    stim[39] = 9'h000;
    stim[40] = 9'h0f0;
    stim[41] = 9'h066;
    stim[42] = 9'h19e;
    stim[43] = 9'h006;
    stim[44] = 9'h1cc;
    stim[45] = 9'h080;
    stim[46] = 9'h1aa;
    stim[47] = 9'h1f4;
    stim[48] = 9'h0da;
    stim[49] = 9'h132;
    stim[50] = 9'h12e;
    stim[51] = 9'h0e0;
    stim[52] = 9'h130;
    stim[53] = 9'h1d2;
    stim[54] = 9'h17e;
    stim[55] = 9'h1e0;
    stim[56] = 9'h0e4;
    stim[57] = 9'h0f8;
    stim[58] = 9'h1d4;
    stim[59] = 9'h110;
    stim[60] = 9'h0d6;
    stim[61] = 9'h1a4;
    stim[62] = 9'h11c;
    stim[63] = 9'h1e8;
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
      expv[0] = 25'hxxxxxxx;
      expv[1] = 25'h0000000;
      expv[2] = 25'h0000000;
      expv[3] = 25'h0000000;
      expv[4] = 25'h0000000;
      expv[5] = 25'h0000000;
      expv[6] = 25'h0000000;
      expv[7] = 25'h0960000;
      expv[8] = 25'h096b600;
      expv[9] = 25'h096b6af;
      expv[10] = 25'h176b6ae;
      expv[11] = 25'h176acae;
      expv[12] = 25'h176ad17;
      expv[13] = 25'h176ad16;
      expv[14] = 25'h176ad16;
      expv[15] = 25'h0dead16;
      expv[16] = 25'h0de0516;
      expv[17] = 25'h0de05ad;
      expv[18] = 25'h11405ac;
      expv[19] = 25'h11569ac;
      expv[20] = 25'h1156829;
      expv[21] = 25'h1596828;
      expv[22] = 25'h158a828;
      expv[23] = 25'h158a9cb;
      expv[24] = 25'h136a9ca;
      expv[25] = 25'h137b3ca;
      expv[26] = 25'h137b33b;
      expv[27] = 25'h0000000;
      expv[28] = 25'h01c0000;
      expv[29] = 25'h01d4200;
      expv[30] = 25'h01d438f;
      expv[31] = 25'h01d438e;
      expv[32] = 25'h01d438e;
      expv[33] = 25'h01d438e;
      expv[34] = 25'h0df438e;
      expv[35] = 25'h0de598e;
      expv[36] = 25'h0de5841;
      expv[37] = 25'h1905840;
      expv[38] = 25'h1915240;
      expv[39] = 25'h191536b;
      expv[40] = 25'h191536a;
      expv[41] = 25'h0f1536a;
      expv[42] = 25'h0f0676a;
      expv[43] = 25'h0f0679f;
      expv[44] = 25'h0f0679e;
      expv[45] = 25'h0f0679e;
      expv[46] = 25'h0f0679e;
      expv[47] = 25'h0f0679e;
      expv[48] = 25'h1f4679e;
      expv[49] = 25'h1f4db9e;
      expv[50] = 25'h1f4db33;
      expv[51] = 25'h1f4db32;
      expv[52] = 25'h1f4db32;
      expv[53] = 25'h130db32;
      expv[54] = 25'h131d332;
      expv[55] = 25'h131d37f;
      expv[56] = 25'h131d37e;
      expv[57] = 25'h131d37e;
      expv[58] = 25'h0f9d37e;
      expv[59] = 25'h0f9d57e;
      expv[60] = 25'h0f9d511;
      expv[61] = 25'h0d7d510;
      expv[62] = 25'h0d7a510;
      expv[63] = 25'h0d7a51d;
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
