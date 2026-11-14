// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_003883 dut (
    .CLK(clk),
    .RST(in_vec[26:26]),
    .CFG_EN(in_vec[25:25]),
    .LO_SET(in_vec[24:24]),
    .FREQ(in_vec[23:0]),
    .ADF_R0(out_vec[64:33]),
    .ADF_R4(out_vec[32:1]),
    .DONE(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h5fcbff6;
    stim[1] = 27'h7fa3d2c;
    stim[2] = 27'h278e323;
    stim[3] = 27'h00d10ce;
    stim[4] = 27'h0e98fd7;
    stim[5] = 27'h317ca20;
    stim[6] = 27'h2e499a8;
    stim[7] = 27'h1b3b187;
    stim[8] = 27'h026544a;
    stim[9] = 27'h0f7842c;
    stim[10] = 27'h3120384;
    stim[11] = 27'h09ad5b5;
    stim[12] = 27'h3d00c5f;
    stim[13] = 27'h02669cd;
    stim[14] = 27'h11193ec;
    stim[15] = 27'h08df7d4;
    stim[16] = 27'h224aa5d;
    stim[17] = 27'h374a94c;
    stim[18] = 27'h002f669;
    stim[19] = 27'h1de7e71;
    stim[20] = 27'h124bb64;
    stim[21] = 27'h2ea631b;
    stim[22] = 27'h10741d0;
    stim[23] = 27'h3a38f5c;
    stim[24] = 27'h3cfedf1;
    stim[25] = 27'h3ccc878;
    stim[26] = 27'h17246d0;
    stim[27] = 27'h155e69b;
    stim[28] = 27'h2c98707;
    stim[29] = 27'h28ff401;
    stim[30] = 27'h0689c09;
    stim[31] = 27'h17776f1;
    stim[32] = 27'h0fc01ea;
    stim[33] = 27'h244917e;
    stim[34] = 27'h1cd8aee;
    stim[35] = 27'h1706391;
    stim[36] = 27'h16fb056;
    stim[37] = 27'h002d22a;
    stim[38] = 27'h2acd2b8;
    stim[39] = 27'h04c85ee;
    stim[40] = 27'h3755344;
    stim[41] = 27'h167a09a;
    stim[42] = 27'h165f936;
    stim[43] = 27'h1e56a40;
    stim[44] = 27'h2da9907;
    stim[45] = 27'h0819966;
    stim[46] = 27'h2c009a2;
    stim[47] = 27'h066913c;
    stim[48] = 27'h38b3919;
    stim[49] = 27'h1268d6c;
    stim[50] = 27'h1f6dbee;
    stim[51] = 27'h0261294;
    stim[52] = 27'h16359da;
    stim[53] = 27'h20ebf67;
    stim[54] = 27'h2202c60;
    stim[55] = 27'h3742019;
    stim[56] = 27'h104c726;
    stim[57] = 27'h2bb6df0;
    stim[58] = 27'h0c6ec60;
    stim[59] = 27'h3031334;
    stim[60] = 27'h18f4cdd;
    stim[61] = 27'h1922941;
    stim[62] = 27'h32034f5;
    stim[63] = 27'h25c765b;
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
      expv[0] = 65'h000a03e800159007x;
      expv[1] = 65'h000a03e800159007x;
      expv[2] = 65'h000a03e800159007x;
      expv[3] = 65'h000a03e800159007x;
      expv[4] = 65'h000a03e800159007x;
      expv[5] = 65'h000a03e800159007x;
      expv[6] = 65'h000a03e800159007x;
      expv[7] = 65'h000a03e800159007x;
      expv[8] = 65'h000a03e800159007x;
      expv[9] = 65'h000a03e800159007x;
      expv[10] = 65'h000a03e800159007x;
      expv[11] = 65'h000a03e800159007x;
      expv[12] = 65'h000a03e800159007x;
      expv[13] = 65'h000a03e800159007x;
      expv[14] = 65'h000a03e800159007x;
      expv[15] = 65'h000a03e800159007x;
      expv[16] = 65'h000a03e800159007x;
      expv[17] = 65'h000a03e800159007x;
      expv[18] = 65'h000a03e800159007x;
      expv[19] = 65'h000a03e800159007x;
      expv[20] = 65'h000a03e800159007x;
      expv[21] = 65'h000a03e800159007x;
      expv[22] = 65'h000a03e800159007x;
      expv[23] = 65'h000a03e800159007x;
      expv[24] = 65'h000a03e800159007x;
      expv[25] = 65'h000a03e800159007x;
      expv[26] = 65'h000a03e800159007x;
      expv[27] = 65'h000a03e800159007x;
      expv[28] = 65'h000a03e800159007x;
      expv[29] = 65'h000a03e800159007x;
      expv[30] = 65'h000a03e800159007x;
      expv[31] = 65'h000a03e800159007x;
      expv[32] = 65'h000a03e800159007x;
      expv[33] = 65'h000a03e800159007x;
      expv[34] = 65'h000a03e800159007x;
      expv[35] = 65'h000a03e800159007x;
      expv[36] = 65'h000a03e800159007x;
      expv[37] = 65'h000a03e800159007x;
      expv[38] = 65'h000a03e800159007x;
      expv[39] = 65'h000a03e800159007x;
      expv[40] = 65'h000a03e800159007x;
      expv[41] = 65'h000a03e800159007x;
      expv[42] = 65'h000a03e800159007x;
      expv[43] = 65'h000a03e800159007x;
      expv[44] = 65'h000a03e800159007x;
      expv[45] = 65'h000a03e800159007x;
      expv[46] = 65'h000a03e800159007x;
      expv[47] = 65'h000a03e800159007x;
      expv[48] = 65'h000a03e800159007x;
      expv[49] = 65'h000a03e800159007x;
      expv[50] = 65'h000a03e800159007x;
      expv[51] = 65'h000a03e800159007x;
      expv[52] = 65'h000a03e800159007x;
      expv[53] = 65'h000a03e800159007x;
      expv[54] = 65'h000a03e800159007x;
      expv[55] = 65'h000a03e800159007x;
      expv[56] = 65'h000a03e800159007x;
      expv[57] = 65'h000a03e800159007x;
      expv[58] = 65'h000a03e800159007x;
      expv[59] = 65'h000a03e800159007x;
      expv[60] = 65'h000a03e800159007x;
      expv[61] = 65'h000a03e800159007x;
      expv[62] = 65'h000a03e800159007x;
      expv[63] = 65'h000a03e800159007x;
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
