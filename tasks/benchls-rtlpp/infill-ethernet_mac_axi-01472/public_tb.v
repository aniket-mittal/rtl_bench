// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 171;
  localparam OW = 133;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01472 dut (
    .s_axi_lite_resetn(in_vec[170:170]),
    .s_axi_lite_clk(in_vec[169:169]),
    .axis_clk(in_vec[168:168]),
    .axi_txd_arstn(in_vec[167:167]),
    .axi_txc_arstn(in_vec[166:166]),
    .axi_rxd_arstn(in_vec[165:165]),
    .axi_rxs_arstn(in_vec[164:164]),
    .gtx_clk(in_vec[163:163]),
    .ref_clk(in_vec[162:162]),
    .s_axi_araddr(in_vec[161:144]),
    .s_axi_arvalid(in_vec[143:143]),
    .s_axi_awaddr(in_vec[142:125]),
    .s_axi_awvalid(in_vec[124:124]),
    .s_axi_bready(in_vec[123:123]),
    .s_axi_rready(in_vec[122:122]),
    .s_axi_wdata(in_vec[121:90]),
    .s_axi_wstrb(in_vec[89:86]),
    .s_axi_wvalid(in_vec[85:85]),
    .s_axis_txc_tdata(in_vec[84:53]),
    .s_axis_txc_tkeep(in_vec[52:49]),
    .s_axis_txc_tlast(in_vec[48:48]),
    .s_axis_txc_tvalid(in_vec[47:47]),
    .s_axis_txd_tdata(in_vec[46:15]),
    .s_axis_txd_tkeep(in_vec[14:11]),
    .s_axis_txd_tlast(in_vec[10:10]),
    .s_axis_txd_tvalid(in_vec[9:9]),
    .m_axis_rxd_tready(in_vec[8:8]),
    .m_axis_rxs_tready(in_vec[7:7]),
    .rgmii_rd(in_vec[6:3]),
    .rgmii_rx_ctl(in_vec[2:2]),
    .rgmii_rxc(in_vec[1:1]),
    .mdio_mdio_i(in_vec[0:0]),
    .mac_irq(out_vec[132:132]),
    .interrupt(out_vec[131:131]),
    .phy_rst_n(out_vec[130:130]),
    .gtx_clk90_out(out_vec[129:129]),
    .gtx_clk_out(out_vec[128:128]),
    .s_axi_arready(out_vec[127:127]),
    .s_axi_awready(out_vec[126:126]),
    .s_axi_bresp(out_vec[125:124]),
    .s_axi_bvalid(out_vec[123:123]),
    .s_axi_rdata(out_vec[122:91]),
    .s_axi_rresp(out_vec[90:89]),
    .s_axi_rvalid(out_vec[88:88]),
    .s_axi_wready(out_vec[87:87]),
    .s_axis_txc_tready(out_vec[86:86]),
    .s_axis_txd_tready(out_vec[85:85]),
    .m_axis_rxd_tdata(out_vec[84:53]),
    .m_axis_rxd_tkeep(out_vec[52:49]),
    .m_axis_rxd_tlast(out_vec[48:48]),
    .m_axis_rxd_tvalid(out_vec[47:47]),
    .m_axis_rxs_tdata(out_vec[46:15]),
    .m_axis_rxs_tkeep(out_vec[14:11]),
    .m_axis_rxs_tlast(out_vec[10:10]),
    .m_axis_rxs_tvalid(out_vec[9:9]),
    .rgmii_td(out_vec[8:5]),
    .rgmii_tx_ctl(out_vec[4:4]),
    .rgmii_txc(out_vec[3:3]),
    .mdio_mdc(out_vec[2:2]),
    .mdio_mdio_o(out_vec[1:1]),
    .mdio_mdio_t(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 171'h51ffd85947e751c968b5a8812eb6adb611d1f79eae6;
    stim[1] = 171'h071c3bdde72ee95416f96683ac77c8fceff58833234;
    stim[2] = 171'h6c70008d13f50eacc0fb8b9dcc7d8b0c524bba5ea2e;
    stim[3] = 171'h4bd4e9cb7d4df72458071ebe61b8235823c21c8a8d5;
    stim[4] = 171'h4899bb32d94cf0e255af26ceb52e727d1c58c013566;
    stim[5] = 171'h4fc5bbb405c428af17c36871656b6f2a29c9685dcd7;
    stim[6] = 171'h1e83c63a771d5a5347688ea8ee29a8f7c6353b7020c;
    stim[7] = 171'h1afd93cd23933eb35d7eb5bd810e5788264b983338b;
    stim[8] = 171'h4fe477661969d5180352fe10b3d9a92d353fe12ad39;
    stim[9] = 171'h2c850402d0bf128d0d336a5a0c990c74d00dd773319;
    stim[10] = 171'h1a3cc845fb9d225d19327c86cef437aa692e374e83c;
    stim[11] = 171'h1834b18fad7654da844f78fcde0a4201a0cbfe28435;
    stim[12] = 171'h1c485c6caababc839c65a15650859354887871a93d5;
    stim[13] = 171'h198f63788e5f184c71edb15d67dd1bbe10ae7390432;
    stim[14] = 171'h2a7911e0768ac34f383cdcae393652ea36d3d9316d4;
    stim[15] = 171'h2e4d8175bc96cbb00c528e418753222fd68af09e993;
    stim[16] = 171'h6a3a62961cf804c8818de83a7a9ddc11efedd4fa7d8;
    stim[17] = 171'h1a7f0fbae7bef856240cbe8eaba6f9284494c774e7e;
    stim[18] = 171'h7a0509917f165a6b468ec4fbb9d12066aec095bf36a;
    stim[19] = 171'h5fe2fb82871c9996d8de99c7e27ab68fd14e8175c1d;
    stim[20] = 171'h1bddaa3e999010e3e1081fa0bd7b399ce9a18e04a5d;
    stim[21] = 171'h6f058f3a19c71bd99a55af04aac3c16a73e338e0a84;
    stim[22] = 171'h69e8ff65bce64dde90f15d2a176056c4df640662987;
    stim[23] = 171'h2b4e159f3d9c0b788d32f3082fc3b9ed0cdeecf61af;
    stim[24] = 171'h396588232f899e5bb8586cde3a5cde538070695fb95;
    stim[25] = 171'h3a8de8aa45819fa0d936e2ddb7a0a2a1f4176c665e7;
    stim[26] = 171'h7afee9fa550271164ab547158f5a8d0edda6b61cd57;
    stim[27] = 171'h3eed533e53b3ee359c42d4acf2bb38047e9ec0ed7bd;
    stim[28] = 171'h6a9481c85ba230b222e188eb00d63bd587b012a8585;
    stim[29] = 171'h6bebd10b276a0ff75723eb4dd3b029fc0edf7e927fc;
    stim[30] = 171'h78d62e86914da8b80f8b97f7dec54495971edc785ec;
    stim[31] = 171'h3c2b46818775f433b3f1ab81a2f9dd632cf58cce9f4;
    stim[32] = 171'h0cfe695f02efaa7afd7dd24e81b81c53758e97e5518;
    stim[33] = 171'h5e9111c692ee82f5a4d4bab7d065abf8cc2e1a66ef8;
    stim[34] = 171'h58c63dacbafc09c7a4eb80a4ab074db33b2b016dc41;
    stim[35] = 171'h1d1f4342b5e45df504412492213db9373da4236e99c;
    stim[36] = 171'h6b9d30fcf29162c41be1b6b691492675a40224f83e3;
    stim[37] = 171'h0aaabb3ef99528392c1b8d8170a3e1d12e5005a669b;
    stim[38] = 171'h4ce95dee5efdc64f91fe59a312859c815027cb248b9;
    stim[39] = 171'h78b793f88f60ebbcc4416ce415bfa94f04c5205bfc9;
    stim[40] = 171'h6e4a5190e01a1d38286fab3ab81b643a6b8d5c060fa;
    stim[41] = 171'h389e35d81793fd8ff6ec6163cc56adca79110625159;
    stim[42] = 171'h3c8d3e12561bd49adb69fcd8c5ea5b4b77fb13aa966;
    stim[43] = 171'h6ffcc5ecf28a7d135ab13c5c1e4550b9116fd66473d;
    stim[44] = 171'h3c4ca51f6b1aabf91161574274b33cc7e74e8fe07ef;
    stim[45] = 171'h7970d758938452e547158eb34f383769f1a32b40c26;
    stim[46] = 171'h5f81f8d28a3bd93ee181792fc638c231eea4f0745ee;
    stim[47] = 171'h1acdc2c1455da948dda3388d114c952f72a7b1884e1;
    stim[48] = 171'h08b32d35da96dc6c827cf889b6f34208798c3e6f474;
    stim[49] = 171'h1eb69f1e3b330fd7ea1a4ab2c7f3932a34b75f43e26;
    stim[50] = 171'h4a7069c745abae907fb39e8e7b14ee80746be444070;
    stim[51] = 171'h0f1183c07c568a3f7eacdf943173435688f899a99b2;
    stim[52] = 171'h2eea3c32a9464a1be762777c9037d172e26a008c4ec;
    stim[53] = 171'h2c819a73e676eaa810892105ad4afb3b6590a74903d;
    stim[54] = 171'h0f65381cb73b6d709192d1cf2995021418a13af93eb;
    stim[55] = 171'h3b55bdc59ffdf6b5c829a407225167449142717853b;
    stim[56] = 171'h798254406e29b7bcb23ea30a3ef6406d1b92eeb8cc3;
    stim[57] = 171'h684d4ec97d62ef2445b1f27d2ca0783b69c0ff133e6;
    stim[58] = 171'h2a866d8389531370197707cec0f3f973332e3a9ccfb;
    stim[59] = 171'h3f71ab371ed98a103f2e1e80eaf6701c3810909cabf;
    stim[60] = 171'h6e36341c7a148adb7aca0f4944fcd73f4fc61120658;
    stim[61] = 171'h2e9507fe777a5276de92a6762c20e7102d3ad842007;
    stim[62] = 171'h6cccd45908d8286018ff7cd980d87ec4de2bde900dc;
    stim[63] = 171'h69f1fb4a60ff6ea1ba76eee9a4f72bb1111d0732288;
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
      expv[0] = 133'h0000000000000000000000000000000000;
      expv[1] = 133'h0000000000000000000000000000000000;
      expv[2] = 133'h0000000000000000000000000000000000;
      expv[3] = 133'h0000000000000000000000000000000000;
      expv[4] = 133'h0000000000000000000000000000000000;
      expv[5] = 133'h0000000000000000000000000000000000;
      expv[6] = 133'h0000000000000000000000000000000000;
      expv[7] = 133'h0000000000000000000000000000000000;
      expv[8] = 133'h0000000000000000000000000000000000;
      expv[9] = 133'h0000000000000000000000000000000000;
      expv[10] = 133'h0000000000000000000000000000000000;
      expv[11] = 133'h0000000000000000000000000000000000;
      expv[12] = 133'h0000000000000000000000000000000000;
      expv[13] = 133'h0000000000000000000000000000000000;
      expv[14] = 133'h0000000000000000000000000000000000;
      expv[15] = 133'h0000000000000000000000000000000000;
      expv[16] = 133'h0000000000000000000000000000000000;
      expv[17] = 133'h0000000000000000000000000000000000;
      expv[18] = 133'h0000000000000000000000000000000000;
      expv[19] = 133'h0000000000000000000000000000000000;
      expv[20] = 133'h0000000000000000000000000000000000;
      expv[21] = 133'h0000000000000000000000000000000000;
      expv[22] = 133'h0000000000000000000000000000000000;
      expv[23] = 133'h0000000000000000000000000000000000;
      expv[24] = 133'h0000000000000000000000000000000000;
      expv[25] = 133'h0000000000000000000000000000000000;
      expv[26] = 133'h0000000000000000000000000000000000;
      expv[27] = 133'h0000000000000000000000000000000000;
      expv[28] = 133'h0000000000000000000000000000000000;
      expv[29] = 133'h0000000000000000000000000000000000;
      expv[30] = 133'h0000000000000000000000000000000000;
      expv[31] = 133'h0000000000000000000000000000000000;
      expv[32] = 133'h0000000000000000000000000000000000;
      expv[33] = 133'h0000000000000000000000000000000000;
      expv[34] = 133'h0000000000000000000000000000000000;
      expv[35] = 133'h0000000000000000000000000000000000;
      expv[36] = 133'h0000000000000000000000000000000000;
      expv[37] = 133'h0000000000000000000000000000000000;
      expv[38] = 133'h0000000000000000000000000000000000;
      expv[39] = 133'h0000000000000000000000000000000000;
      expv[40] = 133'h0000000000000000000000000000000000;
      expv[41] = 133'h0000000000000000000000000000000000;
      expv[42] = 133'h0000000000000000000000000000000000;
      expv[43] = 133'h0000000000000000000000000000000000;
      expv[44] = 133'h0000000000000000000000000000000000;
      expv[45] = 133'h0000000000000000000000000000000000;
      expv[46] = 133'h0000000000000000000000000000000000;
      expv[47] = 133'h0000000000000000000000000000000000;
      expv[48] = 133'h0000000000000000000000000000000000;
      expv[49] = 133'h0000000000000000000000000000000000;
      expv[50] = 133'h0000000000000000000000000000000000;
      expv[51] = 133'h0000000000000000000000000000000000;
      expv[52] = 133'h0000000000000000000000000000000000;
      expv[53] = 133'h0000000000000000000000000000000000;
      expv[54] = 133'h0000000000000000000000000000000000;
      expv[55] = 133'h0000000000000000000000000000000000;
      expv[56] = 133'h0000000000000000000000000000000000;
      expv[57] = 133'h0000000000000000000000000000000000;
      expv[58] = 133'h0000000000000000000000000000000000;
      expv[59] = 133'h0000000000000000000000000000000000;
      expv[60] = 133'h0000000000000000000000000000000000;
      expv[61] = 133'h0000000000000000000000000000000000;
      expv[62] = 133'h0000000000000000000000000000000000;
      expv[63] = 133'h0000000000000000000000000000000000;
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
