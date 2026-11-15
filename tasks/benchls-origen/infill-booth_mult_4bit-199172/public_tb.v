// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_199172 dut (
    .clk(clk),
    .start(in_vec[8:8]),
    .a(in_vec[7:4]),
    .b(in_vec[3:0]),
    .flag(out_vec[8:8]),
    .mul(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h193;
    stim[1] = 9'h05b;
    stim[2] = 9'h000;
    stim[3] = 9'h06e;
    stim[4] = 9'h154;
    stim[5] = 9'h151;
    stim[6] = 9'h0cf;
    stim[7] = 9'h03e;
    stim[8] = 9'h085;
    stim[9] = 9'h0be;
    stim[10] = 9'h1ba;
    stim[11] = 9'h0c1;
    stim[12] = 9'h14a;
    stim[13] = 9'h0dc;
    stim[14] = 9'h1f5;
    stim[15] = 9'h075;
    stim[16] = 9'h01d;
    stim[17] = 9'h172;
    stim[18] = 9'h040;
    stim[19] = 9'h0cc;
    stim[20] = 9'h1d1;
    stim[21] = 9'h0bc;
    stim[22] = 9'h12c;
    stim[23] = 9'h179;
    stim[24] = 9'h1f8;
    stim[25] = 9'h0c1;
    stim[26] = 9'h148;
    stim[27] = 9'h0f6;
    stim[28] = 9'h154;
    stim[29] = 9'h0fb;
    stim[30] = 9'h00e;
    stim[31] = 9'h048;
    stim[32] = 9'h07d;
    stim[33] = 9'h083;
    stim[34] = 9'h025;
    stim[35] = 9'h137;
    stim[36] = 9'h0a5;
    stim[37] = 9'h14b;
    stim[38] = 9'h054;
    stim[39] = 9'h12f;
    stim[40] = 9'h169;
    stim[41] = 9'h015;
    stim[42] = 9'h0b2;
    stim[43] = 9'h11c;
    stim[44] = 9'h003;
    stim[45] = 9'h02e;
    stim[46] = 9'h0a0;
    stim[47] = 9'h01f;
    stim[48] = 9'h0e6;
    stim[49] = 9'h08d;
    stim[50] = 9'h026;
    stim[51] = 9'h048;
    stim[52] = 9'h0ff;
    stim[53] = 9'h0d8;
    stim[54] = 9'h1f9;
    stim[55] = 9'h0fd;
    stim[56] = 9'h02a;
    stim[57] = 9'h011;
    stim[58] = 9'h0d2;
    stim[59] = 9'h1d1;
    stim[60] = 9'h151;
    stim[61] = 9'h187;
    stim[62] = 9'h1c0;
    stim[63] = 9'h071;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'hxxx;
      expv[3] = 9'hxxx;
      expv[4] = 9'hxxx;
      expv[5] = 9'hxxx;
      expv[6] = 9'hxxx;
      expv[7] = 9'hxxx;
      expv[8] = 9'hxxx;
      expv[9] = 9'hxxx;
      expv[10] = 9'hxxx;
      expv[11] = 9'hxxx;
      expv[12] = 9'hxxx;
      expv[13] = 9'hxxx;
      expv[14] = 9'h110;
      expv[15] = 9'h110;
      expv[16] = 9'h110;
      expv[17] = 9'h110;
      expv[18] = 9'h110;
      expv[19] = 9'h110;
      expv[20] = 9'h110;
      expv[21] = 9'h110;
      expv[22] = 9'h110;
      expv[23] = 9'h110;
      expv[24] = 9'h110;
      expv[25] = 9'h110;
      expv[26] = 9'h110;
      expv[27] = 9'h110;
      expv[28] = 9'h110;
      expv[29] = 9'h110;
      expv[30] = 9'h110;
      expv[31] = 9'h110;
      expv[32] = 9'h110;
      expv[33] = 9'h110;
      expv[34] = 9'h110;
      expv[35] = 9'h110;
      expv[36] = 9'h110;
      expv[37] = 9'h110;
      expv[38] = 9'h110;
      expv[39] = 9'h110;
      expv[40] = 9'h110;
      expv[41] = 9'h110;
      expv[42] = 9'h110;
      expv[43] = 9'h110;
      expv[44] = 9'h110;
      expv[45] = 9'h110;
      expv[46] = 9'h110;
      expv[47] = 9'h110;
      expv[48] = 9'h110;
      expv[49] = 9'h110;
      expv[50] = 9'h110;
      expv[51] = 9'h110;
      expv[52] = 9'h110;
      expv[53] = 9'h110;
      expv[54] = 9'h110;
      expv[55] = 9'h110;
      expv[56] = 9'h110;
      expv[57] = 9'h110;
      expv[58] = 9'h110;
      expv[59] = 9'h110;
      expv[60] = 9'h110;
      expv[61] = 9'h110;
      expv[62] = 9'h110;
      expv[63] = 9'h110;
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
