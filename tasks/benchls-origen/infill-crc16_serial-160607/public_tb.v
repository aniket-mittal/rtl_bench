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

  origen_160607 dut (
    .i_sys_clk(clk),
    .i_byte_in(in_vec[9:2]),
    .i_take(in_vec[1:1]),
    .i_reset(in_vec[0:0]),
    .o_ready(out_vec[16:16]),
    .o_crc16(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h1c3;
    stim[1] = 10'h1c1;
    stim[2] = 10'h28e;
    stim[3] = 10'h132;
    stim[4] = 10'h350;
    stim[5] = 10'h3f8;
    stim[6] = 10'h07c;
    stim[7] = 10'h10a;
    stim[8] = 10'h3f4;
    stim[9] = 10'h128;
    stim[10] = 10'h1e0;
    stim[11] = 10'h058;
    stim[12] = 10'h188;
    stim[13] = 10'h31a;
    stim[14] = 10'h16a;
    stim[15] = 10'h3a4;
    stim[16] = 10'h186;
    stim[17] = 10'h062;
    stim[18] = 10'h35a;
    stim[19] = 10'h352;
    stim[20] = 10'h338;
    stim[21] = 10'h23a;
    stim[22] = 10'h1c6;
    stim[23] = 10'h2a2;
    stim[24] = 10'h0d8;
    stim[25] = 10'h072;
    stim[26] = 10'h3b4;
    stim[27] = 10'h0a8;
    stim[28] = 10'h01c;
    stim[29] = 10'h312;
    stim[30] = 10'h114;
    stim[31] = 10'h3c0;
    stim[32] = 10'h04a;
    stim[33] = 10'h18c;
    stim[34] = 10'h334;
    stim[35] = 10'h066;
    stim[36] = 10'h220;
    stim[37] = 10'h23e;
    stim[38] = 10'h052;
    stim[39] = 10'h1d2;
    stim[40] = 10'h1b8;
    stim[41] = 10'h2d8;
    stim[42] = 10'h278;
    stim[43] = 10'h3ac;
    stim[44] = 10'h010;
    stim[45] = 10'h2a6;
    stim[46] = 10'h2de;
    stim[47] = 10'h11a;
    stim[48] = 10'h2e6;
    stim[49] = 10'h136;
    stim[50] = 10'h000;
    stim[51] = 10'h22a;
    stim[52] = 10'h25a;
    stim[53] = 10'h37c;
    stim[54] = 10'h316;
    stim[55] = 10'h378;
    stim[56] = 10'h05a;
    stim[57] = 10'h28a;
    stim[58] = 10'h0d4;
    stim[59] = 10'h1fc;
    stim[60] = 10'h3f0;
    stim[61] = 10'h07a;
    stim[62] = 10'h166;
    stim[63] = 10'h1c8;
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
      expv[0] = 17'h0ffff;
      expv[1] = 17'h0ffff;
      expv[2] = 17'h0ffff;
      expv[3] = 17'h0ffff;
      expv[4] = 17'h0ffff;
      expv[5] = 17'h0ffff;
      expv[6] = 17'h0ffff;
      expv[7] = 17'h0ffff;
      expv[8] = 17'h0ffff;
      expv[9] = 17'h0ffff;
      expv[10] = 17'h0ffff;
      expv[11] = 17'h0ffff;
      expv[12] = 17'h0ffff;
      expv[13] = 17'h0ffff;
      expv[14] = 17'h0ffff;
      expv[15] = 17'h0ffff;
      expv[16] = 17'h0ffff;
      expv[17] = 17'h0ffff;
      expv[18] = 17'h0ffff;
      expv[19] = 17'h0ffff;
      expv[20] = 17'h0ffff;
      expv[21] = 17'h0ffff;
      expv[22] = 17'h0ffff;
      expv[23] = 17'h0ffff;
      expv[24] = 17'h0ffff;
      expv[25] = 17'h0ffff;
      expv[26] = 17'h0ffff;
      expv[27] = 17'h0ffff;
      expv[28] = 17'h0ffff;
      expv[29] = 17'h0ffff;
      expv[30] = 17'h0ffff;
      expv[31] = 17'h0ffff;
      expv[32] = 17'h0ffff;
      expv[33] = 17'h0ffff;
      expv[34] = 17'h0ffff;
      expv[35] = 17'h0ffff;
      expv[36] = 17'h0ffff;
      expv[37] = 17'h0ffff;
      expv[38] = 17'h0ffff;
      expv[39] = 17'h0ffff;
      expv[40] = 17'h0ffff;
      expv[41] = 17'h0ffff;
      expv[42] = 17'h0ffff;
      expv[43] = 17'h0ffff;
      expv[44] = 17'h0ffff;
      expv[45] = 17'h0ffff;
      expv[46] = 17'h0ffff;
      expv[47] = 17'h0ffff;
      expv[48] = 17'h0ffff;
      expv[49] = 17'h0ffff;
      expv[50] = 17'h0ffff;
      expv[51] = 17'h0ffff;
      expv[52] = 17'h0ffff;
      expv[53] = 17'h0ffff;
      expv[54] = 17'h0ffff;
      expv[55] = 17'h0ffff;
      expv[56] = 17'h0ffff;
      expv[57] = 17'h0ffff;
      expv[58] = 17'h0ffff;
      expv[59] = 17'h0ffff;
      expv[60] = 17'h0ffff;
      expv[61] = 17'h0ffff;
      expv[62] = 17'h0ffff;
      expv[63] = 17'h0ffff;
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
