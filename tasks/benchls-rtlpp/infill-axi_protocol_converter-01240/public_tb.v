// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 222;
  localparam OW = 169;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01240 dut (
    .aclk(clk),
    .aresetn(in_vec[221:221]),
    .s_axi_awaddr(in_vec[220:181]),
    .s_axi_awlen(in_vec[180:173]),
    .s_axi_awsize(in_vec[172:170]),
    .s_axi_awburst(in_vec[169:168]),
    .s_axi_awlock(in_vec[167:167]),
    .s_axi_awcache(in_vec[166:163]),
    .s_axi_awprot(in_vec[162:160]),
    .s_axi_awregion(in_vec[159:156]),
    .s_axi_awqos(in_vec[155:152]),
    .s_axi_awvalid(in_vec[151:151]),
    .s_axi_wdata(in_vec[150:119]),
    .s_axi_wstrb(in_vec[118:115]),
    .s_axi_wlast(in_vec[114:114]),
    .s_axi_wvalid(in_vec[113:113]),
    .s_axi_bready(in_vec[112:112]),
    .s_axi_araddr(in_vec[111:72]),
    .s_axi_arlen(in_vec[71:64]),
    .s_axi_arsize(in_vec[63:61]),
    .s_axi_arburst(in_vec[60:59]),
    .s_axi_arlock(in_vec[58:58]),
    .s_axi_arcache(in_vec[57:54]),
    .s_axi_arprot(in_vec[53:51]),
    .s_axi_arregion(in_vec[50:47]),
    .s_axi_arqos(in_vec[46:43]),
    .s_axi_arvalid(in_vec[42:42]),
    .s_axi_rready(in_vec[41:41]),
    .m_axi_awready(in_vec[40:40]),
    .m_axi_wready(in_vec[39:39]),
    .m_axi_bresp(in_vec[38:37]),
    .m_axi_bvalid(in_vec[36:36]),
    .m_axi_arready(in_vec[35:35]),
    .m_axi_rdata(in_vec[34:3]),
    .m_axi_rresp(in_vec[2:1]),
    .m_axi_rvalid(in_vec[0:0]),
    .s_axi_awready(out_vec[168:168]),
    .s_axi_wready(out_vec[167:167]),
    .s_axi_bresp(out_vec[166:165]),
    .s_axi_bvalid(out_vec[164:164]),
    .s_axi_arready(out_vec[163:163]),
    .s_axi_rdata(out_vec[162:131]),
    .s_axi_rresp(out_vec[130:129]),
    .s_axi_rlast(out_vec[128:128]),
    .s_axi_rvalid(out_vec[127:127]),
    .m_axi_awaddr(out_vec[126:87]),
    .m_axi_awprot(out_vec[86:84]),
    .m_axi_awvalid(out_vec[83:83]),
    .m_axi_wdata(out_vec[82:51]),
    .m_axi_wstrb(out_vec[50:47]),
    .m_axi_wvalid(out_vec[46:46]),
    .m_axi_bready(out_vec[45:45]),
    .m_axi_araddr(out_vec[44:5]),
    .m_axi_arprot(out_vec[4:2]),
    .m_axi_arvalid(out_vec[1:1]),
    .m_axi_rready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 222'h0cba32e237dc0b541d2aac5f5e9c85c5c2be719fefbc838ea6a40b28;
    stim[1] = 222'h14af80674de1d014bef24ae03e97079844283ebdd93b4dc5258fe921;
    stim[2] = 222'h249dcfdacfe2e7253998a5be63b7761590c38f54b3f5a7a5a9dfec7e;
    stim[3] = 222'h26e1243f4fefaa776a578ca4d3b191067d30ee968d3b173448c0db13;
    stim[4] = 222'h3bd5ebc3c06fe0511e69505f161588a487f3b08dabb3f029b57d1ec7;
    stim[5] = 222'h3e03814e007f49964548ce6be062af82740e58fd67b2a814d75a9307;
    stim[6] = 222'h2bbb8528ff58f032522ba1a7a8d38dad279f3ad127a56876aff28a24;
    stim[7] = 222'h283d0ab0f11fd569df095f5038aa06cad86506a513c0a4799785233f;
    stim[8] = 222'h201dea478538e61469017a5aed71562d4b045e01ccebad486e57d63a;
    stim[9] = 222'h3cbfae72a33c5aec5ab84f6155096a1f1144fe7a668fc93d89310ec8;
    stim[10] = 222'h2b7d8e839d7feca491cc438223611ae382827cd332fa2ceddaaf93dc;
    stim[11] = 222'h3c96461e13e7f4b41c3d497e9dd222e5cbd6c6ca21021c5132e382a8;
    stim[12] = 222'h202ea070cf3a3fde8ed37d058f102c4da598fc3762670f3a940318cb;
    stim[13] = 222'h3c73d83b21054653ee4fc368a6949e595bca006f4ffbee3c1708fd9b;
    stim[14] = 222'h3df896ff3850c44734e69865007070daafd5f5cad38298257f711c84;
    stim[15] = 222'h307f5a66cfa41d5dea336a5c3aaddc86bc01e5524fe9c0899dc1c24c;
    stim[16] = 222'h3e4cccddf9ec04fe4a7059f177e3cd89a5e309781c08838a0c8bfa23;
    stim[17] = 222'h28fd4fdd443628f7ae3eb087ac8f68e229c5675aa0a20414d657e935;
    stim[18] = 222'h3bcc0208cf0f6201210b5de6c710ed141732d54e012eb3aabfb2a824;
    stim[19] = 222'h2f948d351311e780790a3c008ad3c22fc3adb63699614faaa12ec497;
    stim[20] = 222'h2dfbffcd6afaa794cdce5591b4bb9de949d55a944ecf8b41e36a4025;
    stim[21] = 222'h3483f70eafb530e923ec711696b057e763c484c088a94c677844722f;
    stim[22] = 222'h27bd5c9acb8c92732035aeb5dab21c8bffe8554e92f7c74e832a9e44;
    stim[23] = 222'h2fd15f74bab8befd375f1d6402ada393e836bf3dfaeb36653e79977c;
    stim[24] = 222'h22f8a2c828933f21bdae627c285364162b112b734e82f360b0cc243d;
    stim[25] = 222'h32429cf50548d1e9b51b940c805db79a3c7b5eec156a840c8d30ed83;
    stim[26] = 222'h33dc15a4bcbedae8c4f49f5d9cd3d761e40a3ecb8efb89d14710f8c0;
    stim[27] = 222'h389d8b792e6919ae79cfb72b8b258537068b4e2517ef25a8446094b2;
    stim[28] = 222'h32ca61995272c0144c42b8c93f6edaef0822ad91b94e7e11cd955142;
    stim[29] = 222'h371931ba0e57297de9f70925b9c8d50108240d2b693bba3e59eb1b21;
    stim[30] = 222'h3ac337607e162856a5d30f5f06a365a65852ea7a928d1dfbd0be63f7;
    stim[31] = 222'h3cae0b49ca5e05389c902730ac1186496c897fbbe554150f3fb00e13;
    stim[32] = 222'h28365826707745bc88545b93ed37f2f68ef89e7aeb9cd8e3f5923074;
    stim[33] = 222'h2a713de9b3de49f0148b20c399c9a9b7d75a0a5aec637b309abdb7e2;
    stim[34] = 222'h3309c2c28f57db38a3dfc6cbe14ac56055bb8e9d1d382ad1f4652854;
    stim[35] = 222'h34eac8a2eb9922e3655c67bc83a24957a5e375948b3972626f63c5f5;
    stim[36] = 222'h2fceae40e9c6ef7d8fbd20c4562b3ca53e06eab355d4f401afec44ce;
    stim[37] = 222'h3b64b39bd991e006b70f1f994b51814e9a31e67f9b986f98835f3187;
    stim[38] = 222'h3c2c5f30831bcf241a4b32aa3d04f6f2498cf2f2088fa11a56ca4c28;
    stim[39] = 222'h350a78d8ea7d0ee53163a01375a4bf7be93bcbba43641184735b9263;
    stim[40] = 222'h3fcdc972a27b7e398f2624ad4ade4200733ef0e9cfdfbed575cdc5e7;
    stim[41] = 222'h35cd7971c71d87dcd7e434aec4e90cc39e9948563ebde1b2282aa51b;
    stim[42] = 222'h353c4fdfac252f92fd7f3273fc1b56b662876e338cdd8bf4e69c2519;
    stim[43] = 222'h2bd99bc55704329cf2b90cf24cd476a6149517ca2e9be49cd34cc177;
    stim[44] = 222'h3c16ec56d0045e974d2a90f427b89b89e72a7ae7d822675debf94dcc;
    stim[45] = 222'h39564b52b6eb62efcb3cb0dc1eb70c2d7e45813b57491cdb2a12cddd;
    stim[46] = 222'h3343649b28d6e23cafb6f6735d047ea8e7f7c35ae052f644ccc59b2f;
    stim[47] = 222'h38b1a9d6c85a82bf189ec5a26a3e82f991e01c9d5080c9b08f786739;
    stim[48] = 222'h2fe341abf140690a8ee320cb0f842495823dc73859d5e7f4cc1666f9;
    stim[49] = 222'h1247ebb12bade0949c73f81883bad20107e622130eeeea4c8c33a7ee;
    stim[50] = 222'h295d16db69bdf7939652569c29e9552ae3e8a0488ec2d1263b120d98;
    stim[51] = 222'h3dc0fa6a473c443dbf21ce8016d19023e2489a0de00a289774c78325;
    stim[52] = 222'h37ce2dda7679e8ef8acb66d10acedae9d778d2284a830f469e5d19a9;
    stim[53] = 222'h30c1479ea3fcfb212f35fbb8b0bc38e44fcd2e0491c1b2858ea7c8de;
    stim[54] = 222'h2edb54347c2d77c6a4941cebcfe1000aa9e44c8c06f4d70038ef9ea9;
    stim[55] = 222'h2780c78fe139b4aa4bfeff292e2eaa8f8d1124ee44bda5b59f288d5b;
    stim[56] = 222'h26f2f4ae0d0781077c0fe8cb4f6b17828fa5cb9b768c6e461a22e0a6;
    stim[57] = 222'h33edc73bd30c99f576b5159998d9bf4e3e5814b554b3e5a80b03d38a;
    stim[58] = 222'h296006c97d1361646e8922002affe83f811ef075d4747c247b8ebc23;
    stim[59] = 222'h2ecb0be8a6729fc70ac9fa1b354b749f7227e8db05fa8e2b199f2c7e;
    stim[60] = 222'h3d67fa0ce332a4c4eb334e043752ef3b255ff8b7d6ba940bcc147c32;
    stim[61] = 222'h3af12d9362ca4200aa65d6136f4ab8dac9350acdc422bb0f18d3f5d8;
    stim[62] = 222'h2e81bf9d5b72902fc7043b5c2961826facc687e6281458db8492b719;
    stim[63] = 222'h3c2f6fa1169683840e26bdd1df4c6b26b1af425eaadd61dde56e1d9e;
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
      expv[0] = 169'hxxxxxxxxxxxx2e8cb88df42aac5f5e990b8b857ce3d;
      expv[1] = 169'h0x00000000052be019d37cf24ae03e960f3088507de;
      expv[2] = 169'h0x00000000012773f6b3fd98a5be63b6ec2b21871fb;
      expv[3] = 169'h1x8000000001b8490fd3ff578ca4d3b3220cfa61ddf;
      expv[4] = 169'h0xc48c0db13ef57af0f01969505f161311490fe7618;
      expv[5] = 169'h0x448c0db13f80e053801e48ce6be0655f04e81cb18;
      expv[6] = 169'h0x448c0db13aeee14a3fd22ba1a7a8d71b5a4f3e750;
      expv[7] = 169'h0x448c0db13a0f42ac3c41095f5038ac0d95b0ca0c2;
      expv[8] = 169'h0xc48c0db138077a91e14c017a5aed72ac5a9608bd6;
      expv[9] = 169'h0x86e57d63bf2feb9ca8ccb84f61550ad43e2289fc4;
      expv[10] = 169'h1x06e57d63badf63a0e75ccc4382236235c70504f9e;
      expv[11] = 169'h1x86e57d63bf25918784fc3d497e9dd445cb97ad8c2;
      expv[12] = 169'h0x932e382a980ba81c33ced37d058f10589b4b31f93;
      expv[13] = 169'h1xa940318cbf1cf60ec8434fc368a6913cb2b79401f;
      expv[14] = 169'h0xc1708fd9bf7e25bfce17e698650070e1b55fabea0;
      expv[15] = 169'h1x41708fd9bc1fd699b3ed336a5c3aabb90d7803cb4;
      expv[16] = 169'h0x41708fd9bf9333377e7e7059f177e79b134bc6125;
      expv[17] = 169'h0x41708fd9a23f53f7510f3eb087ac8ed1c4538acf2;
      expv[18] = 169'h0xc1708fd9a6f3008233c10b5de6c711da282e65ab5;
      expv[19] = 169'h0x41708fd9a3e5234d44c00a3c008ad7845f875b6d3;
      expv[20] = 169'h0xc1708fd9a37efff35abcce5591b4bf3bd293aab45;
      expv[21] = 169'h1x41708fd9a520fdc3abe9ec711696b0afcec789096;
      expv[22] = 169'h1xc1708fd9a1ef5726b2e335aeb5dab43917ffd0abb;
      expv[23] = 169'h0xe832a9e45bf457dd2ead5f1d6402ab4727d06d7f7;
      expv[24] = 169'h0xd3e79977d8be28b20a21ae627c2856c82c5622561;
      expv[25] = 169'h1x53e79977c490a73d41511b940c805b6f3478f6bd6;
      expv[26] = 169'h0xd3e79977c4f705692f28f49f5d9cd7aec3c8147dc;
      expv[27] = 169'h1x53e79977c62762de4b9ecfb72b8b230a6e0d169d6;
      expv[28] = 169'h1xd3e79977c4b29866549c42b8c93f6db5de10455a7;
      expv[29] = 169'h0x9cd955143dc64c6e8395f70925b9c9aa0210481bd;
      expv[30] = 169'h1x1cd9551426b0cdd81f86d30f5f06a6cb4cb0a5d46;
      expv[31] = 169'h1x9cd95514272b82d27290902730ac130c92d912fea;
      expv[32] = 169'h1xf3fb00e13a0d96099c1c545b93ed37e5ed1df13cc;
      expv[33] = 169'h0x73fb00e13a9c4f7a6cf08b20c399cb536faeb4151;
      expv[34] = 169'h1x73fb00e124c270b0a3d0dfc6cbe14d8ac0ab771dd;
      expv[35] = 169'h1x73fb00e1253ab228bae35c67bc83a492af4bc6ebd;
      expv[36] = 169'h0x73fb00e123f3ab903a75bd20c4562e794a7c0dd4a;
      expv[37] = 169'h1xf3fb00e126d92ce6f6660f1f994b53029d3463ccf;
      expv[38] = 169'h0x8835f3187f0b17cc20c44b32aa3d01ede49319e44;
      expv[39] = 169'h0x0835f3187d429e363a9d63a01375a17ef7d277970;
      expv[40] = 169'h0x0835f3187ff3725ca8992624ad4adc8400e67de0f;
      expv[41] = 169'h0x8835f31865735e5c71c4e434aec4ea19873d3291c;
      expv[42] = 169'h1x0835f318654f13f7eb0a7f3273fc1ead6cc50edcd;
      expv[43] = 169'h0x0835f31862f666f155c4b90cf24cd0ed4c292a2ee;
      expv[44] = 169'h1x8835f3186705bb15b4072a90f427b93713ce54f53;
      expv[45] = 169'h0xdebf94dcde5592d4adbf3cb0dc1eb6185afc8b026;
      expv[46] = 169'h0xb2a12cdddcd0d926ca34b6f6735d00fd51cfef86b;
      expv[47] = 169'h1xcccc59b2fe2c6a75b2179ec5a26a3d05f323c0380;
      expv[48] = 169'h1x4ccc59b2fbf8d06afc52e320cb0f80492b047b8eb;
      expv[49] = 169'h1xcccc59b2e491faec4aec73f81883bda4020fcc455;
      expv[50] = 169'h0x00000000025745b6da6b52569c29eaaa55c7d1400;
      expv[51] = 169'h0x0000000007703e9a91cd21ce8016d32047c491344;
      expv[52] = 169'h0x0000000005f38b769d9fcb66d10acdb5d3aef1a43;
      expv[53] = 169'h1x80000000043051e7a8f935fbb8b0b871c89f9a5c1;
      expv[54] = 169'h0x0000000003b6d50d1f0e941cebcfe2001553c899b;
      expv[55] = 169'h1x8000000001e031e3f84afeff292e2d551f1a2249e;
      expv[56] = 169'h1xd9f288d5b9bcbd2b83470fe8cb4f6e2f051f4b967;
      expv[57] = 169'h0xe1a22e0a7cfb71cef4c5b5159998db7e9c7cb029a;
      expv[58] = 169'h1x80b03d38ba5801b25f448922002affd07f023de1a;
      expv[59] = 169'h1xc7b8ebc23bb2c2fa299fc9fa1b354ee93ee44fd1f;
      expv[60] = 169'h1xb199f2c7ff59fe8338cc334e043755de764abff1e;
      expv[61] = 169'h0xbcc147c33ebc4b64d8b065d6136f4d71b5926a151;
      expv[62] = 169'h0x3cc147c323a06fe756df043b5c296304df598d0e8;
      expv[63] = 169'h0x3cc147c3270bdbe845a426bdd1df48d64d635e84c;
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
