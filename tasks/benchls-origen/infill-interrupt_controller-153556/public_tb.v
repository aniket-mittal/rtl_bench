// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 121;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_153556 dut (
    .selector(in_vec[8:0]),
    .CPC(out_vec[120:105]),
    .TVEC0(out_vec[104:89]),
    .TVEC1(out_vec[88:73]),
    .TVEC2(out_vec[72:57]),
    .TVEC3(out_vec[56:41]),
    .EPC(out_vec[40:25]),
    .GIE(out_vec[24:24]),
    .PGIE(out_vec[23:23]),
    .IE0(out_vec[22:22]),
    .IE1(out_vec[21:21]),
    .IE2(out_vec[20:20]),
    .IE3(out_vec[19:19]),
    .tvec(out_vec[18:3]),
    .int0_acc(out_vec[2:2]),
    .int1_acc(out_vec[1:1]),
    .int2_acc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0c6;
    stim[1] = 9'h13a;
    stim[2] = 9'h0a6;
    stim[3] = 9'h067;
    stim[4] = 9'h0de;
    stim[5] = 9'h123;
    stim[6] = 9'h0a6;
    stim[7] = 9'h081;
    stim[8] = 9'h068;
    stim[9] = 9'h0fb;
    stim[10] = 9'h1de;
    stim[11] = 9'h1a1;
    stim[12] = 9'h11a;
    stim[13] = 9'h032;
    stim[14] = 9'h130;
    stim[15] = 9'h1f9;
    stim[16] = 9'h103;
    stim[17] = 9'h0a0;
    stim[18] = 9'h05a;
    stim[19] = 9'h1a4;
    stim[20] = 9'h185;
    stim[21] = 9'h054;
    stim[22] = 9'h0a8;
    stim[23] = 9'h131;
    stim[24] = 9'h068;
    stim[25] = 9'h14b;
    stim[26] = 9'h124;
    stim[27] = 9'h1d3;
    stim[28] = 9'h16c;
    stim[29] = 9'h059;
    stim[30] = 9'h0df;
    stim[31] = 9'h029;
    stim[32] = 9'h120;
    stim[33] = 9'h1fe;
    stim[34] = 9'h1c6;
    stim[35] = 9'h1b7;
    stim[36] = 9'h070;
    stim[37] = 9'h02b;
    stim[38] = 9'h1ed;
    stim[39] = 9'h0d5;
    stim[40] = 9'h07b;
    stim[41] = 9'h0e8;
    stim[42] = 9'h182;
    stim[43] = 9'h032;
    stim[44] = 9'h1d8;
    stim[45] = 9'h182;
    stim[46] = 9'h0a5;
    stim[47] = 9'h158;
    stim[48] = 9'h182;
    stim[49] = 9'h1ff;
    stim[50] = 9'h097;
    stim[51] = 9'h1a8;
    stim[52] = 9'h07a;
    stim[53] = 9'h0b7;
    stim[54] = 9'h01c;
    stim[55] = 9'h0ff;
    stim[56] = 9'h1fc;
    stim[57] = 9'h1cd;
    stim[58] = 9'h146;
    stim[59] = 9'h14b;
    stim[60] = 9'h06a;
    stim[61] = 9'h18c;
    stim[62] = 9'h1c3;
    stim[63] = 9'h0cf;
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
      expv[0] = 121'h0000000000000000000000000000000;
      expv[1] = 121'h0000000000000000000000000000000;
      expv[2] = 121'h0000000000000000000000000000000;
      expv[3] = 121'h0000000000000000000000000000000;
      expv[4] = 121'h0000000000000000000000000000000;
      expv[5] = 121'h0000000000000000000000000000000;
      expv[6] = 121'h0000000000000000000000000000000;
      expv[7] = 121'h0000000000000000000000000000000;
      expv[8] = 121'h0000000000000000000000000000000;
      expv[9] = 121'h0000000000000000000000000000000;
      expv[10] = 121'h0000000000000000000000000000000;
      expv[11] = 121'h0000000000000000000000000000000;
      expv[12] = 121'h0000000000000000000000000000000;
      expv[13] = 121'h0000000000000000000000000000000;
      expv[14] = 121'h0000000000000000000000000000000;
      expv[15] = 121'h0000000000000000000000000000000;
      expv[16] = 121'h0000000000000000000000000000000;
      expv[17] = 121'h0000000000000000000000000000000;
      expv[18] = 121'h0000000000000000000000000000000;
      expv[19] = 121'h0000000000000000000000000000000;
      expv[20] = 121'h0000000000000000000000000000000;
      expv[21] = 121'h0000000000000000000000000000000;
      expv[22] = 121'h0000000000000000000000000000000;
      expv[23] = 121'h0000000000000000000000000000000;
      expv[24] = 121'h0000000000000000000000000000000;
      expv[25] = 121'h0000000000000000000000000000000;
      expv[26] = 121'h0000000000000000000000000000000;
      expv[27] = 121'h0000000000000000000000000000000;
      expv[28] = 121'h0000000000000000000000000000000;
      expv[29] = 121'h0000000000000000000000000000000;
      expv[30] = 121'h0000000000000000000000000000000;
      expv[31] = 121'h0000000000000000000000000000000;
      expv[32] = 121'h0000000000000000000000000000000;
      expv[33] = 121'h0000000000000000000000000000000;
      expv[34] = 121'h0000000000000000000000000000000;
      expv[35] = 121'h0000000000000000000000000000000;
      expv[36] = 121'h0000000000000000000000000000000;
      expv[37] = 121'h0000000000000000000000000000000;
      expv[38] = 121'h0000000000000000000000000000000;
      expv[39] = 121'h0000000000000000000000000000000;
      expv[40] = 121'h0000000000000000000000000000000;
      expv[41] = 121'h0000000000000000000000000000000;
      expv[42] = 121'h0000000000000000000000000000000;
      expv[43] = 121'h0000000000000000000000000000000;
      expv[44] = 121'h0000000000000000000000000000000;
      expv[45] = 121'h0000000000000000000000000000000;
      expv[46] = 121'h0000000000000000000000000000000;
      expv[47] = 121'h0000000000000000000000000000000;
      expv[48] = 121'h0000000000000000000000000000000;
      expv[49] = 121'h0000000000000000000000000000000;
      expv[50] = 121'h0000000000000000000000000000000;
      expv[51] = 121'h0000000000000000000000000000000;
      expv[52] = 121'h0000000000000000000000000000000;
      expv[53] = 121'h0000000000000000000000000000000;
      expv[54] = 121'h0000000000000000000000000000000;
      expv[55] = 121'h0000000000000000000000000000000;
      expv[56] = 121'h0000000000000000000000000000000;
      expv[57] = 121'h0000000000000000000000000000000;
      expv[58] = 121'h0000000000000000000000000000000;
      expv[59] = 121'h0000000000000000000000000000000;
      expv[60] = 121'h0000000000000000000000000000000;
      expv[61] = 121'h0000000000000000000000000000000;
      expv[62] = 121'h0000000000000000000000000000000;
      expv[63] = 121'h0000000000000000000000000000000;
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
