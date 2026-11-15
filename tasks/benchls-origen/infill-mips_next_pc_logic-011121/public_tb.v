// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 162;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011121 dut (
    .i_Imm26(in_vec[161:136]),
    .i_PC(in_vec[135:104]),
    .i_PC_4_dec(in_vec[103:72]),
    .i_Rs(in_vec[71:40]),
    .i_Zero_dec(in_vec[39:39]),
    .i_J(in_vec[38:38]),
    .i_Jr(in_vec[37:37]),
    .i_Beq(in_vec[36:36]),
    .i_Bne(in_vec[35:35]),
    .i_exeption(in_vec[34:34]),
    .i_eret(in_vec[33:33]),
    .i_s_rst_dec(in_vec[32:32]),
    .i_epc_to_pc(in_vec[31:0]),
    .o_NextPC(out_vec[63:32]),
    .o_PC_4(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 162'h36e6218c4a63982967114b4076dc5c64790524ff9;
    stim[1] = 162'h3c49238fb8124e72f7c92afc7dfa700bdaeadee4e;
    stim[2] = 162'h0ccaf1cc5b5d242c374f74570a69423c05ebca347;
    stim[3] = 162'h06e6d35184f5e189c94c1646682f00ec648cd479c;
    stim[4] = 162'h239d4831741a0d34c5684f3ff39260a641107f75f;
    stim[5] = 162'h0d0a2e7eda2cf760dbd1a5d7ebc3d067e94777cd9;
    stim[6] = 162'h2f4602b28017b41c1803db1e430915334fb5d7072;
    stim[7] = 162'h17d291b677d75458a4ad990ea7efefff4e8c48812;
    stim[8] = 162'h2c6215c1f7f2c4f03821a09fa527c89be268f73b9;
    stim[9] = 162'h1a8bf828699e274b3e6390901e342ec2e333eb48f;
    stim[10] = 162'h3d200a400a3b8a4d20298b5201ba44a247ec1198e;
    stim[11] = 162'h32542a1bcc8fad256b939af074fda462e6819591c;
    stim[12] = 162'h129d3cb366747bf43fc2ba45cdf8d49d257369257;
    stim[13] = 162'h011ba376f8b8168a7072ef55bb23c75d430051b23;
    stim[14] = 162'h35923097d4b49e159ec583d1ffd09d1f41b6d2647;
    stim[15] = 162'h34970079959206d080eb2aaee39aaeba8a39b990d;
    stim[16] = 162'h12e921072332fb46a437283bcffeb9d188b6fe4aa;
    stim[17] = 162'h2a7cbb0b36e4b18f7624b812a5b4516f72dca6192;
    stim[18] = 162'h0b766344f9b33e3f600847a6aed7c58ce4bce0445;
    stim[19] = 162'h211791be2aa6dc6fd489d55dcf9cbcaa292b79ea7;
    stim[20] = 162'h3aa0d9d9ba3cc64842eb82bb1d85cf00ab4978437;
    stim[21] = 162'h2d906acae916dc0a1cb011f77e8fd615e33d22b1c;
    stim[22] = 162'h0a100d6780b44609b15653227749a73b46859420d;
    stim[23] = 162'h3dd818f8d53e448eab2df7b574c5aca1c1117b884;
    stim[24] = 162'h343376fd2d92fde3178b4ff713d18f50425651c78;
    stim[25] = 162'h35809b84a2eaf03fcde8baf2bb79181cc25e7cbb4;
    stim[26] = 162'h2cc974f65c64935b771c0b8baba5312a0dc983fd4;
    stim[27] = 162'h3c614775f7673b53b4d67a9b4b630bd020560904e;
    stim[28] = 162'h1059b1fdcbd683017df68f961eff885b4925be7ff;
    stim[29] = 162'h02e53fe814d4177ddbdbc394883890496e705a847;
    stim[30] = 162'h098bd44ef4148c8f54cac5326ee1a960e52d94c5e;
    stim[31] = 162'h0c1df36058ba623039328fd608be2a101fcfe8256;
    stim[32] = 162'h0531b02b78348520542af6293658e5b006c9cd9fb;
    stim[33] = 162'h10d585fd1d40dc8c54ed33329db67172267ecfa1b;
    stim[34] = 162'h025bf90c6fe67a7fe74ef8121e369e732b4d70dea;
    stim[35] = 162'h129a26221c700435567609f1e82fda70e8bd7e10e;
    stim[36] = 162'h2240870e2fab326db6a5131250d5466daa9b5abd1;
    stim[37] = 162'h133ac2af3e997ef5d87114283a2e2566249da944d;
    stim[38] = 162'h0db097a85ce40ff751ad7bd634683faf85c880ece;
    stim[39] = 162'h2ba2e5429a7ad3d36bab259728e3f52f64030046f;
    stim[40] = 162'h332cadbdef3611472901cb58f3bbd4166c696ad37;
    stim[41] = 162'h3e9934a977d5088519b00683250ca72a853d6081f;
    stim[42] = 162'h36ae98efe036c4a14a47fd9f3431e31c6886cc1e1;
    stim[43] = 162'h2a9c9d14b312f2a6bcce44efaa61b17f23941758a;
    stim[44] = 162'h185a2c07e1aaa129716036c524c6375721addbfc9;
    stim[45] = 162'h0e06b5626231d8d07e3c565cd1a6e9bc449ee0b90;
    stim[46] = 162'h0265fbe6f13626a16c778e500c9b4bd6049d440c7;
    stim[47] = 162'h1454b2c97fa0f7bd30e5b3b56293d9d9395676de9;
    stim[48] = 162'h3a33db2bf9d2e4838309cf6108209ae641f5b10dc;
    stim[49] = 162'h03a2c8966e11a82c9d0d1556170a61bba862d7947;
    stim[50] = 162'h33a9e8e4be20c3af0a0c04b4ff1581b5cd171c969;
    stim[51] = 162'h3065649063567dbad66137932e955ce88d62e59a0;
    stim[52] = 162'h00810c54b272d0aa137bee1399fb8e8843606ac51;
    stim[53] = 162'h2851f59f7451cd5f744b0233b104e98584e78b698;
    stim[54] = 162'h28105fbb97613ed1873690f26f17e294eae2c7fc3;
    stim[55] = 162'h28910e2159f214e75529804496af48e445948cc25;
    stim[56] = 162'h05c18ec65df03913d4510c3671a1c2484f6e75c64;
    stim[57] = 162'h3354761b4b1ad6d21e2725382b5f41cc62c77bd8a;
    stim[58] = 162'h195aa7f27ccf1c360ae059823c4d57b22d02d99db;
    stim[59] = 162'h0c24a28a6b35706a0b57862f0684dd510a8f47aa9;
    stim[60] = 162'h2893877c9ae4503173f0f63288aef333ad4b80f95;
    stim[61] = 162'h0ff67c22d0faf4bde55fbd54575e5969c5749da55;
    stim[62] = 162'h2a6a0152d4276904dbff9a04b5949434a7920d1a9;
    stim[63] = 162'h38c7cc7bae35c55e25828d073699dbac4d0aaeea5;
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
      expv[0] = 64'hc4a63982c4a63986;
      expv[1] = 64'hfb8124e7fb8124eb;
      expv[2] = 64'hc332bc70c5b5d246;
      expv[3] = 64'h48cd479c184f5e1c;
      expv[4] = 64'h0000000c1741a0d7;
      expv[5] = 64'h94777cd9eda2cf7a;
      expv[6] = 64'h0000000c28017b45;
      expv[7] = 64'h0000000c677d7549;
      expv[8] = 64'h268f73b91f7f2c53;
      expv[9] = 64'h333eb48f8699e278;
      expv[10] = 64'h0000000c00a3b8a8;
      expv[11] = 64'h6819591cbcc8fad6;
      expv[12] = 64'h57369257366747c3;
      expv[13] = 64'h0000000c6f8b816c;
      expv[14] = 64'h0000000c7d4b49e5;
      expv[15] = 64'hee39aaeb99592071;
      expv[16] = 64'h6a41bac372332fb8;
      expv[17] = 64'hb36e4b18b36e4b1c;
      expv[18] = 64'h4bce04454f9b33e7;
      expv[19] = 64'h92b79ea7e2aa6dca;
      expv[20] = 64'hb49784379ba3cc68;
      expv[21] = 64'h33d22b1cae916dc4;
      expv[22] = 64'h0000000c780b4464;
      expv[23] = 64'h0000000c8d53e44c;
      expv[24] = 64'h0000000cd2d92fe2;
      expv[25] = 64'h0000000c4a2eaf07;
      expv[26] = 64'hbaba531265c64939;
      expv[27] = 64'h0560904e5f7673b9;
      expv[28] = 64'h0000000cdcbd6834;
      expv[29] = 64'he705a847814d417b;
      expv[30] = 64'h52d94c5eef4148cc;
      expv[31] = 64'h058ba623058ba627;
      expv[32] = 64'hb7834856b7834856;
      expv[33] = 64'h67ecfa1bd1d40dcc;
      expv[34] = 64'hb4d70deac6fe67ab;
      expv[35] = 64'h8bd7e10e21c70047;
      expv[36] = 64'ha9b5abd1e2fab32a;
      expv[37] = 64'h49da944df3e997f3;
      expv[38] = 64'h634683fa85ce4103;
      expv[39] = 64'h4030046f29a7ad41;
      expv[40] = 64'hc696ad37def36118;
      expv[41] = 64'h3250ca72977d508c;
      expv[42] = 64'h886cc1e1fe036c4e;
      expv[43] = 64'h3941758a4b312f2e;
      expv[44] = 64'h1addbfc97e1aaa16;
      expv[45] = 64'h0000000c26231d91;
      expv[46] = 64'h00c9b4bd6f13626e;
      expv[47] = 64'h97fa0f7b97fa0f7f;
      expv[48] = 64'h0000000cbf9d2e4c;
      expv[49] = 64'h862d794766e11a86;
      expv[50] = 64'h0000000c4be20c3e;
      expv[51] = 64'h063567df063567df;
      expv[52] = 64'h0000000c4b272d0e;
      expv[53] = 64'hfa147d64f7451cd9;
      expv[54] = 64'hae2c7fc3b97613f1;
      expv[55] = 64'h0000000c159f2152;
      expv[56] = 64'h0000000c65df0395;
      expv[57] = 64'h2c77bd8ab4b1ad71;
      expv[58] = 64'hd02d99db27ccf1c7;
      expv[59] = 64'ha6b3570aa6b3570a;
      expv[60] = 64'hd4b80f95c9ae4507;
      expv[61] = 64'h0000000c2d0faf4f;
      expv[62] = 64'h7920d1a92d427694;
      expv[63] = 64'h0000000cbae35c59;
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
