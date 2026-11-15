// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_048743 dut (
    .clkv(clk),
    .clrv(in_vec[0:0]),
    .vr(out_vec[13:13]),
    .vrs(out_vec[12:12]),
    .vrsp(out_vec[11:11]),
    .vrspq(out_vec[10:10]),
    .cntrv(out_vec[9:0])
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
    stim[39] = 1'h1;
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
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0000;
      expv[2] = 14'h0000;
      expv[3] = 14'h0001;
      expv[4] = 14'h0002;
      expv[5] = 14'h0003;
      expv[6] = 14'h0004;
      expv[7] = 14'h0005;
      expv[8] = 14'h0006;
      expv[9] = 14'h0007;
      expv[10] = 14'h0008;
      expv[11] = 14'h0009;
      expv[12] = 14'h000a;
      expv[13] = 14'h000b;
      expv[14] = 14'h000c;
      expv[15] = 14'h000d;
      expv[16] = 14'h000e;
      expv[17] = 14'h000f;
      expv[18] = 14'h0010;
      expv[19] = 14'h0011;
      expv[20] = 14'h0012;
      expv[21] = 14'h0013;
      expv[22] = 14'h0014;
      expv[23] = 14'h0015;
      expv[24] = 14'h0016;
      expv[25] = 14'h0017;
      expv[26] = 14'h0018;
      expv[27] = 14'h0019;
      expv[28] = 14'h001a;
      expv[29] = 14'h001b;
      expv[30] = 14'h001c;
      expv[31] = 14'h001d;
      expv[32] = 14'h001e;
      expv[33] = 14'h001f;
      expv[34] = 14'h0020;
      expv[35] = 14'h0421;
      expv[36] = 14'h0422;
      expv[37] = 14'h0423;
      expv[38] = 14'h0424;
      expv[39] = 14'h0000;
      expv[40] = 14'h0000;
      expv[41] = 14'h0001;
      expv[42] = 14'h0002;
      expv[43] = 14'h0003;
      expv[44] = 14'h0004;
      expv[45] = 14'h0005;
      expv[46] = 14'h0006;
      expv[47] = 14'h0007;
      expv[48] = 14'h0008;
      expv[49] = 14'h0009;
      expv[50] = 14'h000a;
      expv[51] = 14'h000b;
      expv[52] = 14'h000c;
      expv[53] = 14'h000d;
      expv[54] = 14'h000e;
      expv[55] = 14'h000f;
      expv[56] = 14'h0010;
      expv[57] = 14'h0011;
      expv[58] = 14'h0012;
      expv[59] = 14'h0013;
      expv[60] = 14'h0014;
      expv[61] = 14'h0015;
      expv[62] = 14'h0016;
      expv[63] = 14'h0017;
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
