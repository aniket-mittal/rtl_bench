// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 119;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  comparator dut (
    .a(in_vec[118:63]),
    .amask(in_vec[62:56]),
    .b(in_vec[55:0]),
    .match(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 119'h55eaf09ba14cee4b10078c5f174a09;
    stim[1] = 119'h5f0d035ba79422d373174d08a7b863;
    stim[2] = 119'h7b56dd47fd0d1989f40d49eb8eff6f;
    stim[3] = 119'h5927bae97825d5004f998c759da15c;
    stim[4] = 119'h0ffcf0f86d040dfcaae63b0e8bd8a5;
    stim[5] = 119'h2cd52b1636b883f94273f40aaba981;
    stim[6] = 119'h66c96482850115683a52be031de363;
    stim[7] = 119'h6e22c5bc6d1b059a4d99d388e900ca;
    stim[8] = 119'h2e7578319c39dbc1edee43e1d545c4;
    stim[9] = 119'h6245f5a4590467618de93bac7f4b9c;
    stim[10] = 119'h552cee58a956289abca46b6beebaf7;
    stim[11] = 119'h0047b4297fb36704945900576bed22;
    stim[12] = 119'h32035386a96273de23151bbdd0e166;
    stim[13] = 119'h1a732b5613a60a66c431ffbb89386b;
    stim[14] = 119'h603568d0bc98f71ba0fc399a8319de;
    stim[15] = 119'h40ed26814395d9efb860de0aea467b;
    stim[16] = 119'h792a6d86da2fed19f4f303b2607b9e;
    stim[17] = 119'h59f93a555b75671d69d866accd8adb;
    stim[18] = 119'h59277c8a502fa422e31df115590ff5;
    stim[19] = 119'h37ba5d991d0eb94caefeb2de83f302;
    stim[20] = 119'h13e561f2318a48b3271c505aff4510;
    stim[21] = 119'h6223d16056849a880f63e6fbb6b74b;
    stim[22] = 119'h0cef94f9ff38612d5507b445550e49;
    stim[23] = 119'h0531375980538bdc5f197d6eb41b4e;
    stim[24] = 119'h7acfe81a8b99f8cb4b4ead68fdf58e;
    stim[25] = 119'h184bfa4b790b62699a54fb3d4a299d;
    stim[26] = 119'h2f947d7e823bdad50573ee4ef815c7;
    stim[27] = 119'h024fb86680e9adf009f15b22eec036;
    stim[28] = 119'h072e27034cb3a63c855495743027d7;
    stim[29] = 119'h58ca5971ccf0c2d51a0b84d29789e8;
    stim[30] = 119'h57be1499e5c57000ab00d9f0c57f94;
    stim[31] = 119'h078e4d2367cbab0074c6f1ec9c8c89;
    stim[32] = 119'h31d607fe19d72add09a62e8476d2e9;
    stim[33] = 119'h3044e663552d18c2eb59903407b54a;
    stim[34] = 119'h12542fea37ec714f4312a4cdfd2f0a;
    stim[35] = 119'h122ca0ad521a07f70ebc06f34e856f;
    stim[36] = 119'h4462e6382015007377f704940eaae4;
    stim[37] = 119'h5ec5109e66bf834f839bece5bd0a9d;
    stim[38] = 119'h09106bd352341b02310934559dce3a;
    stim[39] = 119'h382646222561d647ce9617f2e5f919;
    stim[40] = 119'h54868f11de0856f6e4f414dc0222d5;
    stim[41] = 119'h73eab15051a9306e9112fb082b12a6;
    stim[42] = 119'h1ac239de0c3cc0c225d85715f74e5a;
    stim[43] = 119'h72d6d342ec616a39d8c7a1361f075e;
    stim[44] = 119'h0773ca8dd9a74ed10721ef2b0f2c91;
    stim[45] = 119'h13bb7c901700fe7c165de6c679376f;
    stim[46] = 119'h2492677b84527bac493354917b5de6;
    stim[47] = 119'h7ac0ef5a34fa791aad1c55cf4be9de;
    stim[48] = 119'h3a1af3f38d5600a617c628c41069b2;
    stim[49] = 119'h4561cf08f3e8a7d68103dd53988cb6;
    stim[50] = 119'h19761a52abeea3b399365914d15044;
    stim[51] = 119'h25d1174f606cbfd8da11af1b3f2b3e;
    stim[52] = 119'h4e17fa9f98b1c56eea7714642fe519;
    stim[53] = 119'h44f328e49bdab7bfe93e45d4f47731;
    stim[54] = 119'h25e3fc589d344da67229941af171ef;
    stim[55] = 119'h62d010ef5630e1561cdaf3f17ac38d;
    stim[56] = 119'h0c85491636384dcc870822ac06e0e9;
    stim[57] = 119'h23b54c119276a253d349ad5056b70f;
    stim[58] = 119'h0d6e62ec1fc63e8805bf1e811eeec3;
    stim[59] = 119'h0889d2a7c2fb5d83a1d9a9ede1f19f;
    stim[60] = 119'h37746c525ad3ff00a8c3f6a31cde61;
    stim[61] = 119'h1c871079b75bc047c849e9108d320f;
    stim[62] = 119'h34b2a731a3e68d47904530814f2516;
    stim[63] = 119'h70016a7045e4ffce92803d7aa10a2e;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
