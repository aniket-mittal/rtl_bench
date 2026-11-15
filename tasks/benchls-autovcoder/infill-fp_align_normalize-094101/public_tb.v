// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_094101 dut (
    .SumS_5(in_vec[45:13]),
    .Shift(in_vec[12:8]),
    .CExp(in_vec[7:0]),
    .NormM(out_vec[36:14]),
    .NormE(out_vec[13:5]),
    .ZeroSum(out_vec[4:4]),
    .NegE(out_vec[3:3]),
    .R(out_vec[2:2]),
    .S(out_vec[1:1]),
    .FG(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h2812b7ecf9f3;
    stim[1] = 46'h01cd77967094;
    stim[2] = 46'h0aee3f6b561a;
    stim[3] = 46'h3a802ecf7044;
    stim[4] = 46'h2284fbc0f958;
    stim[5] = 46'h344c943b9ade;
    stim[6] = 46'h1f2f4b74c2a1;
    stim[7] = 46'h3c01f59bd2eb;
    stim[8] = 46'h3407a6cb5e4d;
    stim[9] = 46'h355d3f04d4e1;
    stim[10] = 46'h2bce9977c36e;
    stim[11] = 46'h30619f3f9e9d;
    stim[12] = 46'h334d55eefb70;
    stim[13] = 46'h17fc2ab03ab6;
    stim[14] = 46'h1e240b4ecaac;
    stim[15] = 46'h1e56f736bda0;
    stim[16] = 46'h1e166628694d;
    stim[17] = 46'h37a5f2852e62;
    stim[18] = 46'h2f2c1772db2b;
    stim[19] = 46'h211d4fa9b9e7;
    stim[20] = 46'h2b5438b94475;
    stim[21] = 46'h0d68a255f864;
    stim[22] = 46'h163b9170571f;
    stim[23] = 46'h18f0cd35675c;
    stim[24] = 46'h037da2455cee;
    stim[25] = 46'h31e98e3de670;
    stim[26] = 46'h1a141a496ce7;
    stim[27] = 46'h1d069af75348;
    stim[28] = 46'h3a36a3733ec0;
    stim[29] = 46'h3c7aa340f125;
    stim[30] = 46'h19d10c71f122;
    stim[31] = 46'h2b1ef92e7f77;
    stim[32] = 46'h183d5ac0abcd;
    stim[33] = 46'h0622954376d1;
    stim[34] = 46'h3a48652eb59c;
    stim[35] = 46'h0eab9155950e;
    stim[36] = 46'h24849e6661c5;
    stim[37] = 46'h3a2a97e359c6;
    stim[38] = 46'h33223067f420;
    stim[39] = 46'h04ceaba35a25;
    stim[40] = 46'h2a4570c6b91c;
    stim[41] = 46'h0bde04bea337;
    stim[42] = 46'h07d3da193788;
    stim[43] = 46'h2ccd6e46b07e;
    stim[44] = 46'h280a4bdc82a5;
    stim[45] = 46'h1d4a50abfa7d;
    stim[46] = 46'h297c219155c8;
    stim[47] = 46'h35fc4c1371c1;
    stim[48] = 46'h0462c55795d8;
    stim[49] = 46'h247f56e1386c;
    stim[50] = 46'h076c589e9111;
    stim[51] = 46'h119a3fd529a1;
    stim[52] = 46'h16d923ba11f2;
    stim[53] = 46'h1d9732911db3;
    stim[54] = 46'h0b6612d6d927;
    stim[55] = 46'h363227aaccd9;
    stim[56] = 46'h2f7e2946fe35;
    stim[57] = 46'h14bd9d224866;
    stim[58] = 46'h384165b60ba8;
    stim[59] = 46'h3478b080eac8;
    stim[60] = 46'h23370ba555f6;
    stim[61] = 46'h005c9bd4a1ae;
    stim[62] = 46'h2e6334c1b2a2;
    stim[63] = 46'h07761e0b0346;
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
      expv[0] = 37'h056fd9db60;
      expv[1] = 37'h01cd779086;
      expv[2] = 37'h1b8fdac0a4;
      expv[3] = 37'h1a802ec6a2;
      expv[4] = 37'h09f781c7e0;
      expv[5] = 37'h1250ee18a0;
      expv[6] = 37'h1cbd2dd406;
      expv[7] = 37'h1007d65b43;
      expv[8] = 37'h09b2d00600;
      expv[9] = 37'h15d3f059a2;
      expv[10] = 37'h1e74cb8d67;
      expv[11] = 37'h07cfe01000;
      expv[12] = 37'h0aaf770ac0;
      expv[13] = 37'h10aac093a0;
      expv[14] = 37'h102d3b1440;
      expv[15] = 37'h1ee6d41060;
      expv[16] = 37'h0ccc50c8a0;
      expv[17] = 37'h1ca1480aa0;
      expv[18] = 37'h00bb960220;
      expv[19] = 37'h1a9f5359e0;
      expv[20] = 37'h15438b8e46;
      expv[21] = 37'h08a255c9a1;
      expv[22] = 37'h1dc8b80101;
      expv[23] = 37'h18669a8ac5;
      expv[24] = 37'h1a24541a40;
      expv[25] = 37'h1a638f4d67;
      expv[26] = 37'h01a4961b60;
      expv[27] = 37'h0834d786c7;
      expv[28] = 37'h08dcc81460;
      expv[29] = 37'h18f54682a2;
      expv[30] = 37'h13a218c243;
      expv[31] = 37'h1c97300b20;
      expv[32] = 37'h0ad6051860;
      expv[33] = 37'h08a550d766;
      expv[34] = 37'h090ca5d0e6;
      expv[35] = 37'h15722abf2d;
      expv[36] = 37'h09093cd882;
      expv[37] = 37'h152fc695a0;
      expv[38] = 37'h12230641a7;
      expv[39] = 37'h1aae8d0180;
      expv[40] = 37'h0ae18d4060;
      expv[41] = 37'h1ef025c687;
      expv[42] = 37'h09ed0c8e44;
      expv[43] = 37'h0ccd6e4de2;
      expv[44] = 37'h00292f5487;
      expv[45] = 37'h0942af8c80;
      expv[46] = 37'h0f84321683;
      expv[47] = 37'h0bf8981623;
      expv[48] = 37'h0c58aad865;
      expv[49] = 37'h1f56e10aa1;
      expv[50] = 37'h0ed8b10007;
      expv[51] = 37'h147faa5320;
      expv[52] = 37'h0db2475c47;
      expv[53] = 37'h06522012e0;
      expv[54] = 37'h0c25ad81c0;
      expv[55] = 37'h027aac19c0;
      expv[56] = 37'h0a51b802e0;
      expv[57] = 37'h1d9d224be0;
      expv[58] = 37'h0b2db013a0;
      expv[59] = 37'h02c20397e0;
      expv[60] = 37'h06e1749c43;
      expv[61] = 37'h00b93795a3;
      expv[62] = 37'h198cd31222;
      expv[63] = 37'h1bb0f04886;
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
