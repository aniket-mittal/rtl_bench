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
    stim[0] = 154'h139d5e4043187f9f3cb2fb3bf70cc2198284e73;
    stim[1] = 154'h00dd6e2d9c7122e2e3e7933a6ba34f895f5f0fb;
    stim[2] = 154'h38d3e71f8bba27caa5addbc1fb4190652ccb422;
    stim[3] = 154'h2787baa671c608d9e3ab65279ed40c1f2d98382;
    stim[4] = 154'h21efbd63c3129cd707a04bc45629a3549d09f06;
    stim[5] = 154'h20c9b61fd94387f2521ea3a3e70a20649fae084;
    stim[6] = 154'h29012e4014b7708c9581d14f9aea8215635d53d;
    stim[7] = 154'h3e2f0d25faba09e2b36ecd4f929a88c35f6847a;
    stim[8] = 154'h37d604be1204a318cf6c978ed3b386642128b6b;
    stim[9] = 154'h2225715c4e16179c40eadfe2fbff5eb6e6e709a;
    stim[10] = 154'h35bae1c12dc5860e3a48dba95764f222ccb8200;
    stim[11] = 154'h210bb0e81344423cf87c149a2843d9a6a243566;
    stim[12] = 154'h2eac5e0d88ed261e01acd8f323131d1870a2a7b;
    stim[13] = 154'h39b56d641559fb9a55bdcdd560d45bea03ad04c;
    stim[14] = 154'h2b0e8a3fb93c1b2614cece48024cc4cea958c96;
    stim[15] = 154'h22c09f41836e0f55f6da5e2111c0a80ee1c7255;
    stim[16] = 154'h25f588c0e90985ad6c1499644c0ed85c0ec49ae;
    stim[17] = 154'h2a7c1e9ad561c7b7479c0efbbca845917a87195;
    stim[18] = 154'h35548a2afbf35dbf50f79a2f80b40715479b82d;
    stim[19] = 154'h3c16c6e1bedcdf20d68844f1de9a47d0fe3bcd4;
    stim[20] = 154'h2a4bd0222d7b41bb0188c3a1c3d669d3a367634;
    stim[21] = 154'h32ecd0de9c7435a590ee856ea35d38bfbab5bcd;
    stim[22] = 154'h3fee43004be9010da6c72fd29b6309a3df1c496;
    stim[23] = 154'h3f0a9915541aaa15b4faaf1c6c3becabc789c31;
    stim[24] = 154'h215a4bed49015651afc437380f76c3fd700beb4;
    stim[25] = 154'h3faffc52a5b288b757a4a9943e990e5ea2d233f;
    stim[26] = 154'h3c7690d2ed2344161d07be2f30141cbdcf1583c;
    stim[27] = 154'h29bfbed490cb0d44b9d74d8c456216af23ac07a;
    stim[28] = 154'h331a953f5e25c3cf267ba08d2fb4046edb93a2f;
    stim[29] = 154'h33c605e03295b3ffdd7d5eab5ffca650aa08a9a;
    stim[30] = 154'h3843ed5c29494f302013bed62784e497aeeaeef;
    stim[31] = 154'h2f5fc81f52d264f2443800092d51c1cb7813478;
    stim[32] = 154'h256347874239567b2c6502455d79467dcdf9bff;
    stim[33] = 154'h39eba691fc819ea0c1e20bb2f4a86333ea02f2a;
    stim[34] = 154'h2275089cbffd5e0357bc7ca9201dbc576a45635;
    stim[35] = 154'h2c0f1245b937d59d35eaa8ce647fae0b1177a9b;
    stim[36] = 154'h1b3de3a0cb973958fbadc0e58c0f1c1d7f5d21e;
    stim[37] = 154'h3fd6095e295d25a8b551c4fe942508b56487ff1;
    stim[38] = 154'h2c61d4670e2c566b6fb2353348db824e2f0815e;
    stim[39] = 154'h3eb36808c6c45c0e10f982bfba334c3e4b085f7;
    stim[40] = 154'h26d032df307c79dc3bb88185dce5c496ed77d67;
    stim[41] = 154'h335bdae381af72daac565e981b8e1c22f002e88;
    stim[42] = 154'h2e7c83e64733ff85f0144f1fafdbca36ada83f6;
    stim[43] = 154'h29188c8f4e21ab002c4bacd9b3a3680e0dc3482;
    stim[44] = 154'h2261f6197df6a8d06fd40851ce9cfc718cce513;
    stim[45] = 154'h21f311d954079712eefd3caa1d4215fac96a874;
    stim[46] = 154'h2ef3d8c1400b00b7866203235d36d3ecf4256b1;
    stim[47] = 154'h2edc139303b02cb079a77c8c7487bd5c7a9068a;
    stim[48] = 154'h2c8007b6352b42af8aea4537e6d6cb2720f802d;
    stim[49] = 154'h2f0dd7886f688225620209aa60d344e3a804095;
    stim[50] = 154'h2eef9035b311730d5e21e69404a02ad53efd3df;
    stim[51] = 154'h2036cfc1c9fb3bbf18b93c5cef23715232f35a4;
    stim[52] = 154'h3c993c1087afb0ee45d0e05b2f202616b8f20d3;
    stim[53] = 154'h27c2abe50eade382b23c20850cc075134a819a8;
    stim[54] = 154'h3ccb0eb2818c4197e85b282953e564787360a7c;
    stim[55] = 154'h39d0f3ad66216d7effee637426d7bbafb2052c3;
    stim[56] = 154'h3fe884ac3bfad398097c2daf8a3c24752ca1d4e;
    stim[57] = 154'h2319309d755c4ef052f04174c5d311e1956ceb5;
    stim[58] = 154'h209e7b8830af2026087b04edd8b8578e68aa0f9;
    stim[59] = 154'h392185d0803e23ac69f29bb952a72db10c3d43b;
    stim[60] = 154'h221feef7ef7cc8ccecc1c1407b0d6cc57253c2b;
    stim[61] = 154'h328fe5dbf439f80e7e0a7ab6ab3ab064e91455a;
    stim[62] = 154'h2d3a3372b4654c96cf8823090e65b81afada2ef;
    stim[63] = 154'h22a9de199d917fc9789a58da67704789104b47c;
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
      expv[3] = 111'h4xxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 111'h2xxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 111'h1xxxxxxxxxxc69f38fc53046cf1d;
      expv[6] = 111'h1xxxxxxxxxxc69f38fc53046cf1d;
      expv[7] = 111'h0xxxxxxxxxxc69f38fc53046cf1d;
      expv[8] = 111'h4xxxxxxxxxxc69f38fc53046cf1d;
      expv[9] = 111'h0xxxxxxxxxxc69f38fc53046cf1d;
      expv[10] = 111'h0xxxxxxxxxxc69f38fc53046cf1d;
      expv[11] = 111'h0xxxxxxxxxxc69f38fc53046cf1d;
      expv[12] = 111'h0xxxxxxxxxxc69f38fc53046cf1d;
      expv[13] = 111'h0xxxxxxxxxxc69f38fc53046cf1d;
      expv[14] = 111'h2xxxxxxxxxxc69f38fc53046cf1d;
      expv[15] = 111'h0xxxxxxxxxxf178692fecfdcd2ad;
      expv[16] = 111'h0xxxxxxxxxxf178692fecfdcd2ad;
      expv[17] = 111'h0xxxxxxxxxxf178692fecfdcd2ad;
      expv[18] = 111'h4xxxxxxxxxxf178692fecfdcd2ad;
      expv[19] = 111'h2xxxxxxxxxxf178692fecfdcd2ad;
      expv[20] = 111'h1xxxxxxxxxx53e0f4d6b9aedfa87;
      expv[21] = 111'h0xxxxxxxxxx53e0f4d6b9aedfa87;
      expv[22] = 111'h4xxxxxxxxxx53e0f4d6b9aedfa87;
      expv[23] = 111'h2xxxxxxxxxx53e0f4d6b9aedfa87;
      expv[24] = 111'h0xxxxxxxxxx976686f4348086d36;
      expv[25] = 111'h1xxxxxxxxxx976686f4348086d36;
      expv[26] = 111'h0xxxxxxxxxx976686f4348086d36;
      expv[27] = 111'h4xxxxxxxxxx976686f4348086d36;
      expv[28] = 111'h2xxxxxxxxxx976686f4348086d36;
      expv[29] = 111'h0xxxxxxxxxxe3b48697b586a25ce;
      expv[30] = 111'h1xxxxxxxxxxe3b48697b586a25ce;
      expv[31] = 111'h0xxxxxxxxxxe3b48697b586a25ce;
      expv[32] = 111'h0xxxxxxxxxxe3b48697b586a25ce;
      expv[33] = 111'h01b9bf37fe100125aa3b586a25ce;
      expv[34] = 111'h01b9bf37fe100125aa3b586a25ce;
      expv[35] = 111'h41b9bf37fe100125aa3b586a25ce;
      expv[36] = 111'h01b9bf37fe000125aa3b586a25ce;
      expv[37] = 111'h01b9bf37fe000125aa3b586a25ce;
      expv[38] = 111'h03b9bf37fe000125aa3b586a25ce;
      expv[39] = 111'h01b9bf37fe389fd284ab586a25ce;
      expv[40] = 111'h01c9610bee589fd284ab586a25ce;
      expv[41] = 111'h00ddaeface589fd284ab586a25ce;
      expv[42] = 111'h00ddaeface789fd284ab586a25ce;
      expv[43] = 111'h00d5b507ec589fd284ab586a25ce;
      expv[44] = 111'h00d5b507ec789fd284ab586a25ce;
      expv[45] = 111'h003199ca26189fd284ab586a25ce;
      expv[46] = 111'h023199ca26189fd284ab586a25ce;
      expv[47] = 111'h003199ca26379543a84b586a25ce;
      expv[48] = 111'h018f520d14179543a84b586a25ce;
      expv[49] = 111'h418f520d14179543a84b586a25ce;
      expv[50] = 111'h018f520d14179543a84b586a25ce;
      expv[51] = 111'h218f520d14179543a84b586a25ce;
      expv[52] = 111'h118f520d14064003db108b986af1;
      expv[53] = 111'h018f520d14064003db108b986af1;
      expv[54] = 111'h418f520d14064003db108b986af1;
      expv[55] = 111'h218f520d14064003db108b986af1;
      expv[56] = 111'h018f520d1423e155f28d620cbf42;
      expv[57] = 111'h118f520d1403e155f28d620cbf42;
      expv[58] = 111'h118f520d1423e155f28d620cbf42;
      expv[59] = 111'h118f520d1423e155f28d620cbf42;
      expv[60] = 111'h018f520d1403e155f28d620cbf42;
      expv[61] = 111'h418f520d1403e155f28d620cbf42;
      expv[62] = 111'h018f520d1403e155f28d620cbf42;
      expv[63] = 111'h018f520d1403e155f28d620cbf42;
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
