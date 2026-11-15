// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_182427 dut (
    .clk(clk),
    .clrn(in_vec[12:12]),
    .d_in(in_vec[11:0]),
    .rd_a(out_vec[49:31]),
    .x(out_vec[30:23]),
    .y(out_vec[22:14]),
    .r(out_vec[13:10]),
    .g(out_vec[9:6]),
    .b(out_vec[5:2]),
    .hs(out_vec[1:1]),
    .vs(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0a4a;
    stim[1] = 13'h0518;
    stim[2] = 13'h1f70;
    stim[3] = 13'h1134;
    stim[4] = 13'h1e3e;
    stim[5] = 13'h158c;
    stim[6] = 13'h19ee;
    stim[7] = 13'h1ce0;
    stim[8] = 13'h1d00;
    stim[9] = 13'h1e3d;
    stim[10] = 13'h1e4f;
    stim[11] = 13'h174f;
    stim[12] = 13'h12f2;
    stim[13] = 13'h1a09;
    stim[14] = 13'h0e4b;
    stim[15] = 13'h1f4e;
    stim[16] = 13'h191e;
    stim[17] = 13'h150b;
    stim[18] = 13'h10f8;
    stim[19] = 13'h1797;
    stim[20] = 13'h1ddf;
    stim[21] = 13'h178c;
    stim[22] = 13'h1842;
    stim[23] = 13'h172b;
    stim[24] = 13'h1305;
    stim[25] = 13'h1db7;
    stim[26] = 13'h1aa6;
    stim[27] = 13'h14b7;
    stim[28] = 13'h1537;
    stim[29] = 13'h1652;
    stim[30] = 13'h1436;
    stim[31] = 13'h0c2c;
    stim[32] = 13'h1e81;
    stim[33] = 13'h1245;
    stim[34] = 13'h1bd1;
    stim[35] = 13'h1d4d;
    stim[36] = 13'h1b63;
    stim[37] = 13'h1f4f;
    stim[38] = 13'h1bfe;
    stim[39] = 13'h0b8c;
    stim[40] = 13'h174d;
    stim[41] = 13'h1884;
    stim[42] = 13'h1bba;
    stim[43] = 13'h122e;
    stim[44] = 13'h11ee;
    stim[45] = 13'h1269;
    stim[46] = 13'h1b4a;
    stim[47] = 13'h19f0;
    stim[48] = 13'h1b36;
    stim[49] = 13'h1b2c;
    stim[50] = 13'h1b89;
    stim[51] = 13'h1c66;
    stim[52] = 13'h17fb;
    stim[53] = 13'h157a;
    stim[54] = 13'h147b;
    stim[55] = 13'h1139;
    stim[56] = 13'h147c;
    stim[57] = 13'h15ce;
    stim[58] = 13'h1f02;
    stim[59] = 13'h17ee;
    stim[60] = 13'h1f04;
    stim[61] = 13'h193a;
    stim[62] = 13'h1724;
    stim[63] = 13'h1705;
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
      expv[0] = 50'h0000000000000;
      expv[1] = 50'h0000000000000;
      expv[2] = 50'h0000000000000;
      expv[3] = 50'h0000080000000;
      expv[4] = 50'h0000080000000;
      expv[5] = 50'h0000100000000;
      expv[6] = 50'h0000100000000;
      expv[7] = 50'h0000180000000;
      expv[8] = 50'h0000180000000;
      expv[9] = 50'h0000200800000;
      expv[10] = 50'h0000200800000;
      expv[11] = 50'h0000280800000;
      expv[12] = 50'h0000280800000;
      expv[13] = 50'h0000300800000;
      expv[14] = 50'h0000000000000;
      expv[15] = 50'h0000000000000;
      expv[16] = 50'h0000080000000;
      expv[17] = 50'h0000080000000;
      expv[18] = 50'h0000100000000;
      expv[19] = 50'h0000100000000;
      expv[20] = 50'h0000180000000;
      expv[21] = 50'h0000180000000;
      expv[22] = 50'h0000200800000;
      expv[23] = 50'h0000200800000;
      expv[24] = 50'h0000280800000;
      expv[25] = 50'h0000280800000;
      expv[26] = 50'h0000300800000;
      expv[27] = 50'h0000300800000;
      expv[28] = 50'h0000380800000;
      expv[29] = 50'h0000380800000;
      expv[30] = 50'h0000401000000;
      expv[31] = 50'h0000000000000;
      expv[32] = 50'h0000000000000;
      expv[33] = 50'h0000080000000;
      expv[34] = 50'h0000080000000;
      expv[35] = 50'h0000100000000;
      expv[36] = 50'h0000100000000;
      expv[37] = 50'h0000180000000;
      expv[38] = 50'h0000180000000;
      expv[39] = 50'h0000000000000;
      expv[40] = 50'h0000000000000;
      expv[41] = 50'h0000080000000;
      expv[42] = 50'h0000080000000;
      expv[43] = 50'h0000100000000;
      expv[44] = 50'h0000100000000;
      expv[45] = 50'h0000180000000;
      expv[46] = 50'h0000180000000;
      expv[47] = 50'h0000200800000;
      expv[48] = 50'h0000200800000;
      expv[49] = 50'h0000280800000;
      expv[50] = 50'h0000280800000;
      expv[51] = 50'h0000300800000;
      expv[52] = 50'h0000300800000;
      expv[53] = 50'h0000380800000;
      expv[54] = 50'h0000380800000;
      expv[55] = 50'h0000401000000;
      expv[56] = 50'h0000401000000;
      expv[57] = 50'h0000481000000;
      expv[58] = 50'h0000481000000;
      expv[59] = 50'h0000501000000;
      expv[60] = 50'h0000501000000;
      expv[61] = 50'h0000581000000;
      expv[62] = 50'h0000581000000;
      expv[63] = 50'h0000601800000;
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
