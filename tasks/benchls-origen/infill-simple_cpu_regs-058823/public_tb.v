// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_058823 dut (
    .signal(clk),
    .in(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hb564ea4b;
    stim[1] = 32'hc51f7096;
    stim[2] = 32'hd7e0f3e3;
    stim[3] = 32'h6d83d661;
    stim[4] = 32'h106a399d;
    stim[5] = 32'h99e575aa;
    stim[6] = 32'hb1717414;
    stim[7] = 32'ha8843af6;
    stim[8] = 32'h458d9061;
    stim[9] = 32'h21a94551;
    stim[10] = 32'h8835ba25;
    stim[11] = 32'h4aaaccaa;
    stim[12] = 32'h495e18c5;
    stim[13] = 32'he6eec29a;
    stim[14] = 32'h18b29308;
    stim[15] = 32'h0ae59c24;
    stim[16] = 32'h1cc2b171;
    stim[17] = 32'h8e9bf604;
    stim[18] = 32'hf1f57d06;
    stim[19] = 32'h8dcd14fa;
    stim[20] = 32'hff2d184e;
    stim[21] = 32'hb41a39f8;
    stim[22] = 32'hb21112f2;
    stim[23] = 32'h3f751631;
    stim[24] = 32'h40c54954;
    stim[25] = 32'h848a7d29;
    stim[26] = 32'h5bc4a883;
    stim[27] = 32'h1e82eec3;
    stim[28] = 32'h0291ecd0;
    stim[29] = 32'h1164591d;
    stim[30] = 32'hb23e90da;
    stim[31] = 32'hbe36a2c3;
    stim[32] = 32'h6b968e8b;
    stim[33] = 32'hab15758e;
    stim[34] = 32'h5edde8e4;
    stim[35] = 32'h978985ab;
    stim[36] = 32'h44042a48;
    stim[37] = 32'h82ee799d;
    stim[38] = 32'h6e246042;
    stim[39] = 32'hb0b1f65e;
    stim[40] = 32'h55810489;
    stim[41] = 32'h5eba3c75;
    stim[42] = 32'hbe74195c;
    stim[43] = 32'h6d568935;
    stim[44] = 32'h5d6c80f6;
    stim[45] = 32'h5c5d6d36;
    stim[46] = 32'h46b9bffe;
    stim[47] = 32'h5d3298f3;
    stim[48] = 32'h66d9b353;
    stim[49] = 32'h7ac326ee;
    stim[50] = 32'h78a260d6;
    stim[51] = 32'h104960d4;
    stim[52] = 32'hefd2d065;
    stim[53] = 32'hd1ebd845;
    stim[54] = 32'h76c01f1c;
    stim[55] = 32'hf32c47dd;
    stim[56] = 32'hbd6beed0;
    stim[57] = 32'h56e2339e;
    stim[58] = 32'haccc279a;
    stim[59] = 32'h9ed4789d;
    stim[60] = 32'h618daed0;
    stim[61] = 32'ha7bafbae;
    stim[62] = 32'h7d5acc17;
    stim[63] = 32'h08095b1c;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hb564ea4b;
      expv[2] = 32'hc51f7096;
      expv[3] = 32'hd7e0f3e3;
      expv[4] = 32'h6d83d661;
      expv[5] = 32'h106a399d;
      expv[6] = 32'h99e575aa;
      expv[7] = 32'hb1717414;
      expv[8] = 32'ha8843af6;
      expv[9] = 32'h458d9061;
      expv[10] = 32'h21a94551;
      expv[11] = 32'h8835ba25;
      expv[12] = 32'h4aaaccaa;
      expv[13] = 32'h495e18c5;
      expv[14] = 32'he6eec29a;
      expv[15] = 32'h18b29308;
      expv[16] = 32'h0ae59c24;
      expv[17] = 32'h1cc2b171;
      expv[18] = 32'h8e9bf604;
      expv[19] = 32'hf1f57d06;
      expv[20] = 32'h8dcd14fa;
      expv[21] = 32'hff2d184e;
      expv[22] = 32'hb41a39f8;
      expv[23] = 32'hb21112f2;
      expv[24] = 32'h3f751631;
      expv[25] = 32'h40c54954;
      expv[26] = 32'h848a7d29;
      expv[27] = 32'h5bc4a883;
      expv[28] = 32'h1e82eec3;
      expv[29] = 32'h0291ecd0;
      expv[30] = 32'h1164591d;
      expv[31] = 32'hb23e90da;
      expv[32] = 32'hbe36a2c3;
      expv[33] = 32'h6b968e8b;
      expv[34] = 32'hab15758e;
      expv[35] = 32'h5edde8e4;
      expv[36] = 32'h978985ab;
      expv[37] = 32'h44042a48;
      expv[38] = 32'h82ee799d;
      expv[39] = 32'h6e246042;
      expv[40] = 32'hb0b1f65e;
      expv[41] = 32'h55810489;
      expv[42] = 32'h5eba3c75;
      expv[43] = 32'hbe74195c;
      expv[44] = 32'h6d568935;
      expv[45] = 32'h5d6c80f6;
      expv[46] = 32'h5c5d6d36;
      expv[47] = 32'h46b9bffe;
      expv[48] = 32'h5d3298f3;
      expv[49] = 32'h66d9b353;
      expv[50] = 32'h7ac326ee;
      expv[51] = 32'h78a260d6;
      expv[52] = 32'h104960d4;
      expv[53] = 32'hefd2d065;
      expv[54] = 32'hd1ebd845;
      expv[55] = 32'h76c01f1c;
      expv[56] = 32'hf32c47dd;
      expv[57] = 32'hbd6beed0;
      expv[58] = 32'h56e2339e;
      expv[59] = 32'haccc279a;
      expv[60] = 32'h9ed4789d;
      expv[61] = 32'h618daed0;
      expv[62] = 32'ha7bafbae;
      expv[63] = 32'h7d5acc17;
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
