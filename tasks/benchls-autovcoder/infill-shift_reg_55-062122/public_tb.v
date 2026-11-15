// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 55;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062122 dut (
    .clock(clk),
    .io_d(in_vec[54:0]),
    .io_q(out_vec[54:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h2123101874250f;
    stim[1] = 55'h2f11c7cee09e86;
    stim[2] = 55'h1b32f2c2ba28bd;
    stim[3] = 55'h3a718d367a12fe;
    stim[4] = 55'h4c072eab1cfcfd;
    stim[5] = 55'h4cbb3e3f531d87;
    stim[6] = 55'h2eebf986eb2137;
    stim[7] = 55'h5e5f4a10f3b558;
    stim[8] = 55'h0c0a66b63ae3ea;
    stim[9] = 55'h7739ac13ecc5b7;
    stim[10] = 55'h49b54c41168fa5;
    stim[11] = 55'h5c78325390daf9;
    stim[12] = 55'h7ead30866384b5;
    stim[13] = 55'h1fef5546ab9439;
    stim[14] = 55'h08dfe0a28a907f;
    stim[15] = 55'h5d2726022d7a19;
    stim[16] = 55'h65dc03b750a6f5;
    stim[17] = 55'h2f28dcdcb727ae;
    stim[18] = 55'h6a98d872b95f4c;
    stim[19] = 55'h3fa9e55d51ae31;
    stim[20] = 55'h1a51de722a040e;
    stim[21] = 55'h6d6a73478243ea;
    stim[22] = 55'h01176ff1b23368;
    stim[23] = 55'h577c9e8fd90a93;
    stim[24] = 55'h7e76072b460d6c;
    stim[25] = 55'h551070932326e1;
    stim[26] = 55'h6d8b1d61405e37;
    stim[27] = 55'h2141719c92810b;
    stim[28] = 55'h4bbe182cd28e6a;
    stim[29] = 55'h6fcc0529a4eaac;
    stim[30] = 55'h04addfb1ef5415;
    stim[31] = 55'h6151fc357bb0c4;
    stim[32] = 55'h648215e0d34051;
    stim[33] = 55'h11c7abade9eb76;
    stim[34] = 55'h78af29051b197a;
    stim[35] = 55'h16106ec31b72bd;
    stim[36] = 55'h1fbbd39438f474;
    stim[37] = 55'h0ccebdfee9d11f;
    stim[38] = 55'h0b73c5d3ee1124;
    stim[39] = 55'h4376bab0f03601;
    stim[40] = 55'h49a07281a2e391;
    stim[41] = 55'h4ba0678dfe3a26;
    stim[42] = 55'h0a460df3a7d7fb;
    stim[43] = 55'h6d99cedcd24918;
    stim[44] = 55'h575f43071d72d4;
    stim[45] = 55'h54d02d2748a71e;
    stim[46] = 55'h7f1e84cd76e761;
    stim[47] = 55'h762a3b5e54d118;
    stim[48] = 55'h17fa8a8ebfeafb;
    stim[49] = 55'h05d6c29a71200f;
    stim[50] = 55'h1de5f3824b66f0;
    stim[51] = 55'h3fcba0b7412199;
    stim[52] = 55'h331c18eeca9597;
    stim[53] = 55'h6e90a8e9cbbf3b;
    stim[54] = 55'h51457c97cdd03d;
    stim[55] = 55'h73068b627ec278;
    stim[56] = 55'h44ab2e627a8fa9;
    stim[57] = 55'h6a1fdb8c078fdb;
    stim[58] = 55'h68d905f366aaa1;
    stim[59] = 55'h6bf1311f8e4e73;
    stim[60] = 55'h6995d53b7b9cbc;
    stim[61] = 55'h3acdd8b424022d;
    stim[62] = 55'h5a8a9a0385784e;
    stim[63] = 55'h43eb186d242b57;
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
      expv[0] = 55'hxxxxxxxxxxxxxx;
      expv[1] = 55'h2123101874250f;
      expv[2] = 55'h2f11c7cee09e86;
      expv[3] = 55'h1b32f2c2ba28bd;
      expv[4] = 55'h3a718d367a12fe;
      expv[5] = 55'h4c072eab1cfcfd;
      expv[6] = 55'h4cbb3e3f531d87;
      expv[7] = 55'h2eebf986eb2137;
      expv[8] = 55'h5e5f4a10f3b558;
      expv[9] = 55'h0c0a66b63ae3ea;
      expv[10] = 55'h7739ac13ecc5b7;
      expv[11] = 55'h49b54c41168fa5;
      expv[12] = 55'h5c78325390daf9;
      expv[13] = 55'h7ead30866384b5;
      expv[14] = 55'h1fef5546ab9439;
      expv[15] = 55'h08dfe0a28a907f;
      expv[16] = 55'h5d2726022d7a19;
      expv[17] = 55'h65dc03b750a6f5;
      expv[18] = 55'h2f28dcdcb727ae;
      expv[19] = 55'h6a98d872b95f4c;
      expv[20] = 55'h3fa9e55d51ae31;
      expv[21] = 55'h1a51de722a040e;
      expv[22] = 55'h6d6a73478243ea;
      expv[23] = 55'h01176ff1b23368;
      expv[24] = 55'h577c9e8fd90a93;
      expv[25] = 55'h7e76072b460d6c;
      expv[26] = 55'h551070932326e1;
      expv[27] = 55'h6d8b1d61405e37;
      expv[28] = 55'h2141719c92810b;
      expv[29] = 55'h4bbe182cd28e6a;
      expv[30] = 55'h6fcc0529a4eaac;
      expv[31] = 55'h04addfb1ef5415;
      expv[32] = 55'h6151fc357bb0c4;
      expv[33] = 55'h648215e0d34051;
      expv[34] = 55'h11c7abade9eb76;
      expv[35] = 55'h78af29051b197a;
      expv[36] = 55'h16106ec31b72bd;
      expv[37] = 55'h1fbbd39438f474;
      expv[38] = 55'h0ccebdfee9d11f;
      expv[39] = 55'h0b73c5d3ee1124;
      expv[40] = 55'h4376bab0f03601;
      expv[41] = 55'h49a07281a2e391;
      expv[42] = 55'h4ba0678dfe3a26;
      expv[43] = 55'h0a460df3a7d7fb;
      expv[44] = 55'h6d99cedcd24918;
      expv[45] = 55'h575f43071d72d4;
      expv[46] = 55'h54d02d2748a71e;
      expv[47] = 55'h7f1e84cd76e761;
      expv[48] = 55'h762a3b5e54d118;
      expv[49] = 55'h17fa8a8ebfeafb;
      expv[50] = 55'h05d6c29a71200f;
      expv[51] = 55'h1de5f3824b66f0;
      expv[52] = 55'h3fcba0b7412199;
      expv[53] = 55'h331c18eeca9597;
      expv[54] = 55'h6e90a8e9cbbf3b;
      expv[55] = 55'h51457c97cdd03d;
      expv[56] = 55'h73068b627ec278;
      expv[57] = 55'h44ab2e627a8fa9;
      expv[58] = 55'h6a1fdb8c078fdb;
      expv[59] = 55'h68d905f366aaa1;
      expv[60] = 55'h6bf1311f8e4e73;
      expv[61] = 55'h6995d53b7b9cbc;
      expv[62] = 55'h3acdd8b424022d;
      expv[63] = 55'h5a8a9a0385784e;
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
