// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132544 dut (
    .clk(clk),
    .rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .slow_signal(in_vec[1:1]),
    .select(in_vec[0:0]),
    .final_output(out_vec[33:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h6dc698545;
    stim[1] = 35'h7f92e64c0;
    stim[2] = 35'h07ea3c15e;
    stim[3] = 35'h30c9f501d;
    stim[4] = 35'h0f62d5bd4;
    stim[5] = 35'h1bb71fd75;
    stim[6] = 35'h27c5965fb;
    stim[7] = 35'h139f0f49a;
    stim[8] = 35'h18c7eaa5b;
    stim[9] = 35'h1c3487425;
    stim[10] = 35'h28a21020d;
    stim[11] = 35'h168c6fe4b;
    stim[12] = 35'h05e8f017d;
    stim[13] = 35'h1434eb62c;
    stim[14] = 35'h40b072fa2;
    stim[15] = 35'h04cbac4f0;
    stim[16] = 35'h08855306d;
    stim[17] = 35'h289b230a5;
    stim[18] = 35'h14f373369;
    stim[19] = 35'h39fd0d6a7;
    stim[20] = 35'h193fa32da;
    stim[21] = 35'h0cad693f4;
    stim[22] = 35'h2169ce83e;
    stim[23] = 35'h34a62df17;
    stim[24] = 35'h22bbb2778;
    stim[25] = 35'h0c4814ee4;
    stim[26] = 35'h370fd6c3c;
    stim[27] = 35'h14dc27113;
    stim[28] = 35'h146c424c6;
    stim[29] = 35'h00a08b861;
    stim[30] = 35'h0f6c18fa1;
    stim[31] = 35'h24c90841c;
    stim[32] = 35'h0fca31ce0;
    stim[33] = 35'h3f8b7ce37;
    stim[34] = 35'h00fd94893;
    stim[35] = 35'h1f436ac80;
    stim[36] = 35'h306a3baff;
    stim[37] = 35'h0b030070b;
    stim[38] = 35'h1c81fdcd1;
    stim[39] = 35'h0fe96a415;
    stim[40] = 35'h26033532a;
    stim[41] = 35'h3b45b85e6;
    stim[42] = 35'h348bab6dc;
    stim[43] = 35'h1ee901796;
    stim[44] = 35'h1466cad5b;
    stim[45] = 35'h0f10dc90d;
    stim[46] = 35'h1bfa3a1b0;
    stim[47] = 35'h2f2f0da58;
    stim[48] = 35'h1ea0549d0;
    stim[49] = 35'h061f02f3f;
    stim[50] = 35'h0f873808f;
    stim[51] = 35'h3e84ca055;
    stim[52] = 35'h2697e20ec;
    stim[53] = 35'h2c5fdd750;
    stim[54] = 35'h0a37d12f7;
    stim[55] = 35'h28f0c87b6;
    stim[56] = 35'h0db8e778f;
    stim[57] = 35'h3cf6c68fe;
    stim[58] = 35'h311e60ead;
    stim[59] = 35'h07e8a0013;
    stim[60] = 35'h20c637695;
    stim[61] = 35'h267a10e66;
    stim[62] = 35'h34efd8541;
    stim[63] = 35'h18bb2d9b6;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h000000000;
      expv[6] = 34'h000000000;
      expv[7] = 34'h1f9645a7c;
      expv[8] = 34'h1f9645a7c;
      expv[9] = 34'h1f9645a7c;
      expv[10] = 34'h0247749c0;
      expv[11] = 34'h0247749c0;
      expv[12] = 34'h0247749c0;
      expv[13] = 34'h17f028c5c;
      expv[14] = 34'h000000000;
      expv[15] = 34'h000000000;
      expv[16] = 34'h000000000;
      expv[17] = 34'h000000000;
      expv[18] = 34'h000000000;
      expv[19] = 34'h000000000;
      expv[20] = 34'h2a4d7d39c;
      expv[21] = 34'h2a4d7d39c;
      expv[22] = 34'h2a4d7d39c;
      expv[23] = 34'h2a4d7d39e;
      expv[24] = 34'h2a4d7d39c;
      expv[25] = 34'h2a4d7d39c;
      expv[26] = 34'h2a4d7d39d;
      expv[27] = 34'h2a4d7d39c;
      expv[28] = 34'h2a4d7d39c;
      expv[29] = 34'h0c426c544;
      expv[30] = 34'h0c426c544;
      expv[31] = 34'h0c426c544;
      expv[32] = 34'h01c84924c;
      expv[33] = 34'h01c84924c;
      expv[34] = 34'h01c84924c;
      expv[35] = 34'h0914bd80c;
      expv[36] = 34'h0914bd80c;
      expv[37] = 34'h0914bd80c;
      expv[38] = 34'h3080430b0;
      expv[39] = 34'h3080430b0;
      expv[40] = 34'h3080430b0;
      expv[41] = 34'h32b503260;
      expv[42] = 34'h32b503260;
      expv[43] = 34'h32b503260;
      expv[44] = 34'h32b503262;
      expv[45] = 34'h32b503260;
      expv[46] = 34'h32b503260;
      expv[47] = 34'h1b3a3a1bc;
      expv[48] = 34'h1b3a3a1bc;
      expv[49] = 34'h1b3a3a1bc;
      expv[50] = 34'h1b3a3a1bc;
      expv[51] = 34'h1b3a3a1bc;
      expv[52] = 34'h1b3a3a1bc;
      expv[53] = 34'h0ee217e68;
      expv[54] = 34'h0ee217e68;
      expv[55] = 34'h0ee217e68;
      expv[56] = 34'h3b4870e8c;
      expv[57] = 34'h3b4870e8c;
      expv[58] = 34'h3b4870e8c;
      expv[59] = 34'h3b4870e8d;
      expv[60] = 34'h3b4870e8c;
      expv[61] = 34'h3b4870e8c;
      expv[62] = 34'h2650fa264;
      expv[63] = 34'h2650fa264;
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
