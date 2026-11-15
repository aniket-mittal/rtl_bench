// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_164025 dut (
    .clk_i(clk),
    .rst_i(in_vec[17:17]),
    .a_bi(in_vec[16:9]),
    .b_bi(in_vec[8:1]),
    .start_i(in_vec[0:0]),
    .busy_o(out_vec[16:16]),
    .y_bo(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h36ec3;
    stim[1] = 18'h3a7a8;
    stim[2] = 18'h180f1;
    stim[3] = 18'h15919;
    stim[4] = 18'h1ca49;
    stim[5] = 18'h12340;
    stim[6] = 18'h0f13e;
    stim[7] = 18'h156f3;
    stim[8] = 18'h06dd1;
    stim[9] = 18'h15994;
    stim[10] = 18'h1e8fe;
    stim[11] = 18'h0cf9e;
    stim[12] = 18'h03b89;
    stim[13] = 18'h1fc2b;
    stim[14] = 18'h1579e;
    stim[15] = 18'h1c00e;
    stim[16] = 18'h06b00;
    stim[17] = 18'h04afb;
    stim[18] = 18'h1a9f9;
    stim[19] = 18'h19e52;
    stim[20] = 18'h0b333;
    stim[21] = 18'h092fb;
    stim[22] = 18'h109d6;
    stim[23] = 18'h0819f;
    stim[24] = 18'h1a8e3;
    stim[25] = 18'h0f5f9;
    stim[26] = 18'h15750;
    stim[27] = 18'h05062;
    stim[28] = 18'h08936;
    stim[29] = 18'h03e2f;
    stim[30] = 18'h1076b;
    stim[31] = 18'h09ac9;
    stim[32] = 18'h0a793;
    stim[33] = 18'h037e6;
    stim[34] = 18'h12d66;
    stim[35] = 18'h0c36b;
    stim[36] = 18'h0ab2b;
    stim[37] = 18'h09b29;
    stim[38] = 18'h08d66;
    stim[39] = 18'h1c79f;
    stim[40] = 18'h18e65;
    stim[41] = 18'h1024d;
    stim[42] = 18'h1a253;
    stim[43] = 18'h1467f;
    stim[44] = 18'h08904;
    stim[45] = 18'h01b73;
    stim[46] = 18'h18d89;
    stim[47] = 18'h101f6;
    stim[48] = 18'h163da;
    stim[49] = 18'h11d35;
    stim[50] = 18'h1bec3;
    stim[51] = 18'h077df;
    stim[52] = 18'h1d80a;
    stim[53] = 18'h033e3;
    stim[54] = 18'h13afb;
    stim[55] = 18'h17902;
    stim[56] = 18'h1ea13;
    stim[57] = 18'h18c3c;
    stim[58] = 18'h0c693;
    stim[59] = 18'h0c28b;
    stim[60] = 18'h0bfbf;
    stim[61] = 18'h0d1ba;
    stim[62] = 18'h13170;
    stim[63] = 18'h072a8;
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
      expv[3] = 17'h10000;
      expv[4] = 17'h10000;
      expv[5] = 17'h10000;
      expv[6] = 17'h10000;
      expv[7] = 17'h10000;
      expv[8] = 17'h10000;
      expv[9] = 17'h10000;
      expv[10] = 17'h10000;
      expv[11] = 17'h03000;
      expv[12] = 17'h03000;
      expv[13] = 17'h13000;
      expv[14] = 17'h13000;
      expv[15] = 17'h13000;
      expv[16] = 17'h13000;
      expv[17] = 17'h13000;
      expv[18] = 17'h13000;
      expv[19] = 17'h13000;
      expv[20] = 17'h13000;
      expv[21] = 17'h00740;
      expv[22] = 17'h10740;
      expv[23] = 17'h10740;
      expv[24] = 17'h10740;
      expv[25] = 17'h10740;
      expv[26] = 17'h10740;
      expv[27] = 17'h10740;
      expv[28] = 17'h10740;
      expv[29] = 17'h10740;
      expv[30] = 17'h0da40;
      expv[31] = 17'h1da40;
      expv[32] = 17'h1da40;
      expv[33] = 17'h1da40;
      expv[34] = 17'h1da40;
      expv[35] = 17'h1da40;
      expv[36] = 17'h1da40;
      expv[37] = 17'h1da40;
      expv[38] = 17'h1da40;
      expv[39] = 17'h09800;
      expv[40] = 17'h19800;
      expv[41] = 17'h19800;
      expv[42] = 17'h19800;
      expv[43] = 17'h19800;
      expv[44] = 17'h19800;
      expv[45] = 17'h19800;
      expv[46] = 17'h19800;
      expv[47] = 17'h19800;
      expv[48] = 17'h038c0;
      expv[49] = 17'h038c0;
      expv[50] = 17'h138c0;
      expv[51] = 17'h138c0;
      expv[52] = 17'h138c0;
      expv[53] = 17'h138c0;
      expv[54] = 17'h138c0;
      expv[55] = 17'h138c0;
      expv[56] = 17'h138c0;
      expv[57] = 17'h138c0;
      expv[58] = 17'h00000;
      expv[59] = 17'h10000;
      expv[60] = 17'h10000;
      expv[61] = 17'h10000;
      expv[62] = 17'h10000;
      expv[63] = 17'h10000;
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
