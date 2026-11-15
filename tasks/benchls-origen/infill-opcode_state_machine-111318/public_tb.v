// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_111318 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .InstructorRegister(in_vec[8:0]),
    .outStateMachine(out_vec[16:1]),
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
    stim[0] = 10'h231;
    stim[1] = 10'h336;
    stim[2] = 10'h088;
    stim[3] = 10'h1bf;
    stim[4] = 10'h1e3;
    stim[5] = 10'h126;
    stim[6] = 10'h0a0;
    stim[7] = 10'h054;
    stim[8] = 10'h028;
    stim[9] = 10'h0eb;
    stim[10] = 10'h0b6;
    stim[11] = 10'h12a;
    stim[12] = 10'h15a;
    stim[13] = 10'h1a5;
    stim[14] = 10'h1e0;
    stim[15] = 10'h118;
    stim[16] = 10'h0f9;
    stim[17] = 10'h112;
    stim[18] = 10'h09e;
    stim[19] = 10'h139;
    stim[20] = 10'h186;
    stim[21] = 10'h123;
    stim[22] = 10'h183;
    stim[23] = 10'h046;
    stim[24] = 10'h0d3;
    stim[25] = 10'h0fa;
    stim[26] = 10'h02f;
    stim[27] = 10'h0b5;
    stim[28] = 10'h0e4;
    stim[29] = 10'h178;
    stim[30] = 10'h12c;
    stim[31] = 10'h05d;
    stim[32] = 10'h0f5;
    stim[33] = 10'h19a;
    stim[34] = 10'h062;
    stim[35] = 10'h19c;
    stim[36] = 10'h01a;
    stim[37] = 10'h104;
    stim[38] = 10'h1b0;
    stim[39] = 10'h132;
    stim[40] = 10'h1c7;
    stim[41] = 10'h1d4;
    stim[42] = 10'h03b;
    stim[43] = 10'h1b4;
    stim[44] = 10'h1b1;
    stim[45] = 10'h10b;
    stim[46] = 10'h17e;
    stim[47] = 10'h080;
    stim[48] = 10'h16a;
    stim[49] = 10'h257;
    stim[50] = 10'h0ca;
    stim[51] = 10'h0b8;
    stim[52] = 10'h029;
    stim[53] = 10'h15d;
    stim[54] = 10'h1ba;
    stim[55] = 10'h1be;
    stim[56] = 10'h06f;
    stim[57] = 10'h192;
    stim[58] = 10'h003;
    stim[59] = 10'h0dd;
    stim[60] = 10'h043;
    stim[61] = 10'h1a2;
    stim[62] = 10'h19e;
    stim[63] = 10'h001;
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
      expv[3] = 17'h00009;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h0000b;
      expv[8] = 17'h00000;
      expv[9] = 17'h00002;
      expv[10] = 17'h00003;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h0000f;
      expv[18] = 17'h00000;
      expv[19] = 17'h00009;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00005;
      expv[25] = 17'h00000;
      expv[26] = 17'h0000f;
      expv[27] = 17'h00000;
      expv[28] = 17'h0000b;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00005;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00007;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00001;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00002;
      expv[44] = 17'h00003;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00009;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h0000d;
      expv[52] = 17'h00000;
      expv[53] = 17'h00002;
      expv[54] = 17'h00003;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00007;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00001;
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
