// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 115;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_073377 dut (
    .clk(clk),
    .reset(in_vec[114:114]),
    .w_ip_addr(in_vec[113:82]),
    .w_mac_addr(in_vec[81:34]),
    .w_en(in_vec[33:33]),
    .r_ip_addr(in_vec[32:1]),
    .r_en(in_vec[0:0]),
    .r_mac_addr(out_vec[47:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 115'h559529e29d18dfa64efb75bac53eb;
    stim[1] = 115'h7fe339eb70beb6294cbaab812816e;
    stim[2] = 115'h31b0b6900e196feacacb14ecbd74d;
    stim[3] = 115'h1165fef32f8133224c5a55f697389;
    stim[4] = 115'h135fbd07f31708b05e294985c1abd;
    stim[5] = 115'h27bf6df570781608189b14e95865f;
    stim[6] = 115'h2a8f27cd94adfcbf4d7b96f5a82e7;
    stim[7] = 115'h111ad0e8eb1763bccd5e1ddc89292;
    stim[8] = 115'h686d67608acb127d74249792ea14b;
    stim[9] = 115'h0cb4f274c50d854d58df150926674;
    stim[10] = 115'h1c9bcb36ecfc1aec14544de3f524a;
    stim[11] = 115'h11b096977620cd0672014a1461366;
    stim[12] = 115'h314c34a47882ecd9c2372a9d42c2c;
    stim[13] = 115'h1e48a8447d2591b7610ba93021ee2;
    stim[14] = 115'h3cc2509a6dd47cc421370b45d5670;
    stim[15] = 115'h01a0d20698c06da98b2f17b16d32c;
    stim[16] = 115'h24c407ce108d6ecae1efbf0d99567;
    stim[17] = 115'h3ad6f2bc846fe60fcf8ad408dcc84;
    stim[18] = 115'h20d74a117d158371d24a6f6fe2a09;
    stim[19] = 115'h33c1fc1b26703824a8612b0b14bb5;
    stim[20] = 115'h191d86c4e78cd064af404e5b355d4;
    stim[21] = 115'h376908bc1d7b81524029aba2cf0ae;
    stim[22] = 115'h0281c81921266bfe27ed15ae7ca04;
    stim[23] = 115'h2030e47269d77fdf6366d1ab2f0b3;
    stim[24] = 115'h19669c6bc912bf669165322d3855d;
    stim[25] = 115'h3bd0a5f69c0183af95fed117eb199;
    stim[26] = 115'h02172e0c407fc44ad290aabc4d25d;
    stim[27] = 115'h3f3d0f0631749b6cfa01d51aa6ed9;
    stim[28] = 115'h3dc3d30c1da26680f72d11b848bda;
    stim[29] = 115'h21a2a6d32fdb9fd7baca0b85fb166;
    stim[30] = 115'h2912bcba1f106642427ace7d615b3;
    stim[31] = 115'h1f50e72fbe92ab639ee6eeed1d134;
    stim[32] = 115'h1b3cfc00b7f5ca43e476be04e0d61;
    stim[33] = 115'h2d3b6a03d70e72eae6594375e5e6e;
    stim[34] = 115'h2241247bbcca10caa07feccfe3e73;
    stim[35] = 115'h1e14cd0b7112c729af978a60793c8;
    stim[36] = 115'h38ebb6df4ca9c441e9fe24c62ab5e;
    stim[37] = 115'h1127b6e458f1a58cd3760bc30ddf2;
    stim[38] = 115'h2784750148b4e609a34c04c6cc5fd;
    stim[39] = 115'h025608ff756ab58e77a700c624f00;
    stim[40] = 115'h0223e251da5ff0dfd9b849310ebed;
    stim[41] = 115'h5e37cc5713b44878ad1bf6a0a77ec;
    stim[42] = 115'h2335c615c3d382dd66266092fe8ef;
    stim[43] = 115'h36c075ff05128c7a4245fda79d567;
    stim[44] = 115'h28003afb8b5d3136f59179e764686;
    stim[45] = 115'h1daab4fae3557d2a315e2ace29fc2;
    stim[46] = 115'h1c33b82b55fb5313216349599345c;
    stim[47] = 115'h0c9e7c9692fcb40a47e0bea7bde19;
    stim[48] = 115'h32c31de48d103744f9d5dd8a836a0;
    stim[49] = 115'h20616fae393814744feffbd92b330;
    stim[50] = 115'h14f9b76068aa60a41ac4c1ca3fd9e;
    stim[51] = 115'h2c545d829ba9fb789d63b95959539;
    stim[52] = 115'h2b915a8af29b15a6bf00b00c9367f;
    stim[53] = 115'h19871942e7581345193b9489533aa;
    stim[54] = 115'h12f44aadbd6f065e576d02ae839ce;
    stim[55] = 115'h3c23f98f9c4f96a670f26b126004c;
    stim[56] = 115'h1bb2fb3b54104db82fc9469e366ed;
    stim[57] = 115'h126b67e6aa7ec149af4a44c606a43;
    stim[58] = 115'h3c9e1ac2be76ea0e640fff093b034;
    stim[59] = 115'h1e30e3753372abcdfe2421cc78e82;
    stim[60] = 115'h34075d2055a1e68eca365d525520c;
    stim[61] = 115'h278d39289c3e17fe1109ce98026bb;
    stim[62] = 115'h389851e1b19681db8bcd93b247025;
    stim[63] = 115'h3d5bd2ec3f1131ef45743d85ae753;
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
      expv[0] = 48'h000000000000;
      expv[1] = 48'h000000000000;
      expv[2] = 48'h000000000000;
      expv[3] = 48'h000000000000;
      expv[4] = 48'h000000000000;
      expv[5] = 48'h000000000000;
      expv[6] = 48'h000000000000;
      expv[7] = 48'h000000000000;
      expv[8] = 48'h000000000000;
      expv[9] = 48'h000000000000;
      expv[10] = 48'h000000000000;
      expv[11] = 48'h000000000000;
      expv[12] = 48'h000000000000;
      expv[13] = 48'h000000000000;
      expv[14] = 48'h000000000000;
      expv[15] = 48'h000000000000;
      expv[16] = 48'h000000000000;
      expv[17] = 48'h000000000000;
      expv[18] = 48'h000000000000;
      expv[19] = 48'h000000000000;
      expv[20] = 48'h000000000000;
      expv[21] = 48'h000000000000;
      expv[22] = 48'h000000000000;
      expv[23] = 48'h000000000000;
      expv[24] = 48'h000000000000;
      expv[25] = 48'h000000000000;
      expv[26] = 48'h000000000000;
      expv[27] = 48'h000000000000;
      expv[28] = 48'h000000000000;
      expv[29] = 48'h000000000000;
      expv[30] = 48'h000000000000;
      expv[31] = 48'h000000000000;
      expv[32] = 48'h000000000000;
      expv[33] = 48'h000000000000;
      expv[34] = 48'h000000000000;
      expv[35] = 48'h000000000000;
      expv[36] = 48'h000000000000;
      expv[37] = 48'h000000000000;
      expv[38] = 48'h000000000000;
      expv[39] = 48'h000000000000;
      expv[40] = 48'h000000000000;
      expv[41] = 48'h000000000000;
      expv[42] = 48'h000000000000;
      expv[43] = 48'h000000000000;
      expv[44] = 48'h000000000000;
      expv[45] = 48'h000000000000;
      expv[46] = 48'h000000000000;
      expv[47] = 48'h000000000000;
      expv[48] = 48'h000000000000;
      expv[49] = 48'h000000000000;
      expv[50] = 48'h000000000000;
      expv[51] = 48'h000000000000;
      expv[52] = 48'h000000000000;
      expv[53] = 48'h000000000000;
      expv[54] = 48'h000000000000;
      expv[55] = 48'h000000000000;
      expv[56] = 48'h000000000000;
      expv[57] = 48'h000000000000;
      expv[58] = 48'h000000000000;
      expv[59] = 48'h000000000000;
      expv[60] = 48'h000000000000;
      expv[61] = 48'h000000000000;
      expv[62] = 48'h000000000000;
      expv[63] = 48'h000000000000;
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
