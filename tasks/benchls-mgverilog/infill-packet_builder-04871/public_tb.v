// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 104;
  localparam OW = 104;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04871 dut (
    .access_in(in_vec[103:103]),
    .write_in(in_vec[102:102]),
    .datamode_in(in_vec[101:100]),
    .ctrlmode_in(in_vec[99:96]),
    .dstaddr_in(in_vec[95:64]),
    .data_in(in_vec[63:32]),
    .srcaddr_in(in_vec[31:0]),
    .packet_out(out_vec[103:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 104'h199ce835cd362cbb76f9a07d5c;
    stim[1] = 104'h093cba8f01dbd3c1127eae759c;
    stim[2] = 104'h7f75eebf22a283e194a97edf40;
    stim[3] = 104'hab0cd1b52420ed4d89993daa61;
    stim[4] = 104'hcf91c6cf8ea14913ead759fa9a;
    stim[5] = 104'he19a8ddeaf1e49f3f26b15ea38;
    stim[6] = 104'h20d2165f7a5cc77f8afa57e79c;
    stim[7] = 104'h6633f4d50665c474ab4d8ec558;
    stim[8] = 104'h39d0e80a1a552d2a61b3b193db;
    stim[9] = 104'hda377e10f6bcf7f94a45559ecc;
    stim[10] = 104'hda651d3d2220a9c1d3b75e5ff4;
    stim[11] = 104'hd6fc6a5583cb4005c7d25a66fd;
    stim[12] = 104'had966a35cc0256e9e7f1106ecf;
    stim[13] = 104'hf33d6a158e1741f69fc81d0ee9;
    stim[14] = 104'h76ade9db81d8c37d4ef5d6f23f;
    stim[15] = 104'h78e51e061261c0e0c64624cb38;
    stim[16] = 104'h0b018e8655382c9c77a322b35a;
    stim[17] = 104'h8e20044ef74a19b7c1f32835a7;
    stim[18] = 104'h3043a74420531c882a0a1193e7;
    stim[19] = 104'hc4696ab193b9da80851cf0479b;
    stim[20] = 104'ha570ee7e3d9945cac128d451ac;
    stim[21] = 104'hda9ac93a34fcb80e46e7899c33;
    stim[22] = 104'h78e571e5f7d0786c7376c7b696;
    stim[23] = 104'h80c1f4c510ab1df61a91dce373;
    stim[24] = 104'h32759bdad2300683ebd1d75f7a;
    stim[25] = 104'h942f9e42f3b9cd9d8e45b9b1b8;
    stim[26] = 104'hfd117c9645612286e2bd3a21a8;
    stim[27] = 104'h5c751f9784a630c07d07ddb073;
    stim[28] = 104'h563c3da43d69dff01d55486238;
    stim[29] = 104'h929494231fe249c6d83ec94c72;
    stim[30] = 104'h619c9dfdbdfc294672add62857;
    stim[31] = 104'h1e6281697dbbaf7c6d92bc9e65;
    stim[32] = 104'hf8fe077b6ab38282d254e4ea4c;
    stim[33] = 104'ha7fac0f52c4afa8478a1c0e544;
    stim[34] = 104'h9846ff130b6c55d343b591a51c;
    stim[35] = 104'hc8137467db0f2147213d677613;
    stim[36] = 104'h9e30474e325690a0fa788a9ae5;
    stim[37] = 104'h622c81cd9f25d971582d4eca87;
    stim[38] = 104'h4a464d35baba40fd23add0a2f1;
    stim[39] = 104'h4154dfcbaf4b4eb0ec18f4696b;
    stim[40] = 104'h8c4cba3294a4ae10eeb2c72f3b;
    stim[41] = 104'hce02ea7790a9a900596c9ee199;
    stim[42] = 104'h4b4180ed346e0294e888b4298f;
    stim[43] = 104'h4c25eec1181a3263c5d48bd81d;
    stim[44] = 104'h896e4f18e39f865779269699f9;
    stim[45] = 104'hb2c7f83edc56d3fe07e842ab59;
    stim[46] = 104'h49ad1a586f0f72dd2ed64457c4;
    stim[47] = 104'h65868c4d620ef8b82e1794b26a;
    stim[48] = 104'h8dfd5976a5be83d73291471ce4;
    stim[49] = 104'h26743b9375b7741b613e95b63c;
    stim[50] = 104'hff7b406d273023e9068c41a08f;
    stim[51] = 104'h564868aab81ee8b07ecc08a10a;
    stim[52] = 104'had9137d483c3a8624152126538;
    stim[53] = 104'h71056c8714b1d0c458e76d30dc;
    stim[54] = 104'h181e385970eda5ad401dfae257;
    stim[55] = 104'h295697d0154a542bae25188034;
    stim[56] = 104'ha22dc87fdeed748efca27ee7f1;
    stim[57] = 104'h5760c8c3fa0a0697bd7dcb099a;
    stim[58] = 104'he873fc5f10282d6d343a7b86ba;
    stim[59] = 104'h2ad657a4bf2c2fe895534418bd;
    stim[60] = 104'h759d73a300937baee945771e02;
    stim[61] = 104'h4a1d8919b57ca43ed9dbabe604;
    stim[62] = 104'h848cfb4dfd585aae31710e0785;
    stim[63] = 104'h4f59dcee516d5aa28c3f429b5d;
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
      expv[0] = 104'hf9a07d5c362cbb769ce835cd94;
      expv[1] = 104'h7eae759cdbd3c1123cba8f0190;
      expv[2] = 104'ha97edf40a283e19475eebf22fe;
      expv[3] = 104'h993daa6120ed4d890cd1b524b9;
      expv[4] = 104'hd759fa9aa14913ea91c6cf8ef3;
      expv[5] = 104'h6b15ea381e49f3f29a8ddeaf1b;
      expv[6] = 104'hfa57e79c5cc77f8ad2165f7a08;
      expv[7] = 104'h4d8ec55865c474ab33f4d5066a;
      expv[8] = 104'hb3b193db552d2a61d0e80a1a9c;
      expv[9] = 104'h45559eccbcf7f94a377e10f6a7;
      expv[10] = 104'hb75e5ff420a9c1d3651d3d22a7;
      expv[11] = 104'hd25a66fdcb4005c7fc6a558367;
      expv[12] = 104'hf1106ecf0256e9e7966a35ccd9;
      expv[13] = 104'hc81d0ee91741f69f3d6a158e3f;
      expv[14] = 104'hf5d6f23fd8c37d4eade9db816e;
      expv[15] = 104'h4624cb3861c0e0c6e51e06128e;
      expv[16] = 104'ha322b35a382c9c77018e8655b0;
      expv[17] = 104'hf32835a74a19b7c120044ef7e1;
      expv[18] = 104'h0a1193e7531c882a43a744200c;
      expv[19] = 104'h1cf0479bb9da8085696ab19343;
      expv[20] = 104'h28d451ac9945cac170ee7e3d59;
      expv[21] = 104'he7899c33fcb80e469ac93a34a7;
      expv[22] = 104'h76c7b696d0786c73e571e5f78e;
      expv[23] = 104'h91dce373ab1df61ac1f4c51001;
      expv[24] = 104'hd1d75f7a300683eb759bdad22c;
      expv[25] = 104'h45b9b1b8b9cd9d8e2f9e42f345;
      expv[26] = 104'hbd3a21a8612286e2117c9645df;
      expv[27] = 104'h07ddb073a630c07d751f9784c6;
      expv[28] = 104'h5548623869dff01d3c3da43d66;
      expv[29] = 104'h3ec94c72e249c6d89494231f25;
      expv[30] = 104'hadd62857fc2946729c9dfdbd1a;
      expv[31] = 104'h92bc9e65bbaf7c6d6281697de4;
      expv[32] = 104'h54e4ea4cb38282d2fe077b6a8f;
      expv[33] = 104'ha1c0e5444afa8478fac0f52c79;
      expv[34] = 104'hb591a51c6c55d34346ff130b85;
      expv[35] = 104'h3d6776130f214721137467db83;
      expv[36] = 104'h788a9ae55690a0fa30474e32e5;
      expv[37] = 104'h2d4eca8725d971582c81cd9f2a;
      expv[38] = 104'hadd0a2f1ba40fd23464d35baa2;
      expv[39] = 104'h18f4696b4b4eb0ec54dfcbaf12;
      expv[40] = 104'hb2c72f3ba4ae10ee4cba3294c1;
      expv[41] = 104'h6c9ee199a9a9005902ea7790e3;
      expv[42] = 104'h88b4298f6e0294e84180ed34b2;
      expv[43] = 104'hd48bd81d1a3263c525eec118c2;
      expv[44] = 104'h269699f99f8657796e4f18e391;
      expv[45] = 104'he842ab5956d3fe07c7f83edc2d;
      expv[46] = 104'hd64457c40f72dd2ead1a586f92;
      expv[47] = 104'h1794b26a0ef8b82e868c4d625a;
      expv[48] = 104'h91471ce4be83d732fd5976a5d1;
      expv[49] = 104'h3e95b63cb7741b61743b937568;
      expv[50] = 104'h8c41a08f3023e9067b406d27ff;
      expv[51] = 104'hcc08a10a1ee8b07e4868aab866;
      expv[52] = 104'h52126538c3a862419137d483d9;
      expv[53] = 104'he76d30dcb1d0c458056c87141e;
      expv[54] = 104'h1dfae257eda5ad401e38597084;
      expv[55] = 104'h251880344a542bae5697d01598;
      expv[56] = 104'ha27ee7f1ed748efc2dc87fde29;
      expv[57] = 104'h7dcb099a0a0697bd60c8c3fa76;
      expv[58] = 104'h3a7b86ba282d6d3473fc5f108b;
      expv[59] = 104'h534418bd2c2fe895d657a4bfa8;
      expv[60] = 104'h45771e02937baee99d73a3005e;
      expv[61] = 104'hdbabe6047ca43ed91d8919b5a2;
      expv[62] = 104'h710e0785585aae318cfb4dfd41;
      expv[63] = 104'h3f429b5d6d5aa28c59dcee51f2;
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
