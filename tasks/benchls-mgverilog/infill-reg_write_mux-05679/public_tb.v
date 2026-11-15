// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05679 dut (
    .clk(clk),
    .ena(in_vec[24:24]),
    .seli(in_vec[23:23]),
    .we(in_vec[22:22]),
    .exp(in_vec[21:16]),
    .d(in_vec[15:0]),
    .result(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h0fded67;
    stim[1] = 25'h1fd4b25;
    stim[2] = 25'h1dfa47d;
    stim[3] = 25'h08897a9;
    stim[4] = 25'h13d6a88;
    stim[5] = 25'h0d08f0b;
    stim[6] = 25'h0773e21;
    stim[7] = 25'h19c933f;
    stim[8] = 25'h0465b89;
    stim[9] = 25'h06a861d;
    stim[10] = 25'h08f711c;
    stim[11] = 25'h1d9f68f;
    stim[12] = 25'h0a4e6cf;
    stim[13] = 25'h17f89a0;
    stim[14] = 25'h055f938;
    stim[15] = 25'h10d1213;
    stim[16] = 25'h19372ca;
    stim[17] = 25'h132c139;
    stim[18] = 25'h0ec04f5;
    stim[19] = 25'h06aa1f9;
    stim[20] = 25'h1b4f940;
    stim[21] = 25'h008d076;
    stim[22] = 25'h124cf57;
    stim[23] = 25'h13cbf5b;
    stim[24] = 25'h1224ef4;
    stim[25] = 25'h13a833f;
    stim[26] = 25'h1c6e040;
    stim[27] = 25'h09edf89;
    stim[28] = 25'h0a1aa2c;
    stim[29] = 25'h1c6bc61;
    stim[30] = 25'h0b1f91f;
    stim[31] = 25'h0c0107f;
    stim[32] = 25'h12575f7;
    stim[33] = 25'h01f8aa7;
    stim[34] = 25'h0f28f92;
    stim[35] = 25'h0f1d12a;
    stim[36] = 25'h1169058;
    stim[37] = 25'h0c2dcaf;
    stim[38] = 25'h10512b4;
    stim[39] = 25'h0184f4f;
    stim[40] = 25'h1549b88;
    stim[41] = 25'h0c2ac9b;
    stim[42] = 25'h1b49bf0;
    stim[43] = 25'h0d116a9;
    stim[44] = 25'h159c289;
    stim[45] = 25'h1c12d8a;
    stim[46] = 25'h19e515f;
    stim[47] = 25'h0d46cb3;
    stim[48] = 25'h066f97e;
    stim[49] = 25'h010bc49;
    stim[50] = 25'h045e968;
    stim[51] = 25'h00c8c75;
    stim[52] = 25'h1c488ba;
    stim[53] = 25'h05613bd;
    stim[54] = 25'h1394320;
    stim[55] = 25'h12600c4;
    stim[56] = 25'h028c376;
    stim[57] = 25'h0b56139;
    stim[58] = 25'h17532e9;
    stim[59] = 25'h1883db3;
    stim[60] = 25'h1fd8941;
    stim[61] = 25'h03fb69a;
    stim[62] = 25'h0660cd9;
    stim[63] = 25'h1919382;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'h003d;
      expv[3] = 16'h001f;
      expv[4] = 16'h001f;
      expv[5] = 16'h001f;
      expv[6] = 16'h001f;
      expv[7] = 16'h001f;
      expv[8] = 16'h001f;
      expv[9] = 16'h001f;
      expv[10] = 16'h001f;
      expv[11] = 16'h001f;
      expv[12] = 16'h0019;
      expv[13] = 16'h0019;
      expv[14] = 16'h89a0;
      expv[15] = 16'h89a0;
      expv[16] = 16'h89a0;
      expv[17] = 16'h89a0;
      expv[18] = 16'h89a0;
      expv[19] = 16'h89a0;
      expv[20] = 16'h89a0;
      expv[21] = 16'h89a0;
      expv[22] = 16'h89a0;
      expv[23] = 16'h89a0;
      expv[24] = 16'h89a0;
      expv[25] = 16'h89a0;
      expv[26] = 16'h89a0;
      expv[27] = 16'h0006;
      expv[28] = 16'h0006;
      expv[29] = 16'h0006;
      expv[30] = 16'h0006;
      expv[31] = 16'h0006;
      expv[32] = 16'h0006;
      expv[33] = 16'h0006;
      expv[34] = 16'h0006;
      expv[35] = 16'h0006;
      expv[36] = 16'h0006;
      expv[37] = 16'h0006;
      expv[38] = 16'h0006;
      expv[39] = 16'h0006;
      expv[40] = 16'h0006;
      expv[41] = 16'h9b88;
      expv[42] = 16'h9b88;
      expv[43] = 16'h9b88;
      expv[44] = 16'h9b88;
      expv[45] = 16'hc289;
      expv[46] = 16'h0001;
      expv[47] = 16'h0001;
      expv[48] = 16'h0001;
      expv[49] = 16'h0001;
      expv[50] = 16'h0001;
      expv[51] = 16'h0001;
      expv[52] = 16'h0001;
      expv[53] = 16'h0004;
      expv[54] = 16'h0004;
      expv[55] = 16'h0004;
      expv[56] = 16'h0004;
      expv[57] = 16'h0004;
      expv[58] = 16'h0004;
      expv[59] = 16'h32e9;
      expv[60] = 16'h32e9;
      expv[61] = 16'h003d;
      expv[62] = 16'h003d;
      expv[63] = 16'h003d;
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
