// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 58;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02679 dut (
    .clk(clk),
    .rst(in_vec[99:99]),
    .tlb_en(in_vec[98:98]),
    .vaddr(in_vec[97:66]),
    .spr_cs(in_vec[65:65]),
    .spr_write(in_vec[64:64]),
    .spr_addr(in_vec[63:32]),
    .spr_dat_i(in_vec[31:0]),
    .hit(out_vec[57:57]),
    .ppn(out_vec[56:35]),
    .uxe(out_vec[34:34]),
    .sxe(out_vec[33:33]),
    .ci(out_vec[32:32]),
    .spr_dat_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'hdfa6b1b629cdd577aac5b4c3a;
    stim[1] = 100'h97a69005acf8ae4c2334d7855;
    stim[2] = 100'h579939faf5b32545ad58af5ef;
    stim[3] = 100'h76b8004f87baa21f77cfadd19;
    stim[4] = 100'h49c05cef70c4b10ae1be862b0;
    stim[5] = 100'h1528a81a80444128208345c40;
    stim[6] = 100'h6b6162bc290094ff8da23f6f2;
    stim[7] = 100'h4206877fa174082c885a03309;
    stim[8] = 100'h3151738ee0c999219f4a3ea5b;
    stim[9] = 100'ha33bc1af8cba9d5c426322380;
    stim[10] = 100'h5dc4a280efc3c9d6409e9b42b;
    stim[11] = 100'h3f08e64f0b9d0e9879d24b702;
    stim[12] = 100'h36e2951d54a5f09fd4fa131da;
    stim[13] = 100'h54da87d01c682a53334f9db35;
    stim[14] = 100'h7f941a98f81e02f9f4accbb25;
    stim[15] = 100'h4e9869f512cb8a996345a818f;
    stim[16] = 100'h2300b3766492c86bb22e64bc8;
    stim[17] = 100'h58d95fe4915dc8d03b6b8f413;
    stim[18] = 100'h6b21f7a943122bd6e58fdb8a9;
    stim[19] = 100'h106c8cff2c8e81f6582c72fcc;
    stim[20] = 100'h0d6483fca4bdc573d697d63bd;
    stim[21] = 100'h694ffe4377c9639ba35c46aa8;
    stim[22] = 100'h1d9e94cbfff00481c875cd472;
    stim[23] = 100'h7c924b54630fe9c5c6a797331;
    stim[24] = 100'h6ae0477f926c1618b4a4c2d54;
    stim[25] = 100'h07ca0b73f58ac20054162b4c0;
    stim[26] = 100'h0c176b848ecba9582ca9a048f;
    stim[27] = 100'h375200a88db4ae6da0123ef1b;
    stim[28] = 100'h74ab34bb08b294f23e3c5135b;
    stim[29] = 100'h4b9afbc6c0e39d91a435db371;
    stim[30] = 100'h40c6a5b2ab1f5e56c5b3b30ef;
    stim[31] = 100'h0efa09124218764e86bb82d69;
    stim[32] = 100'h49a5947b71913ff36309fc293;
    stim[33] = 100'h07b9d0fa152871acfe30f7c3b;
    stim[34] = 100'h1fc2c3388ce2fb4f9e2f8fa8b;
    stim[35] = 100'h1412d9a79617e6fa925a80140;
    stim[36] = 100'h3cc2db4d9988b38c6f3a76abf;
    stim[37] = 100'h4c0b1fa63f8c692e084d8a634;
    stim[38] = 100'h0bdce605f40ddd9401b46d843;
    stim[39] = 100'h224b9e1f94409d2ade3d39bd4;
    stim[40] = 100'h29276dec8837d55a55d4507d0;
    stim[41] = 100'h51192e7217fd043211e895b4e;
    stim[42] = 100'h7b024cc3eeb78c22511ec85f3;
    stim[43] = 100'h34e199321f389e0ee5d167e5d;
    stim[44] = 100'h389efdf75297e3b138d07ff9d;
    stim[45] = 100'h5fbfd987da4684878a0835a3a;
    stim[46] = 100'h09bf886ee3c691da230962a09;
    stim[47] = 100'h182052eed1f949e96b6e42341;
    stim[48] = 100'h1273c0bb77e9d2da0d185882d;
    stim[49] = 100'h39abf3ea936887fffb1fd03e5;
    stim[50] = 100'h3b3f3903483091b08ea1d96c3;
    stim[51] = 100'h7f90c2038530dc03abf333a52;
    stim[52] = 100'h6dc3125dcc40ba0daf951e356;
    stim[53] = 100'h71f50832890443429795cef0a;
    stim[54] = 100'h57fe3be84f716fc05d1493922;
    stim[55] = 100'h77be59b57f398d1779fb1165d;
    stim[56] = 100'h4b9fa649309114946ab9ee780;
    stim[57] = 100'h2029cac9be2105480c2bb8add;
    stim[58] = 100'h5dd65d1d6a3c30c4ae9855da2;
    stim[59] = 100'h2d3708c1cc17dad485a1e1777;
    stim[60] = 100'h010efb4caf0723225159b17a2;
    stim[61] = 100'h74f163c62d306da86736ea131;
    stim[62] = 100'h3e9c20e3a2e7140d1fe46b955;
    stim[63] = 100'h70388df191ea61eb94c5a6501;
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
      expv[0] = 58'h0xxxxxxxxx000xx;
      expv[1] = 58'h0xxxxxxxxx000xx;
      expv[2] = 58'h0xxxxxx00000000;
      expv[3] = 58'h0xxxxxx5ef10001;
      expv[4] = 58'h0xxxxxx00000000;
      expv[5] = 58'h0xxxxxx2b000000;
      expv[6] = 58'h0xxxxxxxxx000xx;
      expv[7] = 58'h0xxxxxxxxxx000x;
      expv[8] = 58'h0xxxxxxxxxxx00x;
      expv[9] = 58'h0xxxxxxxxx000xx;
      expv[10] = 58'h0xxxxxxxxx000xx;
      expv[11] = 58'h0xxxxxxxxx000xx;
      expv[12] = 58'h0xxxxxx00000000;
      expv[13] = 58'h0xxxxxx00000000;
      expv[14] = 58'h0xxxxxx00000000;
      expv[15] = 58'h015997600000000;
      expv[16] = 58'h0159976xxxxx00x;
      expv[17] = 58'h0xxxxxx00000000;
      expv[18] = 58'h0xxxxxxxxxxx00x;
      expv[19] = 58'h0xxxxxxxxx000xx;
      expv[20] = 58'h0xxxxxxxxxxx00x;
      expv[21] = 58'h0xxxxxx00000000;
      expv[22] = 58'h0xxxxxx00000000;
      expv[23] = 58'h00eb9a8xxxx000x;
      expv[24] = 58'h00eb9a800000000;
      expv[25] = 58'h0xxxxxx00000000;
      expv[26] = 58'h0xxxxxxxxx000xx;
      expv[27] = 58'h0xxxxxxxxx000xx;
      expv[28] = 58'h0xxxxxxxxx000xx;
      expv[29] = 58'h0xxxxxxxxxx000x;
      expv[30] = 58'h0xxxxxxxxx000xx;
      expv[31] = 58'h0xxxxxxxxxxx00x;
      expv[32] = 58'h0xxxxxx00000000;
      expv[33] = 58'h0xxxxxx00000000;
      expv[34] = 58'h0xxxxxxxxx000xx;
      expv[35] = 58'h0xxxxxx00000000;
      expv[36] = 58'h0xxxxxx00000000;
      expv[37] = 58'h0xxxxxx00000000;
      expv[38] = 58'h009b14c00000000;
      expv[39] = 58'h0xxxxxx00000000;
      expv[40] = 58'h0xxxxxxxxx000xx;
      expv[41] = 58'h0xxxxxx00000000;
      expv[42] = 58'h0xxxxxxxxx000xx;
      expv[43] = 58'h0xxxxxx00000000;
      expv[44] = 58'h0xxxxxx00000000;
      expv[45] = 58'h0xxxxxx00000000;
      expv[46] = 58'h0xxxxxxxxxxx00x;
      expv[47] = 58'h0xxxxxx00000000;
      expv[48] = 58'h0xxxxxx00000000;
      expv[49] = 58'h009b14c00000000;
      expv[50] = 58'h009b14c8a400080;
      expv[51] = 58'h009b14c82d80001;
      expv[52] = 58'h009b14c8a400080;
      expv[53] = 58'h0xxxxxxxxx000xx;
      expv[54] = 58'h0xxxxxxxxx000xx;
      expv[55] = 58'h0xxxxxx00000000;
      expv[56] = 58'h03f622c00000000;
      expv[57] = 58'h0xxxxxx00000000;
      expv[58] = 58'h0057715b8800082;
      expv[59] = 58'h0xxxxxxxxx000xx;
      expv[60] = 58'h0xxxxxxxxx000xx;
      expv[61] = 58'h0xxxxxxxxx000xx;
      expv[62] = 58'h0xxxxxx78000000;
      expv[63] = 58'h0xxxxxx00000000;
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
