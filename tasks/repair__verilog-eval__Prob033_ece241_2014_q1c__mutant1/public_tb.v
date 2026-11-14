// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .s(out_vec[8:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h156c;
    stim[1] = 16'hfea6;
    stim[2] = 16'h6d62;
    stim[3] = 16'he955;
    stim[4] = 16'hd175;
    stim[5] = 16'h3112;
    stim[6] = 16'hbff6;
    stim[7] = 16'hb938;
    stim[8] = 16'h2bdc;
    stim[9] = 16'hb1a6;
    stim[10] = 16'h854f;
    stim[11] = 16'he542;
    stim[12] = 16'h04b7;
    stim[13] = 16'hb6ba;
    stim[14] = 16'h78bf;
    stim[15] = 16'h0c0b;
    stim[16] = 16'h72d5;
    stim[17] = 16'h7126;
    stim[18] = 16'h5f6d;
    stim[19] = 16'h3652;
    stim[20] = 16'h27f5;
    stim[21] = 16'h264e;
    stim[22] = 16'h641c;
    stim[23] = 16'h5cce;
    stim[24] = 16'h9cdd;
    stim[25] = 16'h97ed;
    stim[26] = 16'ha27e;
    stim[27] = 16'h2e2f;
    stim[28] = 16'hbd6a;
    stim[29] = 16'h377e;
    stim[30] = 16'h4d10;
    stim[31] = 16'h00ab;
    stim[32] = 16'h2422;
    stim[33] = 16'hef01;
    stim[34] = 16'h9973;
    stim[35] = 16'h558d;
    stim[36] = 16'hd08c;
    stim[37] = 16'h6453;
    stim[38] = 16'h783f;
    stim[39] = 16'h3586;
    stim[40] = 16'h9a26;
    stim[41] = 16'h8aaf;
    stim[42] = 16'hd590;
    stim[43] = 16'ha08a;
    stim[44] = 16'hefdf;
    stim[45] = 16'h63d1;
    stim[46] = 16'h8096;
    stim[47] = 16'ha123;
    stim[48] = 16'he693;
    stim[49] = 16'hea81;
    stim[50] = 16'ha8a6;
    stim[51] = 16'h0ca3;
    stim[52] = 16'h85c5;
    stim[53] = 16'hc7ad;
    stim[54] = 16'h789c;
    stim[55] = 16'h9b7f;
    stim[56] = 16'hab25;
    stim[57] = 16'h2c5b;
    stim[58] = 16'h3e3b;
    stim[59] = 16'h1b51;
    stim[60] = 16'h0a37;
    stim[61] = 16'h0f95;
    stim[62] = 16'hca36;
    stim[63] = 16'h3ec8;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 9'h153;
      expv[1] = 9'h0b1;
      expv[2] = 9'h016;
      expv[3] = 9'h128;
      expv[4] = 9'h0b8;
      expv[5] = 9'h03e;
      expv[6] = 9'h192;
      expv[7] = 9'h102;
      expv[8] = 9'h09e;
      expv[9] = 9'h017;
      expv[10] = 9'h06c;
      expv[11] = 9'h146;
      expv[12] = 9'h09a;
      expv[13] = 9'h1f8;
      expv[14] = 9'h172;
      expv[15] = 9'h002;
      expv[16] = 9'h13a;
      expv[17] = 9'h096;
      expv[18] = 9'h1e5;
      expv[19] = 9'h1c9;
      expv[20] = 9'h064;
      expv[21] = 9'h1b1;
      expv[22] = 9'h090;
      expv[23] = 9'h11c;
      expv[24] = 9'h17e;
      expv[25] = 9'h154;
      expv[26] = 9'h048;
      expv[27] = 9'h1ff;
      expv[28] = 9'h0a6;
      expv[29] = 9'h173;
      expv[30] = 9'h07a;
      expv[31] = 9'h0aa;
      expv[32] = 9'h004;
      expv[33] = 9'h1dc;
      expv[34] = 9'h04c;
      expv[35] = 9'h190;
      expv[36] = 9'h089;
      expv[37] = 9'h022;
      expv[38] = 9'h072;
      expv[39] = 9'h15e;
      expv[40] = 9'h0e8;
      expv[41] = 9'h1b6;
      expv[42] = 9'h08b;
      expv[43] = 9'h02d;
      expv[44] = 9'h021;
      expv[45] = 9'h124;
      expv[46] = 9'h1d4;
      expv[47] = 9'h0fc;
      expv[48] = 9'h0a7;
      expv[49] = 9'h0d3;
      expv[50] = 9'h005;
      expv[51] = 9'h0d2;
      expv[52] = 9'h180;
      expv[53] = 9'h035;
      expv[54] = 9'h1b8;
      expv[55] = 9'h038;
      expv[56] = 9'h10c;
      expv[57] = 9'h1a3;
      expv[58] = 9'h006;
      expv[59] = 9'h195;
      expv[60] = 9'h1a7;
      expv[61] = 9'h0f4;
      expv[62] = 9'h128;
      expv[63] = 9'h0ec;
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
