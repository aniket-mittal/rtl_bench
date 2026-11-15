// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
  localparam OW = 102;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_023787 dut (
    .clk_1x(clk),
    .clk_2x(in_vec[102:102]),
    .cpu_wstrb(in_vec[101:98]),
    .cpu_address(in_vec[97:66]),
    .cpu_write_data(in_vec[65:34]),
    .cpu_mem_valid(in_vec[33:33]),
    .cpu_mem_ready(in_vec[32:32]),
    .cpu_read_data(in_vec[31:0]),
    .cpu_wstrb_2x(out_vec[101:98]),
    .cpu_write_data_2x(out_vec[97:66]),
    .cpu_address_2x(out_vec[65:34]),
    .cpu_mem_valid_2x(out_vec[33:33]),
    .cpu_mem_ready_1x(out_vec[32:32]),
    .cpu_read_data_1x(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h332c859aca375bf1f04544630e;
    stim[1] = 103'h620815de85112d828825540a3a;
    stim[2] = 103'h03b9582f54dc814ab6ebfab2fd;
    stim[3] = 103'h5f5ef761419e689e59ccc5a1ae;
    stim[4] = 103'h52688054cfc2f9b6c5045768ba;
    stim[5] = 103'h79d36b317669cd32d7e0fa6ce0;
    stim[6] = 103'h06b7643f1f245b5fd74390ab6b;
    stim[7] = 103'h6b89809c63cce469eaca5b1472;
    stim[8] = 103'h69bbd373050a228fd167e1da77;
    stim[9] = 103'h22b7ba8059318922743edfc0bb;
    stim[10] = 103'h032e407e13865c3b6e7e4d66f4;
    stim[11] = 103'h119fc2adb08f7ae46215dfabe3;
    stim[12] = 103'h7c00ae95327ae5f9d6e58ff2e7;
    stim[13] = 103'h7529a98342e20cae4a64678e8a;
    stim[14] = 103'h7f2330e2c271750dade08e57fa;
    stim[15] = 103'h1907dc483254b9a237dfaeb0c3;
    stim[16] = 103'h4bb25a1aef86e837c73053db35;
    stim[17] = 103'h352ac6cd400cbb28d8411ce99d;
    stim[18] = 103'h6b263bf98af4c92801fcbc6cc4;
    stim[19] = 103'h2787bbe6632bd01a5d4da69bcf;
    stim[20] = 103'h6866523307e1aee58b8b86b7cb;
    stim[21] = 103'h184fbdaec034e3a9849b6360ab;
    stim[22] = 103'h4ab2ca331748485a08c4b30a49;
    stim[23] = 103'h2fcc352d8e46e26c387a5e021e;
    stim[24] = 103'h4483553faafc98447bffc5ae00;
    stim[25] = 103'h36f8ad6708469b04f41a07b30d;
    stim[26] = 103'h52260b77d643edecfc9dad73c5;
    stim[27] = 103'h605a615bbf5c5e5a0ba74002f2;
    stim[28] = 103'h0b7aa6b121a52bff2901a3091c;
    stim[29] = 103'h795edaa0776eae8a4fca06f9a0;
    stim[30] = 103'h48175b936738b2002b1e5736e2;
    stim[31] = 103'h15e5b934bb9c6ee4190e2d89d2;
    stim[32] = 103'h1a7827e1fa75c30437d5cb98b9;
    stim[33] = 103'h3e3fb7d22879e11071cda707d9;
    stim[34] = 103'h7cc143071f77c241a9f78a2a7c;
    stim[35] = 103'h1392f7dad3ca5b263101650725;
    stim[36] = 103'h79705786938edb6762de923d86;
    stim[37] = 103'h75e96a1327b33e29e115a417af;
    stim[38] = 103'h1cbf05a8007ad5a79cb7362add;
    stim[39] = 103'h70cff65c863f0ea5615d10d6f7;
    stim[40] = 103'h1126943f1fd4b1cbe086875b1a;
    stim[41] = 103'h0529651bcd69b4048076a16b7e;
    stim[42] = 103'h34b9ee4da533dd84adec9c2d01;
    stim[43] = 103'h0e5e6641025778b851a73aee52;
    stim[44] = 103'h4eadbe97784d4946dcb8bcdebc;
    stim[45] = 103'h582222fc7263e4b6bf2e38733a;
    stim[46] = 103'h48a92b9831d182216b47a7bd1e;
    stim[47] = 103'h32d9aad9d8a8307d819700857e;
    stim[48] = 103'h49cfc6f49437dd88abcffd7b63;
    stim[49] = 103'h6c103c8df0ffab5d3a6ab609ed;
    stim[50] = 103'h2ac16c1ca3c02e8ee71aefca66;
    stim[51] = 103'h26a30ec6145e4db3a61d011442;
    stim[52] = 103'h2f48383eb0dccf29a50b253a0e;
    stim[53] = 103'h16938be736672fab470841ccb5;
    stim[54] = 103'h009b28a11bfaeb17112c46aea7;
    stim[55] = 103'h60ed96f763bbcdcd100668908b;
    stim[56] = 103'h7c31bb632bc28d827281e2831d;
    stim[57] = 103'h52651fff11749f175db49beb26;
    stim[58] = 103'h440e2c974103c074f3fb58fe8a;
    stim[59] = 103'h21c4f73a050ec255f4dc6b55fb;
    stim[60] = 103'h61f41557026186598d1b1b2af5;
    stim[61] = 103'h4c689d7613d05ef806ea81a467;
    stim[62] = 103'h7ed529ca128c4b719f64ba1e8e;
    stim[63] = 103'h1455cf76a83cb56d5eef0a6ecb;
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
      expv[0] = 102'h00000000000000000xxxxxxxxx;
      expv[1] = 102'h00000000000000000x00000000;
      expv[2] = 102'h00dc814ab7b9582f5x00000000;
      expv[3] = 102'h00dc814ab7b9582f5xebfab2fd;
      expv[4] = 102'h00dc814ab7b9582f5xebfab2fd;
      expv[5] = 102'h00dc814ab7b9582f5xebfab2fd;
      expv[6] = 102'h07245b5fd6b7643f1xebfab2fd;
      expv[7] = 102'h07245b5fd6b7643f1e4390ab6b;
      expv[8] = 102'h07245b5fd6b7643f1e4390ab6b;
      expv[9] = 102'h2131892276b7ba80584390ab6b;
      expv[10] = 102'h2131892276b7ba80593edfc0bb;
      expv[11] = 102'h2131892276b7ba80593edfc0bb;
      expv[12] = 102'h2131892276b7ba80593edfc0bb;
      expv[13] = 102'h2131892276b7ba80593edfc0bb;
      expv[14] = 102'h2131892276b7ba80593edfc0bb;
      expv[15] = 102'h1a54b9a23507dc48333edfc0bb;
      expv[16] = 102'h1a54b9a23507dc4833dfaeb0c3;
      expv[17] = 102'h340cbb28d92ac6cd41dfaeb0c3;
      expv[18] = 102'h340cbb28d92ac6cd41411ce99d;
      expv[19] = 102'h272bd01a5f87bbe661411ce99d;
      expv[20] = 102'h272bd01a5f87bbe6614da69bcf;
      expv[21] = 102'h1834e3a9844fbdaec14da69bcf;
      expv[22] = 102'h1834e3a9844fbdaec19b6360ab;
      expv[23] = 102'h2e46e26c3bcc352d8d9b6360ab;
      expv[24] = 102'h2e46e26c3bcc352d8d7a5e021e;
      expv[25] = 102'h34469b04f6f8ad67097a5e021e;
      expv[26] = 102'h34469b04f6f8ad67081a07b30d;
      expv[27] = 102'h34469b04f6f8ad67081a07b30d;
      expv[28] = 102'h09a52bff2b7aa6b1201a07b30d;
      expv[29] = 102'h09a52bff2b7aa6b12001a3091c;
      expv[30] = 102'h09a52bff2b7aa6b12001a3091c;
      expv[31] = 102'h179c6ee419e5b934b801a3091c;
      expv[32] = 102'h179c6ee419e5b934b90e2d89d2;
      expv[33] = 102'h179c6ee419e5b934b90e2d89d2;
      expv[34] = 102'h179c6ee419e5b934b90e2d89d2;
      expv[35] = 102'h13ca5b263392f7dad10e2d89d2;
      expv[36] = 102'h13ca5b263392f7dad101650725;
      expv[37] = 102'h13ca5b263392f7dad101650725;
      expv[38] = 102'h1c7ad5a79cbf05a80101650725;
      expv[39] = 102'h1c7ad5a79cbf05a800b7362add;
      expv[40] = 102'h13d4b1cbe126943f1cb7362add;
      expv[41] = 102'h13d4b1cbe126943f1c86875b1a;
      expv[42] = 102'h13d4b1cbe126943f1c86875b1a;
      expv[43] = 102'h13d4b1cbe126943f1c86875b1a;
      expv[44] = 102'h13d4b1cbe126943f1c86875b1a;
      expv[45] = 102'h13d4b1cbe126943f1c86875b1a;
      expv[46] = 102'h13d4b1cbe126943f1c86875b1a;
      expv[47] = 102'h30a8307d82d9aad9d886875b1a;
      expv[48] = 102'h30a8307d82d9aad9d89700857e;
      expv[49] = 102'h30a8307d82d9aad9d89700857e;
      expv[50] = 102'h2bc02e8ee6c16c1ca29700857e;
      expv[51] = 102'h2bc02e8ee6c16c1ca31aefca66;
      expv[52] = 102'h2bc02e8ee6c16c1ca31aefca66;
      expv[53] = 102'h2bc02e8ee6c16c1ca31aefca66;
      expv[54] = 102'h2bc02e8ee6c16c1ca31aefca66;
      expv[55] = 102'h2bc02e8ee6c16c1ca31aefca66;
      expv[56] = 102'h2bc02e8ee6c16c1ca31aefca66;
      expv[57] = 102'h2bc02e8ee6c16c1ca31aefca66;
      expv[58] = 102'h2bc02e8ee6c16c1ca31aefca66;
      expv[59] = 102'h210ec255f5c4f73a051aefca66;
      expv[60] = 102'h210ec255f5c4f73a05dc6b55fb;
      expv[61] = 102'h210ec255f5c4f73a05dc6b55fb;
      expv[62] = 102'h210ec255f5c4f73a05dc6b55fb;
      expv[63] = 102'h143cb56d5c55cf76abdc6b55fb;
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
