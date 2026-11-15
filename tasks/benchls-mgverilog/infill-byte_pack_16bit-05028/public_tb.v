// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05028 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .out_valid(in_vec[9:9]),
    .out_done(in_vec[8:8]),
    .out_data(in_vec[7:0]),
    .data_o(out_vec[17:2]),
    .valid_o(out_vec[1:1]),
    .done_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h758;
    stim[1] = 11'h5f6;
    stim[2] = 11'h317;
    stim[3] = 11'h2aa;
    stim[4] = 11'h1c7;
    stim[5] = 11'h37b;
    stim[6] = 11'h3d1;
    stim[7] = 11'h370;
    stim[8] = 11'h000;
    stim[9] = 11'h135;
    stim[10] = 11'h39e;
    stim[11] = 11'h337;
    stim[12] = 11'h1f4;
    stim[13] = 11'h191;
    stim[14] = 11'h015;
    stim[15] = 11'h138;
    stim[16] = 11'h293;
    stim[17] = 11'h03c;
    stim[18] = 11'h0a3;
    stim[19] = 11'h022;
    stim[20] = 11'h3d8;
    stim[21] = 11'h1c8;
    stim[22] = 11'h1ee;
    stim[23] = 11'h008;
    stim[24] = 11'h38e;
    stim[25] = 11'h31d;
    stim[26] = 11'h13d;
    stim[27] = 11'h239;
    stim[28] = 11'h200;
    stim[29] = 11'h379;
    stim[30] = 11'h007;
    stim[31] = 11'h091;
    stim[32] = 11'h188;
    stim[33] = 11'h2a1;
    stim[34] = 11'h1a9;
    stim[35] = 11'h027;
    stim[36] = 11'h3ad;
    stim[37] = 11'h061;
    stim[38] = 11'h2f9;
    stim[39] = 11'h1f5;
    stim[40] = 11'h1ef;
    stim[41] = 11'h034;
    stim[42] = 11'h328;
    stim[43] = 11'h3b5;
    stim[44] = 11'h108;
    stim[45] = 11'h2b5;
    stim[46] = 11'h395;
    stim[47] = 11'h196;
    stim[48] = 11'h357;
    stim[49] = 11'h333;
    stim[50] = 11'h2f8;
    stim[51] = 11'h170;
    stim[52] = 11'h0a0;
    stim[53] = 11'h289;
    stim[54] = 11'h125;
    stim[55] = 11'h17e;
    stim[56] = 11'h3a0;
    stim[57] = 11'h138;
    stim[58] = 11'h12d;
    stim[59] = 11'h3d3;
    stim[60] = 11'h38f;
    stim[61] = 11'h48b;
    stim[62] = 11'h03d;
    stim[63] = 11'h266;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'hxxx61;
      expv[2] = 18'hxxx61;
      expv[3] = 18'hxxx5d;
      expv[4] = 18'h2a85e;
      expv[5] = 18'h2a85d;
      expv[6] = 18'h2a9ed;
      expv[7] = 18'h345ef;
      expv[8] = 18'h345c1;
      expv[9] = 18'h345c0;
      expv[10] = 18'h345c1;
      expv[11] = 18'h279c3;
      expv[12] = 18'h278dd;
      expv[13] = 18'h278dd;
      expv[14] = 18'h278dd;
      expv[15] = 18'h278dc;
      expv[16] = 18'h278dd;
      expv[17] = 18'h24cde;
      expv[18] = 18'h24cdc;
      expv[19] = 18'h24cdc;
      expv[20] = 18'h24cdc;
      expv[21] = 18'h24f61;
      expv[22] = 18'h24f61;
      expv[23] = 18'h24f61;
      expv[24] = 18'h24f60;
      expv[25] = 18'h23b63;
      expv[26] = 18'h23875;
      expv[27] = 18'h23875;
      expv[28] = 18'h0e476;
      expv[29] = 18'h0e400;
      expv[30] = 18'h1e403;
      expv[31] = 18'h1e400;
      expv[32] = 18'h1e400;
      expv[33] = 18'h1e401;
      expv[34] = 18'h1e684;
      expv[35] = 18'h1e685;
      expv[36] = 18'h1e684;
      expv[37] = 18'h2b687;
      expv[38] = 18'h2b684;
      expv[39] = 18'h2b7e4;
      expv[40] = 18'h2b7e5;
      expv[41] = 18'h2b7e5;
      expv[42] = 18'h2b7e4;
      expv[43] = 18'h0a3e7;
      expv[44] = 18'h0a2d5;
      expv[45] = 18'h0a2d5;
      expv[46] = 18'h2d6d6;
      expv[47] = 18'h2d655;
      expv[48] = 18'h2d655;
      expv[49] = 18'h15e57;
      expv[50] = 18'h15ccd;
      expv[51] = 18'h3e0ce;
      expv[52] = 18'h3e0cd;
      expv[53] = 18'h3e0cc;
      expv[54] = 18'h3e224;
      expv[55] = 18'h3e225;
      expv[56] = 18'h3e225;
      expv[57] = 18'h28227;
      expv[58] = 18'h28225;
      expv[59] = 18'h28225;
      expv[60] = 18'h2834d;
      expv[61] = 18'h23f4f;
      expv[62] = 18'h23f4c;
      expv[63] = 18'h23f4c;
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
