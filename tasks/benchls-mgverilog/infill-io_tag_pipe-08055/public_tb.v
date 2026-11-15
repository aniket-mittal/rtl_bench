// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 266;
  localparam OW = 254;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08055 dut (
    .clk(clk),
    .reset(in_vec[265:265]),
    .io_in_valid(in_vec[264:264]),
    .io_in_bits_addr(in_vec[263:254]),
    .io_in_bits_rw(in_vec[253:253]),
    .io_in_bits_wData(in_vec[252:61]),
    .io_in_tag(in_vec[60:51]),
    .io_out_ready(in_vec[50:50]),
    .io_pcIn_valid(in_vec[49:49]),
    .io_pcIn_bits_request(in_vec[48:48]),
    .io_pcIn_bits_moduleId(in_vec[47:32]),
    .io_pcIn_bits_portId(in_vec[31:24]),
    .io_pcIn_bits_pcValue(in_vec[23:4]),
    .io_pcIn_bits_pcType(in_vec[3:0]),
    .io_in_ready(out_vec[253:253]),
    .io_out_valid(out_vec[252:252]),
    .io_out_bits_rData(out_vec[251:60]),
    .io_out_tag(out_vec[59:50]),
    .io_pcOut_valid(out_vec[49:49]),
    .io_pcOut_bits_request(out_vec[48:48]),
    .io_pcOut_bits_moduleId(out_vec[47:32]),
    .io_pcOut_bits_portId(out_vec[31:24]),
    .io_pcOut_bits_pcValue(out_vec[23:4]),
    .io_pcOut_bits_pcType(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 266'h359a24c5c1795908a74d74a1aaf5d7554ac7bcc4bed60705dd914407e4156a22f50;
    stim[1] = 266'h3ef2bcdffbb970367c34e633d78bc0627bc144220eb834701cc11e06beacdc29f77;
    stim[2] = 266'h165e7834c1a8c6ca5c368d13ed49750f2f97a443371e8bfb5f97145a78421906d39;
    stim[3] = 266'h1519b4c6d12faae5dda2b52dcad3cb9104e8149a15c04b8c7dcc4a1069ab1cea03f;
    stim[4] = 266'h0e85035ac5ca4f959aa816bdd61eb771fbb2b189a6db39ee7f89771b5b1430961d2;
    stim[5] = 266'h1c801f032f96601b698c06c4ac86b4b5830661cf0fc81994c85ef427278bc31d2d4;
    stim[6] = 266'h13a329a9faa7e22cf6559f53f241673215972410282f74bfdead24e068e040652b1;
    stim[7] = 266'h156e83b4e88fc5f4006333f2d81250195044cae8e5694b479a6e8762fc7a92c1734;
    stim[8] = 266'h027df13d7a0689063e0fdb3aeae796cc2965404ad4d11e1c1bfd972133ecb8cf795;
    stim[9] = 266'h0e885f3a72cd509c580a4a6497ade1bfb4b25942cf523f79b9443e474e49530e3e3;
    stim[10] = 266'h0868bce46e68133850bd459dd823f3eb3831478810f1f1ed37c045066af3afed707;
    stim[11] = 266'h04af4dba79d45ddb1f9a79b539e8fe264b7324d35dc9287e3a3d61d30c4acc47d04;
    stim[12] = 266'h14eab7e0cd0d265e59351fbb6f379413755607ccef6e37ac54fc68527aa8f4a7afa;
    stim[13] = 266'h1d255dedbf9655ac83683739d9b67dd9228b7e67c2a63b732008036a6bb7721a76e;
    stim[14] = 266'h1f817293cdcd95c85b272bb4b5a358b75b98b0718089c8d5e49445ddc940c1a69cb;
    stim[15] = 266'h11e3244922d267846220936116e46f11b5f0fd0d1179da800edfe9c3ccb2f99c5eb;
    stim[16] = 266'h174ab8d0165bf646eba9d61d875414c3a7042840493ea1cb3c3bedbc2ca8b8e76e0;
    stim[17] = 266'h0dc1b8837d9949b49fa7ad4fc179204dcb4032db4390d048f166d83531ee0e25aec;
    stim[18] = 266'h0151e4171aac28117b1d5233c4fe57379294f46d9e6149e703628b2fc045698a256;
    stim[19] = 266'h11bb71772dc7ce616f08a7f3d7d9a8bf24886712f3688b213bb568a02c1cf2acf6d;
    stim[20] = 266'h289f63a2ce43454841f6d69d54fd92def0df015fcabd65a99136d285616a9ff8820;
    stim[21] = 266'h1d7aa623c151f1e3b3e2ba6ef5fe8a11bff6b7d05fb7f58dddf4f730fc9423d4cb8;
    stim[22] = 266'h0abe79422151bc56f1b26d2e77ae7c45e48d6aa8cc444fcef3ed5cc571e26eac9e8;
    stim[23] = 266'h1cd93c6809d73730560855fc21cd0f310ab3e971c00cf2057a730e191dfb105b501;
    stim[24] = 266'h1655627d49821b529eaff78381b5c1939b28615f63a9edbe6c9b3cbcefd8974ad34;
    stim[25] = 266'h191f46a4f54fabd9702402b56d993569098fe0393d77b15084b59d7c2de755afc7d;
    stim[26] = 266'h06a4784355dbcc77fd9a0ec97fd80ea6c0bacdf209160f0b7de0783758d21ef3e37;
    stim[27] = 266'h1e84ab21a253824e955545cce6f1843c44c96a45a8e5adca7dd31829bd82d09db0a;
    stim[28] = 266'h065385d3f3764406cad68c14dec45bdfc72552bb3eaf9f40bd7b9f207403a591931;
    stim[29] = 266'h0d924bc2dabd76a0b17fd620a32350265c48e601603cbbae3c3ff8766bc97b54f44;
    stim[30] = 266'h15e2f01fbd5d230f75b5153fdb41233bf58c8f69bf3fec2fe8eb37fad8664d93bb6;
    stim[31] = 266'h121cfa56ce7a1b09bbcf3be1767bbe2ea6e4c7a56bed3310248850bfb0aca11586d;
    stim[32] = 266'h050c0e1f6eab6e9bc463cf267b59a2442392dd2ae8a1fab581d80373061482f8963;
    stim[33] = 266'h0e5a826043e1e7bdccbe03dc93daf72337392de874744051d7cd6cd65fed24f5a12;
    stim[34] = 266'h16d291cceb53c60715131b4a460dcc27140e5ad3ce7d5da9db992ae33553e61dbc6;
    stim[35] = 266'h0c06c8f624648950a8414195e21f593a37dbf8e7b1958ce48eab1185f1609e2da57;
    stim[36] = 266'h0c020698954d5d7e0c9b789dab9f4d13942e63594486d10b16b02e14f6ce0309349;
    stim[37] = 266'h0e24e415ed20d6d88d5b92eb08517bc432c5cd299c83e661ab470e90b2d818c7d83;
    stim[38] = 266'h043d978b5f95579b5aeb579db935e84ab0c576e8f19028d6008886cabb0727b5c5e;
    stim[39] = 266'h151151abd6ac8b27722ad0876ccaa625a5d6001ecea793ee88f2155fa655dcd1f3c;
    stim[40] = 266'h0127fb43d56700419cea60fa0d858c2c86048f0dcea0a197796bb00baae582c2b14;
    stim[41] = 266'h067e46a96f71956eeb3cd2c370b25cf9d3fb63fa419ba5346d5606f36787476afa0;
    stim[42] = 266'h0d27a924be16ce6719aa4842a0a4347aa960b6e6a2faf1920704bc96aa010acfd97;
    stim[43] = 266'h0ebc08c1b81b52287a3bef00ca0dd53d4885f73cc408d0051cbddc88c0726d255c7;
    stim[44] = 266'h08fd29e631d4602cc8af4554072ea36dca2c78a3aaf6b022e606f45c21c42c8c3da;
    stim[45] = 266'h0650d7355e8ec0faa0b97ef3fca889365d345754fccdafeb342417211a6cb496808;
    stim[46] = 266'h1b41ef79c5ef2ced1be23b5b0f6cc0e28eb4181404e7443ea8d418c756290609fab;
    stim[47] = 266'h0fbc6770543bf90dc685c4ae7c199604299533521567509715a31f6d3664f9f54b8;
    stim[48] = 266'h0ef116070f94d35cd90102edf64606362d32c0381816e6c00293c8d1749af33539d;
    stim[49] = 266'h00cfea300963d8686027801322a82f45bbe0f83dbf1f261bcdc023bbb7b638a8b4d;
    stim[50] = 266'h0c3ebc8781a1aeecfd1b835a4fdf0fb24193951a66df866f3346de66cb74338990e;
    stim[51] = 266'h175bc69379943d5a77ca46f1395bf0cfe104442b6c13a4205d246653346ec3086c9;
    stim[52] = 266'h1ad466dff7e46b73e50506ef3b62e3bb54a260becdff855688ed1694f516fb8d40b;
    stim[53] = 266'h0a3b4563e9a48e97efdbd0d2acecb520f72ec609fe0128fdd89a53f199bd3cf61b3;
    stim[54] = 266'h1c7d343f27035860f72b9a9aa66f253b1071c5091351591a36db1698c5b4b84b148;
    stim[55] = 266'h164f1a86a0d7047062dccfe007e23ebfdae00ff8e1b4d28b2bb7bfd8ef941865d78;
    stim[56] = 266'h1d36b59567ce968b9f6932ec354bc0ccbbe2fbdb4c6619df4e4a10cde9e87164556;
    stim[57] = 266'h00960c6eacc4869e0680c751941292dc78c617beb118fee3c01c5d7ad9ad047e448;
    stim[58] = 266'h189a2c0fdc37525c239d4926380909f16e92fe38aaf042a3c531a277eacb9e03457;
    stim[59] = 266'h1f7f7a3456b538a30abb8eabc8ad89145a5f46370afdd596a087ab76409417a3769;
    stim[60] = 266'h16c4f07bc7fa3f16e53935b59b5251e5841314db65d675c4d499b34e888def148cc;
    stim[61] = 266'h03241c89f1e1ac6c1691474a6854d45bcee456c70692eae5cd507f44d1f99219531;
    stim[62] = 266'h0e6b0450a8615cd5f57ba9f5a8ba32c62546cbceed39acca6f41c75d4df251de12f;
    stim[63] = 266'h1fb3f2aba199a7fd9cdc75af52e9b3adcd0581e22f63870f31739668ac3da1e6072;
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
      expv[0] = 254'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxa2xxxxxxxxxxxxx;
      expv[2] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx8fxxxxxxxxxxxxx;
      expv[3] = 254'h1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx8axxxxxxxxxxxxx;
      expv[4] = 254'h1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx25xxxxxxxxxxxxx;
      expv[5] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxbbxxxxxxxxxxxxx;
      expv[6] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx7axxxxxxxxxxxxx;
      expv[7] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx92xxxxxxxxxxxxx;
      expv[8] = 254'h1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx43xxxxxxxxxxxxx;
      expv[9] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxcbxxxxxxxxxxxxx;
      expv[10] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1fxxxxxxxxxxxxx;
      expv[11] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx22xxxxxxxxxxxxx;
      expv[12] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxb0xxxxxxxxxxxxx;
      expv[13] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx34xxxxxxxxxxxxx;
      expv[14] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01xxxxxxxxxxxxx;
      expv[15] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx22xxxxxxxxxxxxx;
      expv[16] = 254'h1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxf4xxxxxxxxxxxxx;
      expv[17] = 254'h1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxf6xxxxxxxxxxxxx;
      expv[18] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx6cxxxxxxxxxxxxx;
      expv[19] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx45xxxxxxxxxxxxx;
      expv[20] = 254'h1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxb4xxxxxxxxxxxxx;
      expv[21] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx69xxxxxxxxxxxxx;
      expv[22] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx7bxxxxxxxxxxxxx;
      expv[23] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxaexxxxxxxxxxxxx;
      expv[24] = 254'h1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx87xxxxxxxxxxxxx;
      expv[25] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx9exxxxxxxxxxxxx;
      expv[26] = 254'h1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxcexxxxxxxxxxxxx;
      expv[27] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx3cxxxxxxxxxxxxx;
      expv[28] = 254'h1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx8cxxxxxxxxxxxxx;
      expv[29] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxcfxxxxxxxxxxxxx;
      expv[30] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxfcxxxxxxxxxxxxx;
      expv[31] = 254'h1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx9bxxxxxxxxxxxxx;
      expv[32] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx28xxxxxxxxxxxxx;
      expv[33] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01xxxxxxxxxxxxx;
      expv[34] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxb6xxxxxxxxxxxxx;
      expv[35] = 254'h1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx95xxxxxxxxxxxxx;
      expv[36] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx88xxxxxxxxxxxxx;
      expv[37] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx17xxxxxxxxxxxxx;
      expv[38] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx87xxxxxxxxxxxxx;
      expv[39] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx43xxxxxxxxxxxxx;
      expv[40] = 254'h1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0axxxxxxxxxxxxx;
      expv[41] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxd8xxxxxxxxxxxxx;
      expv[42] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx03xxxxxxxxxxxxx;
      expv[43] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx5exxxxxxxxxxxxx;
      expv[44] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxeexxxxxxxxxxxxx;
      expv[45] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx7axxxxxxxxxxxxx;
      expv[46] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0bxxxxxxxxxxxxx;
      expv[47] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0cxxxxxxxxxxxxx;
      expv[48] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx8fxxxxxxxxxxxxx;
      expv[49] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxe4xxxxxxxxxxxxx;
      expv[50] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx11xxxxxxxxxxxxx;
      expv[51] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx6fxxxxxxxxxxxxx;
      expv[52] = 254'h1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx33xxxxxxxxxxxxx;
      expv[53] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx8bxxxxxxxxxxxxx;
      expv[54] = 254'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx29xxxxxxxxxxxxx;
      expv[55] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx8bxxxxxxxxxxxxx;
      expv[56] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxdfxxxxxxxxxxxxx;
      expv[57] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx08xxxxxxxxxxxxx;
      expv[58] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx2exxxxxxxxxxxxx;
      expv[59] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxd1xxxxxxxxxxxxx;
      expv[60] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxd5xxxxxxxxxxxxx;
      expv[61] = 254'h3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxd9xxxxxxxxxxxxx;
      expv[62] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx3fxxxxxxxxxxxxx;
      expv[63] = 254'h2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxe3xxxxxxxxxxxxx;
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
