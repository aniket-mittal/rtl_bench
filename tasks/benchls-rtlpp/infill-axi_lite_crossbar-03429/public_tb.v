// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 194;
  localparam OW = 263;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03429 dut (
    .aclk(clk),
    .aresetn(in_vec[193:193]),
    .s_axi_awaddr(in_vec[192:161]),
    .s_axi_awprot(in_vec[160:158]),
    .s_axi_awvalid(in_vec[157:157]),
    .s_axi_wdata(in_vec[156:125]),
    .s_axi_wstrb(in_vec[124:121]),
    .s_axi_wvalid(in_vec[120:120]),
    .s_axi_bready(in_vec[119:119]),
    .s_axi_araddr(in_vec[118:87]),
    .s_axi_arprot(in_vec[86:84]),
    .s_axi_arvalid(in_vec[83:83]),
    .s_axi_rready(in_vec[82:82]),
    .m_axi_awready(in_vec[81:80]),
    .m_axi_wready(in_vec[79:78]),
    .m_axi_bresp(in_vec[77:74]),
    .m_axi_bvalid(in_vec[73:72]),
    .m_axi_arready(in_vec[71:70]),
    .m_axi_rdata(in_vec[69:6]),
    .m_axi_rresp(in_vec[5:2]),
    .m_axi_rvalid(in_vec[1:0]),
    .s_axi_awready(out_vec[262:262]),
    .s_axi_wready(out_vec[261:261]),
    .s_axi_bresp(out_vec[260:259]),
    .s_axi_bvalid(out_vec[258:258]),
    .s_axi_arready(out_vec[257:257]),
    .s_axi_rdata(out_vec[256:225]),
    .s_axi_rresp(out_vec[224:223]),
    .s_axi_rvalid(out_vec[222:222]),
    .m_axi_awaddr(out_vec[221:158]),
    .m_axi_awprot(out_vec[157:152]),
    .m_axi_awvalid(out_vec[151:150]),
    .m_axi_wdata(out_vec[149:86]),
    .m_axi_wstrb(out_vec[85:78]),
    .m_axi_wvalid(out_vec[77:76]),
    .m_axi_bready(out_vec[75:74]),
    .m_axi_araddr(out_vec[73:10]),
    .m_axi_arprot(out_vec[9:4]),
    .m_axi_arvalid(out_vec[3:2]),
    .m_axi_rready(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 194'h15a889094fd70250b21d7be2e4965424c11a41433149e4835;
    stim[1] = 194'h0bf24e754a2c07faa597d7040b5b5f70d7fad9dc55557409f;
    stim[2] = 194'h2154c4f64b79bc36497013d028953017293e49222f10f2a13;
    stim[3] = 194'h265109393c40059b2f9d9c2c074d135a341e9a564f75b6fe8;
    stim[4] = 194'h2e24645a8684a58889ff418b4fd307b14836c79a2537be27e;
    stim[5] = 194'h339258401f8a57b14b40d27a662c80e2e06b4a2fdd670ae3a;
    stim[6] = 194'h239432b98f70b3766bcd378d94131072426050fe75c49bad6;
    stim[7] = 194'h3c724fbe105392cc52427c991afb083cc8261c4945a4b1e44;
    stim[8] = 194'h2fda909528432b784529b0e50e09d65d965378b3e14aedd71;
    stim[9] = 194'h289e65baa8d6a09b11439827131403d0d9fc2deab0e7d3034;
    stim[10] = 194'h3de25b7c5e17b1ac8a5b85b946d7adf5656cb715688023586;
    stim[11] = 194'h2eb0c56833c55aca71d442a87822f7e6cf7ef4a5d8a4fa9a9;
    stim[12] = 194'h2171e75933d33400377be78b0a23e96ef7773586219ea0831;
    stim[13] = 194'h22ac0747547694c9c48af81af6a7e0cba2861b090d15eb4f4;
    stim[14] = 194'h3143bf87a7755e373939e8b7f95180a9cfdaf2918b7893329;
    stim[15] = 194'h30fdc3ba8da6a350246b97a50bf5d6b315886843651c1a074;
    stim[16] = 194'h27dc0648b0466f44486c66c8ab55786a588f93dd91efa4784;
    stim[17] = 194'h3fd74a812b34e39e711e2178b64be1c8beda54eea1476545f;
    stim[18] = 194'h22ebb894433f3c23f27f2dc56696423167ca8c674b2036e1c;
    stim[19] = 194'h212d12c96710594d8be04e3a624ad97c5a112627c069f5759;
    stim[20] = 194'h26886a529369430de93c78b6d438640d724982917719bd8fa;
    stim[21] = 194'h266a7e62e4c8e87607ac2ddf23293a46c74a72b2dd08cccc9;
    stim[22] = 194'h2ecd7d723b37e8c198d6c1bd053f0eede4a7ba33eeae755e0;
    stim[23] = 194'h2ef2267569786fd48772984c5d1804636a1b1cccb2146e4f7;
    stim[24] = 194'h215856d1e874603344976bbaba95c8ad8d35553ecccbe7dbf;
    stim[25] = 194'h3fc3b16baa1fb0ba4f51f9bdfd81e29985745fac366e706cd;
    stim[26] = 194'h2af3d1c135434963ff8d4f491f08829fd21d5a8320b7ebcdd;
    stim[27] = 194'h3e3417aa31e1abea352c4d9cf57cce2fd95b24514288f9d9d;
    stim[28] = 194'h2ea4075021f5b44c7884393f5b63f6c28cae086ffb253753d;
    stim[29] = 194'h22a3a2d290b157055ba3bbc55344f8970b60234008ff67f0a;
    stim[30] = 194'h2ffbd9633b812c024bf12adfaeb4e5b1c0d5c0a12dd6d94a7;
    stim[31] = 194'h265660af76c3ed8cca074e02547ee811f4c7dd05450ad22c8;
    stim[32] = 194'h3d1c3d3ca3077e5e2dac926b46b68a2831ca8e0d5e7726a9d;
    stim[33] = 194'h30844606f58f55f068a61b49283f89ef84ba9f239124d1f0a;
    stim[34] = 194'h37a500937679e120e3d910e4cc1adcabac3e8d84c378e93c5;
    stim[35] = 194'h2d29d36fb738e4d1d8bdca4fe81329de88e210b00731769d4;
    stim[36] = 194'h3cf6182eb3a11efc2fface9c28a794e1c1616130ec4b22633;
    stim[37] = 194'h25ad64c51b8c719a7cb69bd99e98cb5d2630c7af4b3247c1d;
    stim[38] = 194'h32ba2b92443b636cb264c2c3c264261025d31a5355cedfda6;
    stim[39] = 194'h30087f0594e40ddf2bfb12b0c2b670885c9b831d48a768111;
    stim[40] = 194'h35393ad38052394cc0545a25bf1c7867580095f7c0fb132af;
    stim[41] = 194'h2699abab44b85e9d8a1e4a0be5b0b33bebe5b79d9aff1d5bd;
    stim[42] = 194'h251826d3ff332a322e4745495150a7929b7a030085add2ed5;
    stim[43] = 194'h2a85311400892033c651148fd82be2bdbfae900e44030bdfb;
    stim[44] = 194'h2053d79c285c3b280d2803fb4384e62170cd454c8d33a0a26;
    stim[45] = 194'h24160e4a0791cbb352282bf949581513a9dd81e77269076a3;
    stim[46] = 194'h296d29a2974731151b44399a257acf75d824f1e617449bd01;
    stim[47] = 194'h3fe6c854ff2c39da54bfdf5bee0683727a79eda45bd656b7b;
    stim[48] = 194'h31fc1e9eb666583c3464162216e466102fa65ec6f6610dfc4;
    stim[49] = 194'h35909e44ce0bf83bc7d171c3e49b8f26ae703725e545fcd76;
    stim[50] = 194'h31a0afe3fa24423c8210d8a10f70068e36dacd374b6174dca;
    stim[51] = 194'h20d80060275bab89a1845ab6a2db573e96ef8a8212758ea25;
    stim[52] = 194'h3bb80f34d98e0e3d4a4bb2aab72b35eedeb4dd69b268efac1;
    stim[53] = 194'h31a3f047f2ec6688587e3f64bfa981d15d1820ea37332263e;
    stim[54] = 194'h207126e2eed31c4f21269455e49f79445582e824e21e31111;
    stim[55] = 194'h3b9c426400598c93c8443e5d10da4228f04edf175f1250afd;
    stim[56] = 194'h2e88513c0b3484ab3d4426c9eae20a32e50708087ee7c9f33;
    stim[57] = 194'h397d3b1a2af04f84d7e676e49fa2150beb14f8d547a9c45c1;
    stim[58] = 194'h2b1bee1acf7e9d8c90ad5635725b78ca4d473e30ceb6aef06;
    stim[59] = 194'h2fd6af8b3c268dcb3bada52f826020cd4cd25271a2b8e2041;
    stim[60] = 194'h2eb82219cce39cfe63a7d7f858369a41c11f492d109aa012f;
    stim[61] = 194'h2767b7b8e5b308d88ebeccdc260811ef907305d93f4cf2ba0;
    stim[62] = 194'h25d4be7ef0f194f55032676e4867b309662d31e091be32ddf;
    stim[63] = 194'h28b05f5ed2df57696c719e738eaf701130c031413ea48a407;
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
      expv[0] = 263'h0598a4f240eb511212ab5112129bfae04a167ae04a16403ebdf1724abdf1724b63;
      expv[1] = 263'h2c2aaaba05d7e49cea97e49cea92c580ff548580ff54b333eb8205afeb8205adb3;
      expv[2] = 263'h451788795042a989ec82a989ec92ef3786c92f3786c92ef009e8144809e8144ad0;
      expv[3] = 263'h0d27badb7f0ca212724ca212727f0800b365c800b365f33ece1603a6ce1603a6d0;
      expv[4] = 263'h15129bdf13dc48c8b51c48c8b509d094b1111094b1113fffa0c5a7eba0c5a7e9b0;
      expv[5] = 263'h1deeb385716724b0802724b0803ff14af629714af6296a80693d3314693d33164c;
      expv[6] = 263'h0d3ae24dd6c7286573072865731bee166ecd6e166ecd7b8e9bc6ca0a9bc6ca09b0;
      expv[7] = 263'h06a2d258f2b8e49f7c38e49f7c240a72598a4a72598a48813e4c8d7d3e4c8d7db0;
      expv[8] = 263'h0ff0a576ea5fb5212a5fb5212a5208656f0888656f08a64cd8728704d87287049f;
      expv[9] = 263'h1d5873e980913ccb75513ccb75521ad413621ad413622a81cc138989cc13898a40;
      expv[10] = 263'h3cb44011acfbc4b6f8bbc4b6f8bfc2f6359142f6359148bdc2dca369c2dca36bfc;
      expv[11] = 263'h5cec527d4d5d618ad05d618ad064f8ab594e38ab594e3bb221543c1221543c112f;
      expv[12] = 263'h0f10cf504042e3ceb242e3ceb264fa668006fa668006eefdf3c58511f3c58511bf;
      expv[13] = 263'h18868af5a685580e8e85580e8ead0ed299388ed29938910d7c0d7b517c0d7b53ff;
      expv[14] = 263'h14c5bc499962877f0f62877f0f49eeabc6e72eabc6e7267cf45bfca8f45bfca89c;
      expv[15] = 263'h15b28e0d02a1fb877521fb87751b34d46a04b4d46a048ccdcbd285f9cbd285fadf;
      expv[16] = 263'h4cc8f7d23c8fb80c914fb80c916408cde88908cde8890cce336455aa336455aad3;
      expv[17] = 263'h1950a3b2a3ffae95027fae950252e69c73ce269c73ce223f10bc5b2710bc5b25bf;
      expv[18] = 263'h05a5901b7185d7712885d7712880e7e7847e67e7847e4cff96e2b34b96e2b34b63;
      expv[19] = 263'h0fe034fabb425a2592c25a2592c9e20b29b1620b29b17fc0271d3124271d31252f;
      expv[20] = 263'h02bb8cdec74d10d4a50d10d4a524ed2861bd2d2861bd267e3c5b6a1e3c5b6a1c03;
      expv[21] = 263'h496e8466674cd4fcc5ccd4fcc5c9191d0ec0d91d0ec0f74e16ef919616ef919490;
      expv[22] = 263'h3ff7573aae1d9afae45d9afae476e6fd183326fd183319b360de829f60de829ff0;
      expv[23] = 263'h0c590a3726dde44ceadde44cead22f0dfa90ef0dfa90eef14c262e8d4c262e8c00;
      expv[24] = 263'h176665f3edc2b0ada3c2b0ada3d20e8c06688e8c06689133b5dd5d4bb5dd5d4adf;
      expv[25] = 263'h141b373837ff8762d77f8762d752c3f61749c3f61749eab0fcdefec0fcdefec09f;
      expv[26] = 263'h17905bf5e7d5e7a38255e7a3826d28692c7fe8692c7ff30ea7a48f86a7a48f840c;
      expv[27] = 263'h26a1447cedfc682f547c682f54643c357d46bc357d46a64e26ce7abe26ce7abe4f;
      expv[28] = 263'h59fd929ba9dd480ea05d480ea0403eb6898f3eb6898f11021c9fadb21c9fadb1bf;
      expv[29] = 263'h54047fb3f9454745a5054745a524162ae0ab562ae0ab7741dde2a9a1dde2a9a24f;
      expv[30] = 263'h1496eb6ca4dff7b2c65ff7b2c676f0258049702580497ff0956fd758956fd75a4f;
      expv[31] = 263'h04a28569170cacc15eccacc15eedd87db199587db1994003a7012a3fa7012a3f6f;
      expv[32] = 263'h04af3b9355fa387a797a387a7940e0efcbc5a0efcbc5b74e4935a35a4935a35b6c;
      expv[33] = 263'h1fc89268f961088c0de1088c0ded31eabe0d31eabe0d15430da4941f0da4941ffc;
      expv[34] = 263'h3461bc749eef4a0126ef4a0126edcf3c241c4f3c241c7bbc8872660c8872660d2f;
      expv[35] = 263'h1e0398bb4e9a53a6df5a53a6df6de71c9a3b271c9a3b157ee527f40ae527f409b0;
      expv[36] = 263'h1c7625913079ec305d79ec305d64f423df85f423df85fffd674e1451674e1453fc;
      expv[37] = 263'h0fa59923e1cb5ac98a0b5ac98a36f18e334fb18e334f95734deccf4f4deccf4c0f;
      expv[38] = 263'h05aae76fece5745724a574572489076c6d96476c6d964cc26161e1326161e13240;
      expv[39] = 263'h50a453b4086010fe0b2010fe0b2d1c81bbe55c81bbe57ffd895861598958615b63;
      expv[40] = 263'h4de07d8995ea7275a72a7275a7000a4729980a47299808b22d12df8e2d12df8e43;
      expv[41] = 263'h44cd7f8eadcd3357568d33575689170bd3b1570bd3b1403f2505f2db2505f2d80c;
      expv[42] = 263'h1442d6e976ca304da7ca304da7ffe6654645e6654645c883a2a4a8aba2a4a8a80c;
      expv[43] = 263'h17220185ef550a6228150a62280011240678d1240678c8b08a47ec148a47ec15bf;
      expv[44] = 263'h044699d050c0a7af3840a7af38520b8765018b876501a64c01fda1c001fda1c24f;
      expv[45] = 263'h05b93483b4482c1c94082c1c9409f239766a7239766a444c15fca4ac15fca4ac00;
      expv[46] = 263'h2d0ba24de852da534512da53452de8e622a368e622a36a821ccd12be1ccd12bd2f;
      expv[47] = 263'h0c2deb2b5b7fcd90a9ffcd90a9ffe5873b4aa5873b4a957fefadf703efadf7036c;
      expv[48] = 263'h057b3086fea3f83d3d63f83d3d6dcccb07868ccb07868cc20b110b720b110b7243;
      expv[49] = 263'h24f2a2fe6aeb213c89ab213c899bc17f0778c17f0778fbb0b8e1f24cb8e1f24dbc;
      expv[50] = 263'h13a5b0ba6f63415fc7e3415fc7f6c48847904488479040306c5087b86c5087b800;
      expv[51] = 263'h07093ac750c1b000c041b000c049eb7571342b75713433022d5b516e2d5b516db3;
      expv[52] = 263'h5ed93477d677701e69b7701e69b631c1c7a971c1c7a9488dd9555b95d9555b95b0;
      expv[53] = 263'h1d1b999131e347e08fe347e08fe4dd8cd10b1d8cd10b0cff1fb25fd71fb25fd49c;
      expv[54] = 263'h48710f188840e24dc5c0e24dc5dbda6389e41a6389e426434a2af24f4a2af24ff3;
      expv[55] = 263'h05af892857f73884c8373884c8000b3192790b31927908821f2e886e1f2e886d23;
      expv[56] = 263'h043f73e4f85d10a2781d10a27812e6909567a6909567aa821364f5721364f57120;
      expv[57] = 263'h00a3d4e22e72fa763472fa763452de09f09ade09f09affc33b724fd33b724fd120;
      expv[58] = 263'h58675b5778d637dc359637dc359befd3b1922fd3b192154eab1ab92eab1ab92db3;
      expv[59] = 263'h1ad15c71025fad5f165fad5f167f04d1b96744d1b967774ed297c132d297c13000;
      expv[60] = 263'h08884d5009dd7044339d7044339b1c739fcc5c739fcc7743ebfc2c1bebfc2c1b6c;
      expv[61] = 263'h1e9fa6795c0ecf6f71cecf6f71c936611b11f6611b11d57f666e1307666e130400;
      expv[62] = 263'h4048df196fcba97cfdcba97cfde41e329eaa1e329eaa047133b7243133b72433fc;
      expv[63] = 263'h449f524520d160bebd9160bebda4dbeaed2d9beaed2d8cf0cf39c754cf39c757f3;
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
