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

  mg_05341 dut (
    .u(in_vec[17:0]),
    .y(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h0acf3;
    stim[1] = 18'h0bc66;
    stim[2] = 18'h142bc;
    stim[3] = 18'h23713;
    stim[4] = 18'h10b17;
    stim[5] = 18'h09dbe;
    stim[6] = 18'h0cfb6;
    stim[7] = 18'h1dbb4;
    stim[8] = 18'h01f1f;
    stim[9] = 18'h0bca9;
    stim[10] = 18'h15f5c;
    stim[11] = 18'h17bee;
    stim[12] = 18'h33733;
    stim[13] = 18'h2109a;
    stim[14] = 18'h19f36;
    stim[15] = 18'h1c873;
    stim[16] = 18'h225d8;
    stim[17] = 18'h3f2e9;
    stim[18] = 18'h25122;
    stim[19] = 18'h15246;
    stim[20] = 18'h18b9b;
    stim[21] = 18'h1508b;
    stim[22] = 18'h3d6bc;
    stim[23] = 18'h23396;
    stim[24] = 18'h32024;
    stim[25] = 18'h1532f;
    stim[26] = 18'h29426;
    stim[27] = 18'h08bb0;
    stim[28] = 18'h158c5;
    stim[29] = 18'h34a37;
    stim[30] = 18'h01144;
    stim[31] = 18'h3a701;
    stim[32] = 18'h3d37f;
    stim[33] = 18'h23aef;
    stim[34] = 18'h3ed30;
    stim[35] = 18'h328f6;
    stim[36] = 18'h00a82;
    stim[37] = 18'h0ae92;
    stim[38] = 18'h03748;
    stim[39] = 18'h1d549;
    stim[40] = 18'h1a1c4;
    stim[41] = 18'h13166;
    stim[42] = 18'h128d5;
    stim[43] = 18'h0157b;
    stim[44] = 18'h24ce8;
    stim[45] = 18'h27e2b;
    stim[46] = 18'h212e6;
    stim[47] = 18'h23103;
    stim[48] = 18'h1a65b;
    stim[49] = 18'h309a6;
    stim[50] = 18'h03826;
    stim[51] = 18'h183ec;
    stim[52] = 18'h0356a;
    stim[53] = 18'h092f1;
    stim[54] = 18'h1e5c8;
    stim[55] = 18'h1adc9;
    stim[56] = 18'h18054;
    stim[57] = 18'h04bf9;
    stim[58] = 18'h35891;
    stim[59] = 18'h29fb0;
    stim[60] = 18'h08fe2;
    stim[61] = 18'h2b7bc;
    stim[62] = 18'h0005b;
    stim[63] = 18'h3f24e;
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
      expv[0] = 9'h056;
      expv[1] = 9'h05e;
      expv[2] = 9'h0a1;
      expv[3] = 9'h11b;
      expv[4] = 9'h085;
      expv[5] = 9'h04e;
      expv[6] = 9'h067;
      expv[7] = 9'h0ed;
      expv[8] = 9'h00f;
      expv[9] = 9'h05e;
      expv[10] = 9'h0af;
      expv[11] = 9'h0bd;
      expv[12] = 9'h19b;
      expv[13] = 9'h108;
      expv[14] = 9'h0cf;
      expv[15] = 9'h0e4;
      expv[16] = 9'h112;
      expv[17] = 9'h1f9;
      expv[18] = 9'h128;
      expv[19] = 9'h0a9;
      expv[20] = 9'h0c5;
      expv[21] = 9'h0a8;
      expv[22] = 9'h1eb;
      expv[23] = 9'h119;
      expv[24] = 9'h190;
      expv[25] = 9'h0a9;
      expv[26] = 9'h14a;
      expv[27] = 9'h045;
      expv[28] = 9'h0ac;
      expv[29] = 9'h1a5;
      expv[30] = 9'h008;
      expv[31] = 9'h1d3;
      expv[32] = 9'h1e9;
      expv[33] = 9'h11d;
      expv[34] = 9'h1f6;
      expv[35] = 9'h194;
      expv[36] = 9'h005;
      expv[37] = 9'h057;
      expv[38] = 9'h01b;
      expv[39] = 9'h0ea;
      expv[40] = 9'h0d0;
      expv[41] = 9'h098;
      expv[42] = 9'h094;
      expv[43] = 9'h00a;
      expv[44] = 9'h126;
      expv[45] = 9'h13f;
      expv[46] = 9'h109;
      expv[47] = 9'h118;
      expv[48] = 9'h0d3;
      expv[49] = 9'h184;
      expv[50] = 9'h01c;
      expv[51] = 9'h0c1;
      expv[52] = 9'h01a;
      expv[53] = 9'h049;
      expv[54] = 9'h0f2;
      expv[55] = 9'h0d6;
      expv[56] = 9'h0c0;
      expv[57] = 9'h025;
      expv[58] = 9'h1ac;
      expv[59] = 9'h14f;
      expv[60] = 9'h047;
      expv[61] = 9'h15b;
      expv[62] = 9'h000;
      expv[63] = 9'h1f9;
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
