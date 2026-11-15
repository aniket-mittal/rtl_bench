// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01979 dut (
    .CLK(clk),
    .RST(in_vec[66:66]),
    .ED(in_vec[65:65]),
    .START(in_vec[64:64]),
    .DReal(in_vec[63:32]),
    .DImag(in_vec[31:0]),
    .DOReal(out_vec[64:33]),
    .DOImag(out_vec[32:1]),
    .RDY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h72142d605367a657f;
    stim[1] = 67'h7d9dc5aeea3a08312;
    stim[2] = 67'h1c59df88f5d7d51d7;
    stim[3] = 67'h27624152dd3010dbf;
    stim[4] = 67'h10ced2b107840ff54;
    stim[5] = 67'h0725b7162fc529240;
    stim[6] = 67'h1b4329b02daea13c2;
    stim[7] = 67'h3459a2bfeff2c52b8;
    stim[8] = 67'h07b3b09a97979a9e7;
    stim[9] = 67'h2c5128dbe00c23b1b;
    stim[10] = 67'h18519b43af1d0d56e;
    stim[11] = 67'h29a82feaf9c358d6a;
    stim[12] = 67'h315a87cf0a01137c6;
    stim[13] = 67'h17b4e6d24492f74a8;
    stim[14] = 67'h00446aeb4ee12c87b;
    stim[15] = 67'h2d851aff1c5544eaf;
    stim[16] = 67'h11913c4688e250027;
    stim[17] = 67'h28909f98549b94837;
    stim[18] = 67'h2a3751ae29110ab53;
    stim[19] = 67'h05ddad1a676e87b8a;
    stim[20] = 67'h3c6b6dac1c667e611;
    stim[21] = 67'h37a473df59d1e5ed7;
    stim[22] = 67'h201d6b0b24a7374c3;
    stim[23] = 67'h0173aac05f5d2b807;
    stim[24] = 67'h2d8d0b3828b838031;
    stim[25] = 67'h295b5d662447d6457;
    stim[26] = 67'h3567acfbdd00a3216;
    stim[27] = 67'h29b3120a8d4744d31;
    stim[28] = 67'h16103c0bd74b372d8;
    stim[29] = 67'h1755e4c86025c42d3;
    stim[30] = 67'h1f51f9eb7ee4a44ab;
    stim[31] = 67'h2cf6d33d76b30b65a;
    stim[32] = 67'h36de273a7b8d65321;
    stim[33] = 67'h2d6eb76ba9b39b8d4;
    stim[34] = 67'h1d36977b1aa967e7f;
    stim[35] = 67'h2556ed469ccad3aea;
    stim[36] = 67'h3a055e61432751516;
    stim[37] = 67'h239e220f1d3e93d07;
    stim[38] = 67'h03b4e552fe079d4ad;
    stim[39] = 67'h3494e2f8585d3b026;
    stim[40] = 67'h2f7b090722b52a664;
    stim[41] = 67'h7fce16cbd06582dee;
    stim[42] = 67'h20b5c3e1b611ffa28;
    stim[43] = 67'h1413d81fcbe4ddc69;
    stim[44] = 67'h2e20b7e10a4df3b76;
    stim[45] = 67'h05775e85887292e5d;
    stim[46] = 67'h2e7eaf013b711c5d6;
    stim[47] = 67'h0d65781bb010b75a2;
    stim[48] = 67'h087d2ebd6335b1192;
    stim[49] = 67'h2301cba5e623cf674;
    stim[50] = 67'h3c52293967837f320;
    stim[51] = 67'h377ba1d5c24e2d20c;
    stim[52] = 67'h064244f5a671a3398;
    stim[53] = 67'h32e4d3124d69bf6a7;
    stim[54] = 67'h098473286e052c75e;
    stim[55] = 67'h1ff8d1eb40535d575;
    stim[56] = 67'h3a8274fb6ca6f880b;
    stim[57] = 67'h04b2529eadd1e5bc6;
    stim[58] = 67'h2eba050770569f24d;
    stim[59] = 67'h0177971275efd825e;
    stim[60] = 67'h004945754991a1edc;
    stim[61] = 67'h13d230485ab70d3d1;
    stim[62] = 67'h212ed964462ad7624;
    stim[63] = 67'h1b3067ee93098312d;
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
      expv[0] = 65'hxxxxxxxxxxxxxxxxx;
      expv[1] = 65'hxxxxxxxxxxxxxxxxx;
      expv[2] = 65'hxxxxxxxxxxxxxxxxx;
      expv[3] = 65'hxxxxxxxxxxxxxxxxx;
      expv[4] = 65'hxxxxxxxxxxxxxxxxx;
      expv[5] = 65'hxxxxxxxxxxxxxxxxx;
      expv[6] = 65'hxxxxxxxxxxxxxxxxx;
      expv[7] = 65'hxxxxxxxxxxxxxxxxx;
      expv[8] = 65'hxxxxxxxxxxxxxxxxx;
      expv[9] = 65'hxxxxxxxxxxxxxxxxx;
      expv[10] = 65'hxxxxxxxxxxxxxxxxx;
      expv[11] = 65'hxxxxxxxxxxxxxxxxx;
      expv[12] = 65'hxxxxxxxxxxxxxxxxx;
      expv[13] = 65'hxxxxxxxxxxxxxxxxx;
      expv[14] = 65'hxxxxxxxxxxxxxxxxx;
      expv[15] = 65'hxxxxxxxxxxxxxxxxx;
      expv[16] = 65'hxxxxxxxxxxxxxxxxx;
      expv[17] = 65'hxxxxxxxxxxxxxxxxx;
      expv[18] = 65'hxxxxxxxxxxxxxxxxx;
      expv[19] = 65'h18a251b7c01847637;
      expv[20] = 65'h18a251b7c01847637;
      expv[21] = 65'h11213f30a9372906e;
      expv[22] = 65'h11213f30a9372906e;
      expv[23] = 65'h11f2ff6e74a7fe5e8;
      expv[24] = 65'h11f2ff6e74a7fe5e9;
      expv[25] = 65'h16a11a81fc16d0a75;
      expv[26] = 65'h003ad616494e6e986;
      expv[27] = 65'h185afd6e92acaa348;
      expv[28] = 65'h185afd6e92acaa348;
      expv[29] = 65'h185afd6e92acaa348;
      expv[30] = 65'h185afd6e92acaa348;
      expv[31] = 65'h185afd6e92acaa348;
      expv[32] = 65'h17006345acfe76c8e;
      expv[33] = 65'h05a84f2615027664b;
      expv[34] = 65'h05a84f2615027664b;
      expv[35] = 65'h05a84f2615027664b;
      expv[36] = 65'h19eda67aed6616cb4;
      expv[37] = 65'h0bbc8254d49890589;
      expv[38] = 65'h0bbc8254d49890589;
      expv[39] = 65'h0bbc8254d49890589;
      expv[40] = 65'h0bbc8254d49890589;
      expv[41] = 65'h0aadda8d3995a75d4;
      expv[42] = 65'h1580891c6884d1abf;
      expv[43] = 65'h1580891c6884d1abe;
      expv[44] = 65'h1580891c6884d1abe;
      expv[45] = 65'h1580891c6884d1abe;
      expv[46] = 65'h1580891c6884d1abe;
      expv[47] = 65'h1580891c6884d1abe;
      expv[48] = 65'h1580891c6884d1abe;
      expv[49] = 65'h1580891c6884d1abe;
      expv[50] = 65'h1580891c6884d1abe;
      expv[51] = 65'h1580891c6884d1abe;
      expv[52] = 65'h1ef6120e456a54cc8;
      expv[53] = 65'h1ef6120e456a54cc8;
      expv[54] = 65'h1ef6120e456a54cc8;
      expv[55] = 65'h1ef6120e456a54cc8;
      expv[56] = 65'h1ef6120e456a54cc8;
      expv[57] = 65'h1ef6120e456a54cc8;
      expv[58] = 65'h1ef6120e456a54cc8;
      expv[59] = 65'h1fc5b3bd20da98878;
      expv[60] = 65'h1fc5b3bd20da98879;
      expv[61] = 65'h1fc5b3bd20da98879;
      expv[62] = 65'h1fc5b3bd20da98879;
      expv[63] = 65'h1fc5b3bd20da98879;
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
