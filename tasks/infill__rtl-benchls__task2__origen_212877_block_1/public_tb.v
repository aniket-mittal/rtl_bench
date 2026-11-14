// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_212877 dut (
    .clock(clk),
    .reset(in_vec[1:1]),
    .inSignal(in_vec[0:0]),
    .outSignal(out_vec[21:21]),
    .hayNegro(out_vec[20:20]),
    .contador(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h2;
    stim[1] = 2'h2;
    stim[2] = 2'h0;
    stim[3] = 2'h1;
    stim[4] = 2'h0;
    stim[5] = 2'h0;
    stim[6] = 2'h0;
    stim[7] = 2'h1;
    stim[8] = 2'h0;
    stim[9] = 2'h1;
    stim[10] = 2'h1;
    stim[11] = 2'h1;
    stim[12] = 2'h0;
    stim[13] = 2'h0;
    stim[14] = 2'h1;
    stim[15] = 2'h1;
    stim[16] = 2'h1;
    stim[17] = 2'h1;
    stim[18] = 2'h0;
    stim[19] = 2'h1;
    stim[20] = 2'h0;
    stim[21] = 2'h1;
    stim[22] = 2'h0;
    stim[23] = 2'h1;
    stim[24] = 2'h0;
    stim[25] = 2'h0;
    stim[26] = 2'h1;
    stim[27] = 2'h0;
    stim[28] = 2'h1;
    stim[29] = 2'h0;
    stim[30] = 2'h0;
    stim[31] = 2'h1;
    stim[32] = 2'h1;
    stim[33] = 2'h0;
    stim[34] = 2'h0;
    stim[35] = 2'h0;
    stim[36] = 2'h1;
    stim[37] = 2'h1;
    stim[38] = 2'h1;
    stim[39] = 2'h1;
    stim[40] = 2'h1;
    stim[41] = 2'h0;
    stim[42] = 2'h0;
    stim[43] = 2'h0;
    stim[44] = 2'h1;
    stim[45] = 2'h0;
    stim[46] = 2'h0;
    stim[47] = 2'h1;
    stim[48] = 2'h1;
    stim[49] = 2'h1;
    stim[50] = 2'h1;
    stim[51] = 2'h0;
    stim[52] = 2'h1;
    stim[53] = 2'h1;
    stim[54] = 2'h1;
    stim[55] = 2'h0;
    stim[56] = 2'h1;
    stim[57] = 2'h0;
    stim[58] = 2'h1;
    stim[59] = 2'h1;
    stim[60] = 2'h0;
    stim[61] = 2'h1;
    stim[62] = 2'h1;
    stim[63] = 2'h1;
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
      expv[0] = 22'h000000;
      expv[1] = 22'h000000;
      expv[2] = 22'h000000;
      expv[3] = 22'h200001;
      expv[4] = 22'h200002;
      expv[5] = 22'h200003;
      expv[6] = 22'h200004;
      expv[7] = 22'h200005;
      expv[8] = 22'h200006;
      expv[9] = 22'h200007;
      expv[10] = 22'h200008;
      expv[11] = 22'h200009;
      expv[12] = 22'h20000a;
      expv[13] = 22'h20000b;
      expv[14] = 22'h20000c;
      expv[15] = 22'h20000d;
      expv[16] = 22'h20000e;
      expv[17] = 22'h20000f;
      expv[18] = 22'h200010;
      expv[19] = 22'h200011;
      expv[20] = 22'h200012;
      expv[21] = 22'h200013;
      expv[22] = 22'h200014;
      expv[23] = 22'h200015;
      expv[24] = 22'h200016;
      expv[25] = 22'h200017;
      expv[26] = 22'h200018;
      expv[27] = 22'h200019;
      expv[28] = 22'h20001a;
      expv[29] = 22'h20001b;
      expv[30] = 22'h20001c;
      expv[31] = 22'h20001d;
      expv[32] = 22'h20001e;
      expv[33] = 22'h20001f;
      expv[34] = 22'h200020;
      expv[35] = 22'h200021;
      expv[36] = 22'h200022;
      expv[37] = 22'h200023;
      expv[38] = 22'h200024;
      expv[39] = 22'h200025;
      expv[40] = 22'h200026;
      expv[41] = 22'h200027;
      expv[42] = 22'h200028;
      expv[43] = 22'h200029;
      expv[44] = 22'h20002a;
      expv[45] = 22'h20002b;
      expv[46] = 22'h20002c;
      expv[47] = 22'h20002d;
      expv[48] = 22'h20002e;
      expv[49] = 22'h20002f;
      expv[50] = 22'h200030;
      expv[51] = 22'h200031;
      expv[52] = 22'h200032;
      expv[53] = 22'h200033;
      expv[54] = 22'h200034;
      expv[55] = 22'h200035;
      expv[56] = 22'h200036;
      expv[57] = 22'h200037;
      expv[58] = 22'h200038;
      expv[59] = 22'h200039;
      expv[60] = 22'h20003a;
      expv[61] = 22'h20003b;
      expv[62] = 22'h20003c;
      expv[63] = 22'h20003d;
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
