// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 112;
  localparam OW = 165;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04363 dut (
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
    .s_axi_awready(out_vec[164:164]),
    .s_axi_wready(out_vec[163:163]),
    .s_axi_bvalid(out_vec[162:162]),
    .s_axi_bresp(out_vec[161:160]),
    .s_axi_arready(out_vec[159:159]),
    .s_axi_rvalid(out_vec[158:158]),
    .s_axi_rresp(out_vec[157:156]),
    .s_axi_rdata(out_vec[155:124]),
    .irq(out_vec[123:123]),
    .m_dest_axi_awaddr(out_vec[122:94]),
    .m_dest_axi_awlen(out_vec[93:90]),
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
    stim[0] = 112'h013c2a0c950b88dd0fef6c418d03;
    stim[1] = 112'h12eda1689cd72c1d7f826d4f1a00;
    stim[2] = 112'hf8ac211a0f635cfa764197901553;
    stim[3] = 112'hae949fe7db9205ae5fa28f856bce;
    stim[4] = 112'ha43030f67cd5fe3bfea39a6961d0;
    stim[5] = 112'hdfde504bdd5987d0a4b8a063579d;
    stim[6] = 112'hecd90763ca114503fa905ea352c3;
    stim[7] = 112'h813ce37da6a314bd70c553730959;
    stim[8] = 112'h8a903bd4c678bedd2d3064046544;
    stim[9] = 112'hfcc7af2b4791507ef14431337631;
    stim[10] = 112'ha3edc364cc0c084bfc68a7f35e0c;
    stim[11] = 112'hc792089caad4a8dabb70031fd4ca;
    stim[12] = 112'hba75a8916de2cea62ccd4a8f19b6;
    stim[13] = 112'h84916fd4c7d04b85b3634157e905;
    stim[14] = 112'he24e9b471367149dbb9f5ffacf50;
    stim[15] = 112'hf711b1cfed5e97b0d394c59f1806;
    stim[16] = 112'h9539185c15acd833dbd4d7589e68;
    stim[17] = 112'h671455d6d23b6ee86d809658ef2e;
    stim[18] = 112'he721c4ab23f52feb92a268d29da2;
    stim[19] = 112'h8dbefa4aee7bc391eeee1ace7705;
    stim[20] = 112'h81567f220910d67b7078d15fc743;
    stim[21] = 112'he7c1be5a5c59ce177a91fb0d8f78;
    stim[22] = 112'hc139bb5bbf93f12a3481eafc2eee;
    stim[23] = 112'h9b763d01940f631c565a94d10697;
    stim[24] = 112'hd098d961026e2f96a4362000c619;
    stim[25] = 112'h9340687338e5461b7e4a2e3d4ded;
    stim[26] = 112'hcd5d2c554b8788d266393a26c35e;
    stim[27] = 112'hdfd5d4d38663a35f04ffd21f93cd;
    stim[28] = 112'hbd2f2b6b60532e2295e0c27f2897;
    stim[29] = 112'hf306a27f62641c7da313e023fed0;
    stim[30] = 112'hc469858b0d7b39b5f64284a15db8;
    stim[31] = 112'had1d6e1c86472e14cdc82bab885b;
    stim[32] = 112'hcf94781e3cc8c885f538d61790a1;
    stim[33] = 112'hd3e616ae52dfb2179eebf3c25d8f;
    stim[34] = 112'h8955606d09dd9cdc1d6ea6d1d2be;
    stim[35] = 112'hae63662e11afc7afc3f2326a0bcb;
    stim[36] = 112'hcca126d6f91fd9032934d5625a9f;
    stim[37] = 112'hf4b35337523cb30c2927b20f7b86;
    stim[38] = 112'h93683a4f1f81fd961eb2324e350f;
    stim[39] = 112'h9f4985033dea17a7661dde306a7e;
    stim[40] = 112'ha5d1c02b684dce3186be69dabf6a;
    stim[41] = 112'hd1b2af1d4495ff7a406667c692a5;
    stim[42] = 112'hbb85107ce72b7ddd62a84e049ac0;
    stim[43] = 112'heba8b430d6cfe40e6215b4645276;
    stim[44] = 112'he9144ec52982724f9664b7d93fba;
    stim[45] = 112'hf777ee29e61733892de1400a0260;
    stim[46] = 112'h9bc89b909554f23097480d228b74;
    stim[47] = 112'h93be7d5cc1e9b99743c2c724c49c;
    stim[48] = 112'h954cc6aca72ed6b958b1caa72154;
    stim[49] = 112'hb4f3a806df8473e8592411fa31d6;
    stim[50] = 112'h800784a4b9d5e6c6bfb11cffa208;
    stim[51] = 112'hc32630c48f7294ba93d046e9ea29;
    stim[52] = 112'hf0b6801b75967a90fb98005a6ac7;
    stim[53] = 112'hde0b91b293a242542e6a12a1ed05;
    stim[54] = 112'hf3c615a8b36048098ec84ccc563f;
    stim[55] = 112'hdd9b63fcfc1389a4854241d41d1e;
    stim[56] = 112'ha4d354cc24a29b9e24b7b07d876e;
    stim[57] = 112'habb8c3fc05cb69f2a8daff9c5f32;
    stim[58] = 112'h89a3ec1db01a1026a84c302557fa;
    stim[59] = 112'h96c825b835b4f50d68ef260deeea;
    stim[60] = 112'hf61dfbda6afb8597c04884d2aa56;
    stim[61] = 112'hbaff4a8318ffd583cf0ce789e536;
    stim[62] = 112'hb7427ec3909d20a41b9aa60915b0;
    stim[63] = 112'h809a207a25d2591823e69bec0911;
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
      expv[0] = 165'h000000000000000000000000000000000000000000;
      expv[1] = 165'h000000000000000000000000000000000000000000;
      expv[2] = 165'h000000000000000000000000000000000000000000;
      expv[3] = 165'h100423425db0000000000020000000000000000007;
      expv[4] = 165'h0803fcfbcf6000000000000000000000000000001c;
      expv[5] = 165'h00861ecfe310000000000000000000000000000004;
      expv[6] = 165'h10ca097beae0000000000020000000000000000007;
      expv[7] = 165'h1000ec799bd0000000000020000000000000000007;
      expv[8] = 165'h080c6fb4d6d000000000000000000000000000001f;
      expv[9] = 165'h00877a98e430000000000000000000000000000006;
      expv[10] = 165'h1805e5696ba000000000002000000000000000001b;
      expv[11] = 165'h0c086c99c95000000000000000000000000000001a;
      expv[12] = 165'h1001139569b8000000000020000000000000000002;
      expv[13] = 165'h0885122e313000000000000000000000000000001e;
      expv[14] = 165'h00cdfa990320000000000000000000000000000001;
      expv[15] = 165'h180368e2b17000000000002000000000000000001c;
      expv[16] = 165'h1c8639fe19f000000000002000000000000000001e;
      expv[17] = 165'h00030b82e000000000000000000000000000000000;
      expv[18] = 165'h00030b82e000000000000000000000000000000000;
      expv[19] = 165'h18889564cce000000000002000000000000000001c;
      expv[20] = 165'h0ccf495deae0000000000000000000000000000019;
      expv[21] = 165'h00cfe44124b8000000000000000000000000000007;
      expv[22] = 165'h18c7cb4bdab000000000002000000000000000001e;
      expv[23] = 165'h1c076b77f4e000000000002000000000000000001a;
      expv[24] = 165'h0087a032b8c8000000000000000000000000000001;
      expv[25] = 165'h18cb2c206ef000000000002000000000000000001d;
      expv[26] = 165'h00cd0e674320000000000000000000000000000005;
      expv[27] = 165'h10058aa98ba0000000000020000000000000000002;
      expv[28] = 165'h188a9a710c10000000000020000000000000000019;
      expv[29] = 165'h00c56d6c84b0000000000000000000000000000007;
      expv[30] = 165'h18044fecb28000000000002000000000000000001c;
      expv[31] = 165'h1c00b161b830000000000020000000000000000018;
      expv[32] = 165'h008dc3912318000000000000000000000000000007;
      expv[33] = 165'h100f03c7b830000000000020000000000000000003;
      expv[34] = 165'h1082d5ca83b0000000000020000000000000000001;
      expv[35] = 165'h000c0da14e50000000000000000000000000000004;
      expv[36] = 165'h008cc5c292b0000000000000000000000000000005;
      expv[37] = 165'h1004dadf3d30000000000020000000000000000003;
      expv[38] = 165'h108a66eab0f0000000000020000000000000000000;
      expv[39] = 165'h000749e41700000000000000000000000000000005;
      expv[40] = 165'h0880a067fbd000000000000000000000000000001e;
      expv[41] = 165'h0cc8056d555000000000000000000000000000001c;
      expv[42] = 165'h1cc5e3a8b61800000000002000000000000000001d;
      expv[43] = 165'h00020f9d5c68000000000000000000000000000006;
      expv[44] = 165'h1806861b314000000000002000000000000000001e;
      expv[45] = 165'h1089d8a58260000000000020000000000000000002;
      expv[46] = 165'h18cdc53d31c000000000002000000000000000001a;
      expv[47] = 165'h0cc37212e22000000000000000000000000000001a;
      expv[48] = 165'h000fab9864a8000000000000000000000000000000;
      expv[49] = 165'h0888d595106000000000000000000000000000001e;
      expv[50] = 165'h0cc500dc5a6000000000000000000000000000001a;
      expv[51] = 165'h0cc094973ab800000000000000000000000000001e;
      expv[52] = 165'h10061891f498000000000020000000000000000007;
      expv[53] = 165'h1880036f142000000000002000000000000000001b;
      expv[54] = 165'h1cc23652b050000000000020000000000000000019;
      expv[55] = 165'h1002b516d388000000000020000000000000000003;
      expv[56] = 165'h100c7f9fbda0000000000020000000000000000000;
      expv[57] = 165'h008a9984ddf0000000000000000000000000000000;
      expv[58] = 165'h08087f8110d0000000000000000000000000000018;
      expv[59] = 165'h0c0d83b6168000000000000000000000000000001a;
      expv[60] = 165'h0004b706e428000000000000000000000000000004;
      expv[61] = 165'h180f7b4dcba000000000002000000000000000001e;
      expv[62] = 165'h0009506395e0000000000000000000000000000006;
      expv[63] = 165'h000fd8728220000000000000000000000000000000;
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
