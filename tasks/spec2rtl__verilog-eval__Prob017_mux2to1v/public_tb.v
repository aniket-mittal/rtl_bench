// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 201;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .a(in_vec[200:101]),
    .b(in_vec[100:1]),
    .sel(in_vec[0:0]),
    .out(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 201'h0a68eb33e528f8b66cd52a81554ae7d732139ad1f452c0582f2;
    stim[1] = 201'h00db3238ad16cf20dc269b2e903b90bcd2e7017d47e98a1b3d6;
    stim[2] = 201'h15b605b7230dac674fd4515ba93559bc1711376d44518748076;
    stim[3] = 201'h104550d9ef5aca929d577680ffa396f7548f147fd4054b4ec9e;
    stim[4] = 201'h09454c62625bae3e5a6cea095182fb997a201ab997d38a6dc6c;
    stim[5] = 201'h0139db9d9aa7466fd169bee26308fd1f6d354293a61462a92ad;
    stim[6] = 201'h08b4a9622baf78c23ac43565ce32bf3969e9b8043d16dfa4181;
    stim[7] = 201'h06b019bf1a79208e6b51f2bdf7683d61d6d3244ad7ea7778ea2;
    stim[8] = 201'h0815f8d1501d45655ca2a78cdc8de129a0ca2c449742e9ab9e5;
    stim[9] = 201'h10489434c4fd49186b8ef8857f61b64a66efe093f4479bae443;
    stim[10] = 201'h10aef5578b15f228d890ec587d6b5187b2c9977951057b5ed60;
    stim[11] = 201'h00367ccd9c9b130d657a5716ea5bf8288b71abb4da66bfb38e8;
    stim[12] = 201'h0dcbfdfcf67fdf5259a5bf04265e4bd9f44322365954b73f672;
    stim[13] = 201'h090dd9e543d7e34ed6b2ce945554254ef75113e6c3ec6e92036;
    stim[14] = 201'h15c6c29bc6f94d15acc53c5aaea474d4a72f3358151cff61270;
    stim[15] = 201'h1e8b49f191b5e5417749b6af328ae678f771d2a1a54c2533e4b;
    stim[16] = 201'h1b0400d170d5be37672677842f2c1e1e151ec48cd0719e472f6;
    stim[17] = 201'h13e60b2483c70577b1fc9e5153b69c856af9a9551146439e661;
    stim[18] = 201'h022d577f20c6bf68280801d1e837606c6e493e8e8a2d75af191;
    stim[19] = 201'h03f5f80fdbdf5d43165b95c127662ee454d07632376c3c7c26a;
    stim[20] = 201'h0200373563d6c3ebe302898cd89546ace536efd689c853c18d4;
    stim[21] = 201'h1883fa7a82b7a6251325cdc1202647b64be9321ee629e549721;
    stim[22] = 201'h066fe8812224c156a1724d32fed0bff11e9233b15689c37a485;
    stim[23] = 201'h1801d1c59b9f0ea34a7179e0c33706c8ad0e653dcb62ffd3e77;
    stim[24] = 201'h01dc5df84b5d3c6b14f6816a587d5d17b1d4715fcbb34e9ab63;
    stim[25] = 201'h168abf9133b7c2e94d376b99aaa52b3c9ff39731c2ee619cb7f;
    stim[26] = 201'h0dda7da3b49210f3c9c16cfec583297f0e93cd1e719349841ef;
    stim[27] = 201'h02179121ad426e112d7cee50b2c4208e7f70f4fc343eddef612;
    stim[28] = 201'h1e4d78f0a5df5ba215b9f59a24f0d120146a47844cdc5ad8c98;
    stim[29] = 201'h171d1363afc062dd547aa814d5a077a2fa64e5bfb29e98de5c9;
    stim[30] = 201'h1926796c4b3d291340daa4e303808be49c4e02f068129e1e5db;
    stim[31] = 201'h1b7c6623d79fdc37e364885824433f97df39cea5f16f3d7162c;
    stim[32] = 201'h1b44caf3f74dafb00796625c29f37b7a39ef9c837efbe4138dd;
    stim[33] = 201'h05e0438a02297705a0146c0bcdb6a110c6d3e0ea1ecbf316ecc;
    stim[34] = 201'h03cf56632292b8c4d09481714a300ff5b07b886cab2f0e44d21;
    stim[35] = 201'h10db56755494cc43339877c00d1690ae6ab32b5ff6efd32ec1d;
    stim[36] = 201'h06b8dcdff7f1e1e97fc0564d64276967395238888a4628bc3b6;
    stim[37] = 201'h16c60813a810ad5b686901ca4921e6243da65586aec1f24fbeb;
    stim[38] = 201'h05cfd25e8c955cce4c8412cf8aa94b461254722101f45ae08c7;
    stim[39] = 201'h182e3f21a68810f00e61095c939d031260ce132b27093d44d76;
    stim[40] = 201'h11f25f70ca4d9e2de3803b78061a64b2a752649db7efef1959a;
    stim[41] = 201'h11cf659654829ad8b0a6c583b48a79cd52d5ff2da3f4de53d5d;
    stim[42] = 201'h17a2080569c156b9f31f57f476d2d353b3b61d06fba6ca657df;
    stim[43] = 201'h07bea4d87ed6fc2adddf0c368fd7b581304a61d29a341dc7f46;
    stim[44] = 201'h040ae17b6deb4bfee35150010e572e9e6e690a61c6276eb68b2;
    stim[45] = 201'h0c7d7cb54289c93e3f57a9b2b5f8befc3c5aec7515bdbf60efb;
    stim[46] = 201'h0c946a554a85c9709a6dd952b4100cc22620930d5589952cc79;
    stim[47] = 201'h0277ef65b75212068b299ca817814348a5e9976907ba5d043e1;
    stim[48] = 201'h0390507827ad62b18ffb331bd5c359d3a81073c35556c691477;
    stim[49] = 201'h1d5af3360c37775b2774a060288ae6952cb229225302a0e87b9;
    stim[50] = 201'h1ddace521e0e03f20c99a2d30d2d2a5f8678270e171039966d0;
    stim[51] = 201'h168560be45554afc296f8364caf1e8eae4cf044784f25815e53;
    stim[52] = 201'h07e339ab35552adc1c1a8970aa84d3aa51c0d09e98087c415f9;
    stim[53] = 201'h0a24ee1a02e61cf3a75f94fa8e348cea39e0494296f9c22df26;
    stim[54] = 201'h1b0a990c6bcd5271daeacc6d38e187941b413fecdc8970c5306;
    stim[55] = 201'h1e4a2edc97b582f9ff173ef6945227d560cdad1a30ece944bc2;
    stim[56] = 201'h1ec370129217cb65bcdd43687047ebbc9bf8f25fe272fe725da;
    stim[57] = 201'h17da4cc6b2553abae7dad25094e1771048346d47903cb60b57a;
    stim[58] = 201'h0a404d9bda6c3946b0f19b0e73d71e8b7097f6a251bfd846b6c;
    stim[59] = 201'h02e6c4d032dbd0508ff0574731987375da6366c176336d1ccae;
    stim[60] = 201'h063e990d25d3024f6223ee34297e90c93af58ac8b2da8602792;
    stim[61] = 201'h116c4c0a14c321d2761e485f7b06a53ad3bf9e8a16b063e4478;
    stim[62] = 201'h1b4244564fb38718b6e9a94294f18dc3f8656d87622830a00b8;
    stim[63] = 201'h02529ba198895aa6b02c5d3628832a33dc855d644cb03f1563b;
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
      expv[0] = 100'h5347599f2947c5b366a9540aa;
      expv[1] = 100'h06d991c568b67906e134d9748;
      expv[2] = 100'hadb02db9186d633a7ea28add4;
      expv[3] = 100'h822a86cf7ad65494eabbb407f;
      expv[4] = 100'h4a2a631312dd71f2d367504a8;
      expv[5] = 100'h847e8fb69aa149d30a3154956;
      expv[6] = 100'h195f9cb4f4dc021e8b6fd20c0;
      expv[7] = 100'h3580cdf8d3c904735a8f95efb;
      expv[8] = 100'h46f094d06516224ba174d5cf2;
      expv[9] = 100'hb0db253377f049fa23cdd7221;
      expv[10] = 100'h8577aabc58af9146c48762c3e;
      expv[11] = 100'h01b3e66ce4d8986b2bd2b8b75;
      expv[12] = 100'h6e5fefe7b3fefa92cd2df8213;
      expv[13] = 100'h486ecf2a1ebf1a76b59674a2a;
      expv[14] = 100'hae3614de37ca68ad6629e2d57;
      expv[15] = 100'h45733c7bb8e950d2a61299f25;
      expv[16] = 100'hd820068b86adf1bb3933bc217;
      expv[17] = 100'hdb4e42b57cd4aa88a321cf330;
      expv[18] = 100'h1bb03637249f474516bad78c8;
      expv[19] = 100'h1fafc07edefaea18b2dcae093;
      expv[20] = 100'h1001b9ab1eb61f5f18144c66c;
      expv[21] = 100'h1323db25f4990f7314f2a4b90;
      expv[22] = 100'h685ff88f4919d8ab44e1bd242;
      expv[23] = 100'h9b83645687329ee5b17fe9f3b;
      expv[24] = 100'h3eae8bd8ea38afe5d9a74d5b1;
      expv[25] = 100'h52959e4ff9cb98e17730ce5bf;
      expv[26] = 100'hc194bf8749e68f38c9a4c20f7;
      expv[27] = 100'h10bc890d6a1370896be772859;
      expv[28] = 100'hf26bc7852efadd10adcfacd12;
      expv[29] = 100'hd03bd17d3272dfd94f4c6f2e4;
      expv[30] = 100'hc045f24e27017834094f0f2ed;
      expv[31] = 100'hdbe3311ebcfee1bf1b2442c12;
      expv[32] = 100'hf9bdbd1cf7ce41bf7df209c6e;
      expv[33] = 100'h2f021c50114bb82d00a3605e6;
      expv[34] = 100'h1807fad83dc43655978722690;
      expv[35] = 100'h8b4857355995affb77e99760e;
      expv[36] = 100'h35c6e6ffbf8f0f4bfe02b26b2;
      expv[37] = 100'h90f3121ed32ac35760f927df5;
      expv[38] = 100'h54a5a3092a391080fa2d70463;
      expv[39] = 100'hc171f90d3440878073084ae49;
      expv[40] = 100'h8f92fb86526cf16f1c01dbc03;
      expv[41] = 100'h453ce6a96aff96d1fa6f29eae;
      expv[42] = 100'h6969a9d9db0e837dd36532bef;
      expv[43] = 100'h3df526c3f6b7e156eef861b47;
      expv[44] = 100'h20570bdb6f5a5ff71a8a80087;
      expv[45] = 100'hfc5f7e1e2d763a8adedfb077d;
      expv[46] = 100'h08066113104986aac4ca9663c;
      expv[47] = 100'hc0a1a452f4cbb483dd2e821f0;
      expv[48] = 100'he1ace9d40839e1aaab6348a3b;
      expv[49] = 100'h45734a96591491298150743dc;
      expv[50] = 100'heed67290f0701f9064cd16986;
      expv[51] = 100'h78f47572678223c2792c0af29;
      expv[52] = 100'h4269d528e0684f4c043e20afc;
      expv[53] = 100'h512770d01730e79d3afca7d47;
      expv[54] = 100'hd854c8635e6a938ed7566369c;
      expv[55] = 100'hf25176e4bdac17cff8b9f7b4a;
      expv[56] = 100'hf61b809490be5b2de6ea1b438;
      expv[57] = 100'hbed2663592a9d5d73ed69284a;
      expv[58] = 100'h52026cded361ca35878cd8739;
      expv[59] = 100'h1736268196de82847f82ba398;
      expv[60] = 100'h31f4c8692e98127b111f71a14;
      expv[61] = 100'h8b626050a6190e93b0f242fbd;
      expv[62] = 100'hda1222b27d9c38c5b74d4a14a;
      expv[63] = 100'h419519ee42aeb226581f8ab1d;
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
