// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_210087 dut (
    .i_clk_0_001s(clk),
    .state(in_vec[8:4]),
    .is_modify(in_vec[3:3]),
    .i_plus(in_vec[2:2]),
    .i_minus(in_vec[1:1]),
    .i_enable(in_vec[0:0]),
    .o_enable(out_vec[15:15]),
    .o_month(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h17d;
    stim[1] = 9'h0b8;
    stim[2] = 9'h023;
    stim[3] = 9'h0ab;
    stim[4] = 9'h1c8;
    stim[5] = 9'h0c2;
    stim[6] = 9'h080;
    stim[7] = 9'h156;
    stim[8] = 9'h120;
    stim[9] = 9'h0ea;
    stim[10] = 9'h170;
    stim[11] = 9'h14c;
    stim[12] = 9'h05b;
    stim[13] = 9'h058;
    stim[14] = 9'h105;
    stim[15] = 9'h128;
    stim[16] = 9'h074;
    stim[17] = 9'h00b;
    stim[18] = 9'h1e1;
    stim[19] = 9'h01b;
    stim[20] = 9'h017;
    stim[21] = 9'h135;
    stim[22] = 9'h158;
    stim[23] = 9'h080;
    stim[24] = 9'h06b;
    stim[25] = 9'h12d;
    stim[26] = 9'h0f9;
    stim[27] = 9'h1ab;
    stim[28] = 9'h017;
    stim[29] = 9'h1cc;
    stim[30] = 9'h081;
    stim[31] = 9'h006;
    stim[32] = 9'h110;
    stim[33] = 9'h06e;
    stim[34] = 9'h0cb;
    stim[35] = 9'h047;
    stim[36] = 9'h028;
    stim[37] = 9'h1bb;
    stim[38] = 9'h1bf;
    stim[39] = 9'h18a;
    stim[40] = 9'h1a9;
    stim[41] = 9'h0f9;
    stim[42] = 9'h011;
    stim[43] = 9'h12f;
    stim[44] = 9'h153;
    stim[45] = 9'h0c0;
    stim[46] = 9'h048;
    stim[47] = 9'h061;
    stim[48] = 9'h1d2;
    stim[49] = 9'h1b9;
    stim[50] = 9'h18e;
    stim[51] = 9'h1dc;
    stim[52] = 9'h035;
    stim[53] = 9'h132;
    stim[54] = 9'h0a1;
    stim[55] = 9'h105;
    stim[56] = 9'h03f;
    stim[57] = 9'h1d7;
    stim[58] = 9'h1f5;
    stim[59] = 9'h00f;
    stim[60] = 9'h11a;
    stim[61] = 9'h017;
    stim[62] = 9'h17a;
    stim[63] = 9'h1da;
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
      expv[0] = 16'h0005;
      expv[1] = 16'h0005;
      expv[2] = 16'h0005;
      expv[3] = 16'h0006;
      expv[4] = 16'h0006;
      expv[5] = 16'h0006;
      expv[6] = 16'h0007;
      expv[7] = 16'h0007;
      expv[8] = 16'h0007;
      expv[9] = 16'h0007;
      expv[10] = 16'h0007;
      expv[11] = 16'h0007;
      expv[12] = 16'h0007;
      expv[13] = 16'h0007;
      expv[14] = 16'h0008;
      expv[15] = 16'h0009;
      expv[16] = 16'h0009;
      expv[17] = 16'h000a;
      expv[18] = 16'h000a;
      expv[19] = 16'h000a;
      expv[20] = 16'h000a;
      expv[21] = 16'h000a;
      expv[22] = 16'h000a;
      expv[23] = 16'h000a;
      expv[24] = 16'h000b;
      expv[25] = 16'h000b;
      expv[26] = 16'h000b;
      expv[27] = 16'h000b;
      expv[28] = 16'h000b;
      expv[29] = 16'h000b;
      expv[30] = 16'h000b;
      expv[31] = 16'h000c;
      expv[32] = 16'h000c;
      expv[33] = 16'h8000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0001;
      expv[39] = 16'h0001;
      expv[40] = 16'h0001;
      expv[41] = 16'h0002;
      expv[42] = 16'h0002;
      expv[43] = 16'h0002;
      expv[44] = 16'h0002;
      expv[45] = 16'h0002;
      expv[46] = 16'h0002;
      expv[47] = 16'h0003;
      expv[48] = 16'h0003;
      expv[49] = 16'h0003;
      expv[50] = 16'h0004;
      expv[51] = 16'h0004;
      expv[52] = 16'h0005;
      expv[53] = 16'h0005;
      expv[54] = 16'h0005;
      expv[55] = 16'h0006;
      expv[56] = 16'h0006;
      expv[57] = 16'h0006;
      expv[58] = 16'h0006;
      expv[59] = 16'h0006;
      expv[60] = 16'h0006;
      expv[61] = 16'h0006;
      expv[62] = 16'h0007;
      expv[63] = 16'h0007;
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
