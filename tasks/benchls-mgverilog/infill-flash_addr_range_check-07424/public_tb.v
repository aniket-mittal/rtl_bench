// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07424 dut (
    .address(in_vec[22:0]),
    .is_addr_within_valid_range(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h0b5c6d;
    stim[1] = 23'h03637e;
    stim[2] = 23'h2f1b4e;
    stim[3] = 23'h5ed41b;
    stim[4] = 23'h2537b6;
    stim[5] = 23'h7cd59c;
    stim[6] = 23'h1bba13;
    stim[7] = 23'h4dda2b;
    stim[8] = 23'h5258ef;
    stim[9] = 23'h64d3c1;
    stim[10] = 23'h32ef33;
    stim[11] = 23'h58558e;
    stim[12] = 23'h24b5c2;
    stim[13] = 23'h000949;
    stim[14] = 23'h6c0f3f;
    stim[15] = 23'h03acd7;
    stim[16] = 23'h602e61;
    stim[17] = 23'h4906d4;
    stim[18] = 23'h55ef17;
    stim[19] = 23'h50442e;
    stim[20] = 23'h27a2e6;
    stim[21] = 23'h7ba19a;
    stim[22] = 23'h56e2fc;
    stim[23] = 23'h5273e5;
    stim[24] = 23'h6e16c3;
    stim[25] = 23'h278429;
    stim[26] = 23'h6b0cee;
    stim[27] = 23'h76bdba;
    stim[28] = 23'h4e5f57;
    stim[29] = 23'h20f411;
    stim[30] = 23'h58ae2f;
    stim[31] = 23'h3c5795;
    stim[32] = 23'h389752;
    stim[33] = 23'h232227;
    stim[34] = 23'h648b07;
    stim[35] = 23'h0dcc02;
    stim[36] = 23'h46bdb2;
    stim[37] = 23'h5b3a97;
    stim[38] = 23'h781be3;
    stim[39] = 23'h271666;
    stim[40] = 23'h0b8625;
    stim[41] = 23'h673131;
    stim[42] = 23'h3f3afe;
    stim[43] = 23'h760697;
    stim[44] = 23'h5fa52f;
    stim[45] = 23'h65d75a;
    stim[46] = 23'h0c2ac9;
    stim[47] = 23'h4b66d4;
    stim[48] = 23'h549e9f;
    stim[49] = 23'h31da6d;
    stim[50] = 23'h14b456;
    stim[51] = 23'h06cd46;
    stim[52] = 23'h690c50;
    stim[53] = 23'h1d8ada;
    stim[54] = 23'h712ceb;
    stim[55] = 23'h218309;
    stim[56] = 23'h6e9e0a;
    stim[57] = 23'h3feee6;
    stim[58] = 23'h43ae15;
    stim[59] = 23'h5f916b;
    stim[60] = 23'h72778b;
    stim[61] = 23'h46a71b;
    stim[62] = 23'h6963b1;
    stim[63] = 23'h1fbf5c;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
