// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 376;
  localparam OW = 454;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01071 dut (
    .clk(clk),
    .rst(in_vec[375:375]),
    .s_eth_hdr_valid(in_vec[374:374]),
    .s_eth_dest_mac(in_vec[373:326]),
    .s_eth_src_mac(in_vec[325:278]),
    .s_eth_type(in_vec[277:262]),
    .s_eth_payload_axis_tdata(in_vec[261:254]),
    .s_eth_payload_axis_tvalid(in_vec[253:253]),
    .s_eth_payload_axis_tlast(in_vec[252:252]),
    .s_eth_payload_axis_tuser(in_vec[251:251]),
    .m_eth_hdr_ready(in_vec[250:250]),
    .m_eth_payload_axis_tready(in_vec[249:249]),
    .arp_request_ready(in_vec[248:248]),
    .arp_response_valid(in_vec[247:247]),
    .arp_response_error(in_vec[246:246]),
    .arp_response_mac(in_vec[245:198]),
    .s_ip_hdr_valid(in_vec[197:197]),
    .s_ip_dscp(in_vec[196:191]),
    .s_ip_ecn(in_vec[190:189]),
    .s_ip_length(in_vec[188:173]),
    .s_ip_ttl(in_vec[172:165]),
    .s_ip_protocol(in_vec[164:157]),
    .s_ip_source_ip(in_vec[156:125]),
    .s_ip_dest_ip(in_vec[124:93]),
    .s_ip_payload_axis_tdata(in_vec[92:85]),
    .s_ip_payload_axis_tvalid(in_vec[84:84]),
    .s_ip_payload_axis_tlast(in_vec[83:83]),
    .s_ip_payload_axis_tuser(in_vec[82:82]),
    .m_ip_hdr_ready(in_vec[81:81]),
    .m_ip_payload_axis_tready(in_vec[80:80]),
    .local_mac(in_vec[79:32]),
    .local_ip(in_vec[31:0]),
    .s_eth_hdr_ready(out_vec[453:453]),
    .s_eth_payload_axis_tready(out_vec[452:452]),
    .m_eth_hdr_valid(out_vec[451:451]),
    .m_eth_dest_mac(out_vec[450:403]),
    .m_eth_src_mac(out_vec[402:355]),
    .m_eth_type(out_vec[354:339]),
    .m_eth_payload_axis_tdata(out_vec[338:331]),
    .m_eth_payload_axis_tvalid(out_vec[330:330]),
    .m_eth_payload_axis_tlast(out_vec[329:329]),
    .m_eth_payload_axis_tuser(out_vec[328:328]),
    .arp_request_valid(out_vec[327:327]),
    .arp_request_ip(out_vec[326:295]),
    .arp_response_ready(out_vec[294:294]),
    .s_ip_hdr_ready(out_vec[293:293]),
    .s_ip_payload_axis_tready(out_vec[292:292]),
    .m_ip_hdr_valid(out_vec[291:291]),
    .m_ip_eth_dest_mac(out_vec[290:243]),
    .m_ip_eth_src_mac(out_vec[242:195]),
    .m_ip_eth_type(out_vec[194:179]),
    .m_ip_version(out_vec[178:175]),
    .m_ip_ihl(out_vec[174:171]),
    .m_ip_dscp(out_vec[170:165]),
    .m_ip_ecn(out_vec[164:163]),
    .m_ip_length(out_vec[162:147]),
    .m_ip_identification(out_vec[146:131]),
    .m_ip_flags(out_vec[130:128]),
    .m_ip_fragment_offset(out_vec[127:115]),
    .m_ip_ttl(out_vec[114:107]),
    .m_ip_protocol(out_vec[106:99]),
    .m_ip_header_checksum(out_vec[98:83]),
    .m_ip_source_ip(out_vec[82:51]),
    .m_ip_dest_ip(out_vec[50:19]),
    .m_ip_payload_axis_tdata(out_vec[18:11]),
    .m_ip_payload_axis_tvalid(out_vec[10:10]),
    .m_ip_payload_axis_tlast(out_vec[9:9]),
    .m_ip_payload_axis_tuser(out_vec[8:8]),
    .rx_busy(out_vec[7:7]),
    .tx_busy(out_vec[6:6]),
    .rx_error_header_early_termination(out_vec[5:5]),
    .rx_error_payload_early_termination(out_vec[4:4]),
    .rx_error_invalid_header(out_vec[3:3]),
    .rx_error_invalid_checksum(out_vec[2:2]),
    .tx_error_payload_early_termination(out_vec[1:1]),
    .tx_error_arp_failed(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 376'ha0bb63a45bcd6d325f0081d91625a620131700b80c20733aa240ee367867d5de6fa6f3e14fc5e6a36357c1e7cd8f17;
    stim[1] = 376'hf228bc401e840b31db2a09d38d39dd178614d88ce0c6cb8596fe976e4a0cd8f2c33a4ecc6d4a56c86ebc6b4c77751d;
    stim[2] = 376'h175e1d3528b328b278ee290ad5bf0056b6dafccb6dcc255b7aa628a1ca79ccac305da2712a10eccf6b68ca0eea9ce5;
    stim[3] = 376'h5e23b105891267a33a0e0352775e460cf9fb225b5aae661e0c851d70d605335264f45109b8e6c8e50b9575acedb9d0;
    stim[4] = 376'h754f709823fb1ee6fbd7b7fcf995a820aa1d8feab455eaea544c5130edf4d9b96789f48862e6e7982556f7f59cad2c;
    stim[5] = 376'h31f19437e401f66609fa30fa844d8bd505c9cd85e50c782924d8b43ebae00ef81e1b67a98eeeedc1e78a3f73af3cdf;
    stim[6] = 376'h63599c1867fcc34810c4d9b56870acdea4e550582bcc34f76975f54612a22b4770038d4cd40bafff9128c96348778f;
    stim[7] = 376'h7d08b5f328cd49748d597097f28b2d3167b62c601c1cec57a84f6766002439fe24213ab99648332e7905223907b9c1;
    stim[8] = 376'h391e9562c6827112070f408b646feb6961b5ac4eaa4eb24017f85e200a1a85db3f14838aaa180261772a1dd28c3595;
    stim[9] = 376'h1f3f59aa18cb2269640c99d5dc2cf3eda93388877095a3a5a05bbca74ee6e959d5486f36a37b0176b419777e86f2ff;
    stim[10] = 376'h1184e894666c7a47b3d7c8790cde07876139852a6cc3e885e16d69eec9723e58a513124356263a836d5b94fc1d872e;
    stim[11] = 376'h665a04677c424e8e4047523e85e19c2d4d116ecc8c87b54e50f180008f9e9b41892cc7f3ebbce2b573a50c8ef8337d;
    stim[12] = 376'h2c68ede6b76027aa4af35a9eb5278a5f6c82b04e13f58e38e38f6f79a882b31d0e0e50c7a57eea662dc6029d145bdd;
    stim[13] = 376'h1d1547c00186dd9fb35446febd8b2dad7ba645a66f1018cab0978cd98e8fa536dc521b01590d62e0b7ab28034c7f5c;
    stim[14] = 376'h2d9e00e97bbf65cf5449a42b896162dcb7501f99969001671e246a38d2f2fc5e521ac09689c876d95f488475c7c2f8;
    stim[15] = 376'h4789ee15fe250bad9b68c9f48f323f74d3ebe8f2d136d0fd211acd63331e63b025d029991969c4c6d5eef349bf1aaf;
    stim[16] = 376'h427c1c486b226390f6f380648462d8e876fea61c31e0bd52b1175a25b58c059f2425e12e606a4aea20dcfd77da96b5;
    stim[17] = 376'h756cdea307ac3e0a8c5f639a192af8ccf6a4f50e2720b7ba4156f9d3172c02fe6a70bedde9fac2708f937b06e17684;
    stim[18] = 376'h758c7690998f3d0e1e8aa7144c9b1c32c5bd347a87f5eefa84e4ae18463ee99c14218872b4c65effc58ee3e7ee08f3;
    stim[19] = 376'h3a9760e78e1200a0641d673234acd6054701dd07ae2cfacf051a42978d3113b75544366d02ee91dc11962a79589138;
    stim[20] = 376'h042adebf462aa4f25c046573fb82e835d91dfa83635f3944d781b3eac29493e5221ca30a35dfd0e5778d45fb88b440;
    stim[21] = 376'h110b90bf82751ceac63a1813612f9918ce79631178c26c742f5160875cbcbff70a91c31b6bc84fb15d70e9fc08fdd8;
    stim[22] = 376'h614b28e0337c44f5d45b634e74e66cbb3162023775de4acfd1b35647deb61705f1e3bccf4e8b5442a4c119cf5a7de9;
    stim[23] = 376'h5bdde3f87f8a21efab3986625fbcf71d80e4b3f2b4b99496edd864e63f8c004dc889f9fd446f6807fd80b908e117b8;
    stim[24] = 376'h35e536dd1a362f5ddc627f133514142486d288aafd59adbb7b630027f433622b294753034b9f489393350d5b7aabec;
    stim[25] = 376'h0329a246af253b4a2826cd9ad606750fa8685935a6ff66e4d1d43dcf2990fd42ae0e4d6f3d35c44c2a66f28d3d07d0;
    stim[26] = 376'h57fe3ad60a361cd940e636898b7af042acbd2352b0ba481e60f60e6633cc893c9f4a46dabddec9d9e170c53592045e;
    stim[27] = 376'h3e14eb187930540af5b9b6c9e7ab1f80b03770cbee9207d7d66cb9cd8eb14d8b59ef565c438ad08efd2b9517fe18c9;
    stim[28] = 376'h4c8cf1c9502b9a6966129cc24e535bff22c16fa9fa57e1eb0336f1b346a3a7c3067d35935411ad6553bdee7205fcda;
    stim[29] = 376'h1eaddc4b62b0044a6ea5238fe6bde0d478c4848ede907f0ef61f9600ec7e5339038efac501102fc09a8fd6dfa497e0;
    stim[30] = 376'h598fa8610ae42a84c01863d21c933bd01eccdbdc523be6694c0c64d25a2528c9eaded88fc5f2b5370a167ee5765f9f;
    stim[31] = 376'h7880dd581c0500b3e37985729da7dfbfb8d398bf6ac407dc6292e5422c7dafb6c25f176786911dcb2e22e6cb3f0cd3;
    stim[32] = 376'h35f99a958c36603b708bfef88eaa1c943974fe1ebd1107cee76a27484fb8d2d0c4339bc538c7bdc392a3666dd4dfa6;
    stim[33] = 376'h221226d15c67464365a4f773e4a49535a895033db759841ab37a593e68b7d70e4d0d265281d5b45716f3ef71378953;
    stim[34] = 376'h11ac5a84eac9d41de133840ef94e355111a607e1f5c105b51866b0afca981db15adcb6250461ab6824f4148d6b1dbe;
    stim[35] = 376'h78df5c47e053744814ca2ecce9eaf38bc2b20cd3b24a69e739c936f254755d92913122e8c651484b9a9466fccf4e69;
    stim[36] = 376'h65beaf6d0c163abdef382146548b2e0f5b4ec64c13efcf2be9d785c2bf66f4bb253c560384fd9fbe7094ed690a4fbe;
    stim[37] = 376'h47822c87da9c54b5d54142ed0acd6d952ea0c34e3811910a0fb274b1579f05c58e3dc5c5b44277586c18ed71a09874;
    stim[38] = 376'h0d65ef70ac0b7694dae5f1e884e586edfcbdd9f97295a17831dd6aa5878c32b0f4f0b7146d817dee02527bed3ce31b;
    stim[39] = 376'h77fc32b55f596001ef4b4a16dc020d1a4905812636b65f2d7b6f7761094c2d56793135699de34cabd4fe6704600b06;
    stim[40] = 376'h41cc57c89b1be0dd102f73e98ed6cbdb17fbb130476f4beb3064d08749b8995d0c749535c1b1a0e2c4aaa9736a3a14;
    stim[41] = 376'h744c263116d5358adfd8c3cac1447aa6cba09edc1876586d542f5fd7c2f93ec7d951b2dbe53dc137d234ab41448d45;
    stim[42] = 376'h1ea185706ef4b3ee6a3d129331028fef26a71d3bd04049e8c3aa3e5e841780658eedec597907c36cf4e8b4af422c6c;
    stim[43] = 376'h035cd006c81a03dfa2d76cdf574b91ec7c019b3f88c36abba5a97bcdc1c7a4eb898ada002c8f0c617cf4a5a8ef8523;
    stim[44] = 376'h249c9b8e75c60a3369dbe0544b2267ec7bc622ee4ae207cbc829cdda422cfd1aa8e34cdc96f2023bed4179131f0205;
    stim[45] = 376'h0f199635eac8961b568971efe7e59e16532248d343cd5b345f0de936ee02705e4e38898b166a480a3dcc10f8303a73;
    stim[46] = 376'h220c2359de0da70295fabb21e62ae52b19aa44f1ecf128b42e03f66c3e3ab8c0e12f96d3ee3a61df7da76f50e524ad;
    stim[47] = 376'h0bbee41f6a07000618f69337675faded7c4a1e4f0e1ab991cc86a409ed91b0f92f62393fb566b8873cf0e527a8a40d;
    stim[48] = 376'h7e37a58ba6d05d7c0c1ffc78230e770a8abf142738f0aebb9c63e67fbaa86422494a779a93cf38785bfa3eaeb883cf;
    stim[49] = 376'h121594ad557b0055328b5995ba591d61f29b9045e7d8554dfca4b9cd726e6ec453242fa2759f9d33d41ad6cb1dde61;
    stim[50] = 376'h7c5ca8941786c2a24bb8d6c827b0a33045ef6956c2cbab74851fee5865e2d9e39910548aae6921712647f52420e6d5;
    stim[51] = 376'h503e788084121ea55de708ccf607229014b3e6751b0c3b8ccaaddd53c184bb5e548fcc45d5050d7627ce0ec7e8d6e8;
    stim[52] = 376'h68fd117f7d2aa5c7d2efda80b845985cfb83bd5f82dc4aae76661591a5e1b8f395a74f33b454b91e2d6238a0091ff8;
    stim[53] = 376'h6a40b3a5b06aba748a0de13be73fb5ab6969a7d1ec0b8aa89dd4dc03b86e567b0be85b1e5fdf09861e2e00bcf72e27;
    stim[54] = 376'h2f83958dd3923c098c9d0871821b2568e6cfb1783faf4abf6e4b0ed950f35de14d15ea48a8fcec05307d85ba667fb6;
    stim[55] = 376'h27d920efe4829fc76f91b3572302a93054d0cf905b3ffa3b008984eb74e76337ee2fd9a5da0efd770ed271da926699;
    stim[56] = 376'h60d4fa4e0fb5c8dbcfe22a9509e3a692efc8fb0504eb46e88b9614ed91f46f817cfb5e1371cbec92ce214d67089add;
    stim[57] = 376'h0a9c6a0c76252b7ef673be83cb204c5f0ff1d65bebf8af8942e2e9957b2f0e3fa2d373f7d91b671ca1e3a0dae03b00;
    stim[58] = 376'h3c1404ba4dad3bcbe1d63ba973844a7dc6f0c5f2f5c202d364978102034a459bcf22a4a6b11467a31b5946c6c31ee6;
    stim[59] = 376'h409a9e5a10957262f9dedf382d3d42df1683b297ba1f565485b3095d2d4a7db5c661105b3868f7dab52b2a214a439c;
    stim[60] = 376'h12104610c533912003388e9ef4a10d3269bf1d70fc61277e0b62746b296c56d0ed6809674cbf88eb672db77310f011;
    stim[61] = 376'h5acaf5f638ee720c601e4c50dd7447341aefc0116046803df6b52534d591aeb4b68e6cecbd618b082161d00396744d;
    stim[62] = 376'h6d3de310a51416c3c33ffaa7e78238bf3b52b452d075cefdea9aed3f15336e3e2863f981e0479f9f42fffd7e81f60c;
    stim[63] = 376'h3b18b8897cea0a67e32872ee650cab14d69ae1b499ca726e63d96dd8df47be88400dc26d251c8ad8e64cd958503644;
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
      expv[0] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx9be9bcfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx4b0ce93bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx30c17689xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxc993d144xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxe59e27d27xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxe0786d9e9xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1dc00e351xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx789084ea9xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx6cfc520e1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx675521bc9xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx62944c491xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0624b31f9xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx743839431xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx5b71486c1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx79486b021xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx409740a6xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx7c909784xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxf9a9c2fbxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxf0508621fxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxdd5510d99xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1488728c1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx5c2a470c1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx17c78ef31xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx372227e79xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx2ca51d4c1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0ab839359xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx727d291b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx2d67bd59xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0c19f4d6xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxe40e3bebxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxa7ab7b62xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxdb097c5dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx4310ce6fxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx39343499xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx456b72d8xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx4a44c48bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx6c94f158xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1638f717xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx43d3c2dcxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx59e4c4d5xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx7431d254xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1f6546cbxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx163bb7b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx2e262b68xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx6aa38d33xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx7938e226xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0384be5bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx64bd88e4xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx092529dexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx114c90bexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0e644152xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx79523f31xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx4e569d3cxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx6c2fa16cxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx053457a9xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx5fb8bf66xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx05f3ed78xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx7e8b4dcfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx6f3c8a92xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx57198441xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx43b5a025xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx52da39b3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx78a18fe6xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 454'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx21003709xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
