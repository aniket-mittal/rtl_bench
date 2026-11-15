// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 104;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011664 dut (
    .clk_sys(clk),
    .rst(in_vec[107:107]),
    .addr_in(in_vec[106:75]),
    .write_in(in_vec[74:74]),
    .writedata_in(in_vec[73:42]),
    .read_in(in_vec[41:41]),
    .byteenable_in(in_vec[40:37]),
    .burstcount_in(in_vec[36:34]),
    .readdata_in(in_vec[33:2]),
    .readdatavalid_in(in_vec[1:1]),
    .waitrequest_in(in_vec[0:0]),
    .readdata_out(out_vec[103:72]),
    .readdatavalid_out(out_vec[71:71]),
    .waitrequest_out(out_vec[70:70]),
    .addr_out(out_vec[69:38]),
    .write_out(out_vec[37:37]),
    .writedata_out(out_vec[36:5]),
    .read_out(out_vec[4:4]),
    .byteenable_out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'h97fd896fb0a5415446481ab9222;
    stim[1] = 108'h91dd1f177e7042d4749dc5eb4f7;
    stim[2] = 108'h18840be03183e6d26c92bd656bc;
    stim[3] = 108'h090e3bb9a6e412ccd8a0bc80984;
    stim[4] = 108'h5a9362f630a9cb437131330ffcf;
    stim[5] = 108'h33994193f7a46e23df69506bc20;
    stim[6] = 108'h75cb570f12f2bfb4baeab5b97d1;
    stim[7] = 108'h48a947a653226e463fd43e600ff;
    stim[8] = 108'h04e89d6cf8b48f2077675b657fb;
    stim[9] = 108'h0caf46818ab44c2eb9ece167eaa;
    stim[10] = 108'h74933b0eeb367c97d92f05c9a96;
    stim[11] = 108'h5324dccd369452334c60640e70e;
    stim[12] = 108'h66ee11bc0060baa519acb0c9f35;
    stim[13] = 108'h28964a63c39b56070a704dc7ca3;
    stim[14] = 108'h5c5ed169fc95476e3c9b0096281;
    stim[15] = 108'h2cc36dd6c56c63fea7547169407;
    stim[16] = 108'h3565fe81b90db00937c4e9044ea;
    stim[17] = 108'h12f31e5e9d79501b6a7f6c53c8b;
    stim[18] = 108'h7b79c4660b96ca63447dc468711;
    stim[19] = 108'h0e9751285c537054869a8b7208b;
    stim[20] = 108'h1b2b94168f168370769dfad736f;
    stim[21] = 108'h507ffbc3ddfeed9dcc4ccdc2cca;
    stim[22] = 108'h19b9db330cf7b2ca6abdb1a86ba;
    stim[23] = 108'h46181e4efbdf3f91fa75a8b2508;
    stim[24] = 108'h04f44df6df4cfb31ff385ef14f2;
    stim[25] = 108'h3a25102c955697e4d4336d6c0bf;
    stim[26] = 108'h7e76ae7cc6eb130edc48bf2ac60;
    stim[27] = 108'h35f7f254332866e3d6cf78282fd;
    stim[28] = 108'h0885e3684a5d376cc3ecbdd2019;
    stim[29] = 108'he868170dad7a496f27c431f1d6d;
    stim[30] = 108'h7247c5ff813780436da3e90c91e;
    stim[31] = 108'h30dae919c549db4fcf6768ec0a5;
    stim[32] = 108'h006917ee1410fbf757f5e80975f;
    stim[33] = 108'h69670f396fd1f8e8d3f85da5f4e;
    stim[34] = 108'h26894d71ae11fd36b61ee514f88;
    stim[35] = 108'h2661de549f0258e14b50813371e;
    stim[36] = 108'h74ffb883a505550ce15fe62c7a9;
    stim[37] = 108'h62dc4473a2958b20418bbd48008;
    stim[38] = 108'h1d6f7eeafeafaa2d4b5098861d4;
    stim[39] = 108'h722ad1cc2c3747f8e2f665577b5;
    stim[40] = 108'h55968a72df3bcb447d9580a3322;
    stim[41] = 108'h3f4d9e2862e81151682ff1f43da;
    stim[42] = 108'h0f65ba0d8d3c9e6f4ba9d1738cc;
    stim[43] = 108'h5e1872e1014444bfe958a748465;
    stim[44] = 108'h63dda1b8e7fdd1ae4c474f2974e;
    stim[45] = 108'h245187e57b9265fe3e29a80424f;
    stim[46] = 108'h6cada241168ea2b23011cbdb6f1;
    stim[47] = 108'h421bf7cfc5f5938180b13ef554e;
    stim[48] = 108'h617d7ba3ae594d89027439a0d43;
    stim[49] = 108'h1908ebf19ee0511fed655c3aeb7;
    stim[50] = 108'h1260dd4f3803bcc016f1e1655a2;
    stim[51] = 108'h7c2086e5bf3514a37126f53b9cc;
    stim[52] = 108'h07be1541806e10aae8b7857fa1a;
    stim[53] = 108'h55fe23dc9ebf719569546d1d968;
    stim[54] = 108'h7581fdb6fdb7ac97ab4398c609b;
    stim[55] = 108'h463e272c73b3f02dfbee01d4e48;
    stim[56] = 108'h204a3e4d96719e8dbea2611e6d0;
    stim[57] = 108'h374571333ab84a804437eaed642;
    stim[58] = 108'h1c6a9f30ee5f4d3570b8e7d4e68;
    stim[59] = 108'h57aab0d5ebb8dc454e40f02f054;
    stim[60] = 108'h06a75ce57877a0a61af7620f9f4;
    stim[61] = 108'h06a91ec991325a94f422236f70b;
    stim[62] = 108'h73a26f39a23537d5f6ff6587827;
    stim[63] = 108'h54eb95a83804c753c708e9da48c;
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
      expv[0] = 104'h206ae488xxxxxxxxx852a0aax3;
      expv[1] = 104'h7717ad3dc8ee8f8bbf38216a3a;
      expv[2] = 104'h4af595af0c4205f018c1f36936;
      expv[3] = 104'h82f202610c4205f1137209667c;
      expv[4] = 104'hc4cc3ff3ed49b17b1854e5a1b8;
      expv[5] = 104'ha541af0819cca0c9fbd23711ef;
      expv[6] = 104'haad6e5f47ae5ab8789795fda5d;
      expv[7] = 104'h50f9803fe454a3d3299137231f;
      expv[8] = 104'h9d6d95fec2744eb67c5a47903b;
      expv[9] = 104'hb3859faa8657a340c55a26175c;
      expv[10] = 104'hbc1726a5ba499d87759b3e4bec;
      expv[11] = 104'h819039c3ba499d885b4a2919a6;
      expv[12] = 104'hb2c327cd7a499d8940305d528c;
      expv[13] = 104'hc1371f28fa499d8961cdab0385;
      expv[14] = 104'h6c0258a07a499d897e4aa3b71e;
      expv[15] = 104'h51c5a501fa499d8962b631ff53;
      expv[16] = 104'h13a4113aba499d895c86d8049b;
      expv[17] = 104'hfdb14f22fa499d8a4ebca80db5;
      expv[18] = 104'hf711a1c47a499d8a45cb6531a2;
      expv[19] = 104'h6a2dc822fa499d8a6e29b82a43;
      expv[20] = 104'h77eb5cdbfa499d8a478b41b83b;
      expv[21] = 104'h33370b32ba499d8a6eff76cee6;
      expv[22] = 104'hf6c6a1ae8cdced99867bd96535;
      expv[23] = 104'hd6a2c9420cdced9abdef9fc8fd;
      expv[24] = 104'he17bc53c827a26fb6fa67d98ff;
      expv[25] = 104'hcdb5b02fc27a26fc4aab4bf27a;
      expv[26] = 104'h22fcab18027a26fc637589877e;
      expv[27] = 104'h3de0a0bf427a26fd59943371fb;
      expv[28] = 104'hb2f74806427a26fd652e9bb671;
      expv[29] = 104'h10c7c75b427a26fd56bd24b793;
      expv[30] = 104'h8fa43247b923e2ffc09bc021b6;
      expv[31] = 104'h9da3b029586d748ce2a4eda7e7;
      expv[32] = 104'hd7a025d7c0348bf70a087dfbab;
      expv[33] = 104'he17697d3b4b3879cb7e8fc7469;
      expv[34] = 104'h7b9453e21344a6b8d708fe9b4b;
      expv[35] = 104'h4204cdc79330ef2a4f812c70a5;
      expv[36] = 104'h7f98b1ea7a7fdc41d282aa8670;
      expv[37] = 104'h2ef52002316e2239d14ac59020;
      expv[38] = 104'h426218750eb7bf757f57d516a5;
      expv[39] = 104'hd9955ded791568e6161ba3fc71;
      expv[40] = 104'h56028cc8aacb45396f9de5a23e;
      expv[41] = 104'hbfc7d0f69fa6cf14317408a8a4;
      expv[42] = 104'ha745ce3307b2dd06c69e4f37a5;
      expv[43] = 104'h629d21196f0c397080a2225ff4;
      expv[44] = 104'h1d3ca5d3b1eed0dc73fee8d726;
      expv[45] = 104'ha6a01093d228c3f2bdc932ff0f;
      expv[46] = 104'h472f6dbc7656d1208b47515908;
      expv[47] = 104'hc4fbd553a10dfbe7e2fac9c0c0;
      expv[48] = 104'hd0e68350e10dfbe8d72ca6c481;
      expv[49] = 104'h9570ebade10dfbe8cf70288ff6;
      expv[50] = 104'hc7859568a10dfbe8dc01de600b;
      expv[51] = 104'h9bd4ee733e104372df9a8a51b8;
      expv[52] = 104'hde15fe86be104373c037085574;
      expv[53] = 104'h51b4765a3e104374cf5fb8cab4;
      expv[54] = 104'h0e631826fe104375fedbd64bd5;
      expv[55] = 104'hb80753923e104375f9d9f816fd;
      expv[56] = 104'h898479b410251f26cb38cf46df;
      expv[57] = 104'hdfabb59090251f27dd5c254032;
      expv[58] = 104'he39f539a0e354f98772fa69ab8;
      expv[59] = 104'h03c0bc150e354f9975dc6e22b7;
      expv[60] = 104'hdd883e7d0353ae72bc3bd0530d;
      expv[61] = 104'h888dbdc2c353ae7388992d4a6a;
      expv[62] = 104'hfd961e09c353ae73911a9beafb;
      expv[63] = 104'h23a769230353ae739c0263a9e3;
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
