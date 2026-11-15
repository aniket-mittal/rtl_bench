// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 119;
  localparam OW = 118;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_216014 dut (
    .clk(clk),
    .aluSig_in(in_vec[118:116]),
    .WB_in(in_vec[115:115]),
    .extendForMem_in(in_vec[114:114]),
    .WMEM_in(in_vec[113:113]),
    .load_in(in_vec[112:112]),
    .R1_in(in_vec[111:80]),
    .R2_in(in_vec[79:48]),
    .wdMem_in(in_vec[47:16]),
    .rd_in(in_vec[15:11]),
    .rs_in(in_vec[10:6]),
    .rt_in(in_vec[5:1]),
    .flush(in_vec[0:0]),
    .aluSig_out(out_vec[117:115]),
    .WB_out(out_vec[114:114]),
    .extendForMem_out(out_vec[113:113]),
    .WMEM_out(out_vec[112:112]),
    .load_out(out_vec[111:111]),
    .R1_out(out_vec[110:79]),
    .R2_out(out_vec[78:47]),
    .wdMem_out(out_vec[46:15]),
    .rd_out(out_vec[14:10]),
    .rs_out(out_vec[9:5]),
    .rt_out(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 119'h78b776ae9abf41cc953f305e27b2bf;
    stim[1] = 119'h51e5d1946e5800b5aeaeecfd83f28d;
    stim[2] = 119'h7230096e6acd123c88c4c74fe5dd66;
    stim[3] = 119'h1e88a657a1f4698e8ea9cb9d313931;
    stim[4] = 119'h295ee0609a43ec75a255b6d85bd21a;
    stim[5] = 119'h0584191697b2bd35be797fa3c5824a;
    stim[6] = 119'h43752c2b288e278f55cb01de3a36e9;
    stim[7] = 119'h44a4350f060eb301a083720fff11e6;
    stim[8] = 119'h5a676df4dd715d1477124b38fc387f;
    stim[9] = 119'h4d9ea52195ddce81fbdae26a042f35;
    stim[10] = 119'h045199778b361015128b97b6a6d533;
    stim[11] = 119'h051a0a2bf5919e14c23147bf52fc9f;
    stim[12] = 119'h36f0b8578127002bae9a32a030a29e;
    stim[13] = 119'h2663b28abaa1e3251d0b2f3c8c2bf0;
    stim[14] = 119'h4859d57df6d32e0ec173e44ce1dad8;
    stim[15] = 119'h29d5d9ef24eb9e7cbcd124668a7fb4;
    stim[16] = 119'h631a6208338b5024fe9af4e31ab010;
    stim[17] = 119'h67a377a3521c0fdf235e31aa70334f;
    stim[18] = 119'h7a0c988ee2eb9521c936690d18122c;
    stim[19] = 119'h3f95dbf099cc570b448d092e60b575;
    stim[20] = 119'h2ff88647ae04737b87604b94fd4d7d;
    stim[21] = 119'h05849db9bef0e8f8e919feab679460;
    stim[22] = 119'h27ae0a5ad294ed4da9f48feb8a0145;
    stim[23] = 119'h52a0c9a853bcac642a5ca51978b470;
    stim[24] = 119'h05220a2fce70e3afce88461c77038b;
    stim[25] = 119'h6baca249d4b7a8d26fe0b294fc3c83;
    stim[26] = 119'h20fd2999a19ed6d373192dc2ee9513;
    stim[27] = 119'h1d42300937fc96af2ecbc24f1a96c2;
    stim[28] = 119'h249d46e3c67f9194cd22ce52381cd7;
    stim[29] = 119'h5ffba7919d86ccd5cd0d6b8066000a;
    stim[30] = 119'h6d7fc0a9774e10f4c65d07bb85609a;
    stim[31] = 119'h08013b0df1c0e0eeffed1f265cde02;
    stim[32] = 119'h460a703d7d4ce6da84874c120d82db;
    stim[33] = 119'h5fbd4ad18508e7fb930e761e8587f2;
    stim[34] = 119'h1b9c4c78edb535f73f589a0551db04;
    stim[35] = 119'h69e2877da9431c9ade311065674373;
    stim[36] = 119'h160e0c3b38aba5e9e03158bd6596b1;
    stim[37] = 119'h7ee8f745eb604c1246c34c09215d57;
    stim[38] = 119'h0d833cbd0e24eabd0c252fa0504f2b;
    stim[39] = 119'h5910ba2456532ebefc5913eb105ba9;
    stim[40] = 119'h3b10e0bef44fe10a08210542dac67e;
    stim[41] = 119'h2ea8d04274c2a778bce27b235f736e;
    stim[42] = 119'h32b8273a4902070cec5882b41f5c92;
    stim[43] = 119'h22bdd9d13ddd78e97344ea7551f859;
    stim[44] = 119'h2ac1bd2cf059b9a25fb5588326671b;
    stim[45] = 119'h20e2d1703b5e666500c9f144362fe1;
    stim[46] = 119'h59b0a9d18be3aefce04c9b38d22d83;
    stim[47] = 119'h4f3c3e1c2ad623a19cba8154efe780;
    stim[48] = 119'h2325b9ec2f4ea433fce9f0d542890c;
    stim[49] = 119'h14ccf356b02ccb919726124d08c4ff;
    stim[50] = 119'h10c418b13439ef4421357d71cc0b7b;
    stim[51] = 119'h4615a1b33cdf8d181a8c5099244189;
    stim[52] = 119'h54376e7493fc9e520a219db1b7fb72;
    stim[53] = 119'h109cf31050b54f8c718b31a9d32cd9;
    stim[54] = 119'h05d92ecab47d4b2952018ff7785c01;
    stim[55] = 119'h777b8c6120514d0e01dc6439926e10;
    stim[56] = 119'h3c21b644d4e3f7ff5dc040121c5c08;
    stim[57] = 119'h789baa7a1488d1e42b89a96baa5364;
    stim[58] = 119'h1407a248b13cd5389c29efb49d332d;
    stim[59] = 119'h7acd31aaba61f1f8ffbb6eb0977b49;
    stim[60] = 119'h3aea03fe85b99db211d31d3070343a;
    stim[61] = 119'h1e24787e3799cb525adbdd84247386;
    stim[62] = 119'h34d30fc325304e47d0359b299cfd54;
    stim[63] = 119'h7d4edfb694560302b145b8f44d0cbd;
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
      expv[0] = 118'h000000000000000000000000000000;
      expv[1] = 118'h385bbb574d5fa0e64a9f982f13d95f;
      expv[2] = 118'h28f2e8ca372c005ad757767ec1f946;
      expv[3] = 118'h391804b73566891e446263a7f2eeb3;
      expv[4] = 118'h0a44532bd0fa34c74754e5ce989c98;
      expv[5] = 118'h14af70304d21f63ad12adb6c2de90d;
      expv[6] = 118'h02c20c8b4bd95e9adf3cbfd1e2c125;
      expv[7] = 118'h20ba9615944713c7aae580ef1d1b74;
      expv[8] = 118'h22521a8783075980d041b907ff88f3;
      expv[9] = 118'h2833b6fa6eb8ae8a3b89259c7e1c3f;
      expv[10] = 118'h22cf5290caeee740fded713502179a;
      expv[11] = 118'h0228ccbbc59b080a8945cbdb536a99;
      expv[12] = 118'h028d0515fac8cf0a6118a3dfa97e4f;
      expv[13] = 118'h1b785c2bc0938015d74d195018514f;
      expv[14] = 118'h1331d9455d50f1928e85979e4615f8;
      expv[15] = 118'h242ceabefb69970760b9f22670ed6c;
      expv[16] = 118'h14eaecf79275cf3e5e689233453fda;
      expv[17] = 118'h318d310419c5a8127f4d7a718d5808;
      expv[18] = 118'h32d1bbd1a90e07ef91af18d53819a7;
      expv[19] = 118'h3d064c477175ca90e49b34868c0916;
      expv[20] = 118'h1acaedf84ce62b85a2468497305aba;
      expv[21] = 118'h12fc4323d70239bdc3b025ca7ea6be;
      expv[22] = 118'h02c24edcdf78747c748cff55b3ca30;
      expv[23] = 118'h12d7052d694a76a6d4fa47f5c500a2;
      expv[24] = 118'h295064d429de5632152e528cbc5a38;
      expv[25] = 118'h02910517e73871d7e744230e3b81c5;
      expv[26] = 118'h30d65124ea5bd46937f0594a7e1e41;
      expv[27] = 118'h107e94ccd0cf6b69b98c96e1774a89;
      expv[28] = 118'h0ea118049bfe4b579765e1278d4b61;
      expv[29] = 118'h124ea371e33fc8ca669167291c0e6b;
      expv[30] = 118'h2ffdd3c8cec3666ae686b5c0330005;
      expv[31] = 118'h36bfe054bba7087a632e83ddc2b04d;
      expv[32] = 118'h04009d86f8e070777ff68f932e6f01;
      expv[33] = 118'h2205381ebea6736d4243a60906c16d;
      expv[34] = 118'h2fdea568c28473fdc9873b0f42c3f9;
      expv[35] = 118'h0dce263c76da9afb9fac4d02a8ed82;
      expv[36] = 118'h30f143bed4a18e4d6f188832b3a1b9;
      expv[37] = 118'h0a07061d9c55d2f4f018ac5eb2cb58;
      expv[38] = 118'h3a747ba2f5b026092361a60490aeab;
      expv[39] = 118'h02c19e5e8712755e861297d0282795;
      expv[40] = 118'h28885d122b29975f7e2c89f5882dd4;
      expv[41] = 118'h1d88705f7a27f085041082a16d633f;
      expv[42] = 118'h175468213a6153bc5e713d91afb9b7;
      expv[43] = 118'h195c139d24810386762c415a0fae49;
      expv[44] = 118'h105eece89eeebc74b9a2753aa8fc2c;
      expv[45] = 118'h1060de96782cdcd12fdaac4193338d;
      expv[46] = 118'h107168b81daf33328064f8a21b17f0;
      expv[47] = 118'h28d854e8c5f1d77e70264d9c6916c1;
      expv[48] = 118'h279e1f0e156b11d0ce5d40aa77f3c0;
      expv[49] = 118'h1192dcf617a75219fe74f86aa14486;
      expv[50] = 118'h0a6679ab581665c8cb93092684627f;
      expv[51] = 118'h08620c589a1cf7a2109abeb8e605bd;
      expv[52] = 118'h220ad0d99e6fc68c0d46284c9220c4;
      expv[53] = 118'h2a1bb73a49fe4f290510ced8dbfdb9;
      expv[54] = 118'h084e7988285aa7c638c598d4e9966c;
      expv[55] = 118'h02ec97655a3ea594a900c7fbbc2e00;
      expv[56] = 118'h3bbdc6309028a68700ee321cc93708;
      expv[57] = 118'h1e10db226a71fbffaee020090e2e04;
      expv[58] = 118'h3c4dd53d0a4468f215c4d4b5d529b2;
      expv[59] = 118'h0a03d124589e6a9c4e14f7da4e9996;
      expv[60] = 118'h386698d55d30f8fc7fddb7584bbda4;
      expv[61] = 118'h1d7501ff42dcced908e98e98381a1d;
      expv[62] = 118'h0f123c3f1bcce5a92d6deec21239c3;
      expv[63] = 118'h1a6987e192982723e81acd94ce7eaa;
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
