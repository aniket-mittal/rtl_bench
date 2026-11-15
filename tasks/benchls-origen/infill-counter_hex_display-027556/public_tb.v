// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_027556 dut (
    .KEY(in_vec[13:10]),
    .SW(in_vec[9:0]),
    .HEX0(out_vec[13:7]),
    .HEX1(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h0b0b;
    stim[1] = 14'h03d1;
    stim[2] = 14'h08d7;
    stim[3] = 14'h363e;
    stim[4] = 14'h0041;
    stim[5] = 14'h0b88;
    stim[6] = 14'h17e0;
    stim[7] = 14'h0787;
    stim[8] = 14'h0dc1;
    stim[9] = 14'h159f;
    stim[10] = 14'h3034;
    stim[11] = 14'h3086;
    stim[12] = 14'h3735;
    stim[13] = 14'h362f;
    stim[14] = 14'h1b14;
    stim[15] = 14'h2f49;
    stim[16] = 14'h1b24;
    stim[17] = 14'h363a;
    stim[18] = 14'h081a;
    stim[19] = 14'h0d47;
    stim[20] = 14'h3568;
    stim[21] = 14'h37e6;
    stim[22] = 14'h273a;
    stim[23] = 14'h0f60;
    stim[24] = 14'h189a;
    stim[25] = 14'h1585;
    stim[26] = 14'h1580;
    stim[27] = 14'h1832;
    stim[28] = 14'h1528;
    stim[29] = 14'h049a;
    stim[30] = 14'h1cae;
    stim[31] = 14'h1e73;
    stim[32] = 14'h06a0;
    stim[33] = 14'h1d54;
    stim[34] = 14'h39c1;
    stim[35] = 14'h34c2;
    stim[36] = 14'h250e;
    stim[37] = 14'h158e;
    stim[38] = 14'h35fe;
    stim[39] = 14'h3df2;
    stim[40] = 14'h28e7;
    stim[41] = 14'h3948;
    stim[42] = 14'h3420;
    stim[43] = 14'h3756;
    stim[44] = 14'h03b8;
    stim[45] = 14'h2166;
    stim[46] = 14'h0a18;
    stim[47] = 14'h2f64;
    stim[48] = 14'h13e3;
    stim[49] = 14'h1fda;
    stim[50] = 14'h0f2a;
    stim[51] = 14'h0b22;
    stim[52] = 14'h11dc;
    stim[53] = 14'h0c12;
    stim[54] = 14'h32ba;
    stim[55] = 14'h3d28;
    stim[56] = 14'h2b23;
    stim[57] = 14'h3626;
    stim[58] = 14'h3855;
    stim[59] = 14'h0d91;
    stim[60] = 14'h0842;
    stim[61] = 14'h3c5a;
    stim[62] = 14'h0162;
    stim[63] = 14'h1d18;
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
      expv[0] = 14'hxxxx;
      expv[1] = 14'hxxxx;
      expv[2] = 14'hxxxx;
      expv[3] = 14'h2040;
      expv[4] = 14'h2040;
      expv[5] = 14'h2040;
      expv[6] = 14'h2040;
      expv[7] = 14'h2040;
      expv[8] = 14'h2040;
      expv[9] = 14'h2040;
      expv[10] = 14'h2040;
      expv[11] = 14'h2040;
      expv[12] = 14'h2040;
      expv[13] = 14'h2040;
      expv[14] = 14'h2040;
      expv[15] = 14'h2040;
      expv[16] = 14'h2040;
      expv[17] = 14'h2040;
      expv[18] = 14'h2040;
      expv[19] = 14'h3cc0;
      expv[20] = 14'h2040;
      expv[21] = 14'h2040;
      expv[22] = 14'h2040;
      expv[23] = 14'h2040;
      expv[24] = 14'h2040;
      expv[25] = 14'h2040;
      expv[26] = 14'h2040;
      expv[27] = 14'h2040;
      expv[28] = 14'h2040;
      expv[29] = 14'h2040;
      expv[30] = 14'h2040;
      expv[31] = 14'h2040;
      expv[32] = 14'h2040;
      expv[33] = 14'h2040;
      expv[34] = 14'h2040;
      expv[35] = 14'h2040;
      expv[36] = 14'h2040;
      expv[37] = 14'h2040;
      expv[38] = 14'h2040;
      expv[39] = 14'h2040;
      expv[40] = 14'h2040;
      expv[41] = 14'h2040;
      expv[42] = 14'h2040;
      expv[43] = 14'h2040;
      expv[44] = 14'h2040;
      expv[45] = 14'h2040;
      expv[46] = 14'h2040;
      expv[47] = 14'h2040;
      expv[48] = 14'h2040;
      expv[49] = 14'h2040;
      expv[50] = 14'h2040;
      expv[51] = 14'h2040;
      expv[52] = 14'h2040;
      expv[53] = 14'h2040;
      expv[54] = 14'h2040;
      expv[55] = 14'h2040;
      expv[56] = 14'h2040;
      expv[57] = 14'h2040;
      expv[58] = 14'h2040;
      expv[59] = 14'h2040;
      expv[60] = 14'h2040;
      expv[61] = 14'h2040;
      expv[62] = 14'h2040;
      expv[63] = 14'h2040;
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
