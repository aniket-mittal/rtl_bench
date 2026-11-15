// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 170;
  localparam OW = 135;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06951 dut (
    .clk(clk),
    .clk__enable(in_vec[169:169]),
    .apb_response__prdata(in_vec[168:137]),
    .apb_response__pready(in_vec[136:136]),
    .apb_response__perr(in_vec[135:135]),
    .apb_request_1__paddr(in_vec[134:103]),
    .apb_request_1__penable(in_vec[102:102]),
    .apb_request_1__psel(in_vec[101:101]),
    .apb_request_1__pwrite(in_vec[100:100]),
    .apb_request_1__pwdata(in_vec[99:68]),
    .apb_request_0__paddr(in_vec[67:36]),
    .apb_request_0__penable(in_vec[35:35]),
    .apb_request_0__psel(in_vec[34:34]),
    .apb_request_0__pwrite(in_vec[33:33]),
    .apb_request_0__pwdata(in_vec[32:1]),
    .reset_n(in_vec[0:0]),
    .apb_request__paddr(out_vec[134:103]),
    .apb_request__penable(out_vec[102:102]),
    .apb_request__psel(out_vec[101:101]),
    .apb_request__pwrite(out_vec[100:100]),
    .apb_request__pwdata(out_vec[99:68]),
    .apb_response_1__prdata(out_vec[67:36]),
    .apb_response_1__pready(out_vec[35:35]),
    .apb_response_1__perr(out_vec[34:34]),
    .apb_response_0__prdata(out_vec[33:2]),
    .apb_response_0__pready(out_vec[1:1]),
    .apb_response_0__perr(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 170'h366295942a41b995cd5d751b7c5561eef7a88d8a3e4;
    stim[1] = 170'h000a8aa0341f6062d51f541af914ec53de47f2bf64a;
    stim[2] = 170'h0dc58357be3f39e625a9c9d870b56e485acb44b12c5;
    stim[3] = 170'h3e9ddd57d1684bb9e937ba356d56ea47b284bf42ce1;
    stim[4] = 170'h0b51ac6a2b803cc6c6b9eec7ae2b354178a60da6137;
    stim[5] = 170'h3fb83c1f1c4db6fa67ff00a1cde4a2f53ba97ab3c2b;
    stim[6] = 170'h201a8bb7008703fdfe57ca2a66c08aab27fb7a1425d;
    stim[7] = 170'h34ea3fbe55ccc7220bdce49067ecec0d7c6dafb0dbb;
    stim[8] = 170'h2f49e154abb8ecc7567397b2f5ca288e16dd0c5769d;
    stim[9] = 170'h36710e7e501c168d4f80ce3c44066a2d8259934156d;
    stim[10] = 170'h0c31c1fe17201868577d8b9f320766ecab2996314cb;
    stim[11] = 170'h123dac7d8bde21310a2912f1941237d098b68b95aaf;
    stim[12] = 170'h224b7748699d0501654bdd2b9cd56ffae37631f7c9b;
    stim[13] = 170'h3849852728eab5d62c9d68b3d205e4e94343651b6c5;
    stim[14] = 170'h399f118d9dc17de6e9b4f7ecdb9597205bef74b07d5;
    stim[15] = 170'h1fd7038d3ea4d94a7150a548aa3cc6fd7078e562023;
    stim[16] = 170'h0acb4e840a83af47f99d7cae27b6b262a1137707b8b;
    stim[17] = 170'h1fc321dfc55ab59d466a34f395b6f29dd823e52eb75;
    stim[18] = 170'h2a04ff83a249f04eae4ee0140441aab6edbca9223ab;
    stim[19] = 170'h33c3d451855e102b559fc09ffa69cbe6f206da2500b;
    stim[20] = 170'h18dcae9d828e15baa8fa1feaf506cbfdae93962db77;
    stim[21] = 170'h11ed71b9f8d9e8b6dc50ba29d472eb365cdb24b9a93;
    stim[22] = 170'h26901a93542c887c4d1bdb16ab5166522ba5c7f4f29;
    stim[23] = 170'h36820854c368ebcdee037abe9af3d7f8e962bfb183b;
    stim[24] = 170'h3f1d772d54a6c00e18550e0157e3d20811b97532dfb;
    stim[25] = 170'h3d1dd52b9f7b9f3552975bcf9abce4db1d9059ea4cb;
    stim[26] = 170'h3d5694145fd0a1c89600eab49c15c5356e2b6692f93;
    stim[27] = 170'h15a4d46b0cc67438913045231fb1b3011e03a966307;
    stim[28] = 170'h159ca18547afebb1613c7f86764b1114df0384da215;
    stim[29] = 170'h1d7ccd479598f38b32b3753221c4116a3e08c3405db;
    stim[30] = 170'h11b681728070464bb62858f8532f6b8f90bb02c49fb;
    stim[31] = 170'h0e4442483096c9ec42a5e7745310c6fd43d79f6e847;
    stim[32] = 170'h2701db4316a484e096c43cbb07fe765364685020fd9;
    stim[33] = 170'h045cb6968f540fe426da17a4fde2a2420e074ffc4bf;
    stim[34] = 170'h208ae5736b616e07fad01a83f410a80172e661394f5;
    stim[35] = 170'h228b0a60b33cba2c0d622f0be84618719df8fddf9ef;
    stim[36] = 170'h0b823813a2b0eae003b7674dd8999278c23d8a3126f;
    stim[37] = 170'h35bf894e1a18099535ca127ad1f16fddced61f4a097;
    stim[38] = 170'h076dbf1bb348e3358e439bd95b83917d6f83ff660ff;
    stim[39] = 170'h38677c01bc5a1a3cf97f290fa5fb208d70eb7fbfa89;
    stim[40] = 170'h110b219afecd4c13383df2b9e49a2ab7f7f3d6623c9;
    stim[41] = 170'h0fc0c6df0f7abf448427059c904ecde0a68f11c8fd5;
    stim[42] = 170'h078427a96782e3e194bb4f29f634fd212ffd3e6db8b;
    stim[43] = 170'h2a0aad5e84a0d7569dfa1ecac32c2ea17cfbd337323;
    stim[44] = 170'h1de00d80b73ae88285e2e2a98b427221eb769104cbf;
    stim[45] = 170'h34d2469d3d379f2edb5b739c4236b320128cbbfb16f;
    stim[46] = 170'h2b3618a07171dfd1a4b17a7803608ee63be60525557;
    stim[47] = 170'h3371fb0594813b861b0db30e4e12068f084fe97acb1;
    stim[48] = 170'h260ad2ad276636f6ec82d424ce65488e18273df3965;
    stim[49] = 170'h07248f264e7ba0ea011a9b0bb9d1b878a45551edd09;
    stim[50] = 170'h0a66f016e66d51714bf3a9b2b4a70f8479dcb37e873;
    stim[51] = 170'h2156abe897cd7ed3ac439d159bcb6eab26289a4fe03;
    stim[52] = 170'h3e7a09e07fa503b93df07661de964eeb562682801a5;
    stim[53] = 170'h24945646c6c333692194a34cbb1d5dbdaaa5c49dd5b;
    stim[54] = 170'h078f47273eb1eba4dbee4d2e51b8bef88fee94f9c99;
    stim[55] = 170'h0dd95838164d8edff7db40617ba80fa4a4fdbbca8c7;
    stim[56] = 170'h3b484bda91538b175f8b5b9f93fdbdfbb4e3239fff9;
    stim[57] = 170'h184f712e0532ea2ae42645b5ff987e3dbda32913217;
    stim[58] = 170'h2a477070747f4c8fae61b88c2c656fc0b9f8444a61b;
    stim[59] = 170'h03497498ee622e2c846f6af1d26cd5008f42d5a1117;
    stim[60] = 170'h3279c72758bcce31e8ca12466950e98c39a7a443af5;
    stim[61] = 170'h0c4aa6d3f0d9c07a6efd03e0a52ff88790b5ec00a8f;
    stim[62] = 170'h3b5ec3171233248ae52ac686f02d4de4599013ef659;
    stim[63] = 170'h2573f982cc217106c87baf82f4fdd0be1bf28121d6b;
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
      expv[0] = 135'h0000000000000000000000000000000000;
      expv[1] = 135'h0000000000000000000000000000000000;
      expv[2] = 135'h0000000000000000000000000000000000;
      expv[3] = 135'h0000000000000000000000000000000000;
      expv[4] = 135'h0000000000000000000000000000000000;
      expv[5] = 135'h0000000000000000000000000000000000;
      expv[6] = 135'h0000000000000000000000000000000000;
      expv[7] = 135'h44db6fa63ff00a1cd00000000000000000;
      expv[8] = 135'h44db6fa67ff00a1cd00000000000000000;
      expv[9] = 135'h44db6fa67ff00a1cd00000000000000000;
      expv[10] = 135'h44db6fa61ff00a1cdb38873f2800000000;
      expv[11] = 135'h44db6fa61ff00a1cdb38873f2800000000;
      expv[12] = 135'h44db6fa61ff00a1cdb38873f2800000000;
      expv[13] = 135'h033516c12cc9a0ab6b38873f2000000000;
      expv[14] = 135'h033516c16cc9a0ab6b38873f2000000000;
      expv[15] = 135'h033516c10cc9a0ab6b38873f2333e231b3;
      expv[16] = 135'h033516c10cc9a0ab6b38873f2333e231b3;
      expv[17] = 135'h033516c10cc9a0ab6b38873f2333e231b3;
      expv[18] = 135'h033516c10cc9a0ab6b38873f2333e231b3;
      expv[19] = 135'h033516c10cc9a0ab6b38873f2333e231b1;
      expv[20] = 135'h249f04eaa4ee01404b38873f2333e231b1;
      expv[21] = 135'h249f04eaa4ee01404b38873f2333e231b1;
      expv[22] = 135'h249f04eaa4ee01404b38873f2333e231b1;
      expv[23] = 135'h249f04eae4ee01404b38873f2333e231b1;
      expv[24] = 135'h249f04eae4ee01404b38873f2333e231b1;
      expv[25] = 135'h249f04ea84ee01404f8ebb96ab33e231b1;
      expv[26] = 135'h249f04ea84ee01404f8ebb96a333e231b1;
      expv[27] = 135'h249f04ea84ee01404f8ebb96a333e231b1;
      expv[28] = 135'h249f04ea84ee01404f8ebb96a333e231b1;
      expv[29] = 135'h249f04ea84ee01404f8ebb96a333e231b1;
      expv[30] = 135'h249f04ea84ee01404f8ebb96a333e231b1;
      expv[31] = 135'h249f04ea84ee01404f8ebb96a333e231b1;
      expv[32] = 135'h249f04ea84ee01404f8ebb96a333e231b1;
      expv[33] = 135'h7d0a1c89200eab49cf8ebb96a333e231b1;
      expv[34] = 135'h7d0a1c89200eab49cf8ebb96a333e231b1;
      expv[35] = 135'h7d0a1c89600eab49cf8ebb96a333e231b1;
      expv[36] = 135'h7d0a1c89000eab49c14585305b33e231b1;
      expv[37] = 135'h7d0a1c89000eab49c14585305b33e231b1;
      expv[38] = 135'h230c38cebc7eefcf714585305333e231b1;
      expv[39] = 135'h230c38cebc7eefcf714585305333e231b1;
      expv[40] = 135'h230c38cefc7eefcf714585305333e231b1;
      expv[41] = 135'h230c38cefc7eefcf714585305333e231b1;
      expv[42] = 135'h230c38cefc7eefcf714585305333e231b1;
      expv[43] = 135'h230c38cefc7eefcf714585305333e231b1;
      expv[44] = 135'h230c38cefc7eefcf714585305333e231b1;
      expv[45] = 135'h230c38cefc7eefcf714585305333e231b1;
      expv[46] = 135'h230c38ce9c7eefcf71458530529a48d3a7;
      expv[47] = 135'h5379f2edb5b739c421458530529a48d3a5;
      expv[48] = 135'h5379f2edf5b739c421458530529a48d3a5;
      expv[49] = 135'h5379f2edf5b739c421458530529a48d3a5;
      expv[50] = 135'h5379f2edf5b739c421458530529a48d3a5;
      expv[51] = 135'h5379f2edf5b739c421458530529a48d3a5;
      expv[52] = 135'h5379f2ed95b739c420ab55f44a9a48d3a5;
      expv[53] = 135'h5379f2ed95b739c420ab55f4429a48d3a5;
      expv[54] = 135'h5379f2ed95b739c420ab55f4429a48d3a5;
      expv[55] = 135'h5379f2ed95b739c420ab55f4429a48d3a5;
      expv[56] = 135'h5379f2ed95b739c420ab55f4429a48d3a5;
      expv[57] = 135'h5379f2ed95b739c420ab55f4429a48d3a5;
      expv[58] = 135'h5379f2ed95b739c420ab55f4429a48d3a5;
      expv[59] = 135'h7edefdda3191cfffc0ab55f4429a48d3a5;
      expv[60] = 135'h7edefdda3191cfffc0ab55f4429a48d3a5;
      expv[61] = 135'h7edefdda7191cfffc0ab55f4429a48d3a5;
      expv[62] = 135'h7edefdda7191cfffc0ab55f4429a48d3a5;
      expv[63] = 135'h7edefdda1191cfffc0ab55f4436bd862e2;
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
