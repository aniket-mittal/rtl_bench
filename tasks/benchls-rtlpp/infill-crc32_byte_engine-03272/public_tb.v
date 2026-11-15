// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03272 dut (
    .i_clk(clk),
    .i_dv(in_vec[8:8]),
    .i_data_in(in_vec[7:0]),
    .o_dv(out_vec[8:8]),
    .o_data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h16a;
    stim[1] = 9'h004;
    stim[2] = 9'h0db;
    stim[3] = 9'h0df;
    stim[4] = 9'h143;
    stim[5] = 9'h0fb;
    stim[6] = 9'h1fa;
    stim[7] = 9'h0bc;
    stim[8] = 9'h015;
    stim[9] = 9'h05e;
    stim[10] = 9'h1a4;
    stim[11] = 9'h137;
    stim[12] = 9'h1c2;
    stim[13] = 9'h063;
    stim[14] = 9'h055;
    stim[15] = 9'h09a;
    stim[16] = 9'h000;
    stim[17] = 9'h085;
    stim[18] = 9'h133;
    stim[19] = 9'h131;
    stim[20] = 9'h077;
    stim[21] = 9'h1d8;
    stim[22] = 9'h010;
    stim[23] = 9'h0c8;
    stim[24] = 9'h153;
    stim[25] = 9'h0a4;
    stim[26] = 9'h0db;
    stim[27] = 9'h014;
    stim[28] = 9'h039;
    stim[29] = 9'h15b;
    stim[30] = 9'h0e4;
    stim[31] = 9'h10f;
    stim[32] = 9'h1c8;
    stim[33] = 9'h02b;
    stim[34] = 9'h148;
    stim[35] = 9'h037;
    stim[36] = 9'h17b;
    stim[37] = 9'h144;
    stim[38] = 9'h157;
    stim[39] = 9'h1d6;
    stim[40] = 9'h09b;
    stim[41] = 9'h158;
    stim[42] = 9'h061;
    stim[43] = 9'h128;
    stim[44] = 9'h1b9;
    stim[45] = 9'h013;
    stim[46] = 9'h024;
    stim[47] = 9'h195;
    stim[48] = 9'h190;
    stim[49] = 9'h014;
    stim[50] = 9'h12e;
    stim[51] = 9'h011;
    stim[52] = 9'h149;
    stim[53] = 9'h144;
    stim[54] = 9'h096;
    stim[55] = 9'h13a;
    stim[56] = 9'h0e6;
    stim[57] = 9'h0f9;
    stim[58] = 9'h0f0;
    stim[59] = 9'h10b;
    stim[60] = 9'h0f3;
    stim[61] = 9'h15d;
    stim[62] = 9'h055;
    stim[63] = 9'h181;
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
      expv[0] = 9'h000;
      expv[1] = 9'h16a;
      expv[2] = 9'h1xx;
      expv[3] = 9'h1xx;
      expv[4] = 9'h1xx;
      expv[5] = 9'h1xx;
      expv[6] = 9'h000;
      expv[7] = 9'h1fa;
      expv[8] = 9'h100;
      expv[9] = 9'h100;
      expv[10] = 9'h100;
      expv[11] = 9'h100;
      expv[12] = 9'h000;
      expv[13] = 9'h1c2;
      expv[14] = 9'h100;
      expv[15] = 9'h100;
      expv[16] = 9'h100;
      expv[17] = 9'h100;
      expv[18] = 9'h000;
      expv[19] = 9'h133;
      expv[20] = 9'h131;
      expv[21] = 9'h1f4;
      expv[22] = 9'h141;
      expv[23] = 9'h138;
      expv[24] = 9'h1f2;
      expv[25] = 9'h000;
      expv[26] = 9'h0a4;
      expv[27] = 9'h0db;
      expv[28] = 9'h014;
      expv[29] = 9'h039;
      expv[30] = 9'h15b;
      expv[31] = 9'h100;
      expv[32] = 9'h100;
      expv[33] = 9'h100;
      expv[34] = 9'h100;
      expv[35] = 9'h000;
      expv[36] = 9'h037;
      expv[37] = 9'h17b;
      expv[38] = 9'h144;
      expv[39] = 9'h157;
      expv[40] = 9'h1d6;
      expv[41] = 9'h1ef;
      expv[42] = 9'h161;
      expv[43] = 9'h1a3;
      expv[44] = 9'h170;
      expv[45] = 9'h000;
      expv[46] = 9'h013;
      expv[47] = 9'h024;
      expv[48] = 9'h195;
      expv[49] = 9'h190;
      expv[50] = 9'h1e4;
      expv[51] = 9'h1ff;
      expv[52] = 9'h1e0;
      expv[53] = 9'h1bd;
      expv[54] = 9'h000;
      expv[55] = 9'h096;
      expv[56] = 9'h13a;
      expv[57] = 9'h100;
      expv[58] = 9'h100;
      expv[59] = 9'h100;
      expv[60] = 9'h100;
      expv[61] = 9'h000;
      expv[62] = 9'h15d;
      expv[63] = 9'h100;
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
