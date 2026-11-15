// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 193;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_144225 dut (
    .clk(clk),
    .rst(in_vec[192:192]),
    .key0(in_vec[191:160]),
    .key1(in_vec[159:128]),
    .key2(in_vec[127:96]),
    .key3(in_vec[95:64]),
    .nonce0(in_vec[63:32]),
    .nonce1(in_vec[31:0]),
    .out0(out_vec[127:96]),
    .out1(out_vec[95:64]),
    .out2(out_vec[63:32]),
    .out3(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 193'h17f4830e549dbff6a80fd485875600db092315b794eb150c5;
    stim[1] = 193'h19240a12435525ac51917684be27d9274c2b66581325e9229;
    stim[2] = 193'h056b71e2f737dee6982a2d839044a50b5fa64c4a126831268;
    stim[3] = 193'h0bf921b99e8b51f9f5172210c384d254a4e098f5c3a237b17;
    stim[4] = 193'h0324f1e1965b860cfc03f7e8e7f706107fc478cef25a8273c;
    stim[5] = 193'h045d8d57db0d121a58fd7862f9c165d2bab97b815bea87f00;
    stim[6] = 193'h0e3a5e649eba58e40ab5a004d103e3a25066a5837f6e4c493;
    stim[7] = 193'h0809881368d222b610e4af9cb28d8fd7338f24b5841cac117;
    stim[8] = 193'h00547b2857ee40c7f8cd28689b38523e7aa064603d4838cad;
    stim[9] = 193'h0a90a60eb7680efe3c628802f134eb40721623d65f5a2c9cd;
    stim[10] = 193'h0cf5e6789b2c157908856794ea2ed9c1beed4f5aff8c1dfe0;
    stim[11] = 193'h077751017f9eb76e4798d035627b6d12d7162667897cb580c;
    stim[12] = 193'h03ca29034e7b5bf650d5482f9550a659b94df6299c894cef1;
    stim[13] = 193'h0708d4138b5fdafa092ccabc710cc603614914313e5934a4e;
    stim[14] = 193'h07cf8bb233958cdcd96908a3dac9ac068b50d2799883b4d05;
    stim[15] = 193'h06d75c15ff844604befcc711ffd7d957a4f3dede98c7adb6f;
    stim[16] = 193'h0e6fd7be182c1d7538f35da791e628e7e9e103c5f892e0f75;
    stim[17] = 193'h0fa0eb4903717ed2f151ff83ebe55ca2db816351d7334e440;
    stim[18] = 193'h0230dd5e939900bade7f59b80c34424bdc9594ae82534f989;
    stim[19] = 193'h0b34fb8b61ed697cb640b7f8372ed1c42dde8dbfe30e5cea9;
    stim[20] = 193'h08291c09185bd9da6fd031cf40b1cabb10f898377161dd0eb;
    stim[21] = 193'h08a345ca22a5899b6628985922fa24c56222b16167aaa6ced;
    stim[22] = 193'h096077cdf76bef466f00d4264bf4df9bb4b7801bb1addfff5;
    stim[23] = 193'h0335ddb49a1eb4f1b3993adc781a45dfd07cfc713b906fec9;
    stim[24] = 193'h0357e2932fc9f3f050701dfcfaf95e1d2eb1c917d34548660;
    stim[25] = 193'h04aab1eb17fdb7d9b86e252e841de312b140c5c0cb5822492;
    stim[26] = 193'h0727aa645f98f1dccbade50e40b1f5a28c1f14d8d3167ff81;
    stim[27] = 193'h096721f9f4e014876e5ffb0e1f92e1d27acf669459264e4ec;
    stim[28] = 193'h02b78e879493a131b6affb6c71c47d01761eaf5112e5bd72d;
    stim[29] = 193'h0111b5948ff9ae26b9f3c6cb9afa3eba1ab0be2adbfd6e460;
    stim[30] = 193'h052cd566f44cacd001b20e835e98d925153ec33b41ca9ed6b;
    stim[31] = 193'h0db0e7786c46f4236161707f4bb8c8e71813feee6a6d9ba4d;
    stim[32] = 193'h0ba168ae947e5150b35cb0495894cfc5084fd02bdd80bb3d2;
    stim[33] = 193'h05ee5f59f74d73e84dcb6b3be618001fe9fb91b1ad96f7ef7;
    stim[34] = 193'h082b769606b7f7ac10c95ede5a3f6ac70014faa0c11c45192;
    stim[35] = 193'h06a287e1d4834bb01355bf512ad75a430752da9571f80cf5c;
    stim[36] = 193'h09e17714e29ce69e76dca547dbb3bfcfbec634e931b3c3f52;
    stim[37] = 193'h0d4cc6e34f07c44331d18026dc5d628236aaeb270db25f9c3;
    stim[38] = 193'h01ab73ef2b86ad8e84f39963aade2f5d513bc7ecfabc19148;
    stim[39] = 193'h0d8693ba47e9497a95c2b5d3d83eb324b968fe872e2d7aeec;
    stim[40] = 193'h014fca69f028a7083fe7515d61bdefff0983886876a7e94e8;
    stim[41] = 193'h025ad9062f01ee0796da0f8627f08998ea72eca2b3240fd24;
    stim[42] = 193'h0b2930775e861666e1ef04055eedebfaa3c97bad1a37046bf;
    stim[43] = 193'h02678fd3b6bdbe5ee7d46e77903976be02bcd604f1a02cade;
    stim[44] = 193'h0913973d6c94d5a87ad4f655442d804641cb401d9afbde4c2;
    stim[45] = 193'h0296798edd266f6240b9b703d8297a5bfe2a531a1e1474995;
    stim[46] = 193'h057b7b09595e68dab214d3277884bc282ee922b1b2d6cc7ac;
    stim[47] = 193'h0e9c7037ce605e05ddda433089d0f18ba4264c0a9bf0d3d2d;
    stim[48] = 193'h0a7bbe5a1669749137a84f6f174974de9565942867fee56fa;
    stim[49] = 193'h01af60f1cc60fe7c96a7d7073ee1ccd6d60bb39890206c120;
    stim[50] = 193'h04da454558a3ec44d7581a33d8607d5ca4875d1c4279eb38c;
    stim[51] = 193'h06e7cf392b05266a518887aac768881a2d27a00beb8c8f6ec;
    stim[52] = 193'h09af75a47c132669550288a3090e676fa13f33de865668e22;
    stim[53] = 193'h0cb1916e7565e2c29c1322e444bfccc446bf851d5f33d0947;
    stim[54] = 193'h07d0d462355d1b2213991d2c0c279058ecc14e4f15a32ad56;
    stim[55] = 193'h0bf65753e17544fc753fde9fcf33061c0fe5d4ab95667c1ad;
    stim[56] = 193'h0da31be788db0bed2e8f8fa2c74beca0695117eb38842e520;
    stim[57] = 193'h08f01c50fbaa0ca20832b8d94a05d9ff14898cbc28f380ca5;
    stim[58] = 193'h0a09dec5651add7a8bfe192de29c0bb1419e36ce5a4f5a86a;
    stim[59] = 193'h0dcf176bad74a1c7f56a9b092de8f41ae1de5fa6cb7583f90;
    stim[60] = 193'h0038c34b51e6474edea262782319d95857fe1cc9106cab08b;
    stim[61] = 193'h00f0d4fae15c0b396876307605820aee93d214e9c7c84e1e6;
    stim[62] = 193'h06f61be0d8253669a8aa633c12a8b2443f404e8f3b6912214;
    stim[63] = 193'h1b5c01b8b2d83a8a0091f8b301bc61ffc193ee46df4c33c7f;
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
      expv[0] = 128'h00000000000000000000000000000000;
      expv[1] = 128'h00000000000000000000000000000000;
      expv[2] = 128'h00000000000000000000000000000000;
      expv[3] = 128'h9240a12435525ac51917684be27d9274;
      expv[4] = 128'hc792fbe9bf223b8dfb94fabf23665682;
      expv[5] = 128'h86b53776da5424781efb5141ba854994;
      expv[6] = 128'h61095bee94895a5cd9809ad5d4a613e5;
      expv[7] = 128'hf592b64acc2711aaae26aeba2b6ac9dc;
      expv[8] = 128'hc1b9c7f47d47d059d991789640331bde;
      expv[9] = 128'h3f01984d2995795719c4947436b1611b;
      expv[10] = 128'h689711a483aa0c875075f58f945fccc4;
      expv[11] = 128'hec411e2b6ed4d071e4d5c253323fda69;
      expv[12] = 128'h5b15ee9c8479a94117159cbcd04cddbe;
      expv[13] = 128'hdf8f97dd8fb52ca0e7627a7ac87dbad2;
      expv[14] = 128'h6f44c47d49dfd007afe0354c8e0644a7;
      expv[15] = 128'hb9249484874760923de679f3fc27366e;
      expv[16] = 128'h406bf516096dd7273a0db0610a986a68;
      expv[17] = 128'h49d9cc3dabf871a044a61ac90e08fc54;
      expv[18] = 128'hf5d23ddd710999c152af171d6ea11eb7;
      expv[19] = 128'h66dbd79e39328559c15035d409184792;
      expv[20] = 128'ha00e5cf724774b07ca687d660854b9f7;
      expv[21] = 128'hc485a7fe058dceccd2bd375d31ec573a;
      expv[22] = 128'hca1376ca23e3a53804a98e974fa5c176;
      expv[23] = 128'hedf71c02188f673b544f500dbf8e5c77;
      expv[24] = 128'h0686833d5e6a904513ddac846f909723;
      expv[25] = 128'h64f113824ea42c08836e43a7826a64cf;
      expv[26] = 128'hb3953f8a72f534d005d8a876e4af7695;
      expv[27] = 128'h268a745a29fd06f0ea881f0b4f2affcd;
      expv[28] = 128'h50877b4aa5f260a439b31ed80c2f8a74;
      expv[29] = 128'hf679dbee60d529b345e2a94c03b5091d;
      expv[30] = 128'h574f05a162a06b844997b269cb6373c8;
      expv[31] = 128'hb9ef7125628d34f114fb2631adf203d0;
      expv[32] = 128'h1c7ca6162397c063c2ed2a01fcaddf30;
      expv[33] = 128'h40146679fc4d37ddbf9b09315a937cee;
      expv[34] = 128'h3c619e56dbfa985f1a2e861fc8b6408f;
      expv[35] = 128'h185c36b5704e73abe2e4c6ae5dcadd3f;
      expv[36] = 128'h88aaaa6021898e9240afa3ed7d4a23c0;
      expv[37] = 128'haa3438f24fe3baa4bdf9c7ada09106fc;
      expv[38] = 128'hfa17f39677661f035e8acea9c3a98f2e;
      expv[39] = 128'h717e1299f596482522345dd7c9eb1a6e;
      expv[40] = 128'h67145abe556ce852ec1f78451550a85a;
      expv[41] = 128'hbc814310133d70080170209fc115d011;
      expv[42] = 128'hcfbeb31804854a8ec285f0b00990aa77;
      expv[43] = 128'hd443fda66af9b15acc169b27f90138e5;
      expv[44] = 128'h3f3daf000ceec8dac517d40cbeea1bbb;
      expv[45] = 128'h4c2c77da5b50a9778401efc718c8a101;
      expv[46] = 128'ha77d21511897da729cca90c8048d8b97;
      expv[47] = 128'hc014fbc34a442d1aa1581c5f5748d60d;
      expv[48] = 128'h0a5928ddd699dee1f8a0f26ca7f3b834;
      expv[49] = 128'he0f307bee529c391a094aaa0e2f30bb0;
      expv[50] = 128'hc61ccb4f013bf52a8387b65078e5d325;
      expv[51] = 128'hc758c0793c89cbd2fc6d8975113bc4b9;
      expv[52] = 128'h03e28c4b22b1de3d0da94e2ea0e51497;
      expv[53] = 128'h26946a88ecfc1d13ae8e62c546793ca4;
      expv[54] = 128'h1390879b281d9cf6f5079f69fcad5e5b;
      expv[55] = 128'h3bae2491ddeb9395f1b4fdc4d8f9c9c6;
      expv[56] = 128'h1999b826f264ca64caaec78a12d88120;
      expv[57] = 128'h0bfe828a7cabc114dd8748aa5aa7abca;
      expv[58] = 128'h88aa439eeb74bcdf382ef47438aa1b7f;
      expv[59] = 128'h741f007dd6c5b62470d90ff387b2a179;
      expv[60] = 128'h4ae4b6a1af0d6b1ff88bb16ccc1ad6a3;
      expv[61] = 128'hf9f221c0ff6b6127c4a6880fa96dbc07;
      expv[62] = 128'hf95d82e74961de756e144416c7723ed1;
      expv[63] = 128'h00000000000000000000000000000000;
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
