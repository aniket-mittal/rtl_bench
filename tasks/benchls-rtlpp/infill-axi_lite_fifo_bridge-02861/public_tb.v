// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 112;
  localparam OW = 172;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02861 dut (
    .s_axi_aclk(clk),
    .s_axi_aresetn(in_vec[111:111]),
    .s_axi_awvalid(in_vec[110:110]),
    .s_axi_awaddr(in_vec[109:99]),
    .s_axi_awprot(in_vec[98:96]),
    .s_axi_wvalid(in_vec[95:95]),
    .s_axi_wdata(in_vec[94:63]),
    .s_axi_wstrb(in_vec[62:59]),
    .s_axi_bready(in_vec[58:58]),
    .s_axi_arvalid(in_vec[57:57]),
    .s_axi_araddr(in_vec[56:46]),
    .s_axi_arprot(in_vec[45:43]),
    .s_axi_rready(in_vec[42:42]),
    .m_dest_axi_aclk(in_vec[41:41]),
    .m_dest_axi_aresetn(in_vec[40:40]),
    .m_dest_axi_awready(in_vec[39:39]),
    .m_dest_axi_wready(in_vec[38:38]),
    .m_dest_axi_bvalid(in_vec[37:37]),
    .m_dest_axi_bresp(in_vec[36:35]),
    .fifo_wr_clk(in_vec[34:34]),
    .fifo_wr_en(in_vec[33:33]),
    .fifo_wr_din(in_vec[32:1]),
    .fifo_wr_sync(in_vec[0:0]),
    .s_axi_awready(out_vec[171:171]),
    .s_axi_wready(out_vec[170:170]),
    .s_axi_bvalid(out_vec[169:169]),
    .s_axi_bresp(out_vec[168:167]),
    .s_axi_arready(out_vec[166:166]),
    .s_axi_rvalid(out_vec[165:165]),
    .s_axi_rresp(out_vec[164:163]),
    .s_axi_rdata(out_vec[162:131]),
    .irq(out_vec[130:130]),
    .m_dest_axi_awaddr(out_vec[129:98]),
    .m_dest_axi_awlen(out_vec[97:90]),
    .m_dest_axi_awsize(out_vec[89:87]),
    .m_dest_axi_awburst(out_vec[86:85]),
    .m_dest_axi_awprot(out_vec[84:82]),
    .m_dest_axi_awcache(out_vec[81:78]),
    .m_dest_axi_awvalid(out_vec[77:77]),
    .m_dest_axi_wdata(out_vec[76:13]),
    .m_dest_axi_wstrb(out_vec[12:5]),
    .m_dest_axi_wvalid(out_vec[4:4]),
    .m_dest_axi_wlast(out_vec[3:3]),
    .m_dest_axi_bready(out_vec[2:2]),
    .fifo_wr_overflow(out_vec[1:1]),
    .fifo_wr_xfer_req(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 112'h495fd16aaa1143fc0c649ece220a;
    stim[1] = 112'h3ecc07493bef90a2c07b994e50d6;
    stim[2] = 112'hb3dd27b2f169cb73972c31d0c26a;
    stim[3] = 112'h8adb37bf9319411f710e62022124;
    stim[4] = 112'hbbaeef8eb22ff36f3d8592d30410;
    stim[5] = 112'hadcaff371abbd08a966436bb0bc9;
    stim[6] = 112'h9f19f6ad011d3cf962cce178f65e;
    stim[7] = 112'he1e30a1e6ede1969a57833ffac7a;
    stim[8] = 112'hbe8e1b542ab5f034a3135c061c75;
    stim[9] = 112'h8a61dcf87530d49f3551ef57d42b;
    stim[10] = 112'h8271ffca78b9ea37991f5cc537de;
    stim[11] = 112'he84c68269aa5e871635b0265ff34;
    stim[12] = 112'hcde9487855d91da7cff6f94eb8da;
    stim[13] = 112'hc3aa4eb3f5c88ea7f54efa41f60a;
    stim[14] = 112'hcdde384bea629dc06d9717f5c7b2;
    stim[15] = 112'h9c5f80b12cf621a0d039a5cc969c;
    stim[16] = 112'hc489147bc5882a6b4d948d178afa;
    stim[17] = 112'he13c23806b644a07bd23666cbda2;
    stim[18] = 112'hacd532878989109edb899c68b032;
    stim[19] = 112'hfc4312961bfa197e565c5823aa11;
    stim[20] = 112'h91127cf70173160052a3814e9505;
    stim[21] = 112'h90cc78f387ce4eebb69dada10a5c;
    stim[22] = 112'hbd1f7c0b8504bd4267b569cd2848;
    stim[23] = 112'hfd20f9e41a87aa674a05d01aa110;
    stim[24] = 112'h869dbc819f4c4b690260bc78282b;
    stim[25] = 112'hb14ee79631f8ad909d6963e6916c;
    stim[26] = 112'hc60388f02ee704aad9e924a3de94;
    stim[27] = 112'hf6ef262eed1d35a418b325371f2d;
    stim[28] = 112'hddde1a569f27b2840ac05c5d0bea;
    stim[29] = 112'hc9801fa5657b925287204f298618;
    stim[30] = 112'hc890334eb025ba1326053afdea9c;
    stim[31] = 112'h968ee67b954c86fb2e3ae6e81826;
    stim[32] = 112'hb864ad84e4260fae6addeab49799;
    stim[33] = 112'h8b214c9c53a87040b02c80a7bc89;
    stim[34] = 112'hc2ae4f834b961eb7df09ee67b1de;
    stim[35] = 112'hf051dea36d4afa5b5ca7d7f898bf;
    stim[36] = 112'hde1ff96978a570ae4866a09fb6e2;
    stim[37] = 112'hcc99b8d939402708a498abf7dc41;
    stim[38] = 112'hc2e5cdcadeb08c8e274f357aaa67;
    stim[39] = 112'h8ac6eb1ffc6a5f221ac34ac71a6f;
    stim[40] = 112'h805f790c5cdf42492b88b3278830;
    stim[41] = 112'ha2a91e0f7ce60a9a952268703cbf;
    stim[42] = 112'h4ebfa064f4a0b25c9385ffefd101;
    stim[43] = 112'h921640a05233f4967c040a089053;
    stim[44] = 112'h9d2aa452474d181c88eaec313746;
    stim[45] = 112'ha9ef315c37e45e37f2486cdf1718;
    stim[46] = 112'hac0ded812c9dbdaa0fac41fb4239;
    stim[47] = 112'h9e3844e8a0462831c3cc7f4500b1;
    stim[48] = 112'hbd23c405faab086422a7e342318b;
    stim[49] = 112'hd8f270b4cbe6af275ab3a65db966;
    stim[50] = 112'heb0f31bc9bb474689c931add1cb2;
    stim[51] = 112'ha1de559f76e1436f8b91a6c90a31;
    stim[52] = 112'hd6edbf79a345b4a176fb0b4ba2c3;
    stim[53] = 112'hf999f5f0d18f5490e04b05325a3c;
    stim[54] = 112'hbec1e009013cd0e22f8d6e435fe2;
    stim[55] = 112'heb2d9f84a19e9a43cf53750a2f2e;
    stim[56] = 112'hd52d663a0b4c22b908d35ea9e826;
    stim[57] = 112'h9b77006ea33a3960fc82f9c2e794;
    stim[58] = 112'h86007a66fab5fa43677b6b7a89b9;
    stim[59] = 112'hf5b0b69a17e4e7e093669c975dfa;
    stim[60] = 112'h9cf8d94253862459cabf6d924baa;
    stim[61] = 112'ha967e3209c5d46475da4929c2dcd;
    stim[62] = 112'h8442341df59993de90280cfdba23;
    stim[63] = 112'hefdd59c571027077b7011559d08d;
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
      expv[0] = 172'he600000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 172'he600000000000000000000000000000000000000000;
      expv[2] = 172'he600000000000000000000000000000000000000000;
      expv[3] = 172'he600000000000000000000000000000000000000000;
      expv[4] = 172'he600000000000000000000000000000000000000000;
      expv[5] = 172'he600000000000000000000000000000000000000000;
      expv[6] = 172'he600000000000000000000000000000000000000000;
      expv[7] = 172'he600000000000000000000000000000000000000000;
      expv[8] = 172'he600000000000000000000000000000000000000000;
      expv[9] = 172'he600000000000000000000000000000000000000000;
      expv[10] = 172'he600000000000000000000000000000000000000000;
      expv[11] = 172'he600000000000000000000000000000000000000000;
      expv[12] = 172'he600000000000000000000000000000000000000000;
      expv[13] = 172'he600000000000000000000000000000000000000000;
      expv[14] = 172'he600000000000000000000000000000000000000000;
      expv[15] = 172'he600000000000000000000000000000000000000000;
      expv[16] = 172'he600000000000000000000000000000000000000000;
      expv[17] = 172'he600000000000000000000000000000000000000000;
      expv[18] = 172'he600000000000000000000000000000000000000000;
      expv[19] = 172'he600000000000000000000000000000000000000000;
      expv[20] = 172'he600000000000000000000000000000000000000000;
      expv[21] = 172'he600000000000000000000000000000000000000000;
      expv[22] = 172'he600000000000000000000000000000000000000000;
      expv[23] = 172'he600000000000000000000000000000000000000000;
      expv[24] = 172'he600000000000001e9001203e7906a1fe7906a1eabc;
      expv[25] = 172'he600000000000001e9001203e7906a1fe7906a1eabc;
      expv[26] = 172'he600000000000001e9001203e7906a1fe7906a1eabc;
      expv[27] = 172'he600000000000000300012c223c0bb9c23c0bb9c01c;
      expv[28] = 172'he600000000000000300012c223c0bb9c23c0bb9c01c;
      expv[29] = 172'he600000000000000300012c223c0bb9c23c0bb9c01c;
      expv[30] = 172'he600000000000000300012c223c0bb9c23c0bb9c01c;
      expv[31] = 172'he600000000000000300012c223c0bb9c23c0bb9c01c;
      expv[32] = 172'he600000000000000300012c223c0bb9c23c0bb9c01c;
      expv[33] = 172'he600000000000000300012c223c0bb9c23c0bb9c01c;
      expv[34] = 172'he600000000000000300012c223c0bb9c23c0bb9c01c;
      expv[35] = 172'he600000000000000300012c223c0bb9c23c0bb9c01c;
      expv[36] = 172'he600000000000001828012437a8db52b7a8db52bffc;
      expv[37] = 172'he600000000000000f0c013c3e5a5e295e5a5e295ddc;
      expv[38] = 172'he60000000000000064c01242e364e500e364e50089c;
      expv[39] = 172'he60000000000000017001343372b7ac3372b7ac223c;
      expv[40] = 172'he60000000000000017001343372b7ac3372b7ac223c;
      expv[41] = 172'he60000000000000017001343372b7ac3372b7ac223c;
      expv[42] = 172'he60000000000000017001343372b7ac3372b7ac223c;
      expv[43] = 172'he600000000000000000000000000000000000000000;
      expv[44] = 172'he600000000000000000000000000000000000000000;
      expv[45] = 172'he600000000000000000000000000000000000000000;
      expv[46] = 172'he600000000000000000000000000000000000000000;
      expv[47] = 172'he600000000000000000000000000000000000000000;
      expv[48] = 172'he600000000000000000000000000000000000000000;
      expv[49] = 172'he600000000000000000000000000000000000000000;
      expv[50] = 172'he600000000000000000000000000000000000000000;
      expv[51] = 172'he600000000000000000000000000000000000000000;
      expv[52] = 172'he600000000000000000000000000000000000000000;
      expv[53] = 172'he600000000000000b7401342fde68d16fde68d16cdc;
      expv[54] = 172'he600000000000001ccc01243d7c3463dd7c3463d55c;
      expv[55] = 172'he600000000000001ccc01243d7c3463dd7c3463d55c;
      expv[56] = 172'he600000000000001594013427e12867a7e12867a67c;
      expv[57] = 172'he600000000000001594013427e12867a7e12867a67c;
      expv[58] = 172'he600000000000001594013427e12867a7e12867a67c;
      expv[59] = 172'he600000000000001594013427e12867a7e12867a67c;
      expv[60] = 172'he600000000000001ad801202da685f92da685f9399c;
      expv[61] = 172'he600000000000001ad801202da685f92da685f9399c;
      expv[62] = 172'he600000000000001ad801202da685f92da685f9399c;
      expv[63] = 172'he600000000000001ad801202da685f92da685f9399c;
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
