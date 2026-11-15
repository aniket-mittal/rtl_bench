// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 102;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  reg_based_cam dut (
    .clk(clk),
    .rst(in_vec[101:101]),
    .waddr(in_vec[100:97]),
    .wdata(in_vec[96:65]),
    .wcare(in_vec[64:33]),
    .wena(in_vec[32:32]),
    .lookup_data(in_vec[31:0]),
    .match_lines(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 102'h25497cf8bc51bb6883a30b8434;
    stim[1] = 102'h380182a1189d89ef9a618c0723;
    stim[2] = 102'h18e71989c21a7f191b8b0ee197;
    stim[3] = 102'h0b9f32f0463e86faf0650062bd;
    stim[4] = 102'h1dcee9b8173d6055c60ce3215d;
    stim[5] = 102'h0be7ab236211ae06cc1b169eae;
    stim[6] = 102'h044bdc0f46dcb97aaeaa12dc9a;
    stim[7] = 102'h1681a729f3094226b1d6d21ae5;
    stim[8] = 102'h09b9760fd667304d6a99dc0edf;
    stim[9] = 102'h13f7317f9a4c19f2acac364496;
    stim[10] = 102'h109fb1d7ffdfef740daa027dd1;
    stim[11] = 102'h03cef325e46103e5aa95a90f8b;
    stim[12] = 102'h1c3caf441b35671cea64ef04b2;
    stim[13] = 102'h147d61f8a030c630f81cee2459;
    stim[14] = 102'h06850e8a8b71944bcf52ba7127;
    stim[15] = 102'h17e4311a7b0cc5b7d1071305c8;
    stim[16] = 102'h062de2b21824c897f5cd53cb49;
    stim[17] = 102'h0d3966c179711d028e04c3c74c;
    stim[18] = 102'h1cb9e50433be046adae932b570;
    stim[19] = 102'h1594882913ae2f1d9c50a86154;
    stim[20] = 102'h11525f307c47dd92c5a6f8c609;
    stim[21] = 102'h0ae2e8994d8d47131f90486d61;
    stim[22] = 102'h05c0868c40449ab3963297d230;
    stim[23] = 102'h168a6d1f271b78ab0b018d72c1;
    stim[24] = 102'h1481e2cfc48186a12dc78e2016;
    stim[25] = 102'h159ca20600d24c1abd9372ebdb;
    stim[26] = 102'h00414cf7bc0211e0f3a8d54dbb;
    stim[27] = 102'h088c22dd7f962d3eb6d7ff286a;
    stim[28] = 102'h0fd9d3dd6cf6695b5c680d19f5;
    stim[29] = 102'h132a5c680fd60d5c09a42e4105;
    stim[30] = 102'h1fbd1ce189e1f992f6f1ccaeac;
    stim[31] = 102'h1af17ec884096b5925f086372f;
    stim[32] = 102'h1e367a4ffcfc02474b2ca30aa5;
    stim[33] = 102'h0b40c27147fdf02f481f3435cf;
    stim[34] = 102'h15b4734fd5a81da2d7aec5dd03;
    stim[35] = 102'h1a3468318916070100b2cf68e8;
    stim[36] = 102'h0ef88632bac563111caf53f1c6;
    stim[37] = 102'h1bd5f6a0a9c69911a2201699ce;
    stim[38] = 102'h117753f5d5b066a8c7e6cf59ee;
    stim[39] = 102'h1c7ba3485de5d172d7e79f45cf;
    stim[40] = 102'h05a0b0494dfbf649c35389f2ea;
    stim[41] = 102'h0483c11eebc7728811e23920f2;
    stim[42] = 102'h10561a77d808dd8295e9249866;
    stim[43] = 102'h022652dce20eef8e07dce82c81;
    stim[44] = 102'h051c9907c200d53830f823300f;
    stim[45] = 102'h0907ba50e5c81d12c5df8f9165;
    stim[46] = 102'h143efda259020ad7f05099481b;
    stim[47] = 102'h15460ebca849d3dd63d01b984a;
    stim[48] = 102'h050d7576375a6095213006def1;
    stim[49] = 102'h11efb01ecddf2c48f1bfc5d967;
    stim[50] = 102'h084744f40c710c624b00c0d3ed;
    stim[51] = 102'h11aabc8a57a8d954af2699a937;
    stim[52] = 102'h099340383dee02a98b075bab96;
    stim[53] = 102'h1aa301561f3ab1de3264676367;
    stim[54] = 102'h027a1fe9aa7ba5d4defa9c7557;
    stim[55] = 102'h12db622f2b6b85ac8ca7019343;
    stim[56] = 102'h0a7e958975b3e884367b2a63a9;
    stim[57] = 102'h14d3126206508562bc916cad23;
    stim[58] = 102'h1beac2bc1d9880c9536993e244;
    stim[59] = 102'h06672aba374c3a5eed2d59c3e3;
    stim[60] = 102'h1fc7a3a246f0650173fa5bd2c5;
    stim[61] = 102'h01ec7fb62f57f20e1e725fc253;
    stim[62] = 102'h16752d0e0f04ee3a1d1331a2ed;
    stim[63] = 102'h001f7a3484b9f2494d0e0268b3;
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
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
