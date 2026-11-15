// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 256;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_131477 dut (
    .clk(clk),
    .rst(in_vec[255:255]),
    .data_in(in_vec[254:0]),
    .count_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 256'hfcc87295907445724458e70cb1f56671bd251a4300f05e997b0d3a65711d36f6;
    stim[1] = 256'h88413520f21b129edc5b07fcd6f25c0168da9015f47aa0d794541f6b2a11e094;
    stim[2] = 256'h27cd444a375c33d4d91954ee4f71aae2b768732bed29d9e8d5546c0b7726e980;
    stim[3] = 256'h69eae35ca848408d43aacc13d97591b8c4fb3aa9213965156eba975f7f39c6ff;
    stim[4] = 256'h39ab3dd2d289708a449d3b83ab3eef1de4ef564b15465627301f401d334b540a;
    stim[5] = 256'h51075684bd7152e5631cc0437ee695234f67d7b04c1676a8410ad1d3d36ddbbf;
    stim[6] = 256'h48556322eef2252c7cf41699c8fab1527ee64511f876abad0def1441b53497e6;
    stim[7] = 256'h5bce1158084202be4e6ae7e7fec6b4e1485eb523903fc4bba4c2a5518a7bc1b4;
    stim[8] = 256'h4c1608eae3d6e4972fa270d50c4b81ed7fb6706394c97d5f31150592553ac498;
    stim[9] = 256'h060cb3eee7e61a89d2ef2fa464c676dcaf90a7f873872e9a71c5be367f770536;
    stim[10] = 256'h06fd2141a4481d53f762cd0653c22a33389e21c7e59115cbfac00d56b9a64103;
    stim[11] = 256'h7fb8d779f5d9d95a566c8408d43aa3e839d45dc649e0a5b1bf5a232c10486ca1;
    stim[12] = 256'h708956e4d0e0bf9f31113f726aa6ccbabd5f19ed13cef7832d6e1e10aa120816;
    stim[13] = 256'h3df4fab6d16f53308f7f78a0a83400bd42773929e6ccdbb9dc442755860b7c9c;
    stim[14] = 256'h00bceaee11df9305e64f3fb537c2f51948e7275347f9eaeb71b1fd347880a157;
    stim[15] = 256'h7dace4617a313c7a3d08c2a80153ce1e8fa37dea0b3700525babbbd823b171f3;
    stim[16] = 256'h5bfa2bce8271a6ea13e30746af04055f8ce11b3411764dd2b9f02064523c7646;
    stim[17] = 256'h7b47c9d2b9594ce68d723e98453b17e177d89e7fe1c3c9b980a18f619e4cf9e6;
    stim[18] = 256'h36de60895f57bf39eb3178140ca5fb94b36064de6f8c615d6852699dfb2edc01;
    stim[19] = 256'h6f66c671914e8f415f5c3c8957b9e0cfef5c5edc49f86f5fcb6f2014645b5bb7;
    stim[20] = 256'h01064582b8b04060d0475b2e16e66ae557bbccb3ef00eb269e4ea0516a584c1e;
    stim[21] = 256'h2449b818b569c9b649c61bc79551dd1f64b87ddcdaad0ef06599886859391080;
    stim[22] = 256'h64227e870bc70843329b9b71507520025f054e25a83fd2644d3d1646187ae2dd;
    stim[23] = 256'h78f53894704325783edb10f500a2fea04c7e097924f9457a2a9a673437aa6e1c;
    stim[24] = 256'h1c44a2857a5115f79aec5d334e4dbefa97be17b9c49ccf8a21f848916054f003;
    stim[25] = 256'h2082d0b4ab297e8958c310dda29470a218713bc5526d2db65d2ffcf3241790b1;
    stim[26] = 256'h00ebb3a003048f17fa486d79b8f8b83a30a739a67c76066eb2e06ef8e6312589;
    stim[27] = 256'h488ba36c992611fc0a23e115a344941e25321597e065b2fcbd34551173ef6c61;
    stim[28] = 256'h67498a692606561ea3c24ae77ec2fa0e3f55566671594fc1b80490a107c30705;
    stim[29] = 256'h0232a8370ef54f5d37f27d966834a2bb3aca8c2c56dab55905cd41183f0a24e5;
    stim[30] = 256'h02b37cd36f95e844b7dc29ed8ea2df303bf24bf65c5ebb732d67a3d34c0765d2;
    stim[31] = 256'h1f008b98c456f0810f5eaf15d58052131a7055949a2da697c6e460490009121c;
    stim[32] = 256'h3d50511e06fc1767e5f64627d36981c25bc2b1310c449727659e9e157dc25123;
    stim[33] = 256'h5f60f9d1eec1df78d83d0a52a22602a70a766d16dffb6126f3b00f01da4032f7;
    stim[34] = 256'h314b472acae65cea7fc2a089f0a086f1eff32cddcbd15739fda98fa826f86977;
    stim[35] = 256'h44464a972e076fbb41d85211696a38df0ac130110752b0fea9c38295528fee23;
    stim[36] = 256'h6eaa165d9e7fbdf6b2ed5bddf4e628dd191a7b266d1d951c923335dbd3af354b;
    stim[37] = 256'h54ff1e4217c8f882470e0adafb1fceec4f73cae891bbb952a564e7a249331aac;
    stim[38] = 256'h7d0c6bfad90d5dc0846163bca5d92e171807036dfc4bf7d7183518cbcf9c51f5;
    stim[39] = 256'h42296617b92a5cbaa3b76d263ad5ddbabdc031f5ab91a3b04d2562d3496a9caf;
    stim[40] = 256'h2d47a41c5610ba1cb022fabaa7df063d0d885e36af2f5738224a95eac284ac62;
    stim[41] = 256'h5f737fc6b5549ba10aeae76183c78cdf81804eca7fe28fdcded7f54128576a2c;
    stim[42] = 256'h654a198d6e716a33a35914135859676c20fa702ebddb6d4fa353fc6bc5fccbbd;
    stim[43] = 256'h254ae381c00be5b9b86a83c1a59db1c98dc2fad9ccd4228fa9ee99616cf45028;
    stim[44] = 256'h382caf205daec4ff261bcefb60fb1f06fd80b64b70ca093c87ccf7dd948db9f4;
    stim[45] = 256'h2ae6f15e872affe010ebdeb29b65028550fea488ca85e6a60a8e95380419db0d;
    stim[46] = 256'h0f691d9e1b2de1a6a52dbcb219b3783190577b7028320c4ef0f3ddbf9507bdb0;
    stim[47] = 256'h5de8c887df8036414f84caf6dd7e2e4c56f219eae9fdc8ed28d1120713adc356;
    stim[48] = 256'h13f6466468f0a82c4963b1ff09587e15787cc5773bc1f6c9af562bf0aa46ef3d;
    stim[49] = 256'h072c4eed6a57198d1d6a7e003a14d88501c0804a31dd853fe731744112b5f474;
    stim[50] = 256'h6f215946d8ed37b673660351ab518136376fdc8d2342bca72341facc711edfaf;
    stim[51] = 256'h1bfb02ca09e083ea9d4ba7e0758d8459962e49a75e659ae460e769f51c89f16e;
    stim[52] = 256'h4d36f7ef033aeefb5fd61531fecd4ec4d6ab5e77b4a3e44c5029f26497ad9dec;
    stim[53] = 256'h7c4067a6a7bbbcd7843cb0011025c34363339a285f373cea2efd929077f60903;
    stim[54] = 256'h10c8f22659a424471f6dd7a7d76df7164da45daf8932dab897c959913d979185;
    stim[55] = 256'h7ab50f0fc4591d1c75ff8fb54c9f507465e63c9b25d30b4e828a386b086b3181;
    stim[56] = 256'h449203228e712cde44702f5af2f3082e20b1ee515aee3819dac584b89c343bb1;
    stim[57] = 256'h59751ec5b9f17bb3b16c5b462976a349518e4b83f20872c6fbb3d30bde1021c8;
    stim[58] = 256'h4bea3ef6c2e79b10c905335a1d43cf73d7c4f468fb59d263912b926eaa477329;
    stim[59] = 256'h565def600f53ba25607260e509b1a5613de9afb1da425722c84726beb23e6b9f;
    stim[60] = 256'h76d893a9bb2cff0764a517dbc8914a7904a705e1ad5f1d0b02d754782989d7c9;
    stim[61] = 256'h07d338220cae13bf7c21535fb924e9dbba52b85ec8fb8ff0360f563920f3bc25;
    stim[62] = 256'h49e3cf1015aa014b7b7cabd048e4c3be728b80f792eb43f3a819daa7e7a34bbd;
    stim[63] = 256'h5dcc9ba04749481995edc35cc3e26edd66b19275c80e0ddf4da475d41a4ff103;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h83;
      expv[7] = 8'h86;
      expv[8] = 8'h7d;
      expv[9] = 8'h81;
      expv[10] = 8'h82;
      expv[11] = 8'h7d;
      expv[12] = 8'h7c;
      expv[13] = 8'h8c;
      expv[14] = 8'h74;
      expv[15] = 8'h7f;
      expv[16] = 8'h80;
      expv[17] = 8'h84;
      expv[18] = 8'h89;
      expv[19] = 8'h80;
      expv[20] = 8'h79;
      expv[21] = 8'h89;
      expv[22] = 8'h85;
      expv[23] = 8'h8e;
      expv[24] = 8'h73;
      expv[25] = 8'h79;
      expv[26] = 8'h74;
      expv[27] = 8'h7b;
      expv[28] = 8'h7e;
      expv[29] = 8'h77;
      expv[30] = 8'h7b;
      expv[31] = 8'h77;
      expv[32] = 8'h76;
      expv[33] = 8'h7c;
      expv[34] = 8'h8c;
      expv[35] = 8'h69;
      expv[36] = 8'h7b;
      expv[37] = 8'h81;
      expv[38] = 8'h8a;
      expv[39] = 8'h75;
      expv[40] = 8'h93;
      expv[41] = 8'h84;
      expv[42] = 8'h84;
      expv[43] = 8'h84;
      expv[44] = 8'h79;
      expv[45] = 8'h8a;
      expv[46] = 8'h88;
      expv[47] = 8'h7a;
      expv[48] = 8'h89;
      expv[49] = 8'h7a;
      expv[50] = 8'h83;
      expv[51] = 8'h83;
      expv[52] = 8'h87;
      expv[53] = 8'h73;
      expv[54] = 8'h86;
      expv[55] = 8'h80;
      expv[56] = 8'h92;
      expv[57] = 8'h7c;
      expv[58] = 8'h84;
      expv[59] = 8'h7f;
      expv[60] = 8'h75;
      expv[61] = 8'h81;
      expv[62] = 8'h86;
      expv[63] = 8'h82;
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
