// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11648 dut (
    .clk(clk),
    .rst(in_vec[17:17]),
    .idata(in_vec[16:9]),
    .ivalid(in_vec[8:8]),
    .strobe(in_vec[7:0]),
    .odata(out_vec[8:1]),
    .ovalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h351e4;
    stim[1] = 18'h2d836;
    stim[2] = 18'h0e2d7;
    stim[3] = 18'h0df9b;
    stim[4] = 18'h07ae7;
    stim[5] = 18'h0881c;
    stim[6] = 18'h10ffb;
    stim[7] = 18'h13a9d;
    stim[8] = 18'h16c48;
    stim[9] = 18'h03628;
    stim[10] = 18'h17bd2;
    stim[11] = 18'h0dcd1;
    stim[12] = 18'h18b6e;
    stim[13] = 18'h127b3;
    stim[14] = 18'h1aab7;
    stim[15] = 18'h1523a;
    stim[16] = 18'h046a1;
    stim[17] = 18'h15f2d;
    stim[18] = 18'h134b9;
    stim[19] = 18'h1cc7e;
    stim[20] = 18'h0dc45;
    stim[21] = 18'h177e2;
    stim[22] = 18'h19b17;
    stim[23] = 18'h0b44f;
    stim[24] = 18'h01028;
    stim[25] = 18'h0d8b3;
    stim[26] = 18'h081c5;
    stim[27] = 18'h02b6d;
    stim[28] = 18'h0348b;
    stim[29] = 18'h1edfa;
    stim[30] = 18'h0ce49;
    stim[31] = 18'h119f9;
    stim[32] = 18'h1626a;
    stim[33] = 18'h17621;
    stim[34] = 18'h0afdb;
    stim[35] = 18'h1b3e1;
    stim[36] = 18'h15e46;
    stim[37] = 18'h0f1a0;
    stim[38] = 18'h139df;
    stim[39] = 18'h118eb;
    stim[40] = 18'h141f6;
    stim[41] = 18'h007e3;
    stim[42] = 18'h1799e;
    stim[43] = 18'h024e3;
    stim[44] = 18'h0fbff;
    stim[45] = 18'h03751;
    stim[46] = 18'h23a51;
    stim[47] = 18'h1d94c;
    stim[48] = 18'h037de;
    stim[49] = 18'h0a816;
    stim[50] = 18'h1e0d0;
    stim[51] = 18'h0993b;
    stim[52] = 18'h00a48;
    stim[53] = 18'h07ca5;
    stim[54] = 18'h1fa89;
    stim[55] = 18'h0003c;
    stim[56] = 18'h11c40;
    stim[57] = 18'h1aa3c;
    stim[58] = 18'h09778;
    stim[59] = 18'h0b949;
    stim[60] = 18'h1c24f;
    stim[61] = 18'h01af8;
    stim[62] = 18'h0333c;
    stim[63] = 18'h0f6e3;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h001;
      expv[5] = 9'h0de;
      expv[6] = 9'h0de;
      expv[7] = 9'h0df;
      expv[8] = 9'h10e;
      expv[9] = 9'h10e;
      expv[10] = 9'h10e;
      expv[11] = 9'h10f;
      expv[12] = 9'h17a;
      expv[13] = 9'h17b;
      expv[14] = 9'h18b;
      expv[15] = 9'h126;
      expv[16] = 9'h126;
      expv[17] = 9'h126;
      expv[18] = 9'h127;
      expv[19] = 9'h15e;
      expv[20] = 9'h15e;
      expv[21] = 9'h15e;
      expv[22] = 9'h15f;
      expv[23] = 9'h177;
      expv[24] = 9'h19a;
      expv[25] = 9'h19a;
      expv[26] = 9'h19a;
      expv[27] = 9'h19b;
      expv[28] = 9'h081;
      expv[29] = 9'h02a;
      expv[30] = 9'h02b;
      expv[31] = 9'h1ec;
      expv[32] = 9'h1ed;
      expv[33] = 9'h118;
      expv[34] = 9'h118;
      expv[35] = 9'h119;
      expv[36] = 9'h0af;
      expv[37] = 9'h1b2;
      expv[38] = 9'h1b3;
      expv[39] = 9'h0f1;
      expv[40] = 9'h138;
      expv[41] = 9'h139;
      expv[42] = 9'h141;
      expv[43] = 9'h007;
      expv[44] = 9'h178;
      expv[45] = 9'h179;
      expv[46] = 9'h0fb;
      expv[47] = 9'h036;
      expv[48] = 9'h001;
      expv[49] = 9'h1d9;
      expv[50] = 9'h036;
      expv[51] = 9'h036;
      expv[52] = 9'h037;
      expv[53] = 9'h098;
      expv[54] = 9'h098;
      expv[55] = 9'h098;
      expv[56] = 9'h098;
      expv[57] = 9'h098;
      expv[58] = 9'h098;
      expv[59] = 9'h099;
      expv[60] = 9'h097;
      expv[61] = 9'h0b8;
      expv[62] = 9'h0b8;
      expv[63] = 9'h0b9;
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
