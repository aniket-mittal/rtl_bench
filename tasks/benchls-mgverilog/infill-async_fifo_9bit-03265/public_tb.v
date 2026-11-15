// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03265 dut (
    .clk_in(clk),
    .rst_in(in_vec[12:12]),
    .clk_out(in_vec[11:11]),
    .fifo_in(in_vec[10:2]),
    .push(in_vec[1:1]),
    .pop(in_vec[0:0]),
    .full(out_vec[10:10]),
    .fifo_out(out_vec[9:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h006a;
    stim[1] = 13'h0812;
    stim[2] = 13'h117d;
    stim[3] = 13'h1e34;
    stim[4] = 13'h1e04;
    stim[5] = 13'h1788;
    stim[6] = 13'h1e3b;
    stim[7] = 13'h18aa;
    stim[8] = 13'h1ebe;
    stim[9] = 13'h1115;
    stim[10] = 13'h13b5;
    stim[11] = 13'h10e0;
    stim[12] = 13'h17f6;
    stim[13] = 13'h12a3;
    stim[14] = 13'h1a54;
    stim[15] = 13'h1eba;
    stim[16] = 13'h14cc;
    stim[17] = 13'h1ba6;
    stim[18] = 13'h1ea5;
    stim[19] = 13'h19d8;
    stim[20] = 13'h1680;
    stim[21] = 13'h110e;
    stim[22] = 13'h147e;
    stim[23] = 13'h1a8b;
    stim[24] = 13'h1891;
    stim[25] = 13'h14d6;
    stim[26] = 13'h159f;
    stim[27] = 13'h11a3;
    stim[28] = 13'h1c0b;
    stim[29] = 13'h14c9;
    stim[30] = 13'h1b3a;
    stim[31] = 13'h1c38;
    stim[32] = 13'h1f22;
    stim[33] = 13'h165c;
    stim[34] = 13'h1086;
    stim[35] = 13'h16b9;
    stim[36] = 13'h1f9b;
    stim[37] = 13'h1ae0;
    stim[38] = 13'h141c;
    stim[39] = 13'h1034;
    stim[40] = 13'h1682;
    stim[41] = 13'h1029;
    stim[42] = 13'h11e1;
    stim[43] = 13'h1bd7;
    stim[44] = 13'h1cee;
    stim[45] = 13'h136b;
    stim[46] = 13'h1b99;
    stim[47] = 13'h1469;
    stim[48] = 13'h1afc;
    stim[49] = 13'h10c4;
    stim[50] = 13'h1ace;
    stim[51] = 13'h1aba;
    stim[52] = 13'h1baa;
    stim[53] = 13'h154d;
    stim[54] = 13'h1072;
    stim[55] = 13'h1757;
    stim[56] = 13'h187e;
    stim[57] = 13'h1256;
    stim[58] = 13'h1c05;
    stim[59] = 13'h1364;
    stim[60] = 13'h1422;
    stim[61] = 13'h1e4d;
    stim[62] = 13'h1de9;
    stim[63] = 13'h1b45;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'hxxx;
      expv[4] = 11'hxxx;
      expv[5] = 11'hxxx;
      expv[6] = 11'hxxx;
      expv[7] = 11'h31d;
      expv[8] = 11'h055;
      expv[9] = 11'h35f;
      expv[10] = 11'h35f;
      expv[11] = 11'h35f;
      expv[12] = 11'h35f;
      expv[13] = 11'h3fb;
      expv[14] = 11'h151;
      expv[15] = 11'h151;
      expv[16] = 11'h35d;
      expv[17] = 11'h35d;
      expv[18] = 11'h1d3;
      expv[19] = 11'h1d3;
      expv[20] = 11'h1d3;
      expv[21] = 11'h1d3;
      expv[22] = 11'h087;
      expv[23] = 11'h23f;
      expv[24] = 11'h145;
      expv[25] = 11'h145;
      expv[26] = 11'h26b;
      expv[27] = 11'h2cf;
      expv[28] = 11'h0d1;
      expv[29] = 11'h205;
      expv[30] = 11'h205;
      expv[31] = 11'h19d;
      expv[32] = 11'h19d;
      expv[33] = 11'h391;
      expv[34] = 11'h391;
      expv[35] = 11'h043;
      expv[36] = 11'h043;
      expv[37] = 11'h3cd;
      expv[38] = 11'h3cd;
      expv[39] = 11'h3cd;
      expv[40] = 11'h3cd;
      expv[41] = 11'h341;
      expv[42] = 11'h341;
      expv[43] = 11'h341;
      expv[44] = 11'h1eb;
      expv[45] = 11'h277;
      expv[46] = 11'h1b5;
      expv[47] = 11'h1b5;
      expv[48] = 11'h1b5;
      expv[49] = 11'h1b5;
      expv[50] = 11'h1b5;
      expv[51] = 11'h167;
      expv[52] = 11'h15d;
      expv[53] = 11'h1d5;
      expv[54] = 11'h1d5;
      expv[55] = 11'h039;
      expv[56] = 11'h3ab;
      expv[57] = 11'h03f;
      expv[58] = 11'h12b;
      expv[59] = 11'h12b;
      expv[60] = 11'h12b;
      expv[61] = 11'h211;
      expv[62] = 11'h211;
      expv[63] = 11'h211;
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
