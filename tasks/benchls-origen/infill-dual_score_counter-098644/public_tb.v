// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_098644 dut (
    .clk(clk),
    .reset(in_vec[2:2]),
    .p1_scored(in_vec[1:1]),
    .p2_scored(in_vec[0:0]),
    .p1_score(out_vec[63:32]),
    .p2_score(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h6;
    stim[1] = 3'h7;
    stim[2] = 3'h1;
    stim[3] = 3'h2;
    stim[4] = 3'h2;
    stim[5] = 3'h1;
    stim[6] = 3'h2;
    stim[7] = 3'h1;
    stim[8] = 3'h1;
    stim[9] = 3'h1;
    stim[10] = 3'h3;
    stim[11] = 3'h0;
    stim[12] = 3'h0;
    stim[13] = 3'h2;
    stim[14] = 3'h2;
    stim[15] = 3'h3;
    stim[16] = 3'h3;
    stim[17] = 3'h2;
    stim[18] = 3'h1;
    stim[19] = 3'h2;
    stim[20] = 3'h3;
    stim[21] = 3'h3;
    stim[22] = 3'h3;
    stim[23] = 3'h1;
    stim[24] = 3'h1;
    stim[25] = 3'h3;
    stim[26] = 3'h1;
    stim[27] = 3'h2;
    stim[28] = 3'h1;
    stim[29] = 3'h3;
    stim[30] = 3'h1;
    stim[31] = 3'h0;
    stim[32] = 3'h3;
    stim[33] = 3'h2;
    stim[34] = 3'h1;
    stim[35] = 3'h2;
    stim[36] = 3'h3;
    stim[37] = 3'h1;
    stim[38] = 3'h0;
    stim[39] = 3'h0;
    stim[40] = 3'h3;
    stim[41] = 3'h0;
    stim[42] = 3'h3;
    stim[43] = 3'h1;
    stim[44] = 3'h1;
    stim[45] = 3'h3;
    stim[46] = 3'h2;
    stim[47] = 3'h1;
    stim[48] = 3'h0;
    stim[49] = 3'h2;
    stim[50] = 3'h0;
    stim[51] = 3'h0;
    stim[52] = 3'h3;
    stim[53] = 3'h1;
    stim[54] = 3'h0;
    stim[55] = 3'h2;
    stim[56] = 3'h0;
    stim[57] = 3'h1;
    stim[58] = 3'h2;
    stim[59] = 3'h3;
    stim[60] = 3'h2;
    stim[61] = 3'h0;
    stim[62] = 3'h3;
    stim[63] = 3'h1;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000001;
      expv[4] = 64'h0000000100000001;
      expv[5] = 64'h0000000200000001;
      expv[6] = 64'h0000000200000002;
      expv[7] = 64'h0000000300000002;
      expv[8] = 64'h0000000300000003;
      expv[9] = 64'h0000000300000004;
      expv[10] = 64'h0000000300000005;
      expv[11] = 64'h0000000400000005;
      expv[12] = 64'h0000000400000005;
      expv[13] = 64'h0000000400000005;
      expv[14] = 64'h0000000500000005;
      expv[15] = 64'h0000000600000005;
      expv[16] = 64'h0000000700000005;
      expv[17] = 64'h0000000800000005;
      expv[18] = 64'h0000000900000005;
      expv[19] = 64'h0000000900000006;
      expv[20] = 64'h0000000a00000006;
      expv[21] = 64'h0000000b00000006;
      expv[22] = 64'h0000000c00000006;
      expv[23] = 64'h0000000d00000006;
      expv[24] = 64'h0000000d00000007;
      expv[25] = 64'h0000000d00000008;
      expv[26] = 64'h0000000e00000008;
      expv[27] = 64'h0000000e00000009;
      expv[28] = 64'h0000000f00000009;
      expv[29] = 64'h0000000f0000000a;
      expv[30] = 64'h000000100000000a;
      expv[31] = 64'h000000100000000b;
      expv[32] = 64'h000000100000000b;
      expv[33] = 64'h000000110000000b;
      expv[34] = 64'h000000120000000b;
      expv[35] = 64'h000000120000000c;
      expv[36] = 64'h000000130000000c;
      expv[37] = 64'h000000140000000c;
      expv[38] = 64'h000000140000000d;
      expv[39] = 64'h000000140000000d;
      expv[40] = 64'h000000140000000d;
      expv[41] = 64'h000000150000000d;
      expv[42] = 64'h000000150000000d;
      expv[43] = 64'h000000160000000d;
      expv[44] = 64'h000000160000000e;
      expv[45] = 64'h000000160000000f;
      expv[46] = 64'h000000170000000f;
      expv[47] = 64'h000000180000000f;
      expv[48] = 64'h0000001800000010;
      expv[49] = 64'h0000001800000010;
      expv[50] = 64'h0000001900000010;
      expv[51] = 64'h0000001900000010;
      expv[52] = 64'h0000001900000010;
      expv[53] = 64'h0000001a00000010;
      expv[54] = 64'h0000001a00000011;
      expv[55] = 64'h0000001a00000011;
      expv[56] = 64'h0000001b00000011;
      expv[57] = 64'h0000001b00000011;
      expv[58] = 64'h0000001b00000012;
      expv[59] = 64'h0000001c00000012;
      expv[60] = 64'h0000001d00000012;
      expv[61] = 64'h0000001e00000012;
      expv[62] = 64'h0000001e00000012;
      expv[63] = 64'h0000001f00000012;
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
