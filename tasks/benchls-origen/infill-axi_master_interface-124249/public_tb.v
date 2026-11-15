// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 171;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_124249 dut (
    .aclk(clk),
    .aresetn(in_vec[170:170]),
    .m_axi_awid(in_vec[169:166]),
    .m_axi_awaddr(in_vec[165:134]),
    .m_axi_awlen(in_vec[133:126]),
    .m_axi_awsize(in_vec[125:123]),
    .m_axi_awburst(in_vec[122:121]),
    .m_axi_awlock(in_vec[120:120]),
    .m_axi_awcache(in_vec[119:116]),
    .m_axi_awprot(in_vec[115:113]),
    .m_axi_awqos(in_vec[112:109]),
    .m_axi_awvalid(in_vec[108:108]),
    .m_axi_wdata(in_vec[107:76]),
    .m_axi_wstrb(in_vec[75:72]),
    .m_axi_wlast(in_vec[71:71]),
    .m_axi_wvalid(in_vec[70:70]),
    .m_axi_bid(in_vec[69:66]),
    .m_axi_bresp(in_vec[65:64]),
    .m_axi_bvalid(in_vec[63:63]),
    .m_axi_arid(in_vec[62:59]),
    .m_axi_araddr(in_vec[58:27]),
    .m_axi_arlen(in_vec[26:19]),
    .m_axi_arsize(in_vec[18:16]),
    .m_axi_arburst(in_vec[15:14]),
    .m_axi_arlock(in_vec[13:13]),
    .m_axi_arcache(in_vec[12:9]),
    .m_axi_arprot(in_vec[8:6]),
    .m_axi_arqos(in_vec[5:2]),
    .m_axi_arvalid(in_vec[1:1]),
    .m_axi_rready(in_vec[0:0]),
    .m_axi_awready(out_vec[43:43]),
    .m_axi_wready(out_vec[42:42]),
    .m_axi_bready(out_vec[41:41]),
    .m_axi_arready(out_vec[40:40]),
    .m_axi_rid(out_vec[39:36]),
    .m_axi_rdata(out_vec[35:4]),
    .m_axi_rresp(out_vec[3:2]),
    .m_axi_rlast(out_vec[1:1]),
    .m_axi_rvalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 171'h3bc363b5b03a3b9c1d04056f58ef93fbdb96bf8c984;
    stim[1] = 171'h2616d67daea9c0a25a656a1dad131da4403c5849a91;
    stim[2] = 171'h69704649c9b08cdf6684c4ef73b31dd7bdfce24caf7;
    stim[3] = 171'h4f3a73f74e39b5dc26065673cab039637234e328321;
    stim[4] = 171'h4b6df9818c4898253a8d70dde31f3ae1e25d6d87de6;
    stim[5] = 171'h42bc735fe98b4cdac56a9c8dcc48b9b545c804424a8;
    stim[6] = 171'h4b79e5724220dbbc4e3dbbeb6791cb757069e70fc39;
    stim[7] = 171'h6f5c514c2e6598448ff78aae77896cad223d2393304;
    stim[8] = 171'h68d1afc6f5a8c58e2e43289ed65b8b7a0a58eb21c48;
    stim[9] = 171'h5f4c0fe405c106b4aa3d04ba486c04c071a1b7fdec6;
    stim[10] = 171'h4c1f418e4e33f53d8ce9b57a319af114da9fb972c1b;
    stim[11] = 171'h635b8bea026c8d9462ea47236e106f923c0360f54d1;
    stim[12] = 171'h5fcf7670147daf1fed2a8a03175b72d9f84270d753b;
    stim[13] = 171'h61831346429f03fb03631104d4c6be24f9e76daf416;
    stim[14] = 171'h7e6860272ce1e64621f7b28af2624423485f0c7acaf;
    stim[15] = 171'h4381fe3a542dc7f1ac8fb9d93e47160a0660377bae8;
    stim[16] = 171'h4596a0f0f694c797ff54097e5f4b19c56b7c420c750;
    stim[17] = 171'h527b9d9b0e303aee6cc60e71fd4877e3a5a08523ba4;
    stim[18] = 171'h426c06efdf76b1bf6ef6d9b3dc167012ed48fe11434;
    stim[19] = 171'h736e8744a4a1f56cec75c08e9feb916acc97c94b008;
    stim[20] = 171'h6eb7b81ea6e00a07e5b61c60733dc5ccfa14f2c40f4;
    stim[21] = 171'h5bf4af0bf25a321e9db532a10c86aee18cde870e547;
    stim[22] = 171'h47ed85c35bc00c0f73e06ce6fd1a317524fd7a3597c;
    stim[23] = 171'h7eb64b25ec09c1089cb640ffd36a8f6f01c95570d37;
    stim[24] = 171'h7bd5a0960495a1a2a0eac53966aa0698613908ca189;
    stim[25] = 171'h67d0d93b9c2f08a9813d2b6da9421823d9550549849;
    stim[26] = 171'h596070290d0339213b0dc7e42d238900cfec463f842;
    stim[27] = 171'h7d04a787a060fbc97c0b6b12f1116e286d2dc331e17;
    stim[28] = 171'h50bab2af034db5dc9fa4e249b65452d19f4728c6d91;
    stim[29] = 171'h6b157e564bd5d77a9b49e37220ea48c81b7d7b774f8;
    stim[30] = 171'h40bc0a399bc9967cc620e69965f99735ffbb2fbc433;
    stim[31] = 171'h50f787e860cb53fba550bda6e828fa3f93bb3ce3845;
    stim[32] = 171'h76220de94420cdb79e64a4e7e37d5a941cf7ab01a0d;
    stim[33] = 171'h42d9816c0df07c08cdd7406baf3cb8c8ae964aa64ec;
    stim[34] = 171'h460c008e4057b144a0e42e9fa338352803efb446cec;
    stim[35] = 171'h7e81762ea889650dabce3ca9a4cbf1dd3c2b25acbe8;
    stim[36] = 171'h478da1c13d8cf7bc3914a1e3a6a548ac1463eabc398;
    stim[37] = 171'h6ae1756308f4f218ae36d6d282465f08c476497d75c;
    stim[38] = 171'h79e206900418acb05b478cad25cea92123cefe0023e;
    stim[39] = 171'h048625be4fa6e64dab67e714e9709d00817799b3564;
    stim[40] = 171'h5f1ce1aae49a689d616be4b0a1ee61f61183aefd968;
    stim[41] = 171'h57ba997ac842e7a83cf3f5bde0ee252d5e7cbfc8d15;
    stim[42] = 171'h62ac8f0660e0ee33fc93b885dceaaf253afe842896b;
    stim[43] = 171'h5ef324ad21a9d2c6ee2b4e671012c03bbdf0608faae;
    stim[44] = 171'h582f2360bc3312bf0ad063ecdfa3da8eeaffc9a504e;
    stim[45] = 171'h65330a29ca63f818f4364ec00f1afe31f14c4ef391a;
    stim[46] = 171'h6a344a619e097aa5a5039fbb1931abb09eb6427e78f;
    stim[47] = 171'h72c153341b717e4cc3cabe43f25dcfb03660c6a6cea;
    stim[48] = 171'h5f1274ddfc477aae730ff03108042b36fcb1dfaef25;
    stim[49] = 171'h776d73c2c4f03ae066db322e83e7f7e8b9a41f6ba47;
    stim[50] = 171'h794cef746fde93b3e423e501d46243672fbe6d2de14;
    stim[51] = 171'h406ebfce501a413ac772d64041726c3a83c7c0265cb;
    stim[52] = 171'h48b64bdbf003e21c891d842b271a7384a33761651ad;
    stim[53] = 171'h43bf2dfe549433f35bd4dae69a9615ff6082313983c;
    stim[54] = 171'h6d65e91a2d8b1495a94dbea28bbc77acdff7acbf76f;
    stim[55] = 171'h5240bc78cc3f52d13d8c0ceece2fad68ba754651f5a;
    stim[56] = 171'h6249ec6f7f795029a9432e540d8393e9dff8b4931a1;
    stim[57] = 171'h783d61cc02a8a102878e17c7f2a3b472851ac00c6a1;
    stim[58] = 171'h644c97494d35b9d6462ada093eb9ae4f697e533941e;
    stim[59] = 171'h6c372bad94e258d30c87f0207637532aaf57bb1c9df;
    stim[60] = 171'h63ef2dada01e728f9ee75aac583417c74820cc68347;
    stim[61] = 171'h5ff891b942f232dd193b269611ec76d9a55a32ff3e4;
    stim[62] = 171'h732d117580945465d76193a375083f8c11d13bd0c18;
    stim[63] = 171'h7b3ea19b71977e87c7ae21b3088811cfef46b5f1635;
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
      expv[0] = 44'h00000000000;
      expv[1] = 44'h00000000000;
      expv[2] = 44'h00000000000;
      expv[3] = 44'h90000000000;
      expv[4] = 44'h60000000000;
      expv[5] = 44'h60000000000;
      expv[6] = 44'h90000000000;
      expv[7] = 44'h90000000000;
      expv[8] = 44'h90000000000;
      expv[9] = 44'h90000000000;
      expv[10] = 44'h90000000000;
      expv[11] = 44'h05deadbeef2;
      expv[12] = 44'h00deadbeef2;
      expv[13] = 44'h06deadbeef2;
      expv[14] = 44'h0ddeadbeef3;
      expv[15] = 44'h04deadbeef2;
      expv[16] = 44'h94deadbeef2;
      expv[17] = 44'h24deadbeef2;
      expv[18] = 44'h24deadbeef2;
      expv[19] = 44'h94deadbeef2;
      expv[20] = 44'h24deadbeef2;
      expv[21] = 44'h64deadbeef2;
      expv[22] = 44'h94deadbeef2;
      expv[23] = 44'h04deadbeef3;
      expv[24] = 44'h05deadbeef2;
      expv[25] = 44'h95deadbeef2;
      expv[26] = 44'h95deadbeef2;
      expv[27] = 44'h25deadbeef2;
      expv[28] = 44'h65deadbeef2;
      expv[29] = 44'h65deadbeef2;
      expv[30] = 44'h65deadbeef2;
      expv[31] = 44'h95deadbeef2;
      expv[32] = 44'h01deadbeef2;
      expv[33] = 44'h0adeadbeef2;
      expv[34] = 44'h09deadbeef3;
      expv[35] = 44'h00deadbeef3;
      expv[36] = 44'h07deadbeef3;
      expv[37] = 44'h0adeadbeef3;
      expv[38] = 44'h0cdeadbeef3;
      expv[39] = 44'h00000000000;
      expv[40] = 44'h00000000000;
      expv[41] = 44'h90000000000;
      expv[42] = 44'h60000000000;
      expv[43] = 44'h20000000000;
      expv[44] = 44'h90000000000;
      expv[45] = 44'h07deadbeef3;
      expv[46] = 44'h05deadbeef3;
      expv[47] = 44'h03deadbeef2;
      expv[48] = 44'h93deadbeef2;
      expv[49] = 44'h08deadbeef2;
      expv[50] = 44'h0fdeadbeef2;
      expv[51] = 44'h04deadbeef3;
      expv[52] = 44'h04deadbeef2;
      expv[53] = 44'h94deadbeef2;
      expv[54] = 44'h94deadbeef2;
      expv[55] = 44'h64deadbeef2;
      expv[56] = 44'h24deadbeef2;
      expv[57] = 44'h94deadbeef2;
      expv[58] = 44'h64deadbeef2;
      expv[59] = 44'h24deadbeef2;
      expv[60] = 44'h94deadbeef2;
      expv[61] = 44'h64deadbeef2;
      expv[62] = 44'h64deadbeef2;
      expv[63] = 44'h94deadbeef2;
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
