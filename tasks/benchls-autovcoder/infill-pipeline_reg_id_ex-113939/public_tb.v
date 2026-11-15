// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 163;
  localparam OW = 160;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_113939 dut (
    .clock(clk),
    .reset(in_vec[162:162]),
    .io_in_pc(in_vec[161:130]),
    .io_in_instruction(in_vec[129:98]),
    .io_in_sextImm(in_vec[97:66]),
    .io_in_readdata1(in_vec[65:34]),
    .io_in_readdata2(in_vec[33:2]),
    .io_flush(in_vec[1:1]),
    .io_valid(in_vec[0:0]),
    .io_data_pc(out_vec[159:128]),
    .io_data_instruction(out_vec[127:96]),
    .io_data_sextImm(out_vec[95:64]),
    .io_data_readdata1(out_vec[63:32]),
    .io_data_readdata2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 163'h5ab7bac9ea717ced8ce90b23272fca895a0b91ecd;
    stim[1] = 163'h708418fde968e6bfcffa8ee26a4b8edf6e32ef8f9;
    stim[2] = 163'h3f150657b25db65d0913025da7e348564f8b48cac;
    stim[3] = 163'h315ab3d7491d61ecf929120adc36ae89d22b3b5c1;
    stim[4] = 163'h080475f7155d06cb1817c8148031b0c66823f19ba;
    stim[5] = 163'h3ec43e1bcddd138222b2fb0bb7f32d51c9a3d4083;
    stim[6] = 163'h3b462d6d20ca36875b9d92f636948f26e188e76a6;
    stim[7] = 163'h04691c48ad7111c1d4d11a73c7628bc27507f6e55;
    stim[8] = 163'h18ddaeef13aa4d30f699cc785f2475d6bc64347cb;
    stim[9] = 163'h1a09a4c86f746217eaa09e83128824674a114904b;
    stim[10] = 163'h2064571064ac4547442c57ee9ce8be81422be0692;
    stim[11] = 163'h08093356e847bd595de80dad426d9601087d82e30;
    stim[12] = 163'h1e8f6ea81d23c9c43ab6333f55868f2409e972251;
    stim[13] = 163'h3758287891ed1999380265c448de610f81428ff61;
    stim[14] = 163'h1f735c0234ef475904460f665e1bf022c60b02ec0;
    stim[15] = 163'h2f09fb52710bd713b93a1e93aabfe256a811dfe9c;
    stim[16] = 163'h2fb65e0636163b368c8742a0f52ed26a7c851f0f8;
    stim[17] = 163'h079b533d32bd0284864d5e58331d28fd89ac5cbe7;
    stim[18] = 163'h139bdce4becdc397227f8af3ac50bc940eec60707;
    stim[19] = 163'h209ec4bbb4334292b96abae0bd38ac0d7c7f8af31;
    stim[20] = 163'h29b813a703643891d4f4e6e00077ff7de6734c3b0;
    stim[21] = 163'h1280ade2406d3b461902ff1c842ab314beafa4147;
    stim[22] = 163'h25c125637716b2b096fd83ccf8b9171130f733cf2;
    stim[23] = 163'h009fae8c6149f4af2fb9534748485d47e2d5ff78b;
    stim[24] = 163'h0485b204b9e4a1f62a34d8471dfa9d0c8286df598;
    stim[25] = 163'h19873af310f509e6bfa1d31724c2c91811845e44a;
    stim[26] = 163'h48a69e27c293822d7052fb3d386ac49662fb7f496;
    stim[27] = 163'h15dcaf8d0b276cb4795edcfb08a14ee46d874aefb;
    stim[28] = 163'h3e5affa2364842cf0da76d0ff926155f917a42ebc;
    stim[29] = 163'h29892b33d4b67ee17d850a013ebdd35ff3c18d319;
    stim[30] = 163'h28f1cb381fb14a43c17f2d3c3cd6bf8d96e7f95e3;
    stim[31] = 163'h1bd3e470f09f9aa4e0c51e3e5248a665cae64c6d5;
    stim[32] = 163'h31efcdf3e8c5192740ba5f883be0b90acf32522d2;
    stim[33] = 163'h3df40a426a177e6ea27b14839885c331fb9a8fa6c;
    stim[34] = 163'h3a3058ed212557bd6447de20db0184fd465ea8386;
    stim[35] = 163'h35754421a95f6460196b6e4f44b6e77dad5418d9f;
    stim[36] = 163'h1f2306e2c82aa67c9fa535ce2be809e2299b36e68;
    stim[37] = 163'h164686231d17f8a7b9c906d144152ddd2f8465453;
    stim[38] = 163'h0a898f42c5a476da0fca6936ec53b34ca90a6b8b1;
    stim[39] = 163'h02dff19b956e59a2e40ac5d4465deb6e919770b10;
    stim[40] = 163'h1756391a41d864d53702964864e2f9d09b43b39c5;
    stim[41] = 163'h374a36989f9bd2c42d618efe185508fbcb059cc11;
    stim[42] = 163'h3c20cd271ec0926cc63f9b4343706ada1a8a3e701;
    stim[43] = 163'h027844d908545cce0459d5876aaef506720b33bb4;
    stim[44] = 163'h3de9ec41160d829205a21b7320ec6836c50255a78;
    stim[45] = 163'h2d14c962d5ec04c4d52daa5991cb0498806e72bce;
    stim[46] = 163'h266d856dcc181a59b4299f84644effe1f380ff98a;
    stim[47] = 163'h3709b27bff4ab83dc2b13f2c0e0e8ae90d2c59855;
    stim[48] = 163'h37a8a910323bfd29b609473e1b7293ff19d31bf6f;
    stim[49] = 163'h10d478ba11f15619ae7717c024986693b5b41d24c;
    stim[50] = 163'h26bff43660ec7ac0fc115e89a72790c9a3c70c362;
    stim[51] = 163'h24097c169848aaa3e7531ccc7a46c9db7715401f8;
    stim[52] = 163'h27c6955bcdff46ec20279563bcce59116f5c3883b;
    stim[53] = 163'h080398d73ba1493b19160460e941224ed85aeabe5;
    stim[54] = 163'h3003423690a1a1fe79949c0528df225dd574f1db7;
    stim[55] = 163'h309663a53aa93a97cf2a6025ea5fb2849dc452520;
    stim[56] = 163'h3d596bbae866c9db8b8744c8437bb4ef7d204b11e;
    stim[57] = 163'h1d02348fc0709856aa7e496cdf91478dc41bd395f;
    stim[58] = 163'h3c76464180560e839cf789fcd468ba536b1a2dd51;
    stim[59] = 163'h2b5fda49ecb69c275fbeec1f0921602fa15f218e7;
    stim[60] = 163'h2aa53203025dc88b3149d6c7193c06777bfc4bf94;
    stim[61] = 163'h32bdef204d7f89ec0696f2df5b34d4b498c4c85a5;
    stim[62] = 163'h2603cb1c4ad757aef29af1d35ebdcf55f5cf18c6b;
    stim[63] = 163'h11a9f28594a3a7cf424511abb14494f5e1d4df8dc;
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
      expv[0] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 160'h0000000000000000000000000000000000000000;
      expv[2] = 160'h0000000000000000000000000000000000000000;
      expv[3] = 160'h0000000000000000000000000000000000000000;
      expv[4] = 160'hc56acf5d247587b3e4a4482b70daba2748aced70;
      expv[5] = 160'h0000000000000000000000000000000000000000;
      expv[6] = 160'h0000000000000000000000000000000000000000;
      expv[7] = 160'h0000000000000000000000000000000000000000;
      expv[8] = 160'h11a47122b5c44707534469cf1d8a2f09d41fdb95;
      expv[9] = 160'h0000000000000000000000000000000000000000;
      expv[10] = 160'h0000000000000000000000000000000000000000;
      expv[11] = 160'h0000000000000000000000000000000000000000;
      expv[12] = 160'h0000000000000000000000000000000000000000;
      expv[13] = 160'h7a3dbaa0748f2710ead8ccfd561a3c9027a5c894;
      expv[14] = 160'hdd60a1e247b46664e00997112379843e050a3fd8;
      expv[15] = 160'hdd60a1e247b46664e00997112379843e050a3fd8;
      expv[16] = 160'hdd60a1e247b46664e00997112379843e050a3fd8;
      expv[17] = 160'hdd60a1e247b46664e00997112379843e050a3fd8;
      expv[18] = 160'h0000000000000000000000000000000000000000;
      expv[19] = 160'h0000000000000000000000000000000000000000;
      expv[20] = 160'h827b12eed0cd0a4ae5aaeb82f4e2b035f1fe2bcc;
      expv[21] = 160'h827b12eed0cd0a4ae5aaeb82f4e2b035f1fe2bcc;
      expv[22] = 160'h0000000000000000000000000000000000000000;
      expv[23] = 160'h0000000000000000000000000000000000000000;
      expv[24] = 160'h0000000000000000000000000000000000000000;
      expv[25] = 160'h0000000000000000000000000000000000000000;
      expv[26] = 160'h0000000000000000000000000000000000000000;
      expv[27] = 160'h0000000000000000000000000000000000000000;
      expv[28] = 160'h0000000000000000000000000000000000000000;
      expv[29] = 160'h0000000000000000000000000000000000000000;
      expv[30] = 160'ha624accf52d9fb85f6142804faf74d7fcf0634c6;
      expv[31] = 160'h0000000000000000000000000000000000000000;
      expv[32] = 160'h6f4f91c3c27e6a93831478f9492299972b9931b5;
      expv[33] = 160'h0000000000000000000000000000000000000000;
      expv[34] = 160'h0000000000000000000000000000000000000000;
      expv[35] = 160'h0000000000000000000000000000000000000000;
      expv[36] = 160'h0000000000000000000000000000000000000000;
      expv[37] = 160'h0000000000000000000000000000000000000000;
      expv[38] = 160'h0000000000000000000000000000000000000000;
      expv[39] = 160'h2a263d0b1691db683f29a4dbb14ecd32a429ae2c;
      expv[40] = 160'h2a263d0b1691db683f29a4dbb14ecd32a429ae2c;
      expv[41] = 160'h5d58e46907619354dc0a5921938be7426d0ece71;
      expv[42] = 160'hdd28da627e6f4b10b5863bf8615423ef2c167304;
      expv[43] = 160'hf083349c7b0249b318fe6d0d0dc1ab686a28f9c0;
      expv[44] = 160'hf083349c7b0249b318fe6d0d0dc1ab686a28f9c0;
      expv[45] = 160'hf083349c7b0249b318fe6d0d0dc1ab686a28f9c0;
      expv[46] = 160'h0000000000000000000000000000000000000000;
      expv[47] = 160'h0000000000000000000000000000000000000000;
      expv[48] = 160'hdc26c9effd2ae0f70ac4fcb0383a2ba434b16615;
      expv[49] = 160'h0000000000000000000000000000000000000000;
      expv[50] = 160'h0000000000000000000000000000000000000000;
      expv[51] = 160'h0000000000000000000000000000000000000000;
      expv[52] = 160'h0000000000000000000000000000000000000000;
      expv[53] = 160'h0000000000000000000000000000000000000000;
      expv[54] = 160'h200e635cee8524ec64581183a504893b616baaf9;
      expv[55] = 160'h0000000000000000000000000000000000000000;
      expv[56] = 160'h0000000000000000000000000000000000000000;
      expv[57] = 160'h0000000000000000000000000000000000000000;
      expv[58] = 160'h0000000000000000000000000000000000000000;
      expv[59] = 160'hf1d9190601583a0e73de27f351a2e94dac68b754;
      expv[60] = 160'h0000000000000000000000000000000000000000;
      expv[61] = 160'h0000000000000000000000000000000000000000;
      expv[62] = 160'hcaf7bc8135fe27b01a5bcb7d6cd352d263132169;
      expv[63] = 160'h0000000000000000000000000000000000000000;
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
