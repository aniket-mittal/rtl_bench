// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_179329 dut (
    .clk(clk),
    .MemRead(in_vec[44:44]),
    .MemWrite(in_vec[43:43]),
    .addr(in_vec[42:35]),
    .funct3(in_vec[34:32]),
    .data_in(in_vec[31:0]),
    .data_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h08e0181e95cf;
    stim[1] = 45'h0c113819504a;
    stim[2] = 45'h19f4211641a6;
    stim[3] = 45'h104c55d5d360;
    stim[4] = 45'h0dc66ea13349;
    stim[5] = 45'h07c4fa614f7a;
    stim[6] = 45'h15c5b3426034;
    stim[7] = 45'h0fe4592adc32;
    stim[8] = 45'h19e1898ba5b8;
    stim[9] = 45'h01968a6504a1;
    stim[10] = 45'h014347e3e124;
    stim[11] = 45'h0bc33195fb84;
    stim[12] = 45'h1937db24b993;
    stim[13] = 45'h17ec35bb75cb;
    stim[14] = 45'h146c8a8a7fbd;
    stim[15] = 45'h00c3f1559841;
    stim[16] = 45'h108c2d43fb69;
    stim[17] = 45'h1d58911dbf6d;
    stim[18] = 45'h1351afcc293f;
    stim[19] = 45'h1111bc10911d;
    stim[20] = 45'h0017ad79d17a;
    stim[21] = 45'h02443c073fbf;
    stim[22] = 45'h0b13382d5561;
    stim[23] = 45'h0f2ff169d924;
    stim[24] = 45'h0497a8d59983;
    stim[25] = 45'h0b290b3b82cc;
    stim[26] = 45'h0694d9885ca9;
    stim[27] = 45'h143eb42cf5c6;
    stim[28] = 45'h06626e5fa443;
    stim[29] = 45'h0cab522aa727;
    stim[30] = 45'h100207c4fb8c;
    stim[31] = 45'h00d15f9f2d10;
    stim[32] = 45'h04421fa3683f;
    stim[33] = 45'h1645ea047acb;
    stim[34] = 45'h00de47fc5503;
    stim[35] = 45'h098a08480773;
    stim[36] = 45'h0ff559e04990;
    stim[37] = 45'h0699d6995831;
    stim[38] = 45'h1afb1120795c;
    stim[39] = 45'h1f09da6a8aa0;
    stim[40] = 45'h0de7cf40923a;
    stim[41] = 45'h0f72bb25059c;
    stim[42] = 45'h08f889519109;
    stim[43] = 45'h13b67f83de72;
    stim[44] = 45'h1a2179764e60;
    stim[45] = 45'h098335eeb8b5;
    stim[46] = 45'h18245e0a87a2;
    stim[47] = 45'h02b8e2f7858f;
    stim[48] = 45'h0034fc459464;
    stim[49] = 45'h1402d6d3519f;
    stim[50] = 45'h154281ecde21;
    stim[51] = 45'h0a810a60db0a;
    stim[52] = 45'h1b92d287966e;
    stim[53] = 45'h1e20ae0bf38f;
    stim[54] = 45'h17313022c997;
    stim[55] = 45'h02ec4d105a4a;
    stim[56] = 45'h07b748a28edb;
    stim[57] = 45'h0b2612970696;
    stim[58] = 45'h0ec8311d86ad;
    stim[59] = 45'h1f8ea449877a;
    stim[60] = 45'h11bb647d32b4;
    stim[61] = 45'h18c9ce75b763;
    stim[62] = 45'h07bfb6757095;
    stim[63] = 45'h1313903cc995;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'h000000xx;
      expv[4] = 32'h000000xx;
      expv[5] = 32'h000000xx;
      expv[6] = 32'h000000xx;
      expv[7] = 32'h0000xxxx;
      expv[8] = 32'h0000xxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'h00000000;
      expv[14] = 32'h000000xx;
      expv[15] = 32'h000000xx;
      expv[16] = 32'h000000xx;
      expv[17] = 32'h000000xx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h44332211;
      expv[32] = 32'h44332211;
      expv[33] = 32'h44332211;
      expv[34] = 32'h0000xxxx;
      expv[35] = 32'h0000xxxx;
      expv[36] = 32'h0000xxxx;
      expv[37] = 32'h0000xxxx;
      expv[38] = 32'h0000xxxx;
      expv[39] = 32'h00000000;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'h00000000;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'h000000xx;
      expv[48] = 32'h000000xx;
      expv[49] = 32'h000000xx;
      expv[50] = 32'h504axxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
