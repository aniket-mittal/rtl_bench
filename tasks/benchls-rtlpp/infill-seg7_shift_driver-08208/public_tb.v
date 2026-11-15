// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08208 dut (
    .clk(clk),
    .rst_n(in_vec[14:14]),
    .seg(in_vec[13:6]),
    .sel(in_vec[5:0]),
    .shcp(out_vec[3:3]),
    .stcp(out_vec[2:2]),
    .ds(out_vec[1:1]),
    .oe(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h0401;
    stim[1] = 15'h0573;
    stim[2] = 15'h6db9;
    stim[3] = 15'h50ea;
    stim[4] = 15'h54e9;
    stim[5] = 15'h7e67;
    stim[6] = 15'h665d;
    stim[7] = 15'h7b21;
    stim[8] = 15'h7cea;
    stim[9] = 15'h573f;
    stim[10] = 15'h77a4;
    stim[11] = 15'h7cb8;
    stim[12] = 15'h63c4;
    stim[13] = 15'h6d10;
    stim[14] = 15'h59fa;
    stim[15] = 15'h50b3;
    stim[16] = 15'h40c8;
    stim[17] = 15'h5ddd;
    stim[18] = 15'h408f;
    stim[19] = 15'h7722;
    stim[20] = 15'h464f;
    stim[21] = 15'h6d37;
    stim[22] = 15'h403f;
    stim[23] = 15'h73fd;
    stim[24] = 15'h5e2f;
    stim[25] = 15'h4eb8;
    stim[26] = 15'h79c2;
    stim[27] = 15'h5e2f;
    stim[28] = 15'h6b29;
    stim[29] = 15'h343c;
    stim[30] = 15'h647f;
    stim[31] = 15'h78bc;
    stim[32] = 15'h40db;
    stim[33] = 15'h48ae;
    stim[34] = 15'h4ec7;
    stim[35] = 15'h72ac;
    stim[36] = 15'h7ac8;
    stim[37] = 15'h51c5;
    stim[38] = 15'h5213;
    stim[39] = 15'h5bc5;
    stim[40] = 15'h4821;
    stim[41] = 15'h6f70;
    stim[42] = 15'h5cb5;
    stim[43] = 15'h7ecc;
    stim[44] = 15'h71f8;
    stim[45] = 15'h501a;
    stim[46] = 15'h7d61;
    stim[47] = 15'h613e;
    stim[48] = 15'h7ea6;
    stim[49] = 15'h5058;
    stim[50] = 15'h7add;
    stim[51] = 15'h74fa;
    stim[52] = 15'h7ba4;
    stim[53] = 15'h60cd;
    stim[54] = 15'h4c9f;
    stim[55] = 15'h787e;
    stim[56] = 15'h6464;
    stim[57] = 15'h6cd4;
    stim[58] = 15'h5fda;
    stim[59] = 15'h5fc2;
    stim[60] = 15'h595c;
    stim[61] = 15'h42bf;
    stim[62] = 15'h4c82;
    stim[63] = 15'h7a95;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h6;
      expv[4] = 4'h6;
      expv[5] = 4'ha;
      expv[6] = 4'ha;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h8;
      expv[10] = 4'h8;
      expv[11] = 4'h2;
      expv[12] = 4'h2;
      expv[13] = 4'ha;
      expv[14] = 4'ha;
      expv[15] = 4'h2;
      expv[16] = 4'h2;
      expv[17] = 4'ha;
      expv[18] = 4'ha;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h8;
      expv[22] = 4'h8;
      expv[23] = 4'h2;
      expv[24] = 4'h2;
      expv[25] = 4'ha;
      expv[26] = 4'ha;
      expv[27] = 4'h2;
      expv[28] = 4'h2;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h6;
      expv[32] = 4'h6;
      expv[33] = 4'ha;
      expv[34] = 4'ha;
      expv[35] = 4'h2;
      expv[36] = 4'h2;
      expv[37] = 4'ha;
      expv[38] = 4'ha;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h8;
      expv[42] = 4'h8;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h8;
      expv[46] = 4'h8;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h8;
      expv[50] = 4'h8;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h8;
      expv[54] = 4'h8;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h8;
      expv[58] = 4'h8;
      expv[59] = 4'h2;
      expv[60] = 4'h2;
      expv[61] = 4'ha;
      expv[62] = 4'ha;
      expv[63] = 4'h0;
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
