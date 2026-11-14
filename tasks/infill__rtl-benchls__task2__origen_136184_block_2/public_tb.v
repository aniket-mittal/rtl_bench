// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 154;
  localparam OW = 111;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_136184 dut (
    .ACLK(clk),
    .ARESETN(in_vec[153:153]),
    .S_AXI_AWADDR(in_vec[152:121]),
    .S_AXI_AWCACHE(in_vec[120:117]),
    .S_AXI_AWPROT(in_vec[116:114]),
    .S_AXI_AWVALID(in_vec[113:113]),
    .S_AXI_WDATA(in_vec[112:81]),
    .S_AXI_WSTRB(in_vec[80:77]),
    .S_AXI_WVALID(in_vec[76:76]),
    .S_AXI_BREADY(in_vec[75:75]),
    .S_AXI_ARADDR(in_vec[74:43]),
    .S_AXI_ARCACHE(in_vec[42:39]),
    .S_AXI_ARPROT(in_vec[38:36]),
    .S_AXI_ARVALID(in_vec[35:35]),
    .S_AXI_RREADY(in_vec[34:34]),
    .LOCAL_CLK(in_vec[33:33]),
    .LOCAL_ACK(in_vec[32:32]),
    .LOCAL_RDATA(in_vec[31:0]),
    .S_AXI_AWREADY(out_vec[110:110]),
    .S_AXI_WREADY(out_vec[109:109]),
    .S_AXI_BVALID(out_vec[108:108]),
    .S_AXI_BRESP(out_vec[107:106]),
    .S_AXI_ARREADY(out_vec[105:105]),
    .S_AXI_RDATA(out_vec[104:73]),
    .S_AXI_RRESP(out_vec[72:71]),
    .S_AXI_RVALID(out_vec[70:70]),
    .LOCAL_CS(out_vec[69:69]),
    .LOCAL_RNW(out_vec[68:68]),
    .LOCAL_ADDR(out_vec[67:36]),
    .LOCAL_BE(out_vec[35:32]),
    .LOCAL_WDATA(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 154'h14e0693aeba557b1d59121b6da02b88aa0f7f53;
    stim[1] = 154'h0bc44a2748bcf9ed49b43705f9d677d6d5e34cd;
    stim[2] = 154'h2545a07f24d12ada3efbe886fe12983e7522f88;
    stim[3] = 154'h3585b3ffc6b153d7b9580f4ae5c181af0698bfc;
    stim[4] = 154'h2831e0cb8fea8dfe2b70a3cf95a7124b0892f45;
    stim[5] = 154'h3d510c2b99cf299346ebfdda70ae8c764f8a16d;
    stim[6] = 154'h2845121df7831b95d031ff4b8a7e53b6beb307f;
    stim[7] = 154'h31ae8ac7acf2f480725ccf591fe0da79b6e67b7;
    stim[8] = 154'h2b824078b72c982295388a314d674cd055f2a3a;
    stim[9] = 154'h2e77ff58335cd38ac7ba6fdee610c597d5f584a;
    stim[10] = 154'h2fa820bf431935970e5a4742abac688b7e84e3f;
    stim[11] = 154'h2bc2fae19a6bb5e36a9fd53270160b2c60eb88a;
    stim[12] = 154'h24623c298daf83811a1a590ec72dad2b57e21a1;
    stim[13] = 154'h3669d55a7cb5c9fdb6ee7489dbea989fb4621d7;
    stim[14] = 154'h32c7bffa25d1210ecc8ea1f007ff78c327b6daa;
    stim[15] = 154'h2185bb3db6ff54cb5b4592d019c98c2cb23c62b;
    stim[16] = 154'h3a663b8a34112595c6467162b9d41d2f3ef6102;
    stim[17] = 154'h306e7afa42d29a2b2df000a242840bef299cf8c;
    stim[18] = 154'h216cdc2b86b2a83df9083c3c7d696eb949b9237;
    stim[19] = 154'h322e47725f62919e06dcb12f63df3fa5938c321;
    stim[20] = 154'h3ab81e0ed426fc07bf6134c4a1e4bfe8a7099b2;
    stim[21] = 154'h376331dde59f61e0d831eb0f3ebccf754f657f9;
    stim[22] = 154'h2e86585c92c9cd71d7c59bc4100eb10c94ee7cb;
    stim[23] = 154'h27b52a4af95eca286fbfeb061cf66a2e540c8fc;
    stim[24] = 154'h2a2eac6f2fc016625a8eec7c77218bb9ba345dd;
    stim[25] = 154'h228cdc38f8cec364d057e86f1596ffba6fe053f;
    stim[26] = 154'h2c97b6d06e1e569ea19779fa4303ad2d5887e04;
    stim[27] = 154'h2cc6261c82f02a44f93d3714832ceeb4a3792a9;
    stim[28] = 154'h2f0a6cdef603d21a2b630dda819fe0a9ef26c9f;
    stim[29] = 154'h3954be576f9e4146002d2e0d0041dd41a400b8f;
    stim[30] = 154'h275e3e0b87b574bd1e30f756ef447b42d380e00;
    stim[31] = 154'h22c8cb708c072011cf948dbec13d17a661ec924;
    stim[32] = 154'h370212a283f4f96fb04ecf6b34b1d7585fef655;
    stim[33] = 154'h33418f2f6e6bdb586bcf2e60cb1002fefdfdcbf;
    stim[34] = 154'h26b04d7734e5663476c5775f89950f9a30c65df;
    stim[35] = 154'h3c9aa60120b1b011a48101129a771c23153b6e2;
    stim[36] = 154'h34db783c308c5b0695c880472bc5aa2fdd83cdf;
    stim[37] = 154'h2a821762139b8bfe58a7878c55ca2f15ce71acb;
    stim[38] = 154'h29b784c437e0193571657c49d86bdf421a4f6a1;
    stim[39] = 154'h2dab44474f102a1bb9b86f8528cf5e05e429e76;
    stim[40] = 154'h357cb5e8afef5b03aa3dcad10c7636f663e63e2;
    stim[41] = 154'h32934cc469d48b02647b325263042694313e6f3;
    stim[42] = 154'h2cfeef8e7ae85350eea822f8d84e4977feb1f6e;
    stim[43] = 154'h3707203e76591ec577c5f24d82ebf846728cabb;
    stim[44] = 154'h34c9c65e42b633457bc77c1a1430633c22b05b6;
    stim[45] = 154'h36c0c916334e0b45fb3e29523b345d8b7da52c1;
    stim[46] = 154'h35b3f8ac2ada370658bf77b57c2b48a2e5afcc7;
    stim[47] = 154'h23f5c55f4b7de34bec1ce469c8cf3f86181897f;
    stim[48] = 154'h38362bebbfcaee3a31c23f19f59cb41300d0388;
    stim[49] = 154'h24c26548f3ab8532d27d78738ba1c1f8a573cf7;
    stim[50] = 154'h2a5a12b21614086bd3eefcd368953298b69f31f;
    stim[51] = 154'h361c9b0c324c0e873dba72f29a86f3df1e99e47;
    stim[52] = 154'h32551afa2ca942a8dc86ec3b077765d98e131da;
    stim[53] = 154'h3e65d6afb7b028c9f3a27c2c177d3ff2ba4fa5f;
    stim[54] = 154'h2d61af6ee863678788117538854ad7bc73a9edc;
    stim[55] = 154'h3c61b444fc5404f5da7fa1580217e1b432c4080;
    stim[56] = 154'h2dc49bf6e885c574eab08a796317b99e504b96b;
    stim[57] = 154'h38fe94bddce1255400ed4a040f7973a5f488329;
    stim[58] = 154'h22572bf8965ef786cce83c39b87e953f4ca5bac;
    stim[59] = 154'h2cc9208dfe328735d13910c8fb532b887034cad;
    stim[60] = 154'h2cdcaab19a98582efe4d0369b9d113e76ae2020;
    stim[61] = 154'h38435c83eebf730d43deac86d85974241b20232;
    stim[62] = 154'h29c15ade009354b4cb823672e6249af64561925;
    stim[63] = 154'h2267b6ebafd1325019dd2ca6afc70703404ff39;
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
      expv[0] = 111'h0xxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 111'h0xxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 111'h0xxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 111'h0xxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 111'h4xxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 111'h0xxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 111'h2xxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 111'h0xxxxxxxxxxac2d9ffe5794c9a37;
      expv[8] = 111'h4xxxxxxxxxxac2d9ffe5794c9a37;
      expv[9] = 111'h0xxxxxxxxxxac2d9ffe5794c9a37;
      expv[10] = 111'h0xxxxxxxxxxac2d9ffe5794c9a37;
      expv[11] = 111'h0xxxxxxxxxxac2d9ffe5794c9a37;
      expv[12] = 111'h2xxxxxxxxxxac2d9ffe5794c9a37;
      expv[13] = 111'h0xxxxxxxxxx8d74563df5daf1b54;
      expv[14] = 111'h1xxxxxxxxxx8d74563df5daf1b54;
      expv[15] = 111'h1xxxxxxxxxx8d74563df5daf1b54;
      expv[16] = 111'h1xxxxxxxxxx8d74563df5daf1b54;
      expv[17] = 111'h1xxxxxxxxxx8d74563df5daf1b54;
      expv[18] = 111'h1xxxxxxxxxx8d74563df5daf1b54;
      expv[19] = 111'h1xxxxxxxxxx8d74563df5daf1b54;
      expv[20] = 111'h1xxxxxxxxxx8d74563df5daf1b54;
      expv[21] = 111'h1xxxxxxxxxx8d74563df5daf1b54;
      expv[22] = 111'h0xxxxxxxxxx8d74563df5daf1b54;
      expv[23] = 111'h0xxxxxxxxxx8d74563df5daf1b54;
      expv[24] = 111'h0xxxxxxxxxx8d74563df5daf1b54;
      expv[25] = 111'h0xxxxxxxxxx8d74563df5daf1b54;
      expv[26] = 111'h014dfc0a7e5d8f8ee43f5daf1b54;
      expv[27] = 111'h014dfc0a7e7d8f8ee43f5daf1b54;
      expv[28] = 111'h00946f25525d8f8ee43f5daf1b54;
      expv[29] = 111'h00946f25527d8f8ee43f5daf1b54;
      expv[30] = 111'h00946f25527d8f8ee43f5daf1b54;
      expv[31] = 111'h00946f25527d8f8ee43f5daf1b54;
      expv[32] = 111'h00946f25527d8f8ee43f5daf1b54;
      expv[33] = 111'h010bfdecaa1d8f8ee43f5daf1b54;
      expv[34] = 111'h410bfdecaa1d8f8ee43f5daf1b54;
      expv[35] = 111'h210bfdecaa1d8f8ee43f5daf1b54;
      expv[36] = 111'h010bfdecaa29a0c797b22b31a3b6;
      expv[37] = 111'h010bfdecaa29a0c797b22b31a3b6;
      expv[38] = 111'h010bfdecaa09a0c797b22b31a3b6;
      expv[39] = 111'h410bfdecaa09a0c797b22b31a3b6;
      expv[40] = 111'h010bfdecaa09a0c797b22b31a3b6;
      expv[41] = 111'h210bfdecaa09a0c797b22b31a3b6;
      expv[42] = 111'h110bfdecaa04dbc2621e7ad81d51;
      expv[43] = 111'h110bfdecaa04dbc2621e7ad81d51;
      expv[44] = 111'h110bfdecaa24dbc2621e7ad81d51;
      expv[45] = 111'h110bfdecaa04dbc2621e7ad81d51;
      expv[46] = 111'h110bfdecaa24dbc2621e7ad81d51;
      expv[47] = 111'h110bfdecaa24dbc2621e7ad81d51;
      expv[48] = 111'h110bfdecaa24dbc2621e7ad81d51;
      expv[49] = 111'h110bfdecaa04dbc2621e7ad81d51;
      expv[50] = 111'h110bfdecaa04dbc2621e7ad81d51;
      expv[51] = 111'h010bfdecaa04dbc2621e7ad81d51;
      expv[52] = 111'h030bfdecaa04dbc2621e7ad81d51;
      expv[53] = 111'h0131c263b41e5e5350de7ad81d51;
      expv[54] = 111'h4131c263b41e5e5350de7ad81d51;
      expv[55] = 111'h2131c263b41e5e5350de7ad81d51;
      expv[56] = 111'h0131c263b40f32eb57d81b3c3c40;
      expv[57] = 111'h0331c263b40f32eb57d81b3c3c40;
      expv[58] = 111'h0131c263b4314f2c62f81b3c3c40;
      expv[59] = 111'h01e994b758514f2c62f81b3c3c40;
      expv[60] = 111'h01e994b758714f2c62f81b3c3c40;
      expv[61] = 111'h01e994b758714f2c62f81b3c3c40;
      expv[62] = 111'h01e994b758714f2c62f81b3c3c40;
      expv[63] = 111'h00c8ac324a114f2c62f81b3c3c40;
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
