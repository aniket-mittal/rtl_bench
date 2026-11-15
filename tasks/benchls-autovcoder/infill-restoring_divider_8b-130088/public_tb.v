// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_130088 dut (
    .clk(clk),
    .rst(in_vec[17:17]),
    .start(in_vec[16:16]),
    .dividend(in_vec[15:8]),
    .divisor(in_vec[7:0]),
    .quotient(out_vec[16:9]),
    .remainder(out_vec[8:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2bacc;
    stim[1] = 18'h2743d;
    stim[2] = 18'h16e20;
    stim[3] = 18'h0f60a;
    stim[4] = 18'h07003;
    stim[5] = 18'h1a457;
    stim[6] = 18'h072a7;
    stim[7] = 18'h17877;
    stim[8] = 18'h17cf7;
    stim[9] = 18'h0156b;
    stim[10] = 18'h0fe93;
    stim[11] = 18'h050a0;
    stim[12] = 18'h1fbe0;
    stim[13] = 18'h16a7b;
    stim[14] = 18'h171b3;
    stim[15] = 18'h1221b;
    stim[16] = 18'h069c5;
    stim[17] = 18'h194e4;
    stim[18] = 18'h0493b;
    stim[19] = 18'h0d8c1;
    stim[20] = 18'h0c451;
    stim[21] = 18'h0d659;
    stim[22] = 18'h1c937;
    stim[23] = 18'h0f310;
    stim[24] = 18'h09ff9;
    stim[25] = 18'h12157;
    stim[26] = 18'h0a1c6;
    stim[27] = 18'h1d352;
    stim[28] = 18'h07464;
    stim[29] = 18'h0039f;
    stim[30] = 18'h07568;
    stim[31] = 18'h0a750;
    stim[32] = 18'h07548;
    stim[33] = 18'h13a79;
    stim[34] = 18'h17483;
    stim[35] = 18'h0dd02;
    stim[36] = 18'h14f36;
    stim[37] = 18'h1f516;
    stim[38] = 18'h07247;
    stim[39] = 18'h00987;
    stim[40] = 18'h17fbc;
    stim[41] = 18'h05061;
    stim[42] = 18'h0e77e;
    stim[43] = 18'h13c3b;
    stim[44] = 18'h1273f;
    stim[45] = 18'h197a6;
    stim[46] = 18'h0bf8b;
    stim[47] = 18'h18d8b;
    stim[48] = 18'h1aadf;
    stim[49] = 18'h08646;
    stim[50] = 18'h1ba75;
    stim[51] = 18'h1c904;
    stim[52] = 18'h0da58;
    stim[53] = 18'h11817;
    stim[54] = 18'h193b6;
    stim[55] = 18'h057bf;
    stim[56] = 18'h1094a;
    stim[57] = 18'h03137;
    stim[58] = 18'h07145;
    stim[59] = 18'h0c0f0;
    stim[60] = 18'h1fd25;
    stim[61] = 18'h01f63;
    stim[62] = 18'h19309;
    stim[63] = 18'h053c1;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
