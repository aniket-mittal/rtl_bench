// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  calendar dut (
    .CLK(clk),
    .RST(in_vec[0:0]),
    .Hours(out_vec[17:12]),
    .Mins(out_vec[11:6]),
    .Secs(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h1;
    stim[1] = 1'h1;
    stim[2] = 1'h0;
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h1;
    stim[54] = 1'h1;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h1;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00001;
      expv[4] = 18'h00002;
      expv[5] = 18'h00003;
      expv[6] = 18'h00004;
      expv[7] = 18'h00005;
      expv[8] = 18'h00006;
      expv[9] = 18'h00007;
      expv[10] = 18'h00008;
      expv[11] = 18'h00009;
      expv[12] = 18'h0000a;
      expv[13] = 18'h0000b;
      expv[14] = 18'h0000c;
      expv[15] = 18'h0000d;
      expv[16] = 18'h0000e;
      expv[17] = 18'h0000f;
      expv[18] = 18'h00010;
      expv[19] = 18'h00011;
      expv[20] = 18'h00012;
      expv[21] = 18'h00013;
      expv[22] = 18'h00014;
      expv[23] = 18'h00015;
      expv[24] = 18'h00016;
      expv[25] = 18'h00017;
      expv[26] = 18'h00018;
      expv[27] = 18'h00019;
      expv[28] = 18'h0001a;
      expv[29] = 18'h0001b;
      expv[30] = 18'h0001c;
      expv[31] = 18'h0001d;
      expv[32] = 18'h0001e;
      expv[33] = 18'h0001f;
      expv[34] = 18'h00020;
      expv[35] = 18'h00021;
      expv[36] = 18'h00022;
      expv[37] = 18'h00023;
      expv[38] = 18'h00024;
      expv[39] = 18'h00025;
      expv[40] = 18'h00026;
      expv[41] = 18'h00027;
      expv[42] = 18'h00028;
      expv[43] = 18'h00029;
      expv[44] = 18'h0002a;
      expv[45] = 18'h0002b;
      expv[46] = 18'h0002c;
      expv[47] = 18'h0002d;
      expv[48] = 18'h0002e;
      expv[49] = 18'h0002f;
      expv[50] = 18'h00030;
      expv[51] = 18'h00031;
      expv[52] = 18'h00032;
      expv[53] = 18'h00000;
      expv[54] = 18'h00000;
      expv[55] = 18'h00000;
      expv[56] = 18'h00001;
      expv[57] = 18'h00002;
      expv[58] = 18'h00000;
      expv[59] = 18'h00000;
      expv[60] = 18'h00001;
      expv[61] = 18'h00002;
      expv[62] = 18'h00003;
      expv[63] = 18'h00004;
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
