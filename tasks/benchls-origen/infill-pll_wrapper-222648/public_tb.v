// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_222648 dut (
    .SCLK(clk),
    .PACKAGEPIN(in_vec[12:12]),
    .DYNAMICDELAY(in_vec[11:4]),
    .BYPASS(in_vec[3:3]),
    .RESETB(in_vec[2:2]),
    .LATCHINPUTVALUE(in_vec[1:1]),
    .SDI(in_vec[0:0]),
    .PLLOUTCOREA(out_vec[5:5]),
    .PLLOUTCOREB(out_vec[4:4]),
    .PLLOUTGLOBALA(out_vec[3:3]),
    .PLLOUTGLOBALB(out_vec[2:2]),
    .LOCK(out_vec[1:1]),
    .SDO(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h111d;
    stim[1] = 13'h0085;
    stim[2] = 13'h1792;
    stim[3] = 13'h18db;
    stim[4] = 13'h19c8;
    stim[5] = 13'h1093;
    stim[6] = 13'h063a;
    stim[7] = 13'h0f43;
    stim[8] = 13'h0510;
    stim[9] = 13'h0359;
    stim[10] = 13'h0730;
    stim[11] = 13'h026a;
    stim[12] = 13'h06f3;
    stim[13] = 13'h05e3;
    stim[14] = 13'h005b;
    stim[15] = 13'h0499;
    stim[16] = 13'h1d50;
    stim[17] = 13'h078b;
    stim[18] = 13'h16d9;
    stim[19] = 13'h1e6b;
    stim[20] = 13'h0cca;
    stim[21] = 13'h0e93;
    stim[22] = 13'h1ae3;
    stim[23] = 13'h1a3b;
    stim[24] = 13'h0301;
    stim[25] = 13'h0790;
    stim[26] = 13'h0152;
    stim[27] = 13'h0d32;
    stim[28] = 13'h06f9;
    stim[29] = 13'h0f90;
    stim[30] = 13'h1928;
    stim[31] = 13'h0d71;
    stim[32] = 13'h1a10;
    stim[33] = 13'h1193;
    stim[34] = 13'h092a;
    stim[35] = 13'h1b09;
    stim[36] = 13'h1561;
    stim[37] = 13'h130b;
    stim[38] = 13'h15a9;
    stim[39] = 13'h10aa;
    stim[40] = 13'h0798;
    stim[41] = 13'h10d0;
    stim[42] = 13'h0e4b;
    stim[43] = 13'h0563;
    stim[44] = 13'h0d08;
    stim[45] = 13'h1a5b;
    stim[46] = 13'h02e8;
    stim[47] = 13'h1be9;
    stim[48] = 13'h0c22;
    stim[49] = 13'h09c0;
    stim[50] = 13'h1ac0;
    stim[51] = 13'h0b00;
    stim[52] = 13'h1e01;
    stim[53] = 13'h1039;
    stim[54] = 13'h098b;
    stim[55] = 13'h0d03;
    stim[56] = 13'h1cb2;
    stim[57] = 13'h06c3;
    stim[58] = 13'h18b2;
    stim[59] = 13'h1858;
    stim[60] = 13'h0e11;
    stim[61] = 13'h1fe8;
    stim[62] = 13'h1aa1;
    stim[63] = 13'h00c0;
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
      expv[0] = 6'h3f;
      expv[1] = 6'h03;
      expv[2] = 6'h3c;
      expv[3] = 6'h3d;
      expv[4] = 6'h3c;
      expv[5] = 6'h3d;
      expv[6] = 6'h00;
      expv[7] = 6'h01;
      expv[8] = 6'h00;
      expv[9] = 6'h01;
      expv[10] = 6'h00;
      expv[11] = 6'h00;
      expv[12] = 6'h01;
      expv[13] = 6'h01;
      expv[14] = 6'h01;
      expv[15] = 6'h01;
      expv[16] = 6'h3c;
      expv[17] = 6'h01;
      expv[18] = 6'h3d;
      expv[19] = 6'h3d;
      expv[20] = 6'h00;
      expv[21] = 6'h01;
      expv[22] = 6'h3d;
      expv[23] = 6'h3d;
      expv[24] = 6'h01;
      expv[25] = 6'h00;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h01;
      expv[29] = 6'h00;
      expv[30] = 6'h3c;
      expv[31] = 6'h01;
      expv[32] = 6'h3c;
      expv[33] = 6'h3d;
      expv[34] = 6'h00;
      expv[35] = 6'h3d;
      expv[36] = 6'h3d;
      expv[37] = 6'h3d;
      expv[38] = 6'h3d;
      expv[39] = 6'h3c;
      expv[40] = 6'h00;
      expv[41] = 6'h3c;
      expv[42] = 6'h01;
      expv[43] = 6'h01;
      expv[44] = 6'h00;
      expv[45] = 6'h3d;
      expv[46] = 6'h00;
      expv[47] = 6'h3d;
      expv[48] = 6'h00;
      expv[49] = 6'h00;
      expv[50] = 6'h3c;
      expv[51] = 6'h00;
      expv[52] = 6'h3d;
      expv[53] = 6'h3d;
      expv[54] = 6'h01;
      expv[55] = 6'h01;
      expv[56] = 6'h3c;
      expv[57] = 6'h01;
      expv[58] = 6'h3c;
      expv[59] = 6'h3c;
      expv[60] = 6'h01;
      expv[61] = 6'h3c;
      expv[62] = 6'h3d;
      expv[63] = 6'h00;
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
