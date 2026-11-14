// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10557 dut (
    .clk(clk),
    .rst(in_vec[8:8]),
    .pos(in_vec[7:0]),
    .wavelength(out_vec[23:16]),
    .value(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h175;
    stim[1] = 9'h158;
    stim[2] = 9'h075;
    stim[3] = 9'h084;
    stim[4] = 9'h0f2;
    stim[5] = 9'h075;
    stim[6] = 9'h0a8;
    stim[7] = 9'h07b;
    stim[8] = 9'h008;
    stim[9] = 9'h07b;
    stim[10] = 9'h063;
    stim[11] = 9'h0da;
    stim[12] = 9'h025;
    stim[13] = 9'h018;
    stim[14] = 9'h057;
    stim[15] = 9'h088;
    stim[16] = 9'h036;
    stim[17] = 9'h0f3;
    stim[18] = 9'h0fb;
    stim[19] = 9'h0ce;
    stim[20] = 9'h0ff;
    stim[21] = 9'h053;
    stim[22] = 9'h0c2;
    stim[23] = 9'h00f;
    stim[24] = 9'h00f;
    stim[25] = 9'h059;
    stim[26] = 9'h073;
    stim[27] = 9'h01b;
    stim[28] = 9'h025;
    stim[29] = 9'h00a;
    stim[30] = 9'h02c;
    stim[31] = 9'h028;
    stim[32] = 9'h05b;
    stim[33] = 9'h09d;
    stim[34] = 9'h016;
    stim[35] = 9'h07e;
    stim[36] = 9'h0c1;
    stim[37] = 9'h092;
    stim[38] = 9'h0a6;
    stim[39] = 9'h0bf;
    stim[40] = 9'h0fc;
    stim[41] = 9'h0e4;
    stim[42] = 9'h029;
    stim[43] = 9'h0c0;
    stim[44] = 9'h0ec;
    stim[45] = 9'h0d3;
    stim[46] = 9'h060;
    stim[47] = 9'h02e;
    stim[48] = 9'h0d7;
    stim[49] = 9'h04b;
    stim[50] = 9'h0e0;
    stim[51] = 9'h192;
    stim[52] = 9'h083;
    stim[53] = 9'h082;
    stim[54] = 9'h018;
    stim[55] = 9'h0b0;
    stim[56] = 9'h0a9;
    stim[57] = 9'h005;
    stim[58] = 9'h03a;
    stim[59] = 9'h098;
    stim[60] = 9'h0b4;
    stim[61] = 9'h0d5;
    stim[62] = 9'h0f0;
    stim[63] = 9'h032;
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
      expv[0] = 24'h2cxxxx;
      expv[1] = 24'h2cxxxx;
      expv[2] = 24'h2cxxxx;
      expv[3] = 24'h2cxxxx;
      expv[4] = 24'h2cxxxx;
      expv[5] = 24'h2cxxxx;
      expv[6] = 24'h2cxxxx;
      expv[7] = 24'h2cxxxx;
      expv[8] = 24'h2c746e;
      expv[9] = 24'h2cxxxx;
      expv[10] = 24'h2cxxxx;
      expv[11] = 24'h2cxxxx;
      expv[12] = 24'h2c9452;
      expv[13] = 24'h2cdbf1;
      expv[14] = 24'h2cxxxx;
      expv[15] = 24'h2cxxxx;
      expv[16] = 24'h2cxxxx;
      expv[17] = 24'h2cxxxx;
      expv[18] = 24'h2cxxxx;
      expv[19] = 24'h2cxxxx;
      expv[20] = 24'h2cxxxx;
      expv[21] = 24'h2cxxxx;
      expv[22] = 24'h2cxxxx;
      expv[23] = 24'h2c6bae;
      expv[24] = 24'h2c6bae;
      expv[25] = 24'h2cxxxx;
      expv[26] = 24'h2cxxxx;
      expv[27] = 24'h2cac2e;
      expv[28] = 24'h2c9452;
      expv[29] = 24'h2c7eb2;
      expv[30] = 24'h2cxxxx;
      expv[31] = 24'h2cbacd;
      expv[32] = 24'h2cxxxx;
      expv[33] = 24'h2cxxxx;
      expv[34] = 24'h2c0000;
      expv[35] = 24'h2cxxxx;
      expv[36] = 24'h2cxxxx;
      expv[37] = 24'h2cxxxx;
      expv[38] = 24'h2cxxxx;
      expv[39] = 24'h2cxxxx;
      expv[40] = 24'h2cxxxx;
      expv[41] = 24'h2cxxxx;
      expv[42] = 24'h2ccad4;
      expv[43] = 24'h2cxxxx;
      expv[44] = 24'h2cxxxx;
      expv[45] = 24'h2cxxxx;
      expv[46] = 24'h2cxxxx;
      expv[47] = 24'h2cxxxx;
      expv[48] = 24'h2cxxxx;
      expv[49] = 24'h2cxxxx;
      expv[50] = 24'h2cxxxx;
      expv[51] = 24'h2cxxxx;
      expv[52] = 24'h2cxxxx;
      expv[53] = 24'h2cxxxx;
      expv[54] = 24'h2cdbf1;
      expv[55] = 24'h2cxxxx;
      expv[56] = 24'h2cxxxx;
      expv[57] = 24'h2c53d2;
      expv[58] = 24'h2cxxxx;
      expv[59] = 24'h2cxxxx;
      expv[60] = 24'h2cxxxx;
      expv[61] = 24'h2cxxxx;
      expv[62] = 24'h2cxxxx;
      expv[63] = 24'h2cxxxx;
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
