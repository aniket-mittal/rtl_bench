// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_123657 dut (
    .clock(clk),
    .reset(in_vec[9:9]),
    .ready(in_vec[8:8]),
    .volume(in_vec[7:3]),
    .source(in_vec[2:0]),
    .command_address(out_vec[24:17]),
    .command_data(out_vec[16:1]),
    .command_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h21b;
    stim[1] = 10'h2df;
    stim[2] = 10'h027;
    stim[3] = 10'h1cf;
    stim[4] = 10'h2ac;
    stim[5] = 10'h117;
    stim[6] = 10'h140;
    stim[7] = 10'h05e;
    stim[8] = 10'h086;
    stim[9] = 10'h136;
    stim[10] = 10'h13b;
    stim[11] = 10'h1bf;
    stim[12] = 10'h066;
    stim[13] = 10'h02f;
    stim[14] = 10'h0a5;
    stim[15] = 10'h1ca;
    stim[16] = 10'h150;
    stim[17] = 10'h1dd;
    stim[18] = 10'h11f;
    stim[19] = 10'h036;
    stim[20] = 10'h147;
    stim[21] = 10'h08f;
    stim[22] = 10'h109;
    stim[23] = 10'h144;
    stim[24] = 10'h189;
    stim[25] = 10'h19c;
    stim[26] = 10'h0e6;
    stim[27] = 10'h1d7;
    stim[28] = 10'h020;
    stim[29] = 10'h06a;
    stim[30] = 10'h199;
    stim[31] = 10'h32a;
    stim[32] = 10'h08a;
    stim[33] = 10'h22c;
    stim[34] = 10'h1b8;
    stim[35] = 10'h009;
    stim[36] = 10'h191;
    stim[37] = 10'h149;
    stim[38] = 10'h151;
    stim[39] = 10'h087;
    stim[40] = 10'h194;
    stim[41] = 10'h1d2;
    stim[42] = 10'h107;
    stim[43] = 10'h156;
    stim[44] = 10'h160;
    stim[45] = 10'h1cc;
    stim[46] = 10'h1cd;
    stim[47] = 10'h00f;
    stim[48] = 10'h021;
    stim[49] = 10'h197;
    stim[50] = 10'h04f;
    stim[51] = 10'h17a;
    stim[52] = 10'h19a;
    stim[53] = 10'h102;
    stim[54] = 10'h0ac;
    stim[55] = 10'h0c3;
    stim[56] = 10'h0be;
    stim[57] = 10'h17b;
    stim[58] = 10'h0a5;
    stim[59] = 10'h046;
    stim[60] = 10'h10d;
    stim[61] = 10'h02f;
    stim[62] = 10'h09a;
    stim[63] = 10'h178;
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
      expv[0] = 25'h0000000;
      expv[1] = 25'h0000000;
      expv[2] = 25'h0000000;
      expv[3] = 25'h0000000;
      expv[4] = 25'h0000000;
      expv[5] = 25'h0000000;
      expv[6] = 25'h0000001;
      expv[7] = 25'h008b581;
      expv[8] = 25'h0090801;
      expv[9] = 25'h0086301;
      expv[10] = 25'h0301011;
      expv[11] = 25'h034007f;
      expv[12] = 25'h0381e1f;
      expv[13] = 25'h0381e1f;
      expv[14] = 25'h0381e1f;
      expv[15] = 25'h0381e1f;
      expv[16] = 25'h01c1011;
      expv[17] = 25'h0140001;
      expv[18] = 25'h03d0001;
      expv[19] = 25'h0000000;
      expv[20] = 25'h0000000;
      expv[21] = 25'h0000000;
      expv[22] = 25'h0000000;
      expv[23] = 25'h0000000;
      expv[24] = 25'h0000000;
      expv[25] = 25'h0000000;
      expv[26] = 25'h0000000;
      expv[27] = 25'h0000000;
      expv[28] = 25'h0000000;
      expv[29] = 25'h0000000;
      expv[30] = 25'h0000000;
      expv[31] = 25'h0000000;
      expv[32] = 25'h0000000;
      expv[33] = 25'h0000000;
      expv[34] = 25'h0000000;
      expv[35] = 25'h0000001;
      expv[36] = 25'h0000001;
      expv[37] = 25'h0089481;
      expv[38] = 25'h0301011;
      expv[39] = 25'h034007f;
      expv[40] = 25'h0340049;
      expv[41] = 25'h0381e1f;
      expv[42] = 25'h01c1011;
      expv[43] = 25'h0140001;
      expv[44] = 25'h03d0001;
      expv[45] = 25'h0000000;
      expv[46] = 25'h0000000;
      expv[47] = 25'h0000000;
      expv[48] = 25'h0000000;
      expv[49] = 25'h0000000;
      expv[50] = 25'h0000000;
      expv[51] = 25'h0000000;
      expv[52] = 25'h0000000;
      expv[53] = 25'h0000000;
      expv[54] = 25'h0000000;
      expv[55] = 25'h0000000;
      expv[56] = 25'h0000000;
      expv[57] = 25'h0000000;
      expv[58] = 25'h0000000;
      expv[59] = 25'h0000000;
      expv[60] = 25'h0000000;
      expv[61] = 25'h0000000;
      expv[62] = 25'h0000000;
      expv[63] = 25'h0000000;
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
