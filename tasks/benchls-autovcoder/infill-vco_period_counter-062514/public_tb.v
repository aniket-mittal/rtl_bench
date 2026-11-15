// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 26;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062514 dut (
    .clk(clk),
    .rst(in_vec[9:9]),
    .psi(in_vec[8:8]),
    .setPeriod(in_vec[7:0]),
    .inc(out_vec[25:25]),
    .dec(out_vec[24:24]),
    .count(out_vec[23:8]),
    .adjustedDiv(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h29d;
    stim[1] = 10'h33d;
    stim[2] = 10'h06f;
    stim[3] = 10'h19e;
    stim[4] = 10'h05c;
    stim[5] = 10'h005;
    stim[6] = 10'h16a;
    stim[7] = 10'h17b;
    stim[8] = 10'h20a;
    stim[9] = 10'h1b6;
    stim[10] = 10'h017;
    stim[11] = 10'h0be;
    stim[12] = 10'h0f9;
    stim[13] = 10'h04f;
    stim[14] = 10'h056;
    stim[15] = 10'h174;
    stim[16] = 10'h12f;
    stim[17] = 10'h193;
    stim[18] = 10'h06d;
    stim[19] = 10'h189;
    stim[20] = 10'h0d0;
    stim[21] = 10'h1bf;
    stim[22] = 10'h15f;
    stim[23] = 10'h1b9;
    stim[24] = 10'h1ed;
    stim[25] = 10'h0e9;
    stim[26] = 10'h0a5;
    stim[27] = 10'h167;
    stim[28] = 10'h0bc;
    stim[29] = 10'h106;
    stim[30] = 10'h018;
    stim[31] = 10'h021;
    stim[32] = 10'h0e5;
    stim[33] = 10'h13c;
    stim[34] = 10'h11c;
    stim[35] = 10'h1b2;
    stim[36] = 10'h181;
    stim[37] = 10'h16f;
    stim[38] = 10'h16f;
    stim[39] = 10'h1f8;
    stim[40] = 10'h09f;
    stim[41] = 10'h1cd;
    stim[42] = 10'h1c0;
    stim[43] = 10'h0cd;
    stim[44] = 10'h190;
    stim[45] = 10'h0f1;
    stim[46] = 10'h08c;
    stim[47] = 10'h1d9;
    stim[48] = 10'h0d0;
    stim[49] = 10'h1bd;
    stim[50] = 10'h107;
    stim[51] = 10'h0bb;
    stim[52] = 10'h14f;
    stim[53] = 10'h103;
    stim[54] = 10'h171;
    stim[55] = 10'h08a;
    stim[56] = 10'h0d2;
    stim[57] = 10'h14f;
    stim[58] = 10'h0a7;
    stim[59] = 10'h198;
    stim[60] = 10'h0c0;
    stim[61] = 10'h1da;
    stim[62] = 10'h10b;
    stim[63] = 10'h0be;
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
      expv[0] = 26'h000007f;
      expv[1] = 26'h000007f;
      expv[2] = 26'h000007f;
      expv[3] = 26'h000007f;
      expv[4] = 26'h100007f;
      expv[5] = 26'h000007e;
      expv[6] = 26'h000007e;
      expv[7] = 26'h000007e;
      expv[8] = 26'h000007f;
      expv[9] = 26'h000007f;
      expv[10] = 26'h100007f;
      expv[11] = 26'h000007e;
      expv[12] = 26'h000007e;
      expv[13] = 26'h000007e;
      expv[14] = 26'h000007e;
      expv[15] = 26'h000007e;
      expv[16] = 26'h000007e;
      expv[17] = 26'h000017e;
      expv[18] = 26'h100027e;
      expv[19] = 26'h000027d;
      expv[20] = 26'h100007d;
      expv[21] = 26'h000007c;
      expv[22] = 26'h000007c;
      expv[23] = 26'h000017c;
      expv[24] = 26'h000027c;
      expv[25] = 26'h100037c;
      expv[26] = 26'h000037b;
      expv[27] = 26'h000037b;
      expv[28] = 26'h100007b;
      expv[29] = 26'h000007a;
      expv[30] = 26'h100007a;
      expv[31] = 26'h0000079;
      expv[32] = 26'h0000079;
      expv[33] = 26'h0000079;
      expv[34] = 26'h0000079;
      expv[35] = 26'h0000179;
      expv[36] = 26'h0000279;
      expv[37] = 26'h0000379;
      expv[38] = 26'h0000479;
      expv[39] = 26'h0000579;
      expv[40] = 26'h1000679;
      expv[41] = 26'h0000678;
      expv[42] = 26'h0000078;
      expv[43] = 26'h1000178;
      expv[44] = 26'h0000177;
      expv[45] = 26'h1000077;
      expv[46] = 26'h0000076;
      expv[47] = 26'h0000076;
      expv[48] = 26'h1000076;
      expv[49] = 26'h0000075;
      expv[50] = 26'h0000075;
      expv[51] = 26'h1000175;
      expv[52] = 26'h0000174;
      expv[53] = 26'h0000074;
      expv[54] = 26'h0000174;
      expv[55] = 26'h1000274;
      expv[56] = 26'h0000273;
      expv[57] = 26'h0000273;
      expv[58] = 26'h1000073;
      expv[59] = 26'h0000072;
      expv[60] = 26'h1000072;
      expv[61] = 26'h0000071;
      expv[62] = 26'h0000071;
      expv[63] = 26'h1000171;
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
