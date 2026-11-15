// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 74;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01880 dut (
    .clk(clk),
    .ce(in_vec[73:73]),
    .reset(in_vec[72:72]),
    .flags(in_vec[71:40]),
    .prg_ain(in_vec[39:24]),
    .prg_read(in_vec[23:23]),
    .prg_write(in_vec[22:22]),
    .prg_din(in_vec[21:14]),
    .chr_ain(in_vec[13:0]),
    .prg_aout(out_vec[47:26]),
    .prg_allow(out_vec[25:25]),
    .chr_aout(out_vec[24:3]),
    .chr_allow(out_vec[2:2]),
    .vram_a10(out_vec[1:1]),
    .vram_ce(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 74'h33bc0999f32fe6b9678;
    stim[1] = 74'h33831ba875009acbd27;
    stim[2] = 74'h21f0ddf0377ad7ed8cb;
    stim[3] = 74'h2bb0bb3ca02ccda9564;
    stim[4] = 74'h0097d6ad60514b8412f;
    stim[5] = 74'h0e146cf1cdc9b8db15d;
    stim[6] = 74'h002583e957b88c34183;
    stim[7] = 74'h0409d4381e776f8217d;
    stim[8] = 74'h066cb6dfe729b61a28c;
    stim[9] = 74'h2cc8424e4c0e65efe8c;
    stim[10] = 74'h0cd4da690e44a898323;
    stim[11] = 74'h23f12bc607154298d7b;
    stim[12] = 74'h27d786676b0e295b51b;
    stim[13] = 74'h2bf49dab148b2efc56f;
    stim[14] = 74'h2a02e2fe4d2a3d55b29;
    stim[15] = 74'h2d2f47a05fd1431d8b9;
    stim[16] = 74'h28ec56cd98c52059b8f;
    stim[17] = 74'h05d67420597097cdfd1;
    stim[18] = 74'h250ad0be734e353cb75;
    stim[19] = 74'h29d2ad03dc51a242c19;
    stim[20] = 74'h00dd9138711402bb492;
    stim[21] = 74'h0a8e3f99143b88d2453;
    stim[22] = 74'h0a47423b91051882e45;
    stim[23] = 74'h0e5637ddaba454a70d4;
    stim[24] = 74'h275cdebd723fe5a4ec3;
    stim[25] = 74'h2b36773e40105e71533;
    stim[26] = 74'h26dd1b92724ae6202bc;
    stim[27] = 74'h011b5f29aae4291dfc0;
    stim[28] = 74'h2d5cce053ec8562f665;
    stim[29] = 74'h0ab085c0add833e6710;
    stim[30] = 74'h0d7c1693aead3acb850;
    stim[31] = 74'h24fe48d1fc934b74d4a;
    stim[32] = 74'h2c8d569a2c200218ac8;
    stim[33] = 74'h0907719417a9631e837;
    stim[34] = 74'h2f3aa7410477d5d972b;
    stim[35] = 74'h0fd30415eb5a8c77c14;
    stim[36] = 74'h0c4a3971effa8224fc3;
    stim[37] = 74'h019ac1fedee4263d051;
    stim[38] = 74'h0b0d39baa246945891c;
    stim[39] = 74'h05087add47f999b6711;
    stim[40] = 74'h2d4e552da37b3c54ea3;
    stim[41] = 74'h361863e8522ac0185d7;
    stim[42] = 74'h08197338904e905c406;
    stim[43] = 74'h0e1df2894a105fd859a;
    stim[44] = 74'h2cba0359e57651839fb;
    stim[45] = 74'h0bfcd34d05cdab1e4f8;
    stim[46] = 74'h21d6346def3c5b7ba00;
    stim[47] = 74'h252c3b0e7bd9c15097e;
    stim[48] = 74'h01f35c38d7aa0df4b31;
    stim[49] = 74'h233ef25d29e0e50d947;
    stim[50] = 74'h29690e32b8c2eb5a3e4;
    stim[51] = 74'h242aa26318ad328f839;
    stim[52] = 74'h031c9774dc0428f17d9;
    stim[53] = 74'h04b6341ffe60a92b37c;
    stim[54] = 74'h0e2e48c57ef122fd803;
    stim[55] = 74'h2e6df4ead65d4988ee2;
    stim[56] = 74'h2f941e2664faffe99c2;
    stim[57] = 74'h0244741da6fbedcb7f4;
    stim[58] = 74'h2bfc3a64cadb31bebff;
    stim[59] = 74'h21c4011094a7ae5ded1;
    stim[60] = 74'h1fd53de4ebea7756fe1;
    stim[61] = 74'h27a296d8ad2de97e224;
    stim[62] = 74'h0cd017a05a9626a6be4;
    stim[63] = 74'h231faeaac370e570d26;
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
      expv[0] = 48'h0xcbf90xx3cx;
      expv[1] = 48'h0f40250xe93d;
      expv[2] = 48'hf05eb70xc65c;
      expv[3] = 48'h0x0b310xab24;
      expv[4] = 48'h0x14510x0978;
      expv[5] = 48'h0f726f0x8aed;
      expv[6] = 48'hf06e230x0c18;
      expv[7] = 48'h0f9dd90x0be9;
      expv[8] = 48'hf04a6f0x1461;
      expv[9] = 48'h0f03990xf461;
      expv[10] = 48'h0f912b0x191c;
      expv[11] = 48'hf045530x6bdc;
      expv[12] = 48'h0xc38b0xa8d9;
      expv[13] = 48'h0f22c90x2b7c;
      expv[14] = 48'h0f4a8d0xd948;
      expv[15] = 48'h0ff4530xc5c8;
      expv[16] = 48'h0x314b0xdc78;
      expv[17] = 48'h0x5c250xfe88;
      expv[18] = 48'h0xd38d0x5ba8;
      expv[19] = 48'h0f146b0x60cd;
      expv[20] = 48'h0x45010xa491;
      expv[21] = 48'h0f0ee10x229d;
      expv[22] = 48'h0x41450x7229;
      expv[23] = 48'h0xe9150x86a1;
      expv[24] = 48'h0x8ff90x761c;
      expv[25] = 48'h0x04150xa998;
      expv[26] = 48'h0x92b90x15e4;
      expv[27] = 48'h0xb90b0xfe04;
      expv[28] = 48'h0fb2150xb32d;
      expv[29] = 48'h0f760f0x3881;
      expv[30] = 48'h0fab4f0xc281;
      expv[31] = 48'h0f24d30x6a54;
      expv[32] = 48'h0f08030x5640;
      expv[33] = 48'hf06a5b0x41b9;
      expv[34] = 48'h0f1df50xb958;
      expv[35] = 48'h0xd6a10xe0a1;
      expv[36] = 48'h0ffea30x7e1c;
      expv[37] = 48'h0fb9090x8288;
      expv[38] = 48'h0x91a50x48e4;
      expv[39] = 48'hf07e670x388d;
      expv[40] = 48'h0xdecd0x7518;
      expv[41] = 48'h0x8ab10x2eb8;
      expv[42] = 48'h0x13a50x2030;
      expv[43] = 48'h0x84150x2cd0;
      expv[44] = 48'h0f5d950xcfd9;
      expv[45] = 48'h0f73690x27c1;
      expv[46] = 48'h0fcf170xd001;
      expv[47] = 48'h0xf6730x4bf4;
      expv[48] = 48'hf06a830x598c;
      expv[49] = 48'h0x78390xca38;
      expv[50] = 48'h0x30bb0xxf25;
      expv[51] = 48'h0x2b4f0841c9;
      expv[52] = 48'h0x010b083ec8;
      expv[53] = 48'h0x982b081be1;
      expv[54] = 48'h0xbc4b08401c;
      expv[55] = 48'hf017530xx710;
      expv[56] = 48'h0x3ebd084e14;
      expv[57] = 48'hf03efb083fa1;
      expv[58] = 48'h0xb6cf0xxffd;
      expv[59] = 48'h0x29e9087688;
      expv[60] = 48'h0xfa9d0xxf0d;
      expv[61] = 48'h0f4b7b0x1121;
      expv[62] = 48'h0xa5890x5f21;
      expv[63] = 48'h0xdc390x6934;
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
