// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_030222 dut (
    .iCLK(clk),
    .iXstart(in_vec[45:33]),
    .iYstart(in_vec[32:20]),
    .reading_sram(in_vec[19:10]),
    .reading_search(in_vec[9:0]),
    .oX_sram(out_vec[52:40]),
    .oY_sram(out_vec[39:27]),
    .oX_search(out_vec[26:14]),
    .oY_search(out_vec[13:1]),
    .finished(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h21190b7e25f3;
    stim[1] = 46'h36ad1e1322d7;
    stim[2] = 46'h07402e904a41;
    stim[3] = 46'h0af3670d3cb8;
    stim[4] = 46'h3a0a1057a1ae;
    stim[5] = 46'h2a6da9292bde;
    stim[6] = 46'h03d8b8477e18;
    stim[7] = 46'h1d54e5d857c0;
    stim[8] = 46'h22c03693fcbc;
    stim[9] = 46'h2a67b567fbf9;
    stim[10] = 46'h3c30382bbc68;
    stim[11] = 46'h1c2de3be8ada;
    stim[12] = 46'h27562056be91;
    stim[13] = 46'h30c755b302d3;
    stim[14] = 46'h393a39faed3b;
    stim[15] = 46'h1750a865641d;
    stim[16] = 46'h0668378db685;
    stim[17] = 46'h267694de046a;
    stim[18] = 46'h30fa0e491d72;
    stim[19] = 46'h3546eb9ed51b;
    stim[20] = 46'h0504e0031a04;
    stim[21] = 46'h11b0ba82d820;
    stim[22] = 46'h0e0744e98fd7;
    stim[23] = 46'h3863d51a7176;
    stim[24] = 46'h33ebaba24681;
    stim[25] = 46'h2135682880a3;
    stim[26] = 46'h1184e3a10416;
    stim[27] = 46'h2bc37ec7cfb9;
    stim[28] = 46'h0f9b106a5fc0;
    stim[29] = 46'h1055ff21c038;
    stim[30] = 46'h33bf76e6ea8e;
    stim[31] = 46'h2825ad32be0a;
    stim[32] = 46'h1c08b173fd9a;
    stim[33] = 46'h1f904eb98978;
    stim[34] = 46'h2c45f81aa397;
    stim[35] = 46'h21686a5d3c54;
    stim[36] = 46'h0f91def3bee3;
    stim[37] = 46'h39094bf4cef0;
    stim[38] = 46'h048506739845;
    stim[39] = 46'h3c1cc7e2b2bb;
    stim[40] = 46'h0a6d1b15d6e0;
    stim[41] = 46'h193a3b55d172;
    stim[42] = 46'h1991a655582d;
    stim[43] = 46'h19db4a5d75ad;
    stim[44] = 46'h0c357bbdac55;
    stim[45] = 46'h0edf942d2fd0;
    stim[46] = 46'h234167f4d19a;
    stim[47] = 46'h153e79c09962;
    stim[48] = 46'h3ed57e9ae617;
    stim[49] = 46'h3d49a1973375;
    stim[50] = 46'h16cbec57d8f5;
    stim[51] = 46'h1ad057df1f74;
    stim[52] = 46'h1da2309019bf;
    stim[53] = 46'h33d70518e99e;
    stim[54] = 46'h3b93757c35d3;
    stim[55] = 46'h28e29ef85030;
    stim[56] = 46'h08fb87703c17;
    stim[57] = 46'h38cb9fd06c2e;
    stim[58] = 46'h334dd145f011;
    stim[59] = 46'h0e5674a7c240;
    stim[60] = 46'h104a8ef9a6d5;
    stim[61] = 46'h2d2898c6a1ca;
    stim[62] = 46'h11b6f6c33ac1;
    stim[63] = 46'h391149fae604;
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
      expv[0] = 53'hxxxxxxxxxxxxxx;
      expv[1] = 53'h108c85b8000000;
      expv[2] = 53'h1b568f08000000;
      expv[3] = 53'h03a01748000000;
      expv[4] = 53'h0579b380000000;
      expv[5] = 53'h1d050828000000;
      expv[6] = 53'h1536d490000000;
      expv[7] = 53'h01ec5c20000000;
      expv[8] = 53'h0eaa72e8000000;
      expv[9] = 53'h11601b48000000;
      expv[10] = 53'h1533dab0000000;
      expv[11] = 53'h1e181c10000000;
      expv[12] = 53'h0e16f1d8000000;
      expv[13] = 53'h13ab1028000000;
      expv[14] = 53'h1863aad8000000;
      expv[15] = 53'h1c9d1cf8000000;
      expv[16] = 53'h0ba85430000000;
      expv[17] = 53'h03341bc0000000;
      expv[18] = 53'h133b4a68000000;
      expv[19] = 53'h187d0720000000;
      expv[20] = 53'h1aa375c8000000;
      expv[21] = 53'h02827000000000;
      expv[22] = 53'h08d85d40000000;
      expv[23] = 53'h0703a270000000;
      expv[24] = 53'h1c31ea88000000;
      expv[25] = 53'h19f5d5d0000000;
      expv[26] = 53'h109ab410000000;
      expv[27] = 53'h08c271d0000000;
      expv[28] = 53'h15e1bf60000000;
      expv[29] = 53'h07cd8830000000;
      expv[30] = 53'h082aff90000000;
      expv[31] = 53'h19dfbb70000000;
      expv[32] = 53'h1412d698000000;
      expv[33] = 53'h0e0458b8000000;
      expv[34] = 53'h0fc82758000000;
      expv[35] = 53'h1622fc08000000;
      expv[36] = 53'h10b43528000000;
      expv[37] = 53'h07c8ef78000000;
      expv[38] = 53'h1c84a5f8000000;
      expv[39] = 53'h02428338000000;
      expv[40] = 53'h1e0e63f0000000;
      expv[41] = 53'h05368d88000000;
      expv[42] = 53'h0c9d1da8000000;
      expv[43] = 53'h0cc8d328000000;
      expv[44] = 53'h0ceda528000000;
      expv[45] = 53'h061abdd8000000;
      expv[46] = 53'h076fca10000000;
      expv[47] = 53'h11a0b3f8000000;
      expv[48] = 53'h0a9f3ce0000000;
      expv[49] = 53'h1f6abf48000000;
      expv[50] = 53'h1ea4d0c8000000;
      expv[51] = 53'h0b65f628000000;
      expv[52] = 53'h0d682be8000000;
      expv[53] = 53'h0ed11848000000;
      expv[54] = 53'h19eb8288000000;
      expv[55] = 53'h1dc9bab8000000;
      expv[56] = 53'h14714f78000000;
      expv[57] = 53'h047dc3b8000000;
      expv[58] = 53'h1c65cfe8000000;
      expv[59] = 53'h19a6e8a0000000;
      expv[60] = 53'h072b3a50000000;
      expv[61] = 53'h08254778000000;
      expv[62] = 53'h16944c60000000;
      expv[63] = 53'h08db7b60000000;
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
