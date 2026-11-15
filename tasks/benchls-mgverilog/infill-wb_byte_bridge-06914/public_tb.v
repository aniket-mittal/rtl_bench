// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 58;
  localparam OW = 58;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06914 dut (
    .wb_clk_i(clk),
    .cpu_byte_o(in_vec[57:57]),
    .cpu_memop(in_vec[56:56]),
    .cpu_m_io(in_vec[55:55]),
    .cpu_adr_o(in_vec[54:35]),
    .cpu_dat_o(in_vec[34:19]),
    .cpu_we_o(in_vec[18:18]),
    .wb_rst_i(in_vec[17:17]),
    .wb_dat_i(in_vec[16:1]),
    .wb_ack_i(in_vec[0:0]),
    .cpu_block(out_vec[57:57]),
    .cpu_dat_i(out_vec[56:41]),
    .wb_dat_o(out_vec[40:25]),
    .wb_adr_o(out_vec[24:6]),
    .wb_we_o(out_vec[5:5]),
    .wb_tga_o(out_vec[4:4]),
    .wb_sel_o(out_vec[3:2]),
    .wb_stb_o(out_vec[1:1]),
    .wb_cyc_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 58'h3fa62cca88b4bb8;
    stim[1] = 58'h2fa8863b8dec8a1;
    stim[2] = 58'h0803328d781e0e9;
    stim[3] = 58'h0e69d3f897c032c;
    stim[4] = 58'h30a8c57a2ed80ef;
    stim[5] = 58'h24bba19f94d9dd6;
    stim[6] = 58'h1e583ebdf3597d3;
    stim[7] = 58'h16a1306d2cd01f3;
    stim[8] = 58'h21bb746b63c9de2;
    stim[9] = 58'h37be7ff5e2180c6;
    stim[10] = 58'h2c3126cf81dd4d1;
    stim[11] = 58'h01d9eec2ce5d88f;
    stim[12] = 58'h0bbd6032399d307;
    stim[13] = 58'h2370771b47383ad;
    stim[14] = 58'h055fc5b6e89eee5;
    stim[15] = 58'h3681620decc746e;
    stim[16] = 58'h0a0892e66d9a3e0;
    stim[17] = 58'h2cfc36a1e041f5f;
    stim[18] = 58'h3ba1c28d4e500c0;
    stim[19] = 58'h18361697d71f135;
    stim[20] = 58'h0a315bc66240da1;
    stim[21] = 58'h09fa5570560b50f;
    stim[22] = 58'h23744db0525b790;
    stim[23] = 58'h1e5419bb8a8c2a7;
    stim[24] = 58'h1a4cb6e4875a21d;
    stim[25] = 58'h3863126d8a45409;
    stim[26] = 58'h2daa047f7e11b5f;
    stim[27] = 58'h26986f266f444db;
    stim[28] = 58'h1959f529c1dd0c8;
    stim[29] = 58'h2f01ce09b2c8a0b;
    stim[30] = 58'h0401082b2f1fbcc;
    stim[31] = 58'h2e7244f97a8fa65;
    stim[32] = 58'h1aeb24d48d9275a;
    stim[33] = 58'h1f886169e2cc4dd;
    stim[34] = 58'h02d27ece1b4885b;
    stim[35] = 58'h2be25c740f4786b;
    stim[36] = 58'h108a12f0cb4b6e6;
    stim[37] = 58'h2d2dc58a44cf07b;
    stim[38] = 58'h01439a037c4b421;
    stim[39] = 58'h1fa81a28a9dac39;
    stim[40] = 58'h12ca72716ed031a;
    stim[41] = 58'h1d64ea76494fb33;
    stim[42] = 58'h226aceb1a54442f;
    stim[43] = 58'h134085a45b580e1;
    stim[44] = 58'h061b00ed02572b0;
    stim[45] = 58'h39311323cd4fc4c;
    stim[46] = 58'h2e8f5911a18ce6b;
    stim[47] = 58'h1cb8ebfbc6c426e;
    stim[48] = 58'h05053ae5a253e02;
    stim[49] = 58'h0c453f6f045cb3d;
    stim[50] = 58'h3a4917f22658fe0;
    stim[51] = 58'h06eeeff7025dd5a;
    stim[52] = 58'h2738138bf006f26;
    stim[53] = 58'h0ac5c94068555fd;
    stim[54] = 58'h1b6c3e8633d9ecd;
    stim[55] = 58'h2ec6d46f388ce3e;
    stim[56] = 58'h19df658224c10f2;
    stim[57] = 58'h3e5870d5a8d8474;
    stim[58] = 58'h03787ae05d0c07d;
    stim[59] = 58'h05514014fd01f4b;
    stim[60] = 58'h33da3d5b291cdbb;
    stim[61] = 58'h39da38262f8d84d;
    stim[62] = 58'h2ad3e751e7c47d7;
    stim[63] = 58'h16a9b1a0880a783;
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
      expv[0] = 58'hxxxxxxxxxxxxxxx;
      expv[1] = 58'hxxxxx232be98b3b;
      expv[2] = 58'hxxxxxee37ea2194;
      expv[3] = 58'hxxxxxe03400ccb4;
      expv[4] = 58'hxxxxx5fe39a74eb;
      expv[5] = 58'h000efe8ba2a3164;
      expv[6] = 58'h200ee527f2ee874;
      expv[7] = 58'h200efccf7960fa4;
      expv[8] = 58'h000efb4b3a84c24;
      expv[9] = 58'h200efad8e6edd04;
      expv[10] = 58'h200ef89d7ef9ffb;
      expv[11] = 58'h3ffd4073f0c49a4;
      expv[12] = 58'h3ffd5390a767b94;
      expv[13] = 58'h3ffd4c8e6ef5804;
      expv[14] = 58'h1ffd46d1cdc1dc4;
      expv[15] = 58'h3ffd5a2db57f164;
      expv[16] = 58'h3ffd437b3a05897;
      expv[17] = 58'h3ffd5b7988224bb;
      expv[18] = 58'h0001f80873f0db4;
      expv[19] = 58'h2001f3834e87094;
      expv[20] = 58'h2001f5c5e0d85b4;
      expv[21] = 58'h2001f89188c56d4;
      expv[22] = 58'h0001fc1587e9564;
      expv[23] = 58'h2001f48c0dd1354;
      expv[24] = 58'h2001e2aef950674;
      expv[25] = 58'h2001e1d92932db4;
      expv[26] = 58'h2001fb62818c494;
      expv[27] = 58'h0001ffdf96a8124;
      expv[28] = 58'h2001e99bda61bf4;
      expv[29] = 58'h2001ea706567d7f;
      expv[30] = 58'h0000a26cbc07384;
      expv[31] = 58'h2000aacbd004214;
      expv[32] = 58'h2000bebe59c9114;
      expv[33] = 58'h2000a3752bac93b;
      expv[34] = 58'h2c4dda78be21864;
      expv[35] = 58'h2c4dc6d38b49fb4;
      expv[36] = 58'h0c4ddd03cf89724;
      expv[37] = 58'h2c4dd2dc22284b4;
      expv[38] = 58'h0c4dd12294b7164;
      expv[39] = 58'h2c4dc0df050e6b4;
      expv[40] = 58'h2c4dca2a7ea06a4;
      expv[41] = 58'h2c4ddc5bab29cbf;
      expv[42] = 58'h2fb33d925593aa4;
      expv[43] = 58'h2fb3294c69ab3a4;
      expv[44] = 58'h0fb336c90d02164;
      expv[45] = 58'h2fb3209b586c034;
      expv[46] = 58'h2fb328f344c44d7;
      expv[47] = 58'h0006a4687a3d674;
      expv[48] = 58'h0006b1bef2e3ae4;
      expv[49] = 58'h2006a8997414eb4;
      expv[50] = 58'h2006bbc11114ff4;
      expv[51] = 58'h2006a99c89245eb;
      expv[52] = 58'h2006a09ddbbbbcb;
      expv[53] = 58'h2006bc02fce04fb;
      expv[54] = 58'h355fd01a0b17274;
      expv[55] = 58'h155fcce18db0f94;
      expv[56] = 58'h355fdbce3b1b534;
      expv[57] = 58'h355fc920877d97b;
      expv[58] = 58'h355fca357961c0b;
      expv[59] = 58'h200c17581961c47;
      expv[60] = 58'h34ac053f5545004;
      expv[61] = 58'h34ac16ca4f68f54;
      expv[62] = 58'h34ac098be768e34;
      expv[63] = 58'h34ac1479eb4f9c4;
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
