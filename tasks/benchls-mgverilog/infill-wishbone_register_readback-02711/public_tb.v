// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 530;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02711 dut (
    .wb_clk_i(clk),
    .wb_rst_i(in_vec[529:529]),
    .wb_stb_i(in_vec[528:528]),
    .wb_adr_i(in_vec[527:512]),
    .word00(in_vec[511:480]),
    .word01(in_vec[479:448]),
    .word02(in_vec[447:416]),
    .word03(in_vec[415:384]),
    .word04(in_vec[383:352]),
    .word05(in_vec[351:320]),
    .word06(in_vec[319:288]),
    .word07(in_vec[287:256]),
    .word08(in_vec[255:224]),
    .word09(in_vec[223:192]),
    .word10(in_vec[191:160]),
    .word11(in_vec[159:128]),
    .word12(in_vec[127:96]),
    .word13(in_vec[95:64]),
    .word14(in_vec[63:32]),
    .word15(in_vec[31:0]),
    .wb_dat_o(out_vec[32:1]),
    .wb_ack_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 530'h3ab706c19402b697893ed28c1225e31c8086e11be9f84e48f5fd4abfe95879e26d153df4181c71b87c7da58f160a84bcdf397810d1b78e75f12415fd2d729f7e8ed1e;
    stim[1] = 530'h2bf196660cd6ad311d377e954c16b4b70eeba1d9475237a8f7c89efcf145ce2b63adbfb205ce4371cca8be71ab038462de4f36c2bfb5d36adb1ee0313462272b1399f;
    stim[2] = 530'h0dad43eff5e806c8c602f5c82791c05f520f183ecf9a33f28c41644c8274980cf2054eea2a40436c678348f5ebccb12c46b5f1c25dccf03031522e50ea849a39b1e22;
    stim[3] = 530'h02b4d0fe3eec4b1fa45fe3c07998b28879612a17f5194116e25009f2b68629a5244c169ee115fae20a8c2fd022abaa10c2dd1b30e7692bc1e29baf099585ae7253c1c;
    stim[4] = 530'h0bd1ff7418775669257644eb3971dbc07a7f603edc84079e3a089a3c6d025e780f09ac879b433713a8eb896dc87ec6b1cc0d983a42d8c7bcb27ee69fe4c5774e7942e;
    stim[5] = 530'h1ba1e7f0ed87c715ed744579b58d394ab2e2d60bd59808ba61b2e21fcd40823a0cd746c514a2bc37738f681b512549166ddad53df8580d7b064fb7c0c186c43b8b047;
    stim[6] = 530'h1d501dc431e64f36dc49ae4de1673427d0ba9e41499895c7a7fa9814eb21d507859d3fcd5842ee33f62c550f66a9590b9883c06f161196ff4cfa7e025da3f9f07ccf5;
    stim[7] = 530'h0102d9548891e10e53f78f4168f26b81cc207ff4a8194c903139e0c1ed5a52a70b26e13451263e279f05dcf628fd427b4ddd751558034cbb6cade85d08757ffffcc51;
    stim[8] = 530'h00bb6d623a11547e114717f1fd579edbc86eb6ec1db65abcf202aacb4d12128ed3b4ba2dad539d945801924655472d3e010ac5a5fd383ed4324fc62e3da2cb47589e5;
    stim[9] = 530'h14a17e46810303f7dafb6f67a0b4d6c47b115af0261edc9825df3ce51cfff3ceee196fb2236ffb4e92e18cff088ca8126d6688c8274d43dfcfd6528ed25f7589e8ed9;
    stim[10] = 530'h0cdb872ecae8a1b8bcb91acf0a506e1d3a5a11ee0e1a5fb38229707e695bb95c60cef8e2c9654279d43daeb7ce5bfb840f3023a70b737a996925579d27a4fc5dcb077;
    stim[11] = 530'h0c1a20c282ccfa5eda4c41c76f3094f7f3e587f0009fb0bfa8c1e401bb4075ec13cb83e5ecf30be48f93e0a042168aac984c545d5d2466f620acb80895030b92a7eed;
    stim[12] = 530'h1ba78c3d475a25b91580095ead16dcb1cef5bbe9d4241ebce10f751b553a1adfcd25ae9d48eb91191eda9d1b497c9d5397ea47ea13f229afa02f690156d1e68dc80b6;
    stim[13] = 530'h1f656783717ebdd1564c34d732eefac2585e65bc17c139da11b20cd8988be8369256cbbb05adab1bd4349c70b763d4c757b809ef6addf83c685d15a55f5fcdf061b4d;
    stim[14] = 530'h1ee6a11ffda56f4544c2a2ada15bead2e2e5659ba95818762082904c037c5726522e97a1acd16ebf4c535a3b312a4c2e776eddd3dcd121463190f58824613cf77d95b;
    stim[15] = 530'h0fe388968ccd678d80dfe58cadf0710979f5edda0ab3bf5676c0afabeda13f13846c43994c5037afaae202f44062ae0e7c4b71fae231ff41f2d8f120a9fd12ea05847;
    stim[16] = 530'h0ccaa241b7bdee37aed180370e64af3c647706994b3e0aad43c64f0a63fb8e90af4d6b445521639a1706afc5e26f53fe85fd2ceac2b7c5765a53f2b40e37ac225fc79;
    stim[17] = 530'h0c1d5bb8b4f13edcd062bb31d08f45491382fc481ac7ea0e57dd1cdafbaecaabe88232bed2cf43502abc6f85c31ac9bb9564f5fc304b27433c7493da01d3ca20060ff;
    stim[18] = 530'h0a02010cb34bec88ae6bd5d463a0f99f0a43e739e2817b56d25ec45b32f589a762a31d985776b04c49bb0ee704fcc467fdb351642019f31a0f10eefd71bc0dde678d8;
    stim[19] = 530'h08485b20a067c45321eba484cd761db94597f57bf90bfd9e7166f94f4a6280ad0d45783269805a7ec71e87f27ce0170111b4cb1cb08118020bc5fb9d31315d3056338;
    stim[20] = 530'h06d6df2b2cf3b2ac740be72c3b16e8ff8c7d5d1022301d1e45860a4d70f45c26662cfddff40d0925949cbc7d1d2c6a18fd60e613440564489aad37193ae077f079a3f;
    stim[21] = 530'h1e9240813f4dc1383ed4d826a37e958a53638a636db61923620c440b6095d9f48053ce9be85a7287a01531f04c5e9f5f6a1c6c60f47afb5351809ec423f77d6766315;
    stim[22] = 530'h14c47b4f294a31b15210907d5904f689cfb1bf3babec1322f4147e208141b84db1336b497d380832acedec9decb72100fd969ef69f525cca19cee0fcbb10237377c6f;
    stim[23] = 530'h055aaecf15b84b2d585fdb330526e3d0a0f91fc420cc88e543cf7b10784326d4c6bb033bb51f8441d0dbff131dbf4a633153a064ca46a6e43ba94a1411a85ef15aee2;
    stim[24] = 530'h0c6eaa1db01c93e688a5d967bbd51b3bd078f3af390e44e125068ed7ef9e6ff60ca6f83c799b92dbb45849aec62359e1c8c6eef7002afd259ce9ce4f463bf65df3c43;
    stim[25] = 530'h0c558e1f8273b88ae35282c87f4a156b15cc3ccb31419fb1c8362c2511954a9afbdb7c8f31dc4f5d4c17f6cc281d90860e0d793869f268c8aab708290384f1d61e687;
    stim[26] = 530'h1dab298c0f9dca80bb39327c00ef6c58c192eca08c8df69b8882cda022fd491aaff1dcf60af48ee3db95d090a640e4a35182dc815afc74d0185ae502a667a5540b701;
    stim[27] = 530'h05cb8047a504fbd1b5a32f900dc663d4c5a6cf69807ebf8835db09101640cd4cb9cae5cc4fb688c741f5bcf07a27f3280e7293e0e924159be13ec2a545dd17bc620c4;
    stim[28] = 530'h12cea1c4d45330f47775bd8c0176ead9e885808f2110027e89d40503b076872da332465562863303a5765d13c7139b0d61573a322d679304205d7d018462a525d5745;
    stim[29] = 530'h0bc844f3459a3edc48233fc6c2d1f974b3da81ca0935217f89001ed556b6a711ecf3cf0b4bc94001304a410c80a574b85d18a34ef78fc4ea71ca365ea4f5ab13d24f0;
    stim[30] = 530'h013620bd83b62c3804d0e3464f0463b6fffb1bde30d27798e888b8e67109973638b51a4a010c4ea03b0d77d025f06717665543cec055876d6bf42c06505ee67ef800b;
    stim[31] = 530'h148ec87207ca656afeae4f61554925a9f470f477cc60a9fdc6b993e9743cb74916304ddb1af243f4162723a424400355b19aba4a4df94130adc7905d60a37e9aad38f;
    stim[32] = 530'h12fd7217ce2dce97e71bce48334eee3b85132513366b406c3845a49e7239b9188fa19321c5cbf9c6eee7fe43b05a484bfebd537813b0f89e40276cc6ab74831d1a31e;
    stim[33] = 530'h0fc0ca3a8d24000a158f527b0e6ffc66f50dcab5f19b8feb75ae8e684a7895a3a97bd288e3d01f0ed8a7c71224487f07898e7ec62d81fd2081295804d892d54ce77f5;
    stim[34] = 530'h15e55888dd3e1904a92a9dbd29971de9796b2a8b697a5cb1d8597431747360db48ff00abecf8a5c0fa675f6a63910fc3640473024024e4aed19fc7621de6b30ba4850;
    stim[35] = 530'h072ee2a8f0f135a3c97100f3d0c1206adc4872260d5bb8cd39a7e7ab9c066777bdcfc451757bae9803e8cc29cf6b34bfe66f194cdc76d766cbacf230640b06c06ddbb;
    stim[36] = 530'h036bc14c855c3a8398cf94bc1f1b1d6ec3ba2e5cfd9850b5c820fa8d66d1371dfea25c101bf29ce894a901af39d541ddee51d73e2d8c1720055556904592e1ce99db9;
    stim[37] = 530'h1f49d325b88df2a776f441a30f1937d537211a7c4495b4d8233b48bc3d698884c59f099c98678c519bbae97837a0b338b9abbb762c756554cce1aae0ff7346cb6ebe6;
    stim[38] = 530'h059672fd27a38f51f4d4acb433c9f2c83ee99a5095bb824d4f6f7641bfc786a34057f54f0506e4250642a51bdf4e0bc46b28556e58288ac1b344cd56dfa5aed56257c;
    stim[39] = 530'h1e0f79ae21af7f43082d7e76cd28ad1b47a251a57f8171ed8eb8c622fb6fbcba750aa570ef065eb36b2dc7273ae526144346a63fd922855d4052f77b0e01d975b6623;
    stim[40] = 530'h0b3fd60760a0b6f999024e33c192bd18e23089caccae43116365b96041814ca3e74b75864091b61b919d610af6247e0ee859a8353a973b1ca6c5692b271cea6c72abb;
    stim[41] = 530'h0b20028d8e2e94c5c27347e1dc4c24fbab8f480c8f83af1ce265ece043f94cb8d5d39f40a7a8052e0660fe4e46c5508b82f5e3d4711e791e320c88e359e0d51da398f;
    stim[42] = 530'h14dc1f2b31b327466f874d1bee5bfe150231be4f9fea1ed97bc4505b83ac44163bfa2245f5c61263f47918df5a751331567ca13f10ac4cdbd36b50c1542979e37329c;
    stim[43] = 530'h07bf64022d503e5aebf8b0c53595da6be6f6248e29e25045085b0ad56d8e79a59036606125e651ee70dd8a1f2813b27c0106e5087e12464bbc557d77636d32eab3e1e;
    stim[44] = 530'h141ff07039e2c462c8ba83f41c60cf1ff2523d98fa6fb1732607e07cad49f5d3a405572ec1f0bb36b6b2765a697752cd20fc024a54736eefc5ba8a73f19f23d1f65d4;
    stim[45] = 530'h1568beb2dd918aae124bfff8cc85d7106c7708fde87a84e0bfe4716c031779991cf91b25dd294650065b6b1ab0e4549a8776337726021aed3242ad9c5d98fb70f2888;
    stim[46] = 530'h186839d2a29111c8e00b7fbe534d068978b8c8b3c13ad9bd1117b915bc106c9214d11894b7fa4c670b456765bc57f3e4e3bca7e7bdb1b447595e8265cc23ba7e29534;
    stim[47] = 530'h02d94674d4b842e347b7cd482c12985e7ee381f68ae6af7f2b4dc71ed425a669e899d4ae07e2ec43e97c623ee44a82f39e0323649e7828294c6bb13a407e646af5220;
    stim[48] = 530'h070132c931e71989c757372fcd1502ba7825905eafe0158f9c775768f49f1c6ebfb95822d97a6b4bb8a7b480ada48686bc877314d8b0d108bbb574fa0d81b7677b1ff;
    stim[49] = 530'h038bdf6f473508dd0098d7f0b0de06ef88bce47fde4a79af202e0f3683b52393e8cb229cef3e5dc8a7e3e989c3981b99bbc9964b4abefeda82575a25e2ff90a086417;
    stim[50] = 530'h1a513ce4e0aa3ac36bfe489f91e9f78bb5a4e8cf9b32ac27ba030e25b63a01899acc13d99f07f1e23c813761bf536cc57a0f171ff2dc5cda3d0b55ea7a64e1b33499b;
    stim[51] = 530'h03d898fa9d062e654f971aea8f7a48d3b77b118ffd68dcfd192e8fd61f9749cf09b8332f2407b5a4c6d0687ffdf76b23de61e22aa2413e30f6d060d52831a7db008a3;
    stim[52] = 530'h0c0b58123dedc2bb45835f1cef5581114b204c0df652287fce4126bd92c7905d57c953340dfde0a5f5c23016f83b6858dd68f25ffb2fd13be61eef2b811e9c994c7f1;
    stim[53] = 530'h1631e4cb7f2cdc7a8cde33a8d3864bc4739184f037af47b911679c3baf449f008a60246d2233f46030715812a774cc8b6d6e94b2a32a9b363dff9c801fe86c9b49da4;
    stim[54] = 530'h10d371707eb12463934bbdf0230c417789869881a50bb3fc52d4eb99f6204dbb79e0a9acef762d02e86bb7dffac4a98779442f7601b20c25d89b0d6bfa384ddafb37f;
    stim[55] = 530'h04e4593182d5e5f257beeb6bda8cf8606e69794951fa8332d569642bc4445c6d4757570130b9825f578f48a8dd9adefce27cf4d0de90498ddf09d19a9898c0c9db5a7;
    stim[56] = 530'h0a8b7c79a234366fd99caef8279810749d3e72130677ffa8932dd4798737edb76fe9d97f3e9208501e75761d3a8e2318e9689ff9baca6ac234afbf26f6080f3ca1b9b;
    stim[57] = 530'h058de4242e30fe4382d02a615df7ef38230ababa0a200a4efc0b1675e11dbea017cb5643a473b85fca7b51da586bb17058ba28f0434ee424fd7e53a09dc8b5713f653;
    stim[58] = 530'h0dc3004d341619249435a616c7f051119214f0e771b5a972e59611777ce8c58126835424660e10513446b398aa5a44cb32db9e383be635a2438be69536aa3ad3579ba;
    stim[59] = 530'h10fb0e5ffda06b6c1258df0065bd355c3f1e8d6cdfd821170ac28b2be2d1da1f8acfcce3c0606702801d645a33fd8f21343adba2eaab5654c323aac4bac1ea6bd38d3;
    stim[60] = 530'h112e2acfeda5765c99f7e78f5561d66f5a6c945de5e972f6c59362bd6716277c005a0d5feddf08fe4b404100c54472ba3b3ac76d446f01888ea911803c8c17cd7d8c9;
    stim[61] = 530'h15e32fa59bdf14d9650d39ee3927b41283a0d3e60153a65c5355360cb7d7ec76aac0574fe2feb4fdd23df5c1d0daa2a92ff4638856e64840b4b9731372f27c52226e9;
    stim[62] = 530'h0ff03ecba0bfa723ec319a25f19d4a70d7847fb2331d863bf1223ccf9749ced9d230c24e9f66950a7a2d9d0f6029b869af8791584af650d711171b56fd3932ab53074;
    stim[63] = 530'h01e4467c929895b8a5792e9eccc8a8688016a9a440974979d0517d54e5e81d4899b83c705d96c34cd2469c5b6d4d109cd737aa170d003473e91958c44870cfde96ec3;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h1021a36f0;
      expv[2] = 33'h1df9e28b8;
      expv[3] = 33'h07e51882c;
      expv[4] = 33'h0510f2c24;
      expv[5] = 33'h1cf01e134;
      expv[6] = 33'h047419ae9;
      expv[7] = 33'h1b8863cc8;
      expv[8] = 33'h04f69bbae;
      expv[9] = 33'h1da8649f8;
      expv[10] = 33'h19304bbe7;
      expv[11] = 33'h0f3a4f49e;
      expv[12] = 33'h07cbd9e60;
      expv[13] = 33'h1202ada3d;
      expv[14] = 33'h13b423640;
      expv[15] = 33'h147662549;
      expv[16] = 33'h024153fa2;
      expv[17] = 33'h1f8bc4dea;
      expv[18] = 33'h141cafba2;
      expv[19] = 33'h1b30aeed6;
      expv[20] = 33'h08a643d74;
      expv[21] = 33'h1431fac1c;
      expv[22] = 33'h050f402a7;
      expv[23] = 33'h0362a4212;
      expv[24] = 33'h1e263b7e8;
      expv[25] = 33'h135d8c46a;
      expv[26] = 33'h184a232a8;
      expv[27] = 33'h1902b5f8f;
      expv[28] = 33'h054a8bba2;
      expv[29] = 33'h1a278e273;
      expv[30] = 33'h1db890466;
      expv[31] = 33'h149402188;
      expv[32] = 33'h06ab63357;
      expv[33] = 33'h00d8708b4;
      expv[34] = 33'h18cdea1b8;
      expv[35] = 33'h1963b0b2f;
      expv[36] = 33'h097fccde2;
      expv[37] = 33'h039d33b72;
      expv[38] = 33'h11098b3e1;
      expv[39] = 33'h084a0c854;
      expv[40] = 33'h0aba80a5f;
      expv[41] = 33'h14d8e5576;
      expv[42] = 33'h051b1c5d2;
      expv[43] = 33'h1e5663665;
      expv[44] = 33'h0c9778aae;
      expv[45] = 33'h07a3ecba9;
      expv[46] = 33'h1ff1990ba;
      expv[47] = 33'h13a545223;
      expv[48] = 33'h1efe569b8;
      expv[49] = 33'h00bd5fc02;
      expv[50] = 33'h01410c82e;
      expv[51] = 33'h119f36655;
      expv[52] = 33'h15d51ef48;
      expv[53] = 33'h0277cc3dc;
      expv[54] = 33'h1e0114c05;
      expv[55] = 33'h184bb1360;
      expv[56] = 33'h0be4af7dc;
      expv[57] = 33'h1584695f6;
      expv[58] = 33'h1d402f96a;
      expv[59] = 33'h1c7077cc6;
      expv[60] = 33'h1745d556b;
      expv[61] = 33'h1abfdbbe0;
      expv[62] = 33'h0710adcc9;
      expv[63] = 33'h1d97417f4;
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
