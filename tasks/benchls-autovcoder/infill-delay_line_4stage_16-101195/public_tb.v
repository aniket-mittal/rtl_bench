// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_101195 dut (
    .clk(clk),
    .rst(in_vec[19:19]),
    .enable(in_vec[18:18]),
    .counter(in_vec[17:16]),
    .data_in(in_vec[15:0]),
    .data_out0(out_vec[63:48]),
    .data_out1(out_vec[47:32]),
    .data_out2(out_vec[31:16]),
    .data_out3(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hfb55b;
    stim[1] = 20'h95762;
    stim[2] = 20'h375b7;
    stim[3] = 20'h2c7ee;
    stim[4] = 20'h0a68a;
    stim[5] = 20'h77043;
    stim[6] = 20'h03f4d;
    stim[7] = 20'h0ddaf;
    stim[8] = 20'h0e879;
    stim[9] = 20'h19316;
    stim[10] = 20'h618e8;
    stim[11] = 20'h6438e;
    stim[12] = 20'h6d505;
    stim[13] = 20'h101f2;
    stim[14] = 20'h0a6d8;
    stim[15] = 20'h411b6;
    stim[16] = 20'h74ae0;
    stim[17] = 20'h070ab;
    stim[18] = 20'h7f876;
    stim[19] = 20'h41828;
    stim[20] = 20'h48cc1;
    stim[21] = 20'h541c2;
    stim[22] = 20'h2e04f;
    stim[23] = 20'h1e419;
    stim[24] = 20'h7f603;
    stim[25] = 20'h1f6f5;
    stim[26] = 20'h4b207;
    stim[27] = 20'h2df07;
    stim[28] = 20'h7a5ca;
    stim[29] = 20'h6dc80;
    stim[30] = 20'h0d62e;
    stim[31] = 20'h3f491;
    stim[32] = 20'h5ebf6;
    stim[33] = 20'h0ac45;
    stim[34] = 20'h42865;
    stim[35] = 20'h22ebe;
    stim[36] = 20'h5049b;
    stim[37] = 20'h6d932;
    stim[38] = 20'h07269;
    stim[39] = 20'h2a221;
    stim[40] = 20'h26d1d;
    stim[41] = 20'h03a8b;
    stim[42] = 20'h19ecf;
    stim[43] = 20'h7289e;
    stim[44] = 20'h40ee4;
    stim[45] = 20'h53065;
    stim[46] = 20'h3f06f;
    stim[47] = 20'h21c70;
    stim[48] = 20'h7ab88;
    stim[49] = 20'h56cfb;
    stim[50] = 20'h51c3c;
    stim[51] = 20'h6967d;
    stim[52] = 20'h49da8;
    stim[53] = 20'h59498;
    stim[54] = 20'h79623;
    stim[55] = 20'h7a09c;
    stim[56] = 20'h52524;
    stim[57] = 20'h6a8ed;
    stim[58] = 20'h2f2b2;
    stim[59] = 20'h50fb6;
    stim[60] = 20'h24c89;
    stim[61] = 20'h14d23;
    stim[62] = 20'h47821;
    stim[63] = 20'h0966d;
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
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h0000000000000000;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h0000000000000000;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'h0000000000000000;
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
