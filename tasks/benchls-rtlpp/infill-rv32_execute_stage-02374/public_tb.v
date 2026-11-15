// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 275;
  localparam OW = 143;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02374 dut (
    .clk(clk),
    .reset_n(in_vec[274:274]),
    .stall(in_vec[273:273]),
    .a_decode(in_vec[272:241]),
    .b_decode(in_vec[240:209]),
    .offset_decode(in_vec[208:177]),
    .a_rs_idx(in_vec[176:172]),
    .b_rs_idx(in_vec[171:167]),
    .regfile_rd_idx(in_vec[166:162]),
    .regfile_rd_val(in_vec[161:130]),
    .pc_in(in_vec[129:98]),
    .rd_in(in_vec[97:93]),
    .branch_in(in_vec[92:92]),
    .jump_in(in_vec[91:91]),
    .system_in(in_vec[90:90]),
    .load_in(in_vec[89:89]),
    .store_in(in_vec[88:88]),
    .ld_store_width(in_vec[87:85]),
    .cancelled(in_vec[84:84]),
    .add_nsub(in_vec[83:83]),
    .arith(in_vec[82:82]),
    .cmp_unsigned(in_vec[81:81]),
    .cmp_is_lt(in_vec[80:80]),
    .cmp_is_ge(in_vec[79:79]),
    .cmp_is_eq(in_vec[78:78]),
    .cmp_is_ne(in_vec[77:77]),
    .bit_is_and(in_vec[76:76]),
    .bit_is_or(in_vec[75:75]),
    .bit_is_xor(in_vec[74:74]),
    .shift_arith(in_vec[73:73]),
    .shift_left(in_vec[72:72]),
    .shift_right(in_vec[71:71]),
    .extm_update_rd(in_vec[70:70]),
    .extm_rd_idx(in_vec[69:65]),
    .extm_rd_val(in_vec[64:33]),
    .clr_load_op(in_vec[32:32]),
    .ld_data(in_vec[31:0]),
    .rd(out_vec[142:138]),
    .update_pc(out_vec[137:137]),
    .load(out_vec[136:136]),
    .store(out_vec[135:135]),
    .pc(out_vec[134:103]),
    .c(out_vec[102:71]),
    .addr(out_vec[70:39]),
    .st_be(out_vec[38:35]),
    .retired_instr(out_vec[34:34]),
    .misaligned_load(out_vec[33:33]),
    .misaligned_store(out_vec[32:32]),
    .misaligned_addr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 275'h301d8d0e1d37404672922f6a9e6fe09eb9e8f339dbacbc88db089e4a6c4386daf1171;
    stim[1] = 275'h25aaf6b0767499c9d5a347cc87c3016a1be68535da50827cbe3e90a28b93ddbb2904d;
    stim[2] = 275'h57347ecb34fa8147b3ed663d012755f9f4f236dfba0ade16d7673b531f558f31a363c;
    stim[3] = 275'h484a003dadac3c3c440fc526605399f60e63dd70e9b38fc9490760a3ac2e8a754c1fc;
    stim[4] = 275'h46504da0710fdb08a37eb857b61b47f7d5d792fc9176de5f0881dba5aa54b445bb627;
    stim[5] = 275'h51b3f741093cc5c63eea96d89a6bb7baeb30df5dc5379afcb90101fbaf749c4722c1c;
    stim[6] = 275'h49f47c2c98ffbb5e84b1ecd550af915ff97be9e6bbc6b9f57c4c3e228dd6562017f74;
    stim[7] = 275'h6938df76f4a2db7e785e6adcfba11c6216a81e615b3c5252bff6c943b8f93bf475083;
    stim[8] = 275'h57cc58e240fb33024856ab92bc64968bd042630cf0614e227ad5908a90085207347d0;
    stim[9] = 275'h634d0e881d9d28e8e328c8e46b9b29d84b67e9ce1f6663b915f66749871253701ad8c;
    stim[10] = 275'h6ef21d85d176cb95e36336947cfd24760368d827d84b1b74f13a3dec1ab90d8f39b3d;
    stim[11] = 275'h6282bc195dd97aaac54f2bd441239ee358575ed13386b9e653ea96836fa2b897f5d2b;
    stim[12] = 275'h78453645df672cfa1d2a1b083ce872ee30619195cae7dbbe4079b13acb52ca72bc753;
    stim[13] = 275'h53c340675dae98e4b367dd01c03a8a059d63de9c3a254baec6cfe3570dfa3e013e4be;
    stim[14] = 275'h7c905891a78426c21a30a875823a64ec1022976a196879b916291d5b16e899852ffe4;
    stim[15] = 275'h7763bfbe5b6c90602b38b33b689e8602a25bd7340d07f6ee2db925574db07bd2a4221;
    stim[16] = 275'h43558361e621e3a21a0578775cd299e766f7229b5a5c74631895ccca5a4ae7402fd54;
    stim[17] = 275'h71f6d8a5dda2192aea8264e9ecdd2b8871f41f51d41dc48adc9fd91ae2d34db191122;
    stim[18] = 275'h4d564c5cd7a881d2fdb68ec7c918f3efa3d51039c22e21e96b97ac23fe94cfbef2a77;
    stim[19] = 275'h50b30ad44d918e513920a30596c812e7be5d693bd7071be81cd79037230193bc8a02c;
    stim[20] = 275'h66bab3de8157576040feca9fb2a85544960dd7006e95b9924559385b9024b1b93e352;
    stim[21] = 275'h6aa049c0fbac559f751c1f0b771d325d638c87ca6b2591a8390af617eddf7a0feef9e;
    stim[22] = 275'h660f45c62c6e7616cd46c4f661e4ce97682eae90e77c124f1f6dc00ea804d9629a1bd;
    stim[23] = 275'h409822f51adbabda978e19dd0ed0717b3e0596816f4b095e4c0b37f3dbd4a208bc65b;
    stim[24] = 275'h6f3a2395ea8d0f5ff10a911829ba351e6ac2f68dfc20ca7e252af7310317cc36a335e;
    stim[25] = 275'h444ca5deae0cdf322152b2a7a9f943ae60c8589dfb2cdd903e27d6ea479660de4f810;
    stim[26] = 275'h49fad6802911cecbf2d48e95e8898b316f02ba051ee4cc443baf47bce06f7377d3774;
    stim[27] = 275'h61a6869ff2c3c38e92ac5c6bae69de9e830fbb0b3db08b08cb70a4206b54d94723ae7;
    stim[28] = 275'h45743a939fb26aa521da2c45f5feabec8bad58a91f00f1be24e12edc47ddb4f2178c7;
    stim[29] = 275'h680b0a97d5d9064014c1256ccc0928bd2b445523ea565878a42b7881c382fe64a1cec;
    stim[30] = 275'h4e11ee37e25272333ad180dc91bc6364dd9f78e84838f7de9c80b81db097dbde15017;
    stim[31] = 275'h5ece43eb1519c00253d0a57c375863a698ddf09778a893f1669aec1651ce612e352ce;
    stim[32] = 275'h59ee77e88b9a92a13404eeea65bd484a71414a396691c58fe43f4ac04c47a606f0142;
    stim[33] = 275'h556c37b02e37c5df18cb0ff6296abc99660daac6f7b3f0e6ced6e25c4b0164e411b84;
    stim[34] = 275'h43a125b409015c7d4088910a0ac590714afbde5987f72e036227efe7e75dfbc0482a3;
    stim[35] = 275'h7d89a769dd3f1bae238971fc4d769d19331e0f7746d04a5b20e3e1365d8d26ad9236f;
    stim[36] = 275'h76ee6bc5ebff9c3a57b7cda4d5d8d05291d9471ca696907e61aef7b77940b4f6536f2;
    stim[37] = 275'h50082e3121c325517b4cef3c8b8146f09d1aaefa9e1e523d3641cce1627929da166a9;
    stim[38] = 275'h5626e9fd3079e46c5c59c18c462887af54f69734ff8ca6096afabf23b13bd090b00d1;
    stim[39] = 275'h64c02284f66f2c2fc0ea3f38b3dbcb4f6841f8a2bf20c64f025734c6821a58f9097ee;
    stim[40] = 275'h6bcb5e08f45bed2f89d0d09d62a6e1c49041b5a8038fda2754bbc1324489463441cb6;
    stim[41] = 275'h641bf20a38bccfcb985903a20db34ca63d7ced93ad0d9ee017f2385677528dde69363;
    stim[42] = 275'h41d137edddb0848cc1272471a4d91fa5dd499c44c7e4b571ff7236ac49083ad129e44;
    stim[43] = 275'h64a0d99284d3b791c405d67bf5d4cf77357135d926a67969fc2980765c625acf0e578;
    stim[44] = 275'h60b26da77f475394557c595fb58bd1c882f819c6099c329cc09a5dda082fbc2fe2265;
    stim[45] = 275'h71349287b195ddc485be8eb0916e6b9dbc27f5450990ca6bf87836cc39c95f348ebf7;
    stim[46] = 275'h6802a27223d5d48aa6b905ec782fb16073060c3b5aedbecc94bc4b189067874377fb9;
    stim[47] = 275'h573aa5d97299d1b23dc8775720c122fc4811ce4e7b0520ac3c6a8ea8ed719ee9e36f6;
    stim[48] = 275'h6b4c979f973da9c76bf76c14e38a02f48438f335b0502adea361ff23ff369a7febe2a;
    stim[49] = 275'h7bd82fc27bb3505218a2e9461f53cbc5be331c08f48d40270d4c3a7644908d944e7f6;
    stim[50] = 275'h56e03d847b495efb6e9b4d8464f803d47021c86d830fa05fbecc00cfa8c19686e9387;
    stim[51] = 275'h71a08bd364ae71e9b0c845b9d4ac035a41eb2705fca563d5ee1ca7dfb77a1b8810b08;
    stim[52] = 275'h5bd8da2d484f92ad1d046c5c77ae581894a964563d8a13410bf0c985836def258af45;
    stim[53] = 275'h54d141f3183da9bd8996a2a1898f47bc45c781d960e1ccb4160d85425d87879583b39;
    stim[54] = 275'h798c7b26fb2098bb1918360eb369479244a1ac49b9a70e0be211a8933413f3678d420;
    stim[55] = 275'h712ef1187c8c8379e38899c871f9ba13bf6beda357a61f44af308d5c737fb8f7dc01c;
    stim[56] = 275'h59ba311798c7cfe6203426d4fe861de9487c443e9f0e9497f77a6af5c134f0030c867;
    stim[57] = 275'h49ac15dd1898c6bde025e696b1bd204d43fdb87211678858a082c7cbc919f4524dc75;
    stim[58] = 275'h751cf176e8a4a63e771b65d6fff18e4385dcebe5d079424ef50c2d4cb8dfb768a6923;
    stim[59] = 275'h557f463681d6762bb0d4b281fb65b42b9411ed10541a519d369e10604a299ad7d2216;
    stim[60] = 275'h4e4c9e7f8cd9076fa784e81c4954d0bda3dcf84935946c1808927329c721ed18ea7af;
    stim[61] = 275'h637677f7ff1172b8eddc7bcc1794e6ff22e4a4fa59a9a9a730347a73ee9ccecbea3b8;
    stim[62] = 275'h72680de74857d76df11c8f01396ba5a51ef65d96c6fa4653f4ccbc2aa80ad8d052801;
    stim[63] = 275'h771fa2689b9d1b13c6c72356c65f9d28558d5184c396e822fb19730804092654780ed;
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
      expv[0] = 143'h00xxxxxxxxxxxxxxxxxxxxxxxxxx157de3c4;
      expv[1] = 143'h00xxxxxxxxxxxxxxxxxxxxxxxxxxda71f3e7;
      expv[2] = 143'h00xxxxxxxxxxxxxxxxxxxxxxxxxx590f2841;
      expv[3] = 143'h643d750d09ed4c7d562c8794207c62ce2b20;
      expv[4] = 143'h6e57d8f1e7828eb0ba2c879420084e782fc0;
      expv[5] = 143'h005d80a2a45d7f7ea3a73c17e07884f470cc;
      expv[6] = 143'h02ebc2f41c84c31500427a38667f7533480e;
      expv[7] = 143'h040bd0de2c788a37593a99a406780cba529e;
      expv[8] = 143'h588bd0de2c250ee3e4ba99a40662011823a7;
      expv[9] = 143'h3067748f0d422a4021008c11d26433aebb63;
      expv[10] = 143'h4ce7748f0d1d261c49008c11d24392aaa0d1;
      expv[11] = 143'h4c67748f0d01a3a46e808c11d2783e8f3f6c;
      expv[12] = 143'h4c67748f0d12a505ba008c11d27bab7a8a6f;
      expv[13] = 143'h4c67748f0d6378252f008c11d2783958eb48;
      expv[14] = 143'h7e45c7652f8d5c37e89cac75a47cb6080839;
      expv[15] = 143'h7e45c7652f800000009cac75a41214e397cd;
      expv[16] = 143'h7e45c7652ffdbefff99cac75a47aead7dec9;
      expv[17] = 143'h3825dd9c0fb329692bf56bef6418e3c9ec7d;
      expv[18] = 143'h7825dd9c0fe46b8b4d756bef64185866d924;
      expv[19] = 143'h771d38791d308ffa532c336c92084e9d6ece;
      expv[20] = 143'h7079126495c0dc8c06274eb766253dcbf3f1;
      expv[21] = 143'h7079126495958d71f9274eb76618fde34662;
      expv[22] = 143'h7079126495aa810601a74eb766209ab055e4;
      expv[23] = 143'h3879126495803aa013274eb76678c131e690;
      expv[24] = 143'h12edcf3b3e16f1dc6a6098f3487c0225a570;
      expv[25] = 143'h126dcf3b3e28200c57e098f348782cfac432;
      expv[26] = 143'h78496614435ba91e59967d621824e67b28b0;
      expv[27] = 143'h6a4c3295301ef381bd967d62187ca297185c;
      expv[28] = 143'h6a4c32953051a928b9967d62180b3a7336cb;
      expv[29] = 143'h00149a94e2ffd9eade9d399b647ce6618024;
      expv[30] = 143'h00949a94e2800000001d399b6409641f7d61;
      expv[31] = 143'h025013840b4fc9fbfeb20fbeb07c94f74b39;
      expv[32] = 143'h004fa00fb526d20fa34a7ba59c106f9b3697;
      expv[33] = 143'h6a16242a26ab01311eca7ba59c7a71ba3d32;
      expv[34] = 143'h5c0e8ff63c89712c05b8dd1e987c214db5f0;
      expv[35] = 143'h7c3ed554163f9f9d77b8dd1e98180898cb30;
      expv[36] = 143'h7cbed5541676feffbfb8dd1e981b7531cb55;
      expv[37] = 143'h5c3ed554165edde502b8dd1e987b5aa8eb6d;
      expv[38] = 143'h244b28f92ec72c2d812d5475b67894055c4b;
      expv[39] = 143'h4c1fd1054a16b41643ad5475b6402d530dec;
      expv[40] = 143'h641fd1054a531a08692d5475b67aace17532;
      expv[41] = 143'h641fd1054a5dbdc365ad5475b678f5611303;
      expv[42] = 143'h641fd1054a7bff7fffad5475b64087d098b3;
      expv[43] = 143'h6ab60dccc6360dccc643e84c584045358073;
      expv[44] = 143'h6a360dccc625d2449143e84c5840b1763838;
      expv[45] = 143'h6a360dccc67fe704eec3e84c587ab79909c1;
      expv[46] = 143'h6a360dccc60b29c130c3e84c581875dd42f4;
      expv[47] = 143'h0a360dccc62c62419e43e84c5878a818e984;
      expv[48] = 143'h002751de2e168dd1ad540c74c27dba201da3;
      expv[49] = 143'h002751de2e7df6ff7fd40c74c27aa3d8c843;
      expv[50] = 143'h042751de2e69d91242540c74c2792bdc5846;
      expv[51] = 143'h0248a671ff033ea30615ee2c227913468c69;
      expv[52] = 143'h1648a671ff1f7edde815ee2c2278c6ea344d;
      expv[53] = 143'h0010a1b3696f7f6ab515ee2c2210f33f24a4;
      expv[54] = 143'h33b43baec21509761e799f92527c952589ac;
      expv[55] = 143'h32343baec21b3c6a10799f925218a5bc5706;
      expv[56] = 143'h32343baec240320461f99f925279cf72bf63;
      expv[57] = 143'h004a0803f6ca0803f6e7b95fb0784e8fe39d;
      expv[58] = 143'h128913726be6f35ff7a747f1ce1461c2ba6e;
      expv[59] = 143'h060913726bb532e37ea747f1ce79329fc5c3;
      expv[60] = 143'h405d56f188c18128a6194fe2e078ae8c34de;
      expv[61] = 143'h588ea60b99bb767dfed7461a6e268a979e1f;
      expv[62] = 143'h0c0ea60b99e9cfba7357461a6e791c24e743;
      expv[63] = 143'h140ea60b99f0aaa02b57461a6e60ef362dfa;
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
