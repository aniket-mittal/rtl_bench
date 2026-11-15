// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 26;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06957 dut (
    .clock(clk),
    .reset(in_vec[10:10]),
    .start(in_vec[9:9]),
    .N(in_vec[8:0]),
    .dp(out_vec[25:17]),
    .done(out_vec[16:16]),
    .counter(out_vec[15:8]),
    .sr(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h580;
    stim[1] = 11'h44f;
    stim[2] = 11'h15b;
    stim[3] = 11'h174;
    stim[4] = 11'h139;
    stim[5] = 11'h357;
    stim[6] = 11'h019;
    stim[7] = 11'h14b;
    stim[8] = 11'h1ad;
    stim[9] = 11'h11b;
    stim[10] = 11'h3cb;
    stim[11] = 11'h2b5;
    stim[12] = 11'h20f;
    stim[13] = 11'h0a2;
    stim[14] = 11'h38f;
    stim[15] = 11'h097;
    stim[16] = 11'h2e1;
    stim[17] = 11'h146;
    stim[18] = 11'h3e8;
    stim[19] = 11'h3cb;
    stim[20] = 11'h101;
    stim[21] = 11'h2a6;
    stim[22] = 11'h1ac;
    stim[23] = 11'h405;
    stim[24] = 11'h177;
    stim[25] = 11'h0b3;
    stim[26] = 11'h100;
    stim[27] = 11'h39c;
    stim[28] = 11'h0d0;
    stim[29] = 11'h3fd;
    stim[30] = 11'h034;
    stim[31] = 11'h356;
    stim[32] = 11'h06e;
    stim[33] = 11'h310;
    stim[34] = 11'h212;
    stim[35] = 11'h276;
    stim[36] = 11'h2b4;
    stim[37] = 11'h0a1;
    stim[38] = 11'h343;
    stim[39] = 11'h246;
    stim[40] = 11'h138;
    stim[41] = 11'h179;
    stim[42] = 11'h2a2;
    stim[43] = 11'h062;
    stim[44] = 11'h312;
    stim[45] = 11'h00c;
    stim[46] = 11'h179;
    stim[47] = 11'h0e6;
    stim[48] = 11'h29b;
    stim[49] = 11'h083;
    stim[50] = 11'h094;
    stim[51] = 11'h3cb;
    stim[52] = 11'h313;
    stim[53] = 11'h39f;
    stim[54] = 11'h38c;
    stim[55] = 11'h001;
    stim[56] = 11'h354;
    stim[57] = 11'h27a;
    stim[58] = 11'h072;
    stim[59] = 11'h09f;
    stim[60] = 11'h0cb;
    stim[61] = 11'h240;
    stim[62] = 11'h27d;
    stim[63] = 11'h306;
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
      expv[0] = 26'h0000000;
      expv[1] = 26'h0000000;
      expv[2] = 26'h0000000;
      expv[3] = 26'h0005500;
      expv[4] = 26'h0005401;
      expv[5] = 26'h0005303;
      expv[6] = 26'h0005207;
      expv[7] = 26'h000510f;
      expv[8] = 26'h000501e;
      expv[9] = 26'h0004f3d;
      expv[10] = 26'h0004e7a;
      expv[11] = 26'h0004df4;
      expv[12] = 26'h0004ce8;
      expv[13] = 26'h0004bd0;
      expv[14] = 26'h0004aa1;
      expv[15] = 26'h0004943;
      expv[16] = 26'h0004887;
      expv[17] = 26'h000470e;
      expv[18] = 26'h000461c;
      expv[19] = 26'h0004539;
      expv[20] = 26'h0004472;
      expv[21] = 26'h00043e5;
      expv[22] = 26'h00042cb;
      expv[23] = 26'h0000000;
      expv[24] = 26'h0000000;
      expv[25] = 26'h0004700;
      expv[26] = 26'h0004601;
      expv[27] = 26'h0004503;
      expv[28] = 26'h0004407;
      expv[29] = 26'h000430f;
      expv[30] = 26'h000421e;
      expv[31] = 26'h000413d;
      expv[32] = 26'h000407a;
      expv[33] = 26'h0003ff4;
      expv[34] = 26'h0003ee8;
      expv[35] = 26'h0003dd0;
      expv[36] = 26'h0003ca1;
      expv[37] = 26'h0003b43;
      expv[38] = 26'h0003a87;
      expv[39] = 26'h000390e;
      expv[40] = 26'h000381c;
      expv[41] = 26'h0003739;
      expv[42] = 26'h0003672;
      expv[43] = 26'h00035e5;
      expv[44] = 26'h00034cb;
      expv[45] = 26'h0003397;
      expv[46] = 26'h000322f;
      expv[47] = 26'h000315f;
      expv[48] = 26'h00030bf;
      expv[49] = 26'h0002f7f;
      expv[50] = 26'h0002efe;
      expv[51] = 26'h0002dfd;
      expv[52] = 26'h0002cfb;
      expv[53] = 26'h0002bf7;
      expv[54] = 26'h0002aee;
      expv[55] = 26'h00029dc;
      expv[56] = 26'h00028b8;
      expv[57] = 26'h0002771;
      expv[58] = 26'h00026e3;
      expv[59] = 26'h00025c7;
      expv[60] = 26'h000248e;
      expv[61] = 26'h000231d;
      expv[62] = 26'h000223b;
      expv[63] = 26'h0002176;
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
