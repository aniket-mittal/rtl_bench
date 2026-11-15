// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 105;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01177 dut (
    .clk(clk),
    .test_mode(in_vec[106:106]),
    .rx_packet(in_vec[105:2]),
    .rx_burst(in_vec[1:1]),
    .rx_access(in_vec[0:0]),
    .erx_access(out_vec[104:104]),
    .erx_packet(out_vec[103:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h2a8e126932b11a3ee2f986735e7;
    stim[1] = 107'h2467346fb1015e490ecee753b83;
    stim[2] = 107'h0b9fbb04ed8d512e35414408418;
    stim[3] = 107'h627ea0420c15c434051de870ef0;
    stim[4] = 107'h6e7451556e84a4fe9f8228ff051;
    stim[5] = 107'h52476b59b7983a2fbd81d19e794;
    stim[6] = 107'h7631c67ab58e376babed74cc684;
    stim[7] = 107'h0a7861bf846173b9ead574963ea;
    stim[8] = 107'h71ce806a68b9e893f6ef2cf7c75;
    stim[9] = 107'h01c29dff68a6fc48a9332017ee5;
    stim[10] = 107'h5bd6990e20d798802fcae373188;
    stim[11] = 107'h0a73b216c9c2fb627eba2f07828;
    stim[12] = 107'h5ac14fcb233f34fd7e84c07b474;
    stim[13] = 107'h779caff5388c2ae4bac9cb892a1;
    stim[14] = 107'h488b50e1b978385bc5be66ad4c0;
    stim[15] = 107'h4ac711c71a7797ddb01d6d185f9;
    stim[16] = 107'h05eb40cfd364f2221ec083bb0d9;
    stim[17] = 107'h6902deb1f477dd12385737c73fc;
    stim[18] = 107'h237fe7d4691b24b95e576a13991;
    stim[19] = 107'h4e645d60c46ff4cf1946799da81;
    stim[20] = 107'h326bd641232ebf3b4ab0df8586c;
    stim[21] = 107'h2d77ef90485df9b2e110c89bc99;
    stim[22] = 107'h42fb249822c81e256ec03e7fb89;
    stim[23] = 107'h6a1baa31dca733eb14ea67b66c1;
    stim[24] = 107'h3108c4688d6c97533de62273050;
    stim[25] = 107'h03b069b4de68f5bd13ad50213d9;
    stim[26] = 107'h69b4ab29af5d174e7c72cb5f81c;
    stim[27] = 107'h0b19451512b8b68fe30fd73e0f8;
    stim[28] = 107'h7a56f5677f2f515387670088918;
    stim[29] = 107'h70a315ad6311d2dfc9e15022600;
    stim[30] = 107'h5cf58fa57e1b9b48837af2ce115;
    stim[31] = 107'h696b09a8aad96a59c8f5a2a755c;
    stim[32] = 107'h09e616c956a2e8adbf1421b3a5c;
    stim[33] = 107'h71d1e3e01d8840ec462d1ce27bd;
    stim[34] = 107'h307bc96f0f68e7c4e77a6f51b1d;
    stim[35] = 107'h3fec3982bb230a1cd80fcc44f31;
    stim[36] = 107'h19d32d59dae4ba95cc3f6260dc4;
    stim[37] = 107'h6ead1f0fb031efa215b71be9254;
    stim[38] = 107'h4d8e88065672f6dd3c0d67d8968;
    stim[39] = 107'h0417e8bcd9a1e81ce175056a005;
    stim[40] = 107'h138cbb47db4a0badbb8f68673c4;
    stim[41] = 107'h33c9f263df4a337b10de8c12c8c;
    stim[42] = 107'h36479ef935d3159adfcdee6ee90;
    stim[43] = 107'h585cbd8d6881210ea3c4100e265;
    stim[44] = 107'h1ab08a9c401e5ed7432a00b3bf1;
    stim[45] = 107'h47452e4fcd7dda34b6e715b6f54;
    stim[46] = 107'h15f5f1e9a1c3a005f0681ef7fcd;
    stim[47] = 107'h6768f2a32b1598a1854f14158f0;
    stim[48] = 107'h66df2997cf409c775230469bc3c;
    stim[49] = 107'h2daba37875a4eb9c64411677a98;
    stim[50] = 107'h7705cd454fc0bc50f11bea9a2b4;
    stim[51] = 107'h25b0df86859149d168acdd7276d;
    stim[52] = 107'h75bb83c25544302c8f7ab62890d;
    stim[53] = 107'h3c88ab091c6c68beb4be8dcbc01;
    stim[54] = 107'h1f34f7e0292a4113f1d94302501;
    stim[55] = 107'h6dbb4dc25647b2bb28d99784e05;
    stim[56] = 107'h19542dfae45620f3b8ec47fdde5;
    stim[57] = 107'h0d20c87cdce9bf7dfcede8e92e4;
    stim[58] = 107'h306747342faada5d0db9ff12555;
    stim[59] = 107'h4d981a2abcdd8b0cf1bfb1a45d4;
    stim[60] = 107'h6d94928cea6b654de2ab290dbb8;
    stim[61] = 107'h2404509f41d50b13d0e5fcdddcd;
    stim[62] = 107'h08e71e61f1a7ff22f6399ae3f54;
    stim[63] = 107'h2bcff4b4478ddabf69cd9b5912c;
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
      expv[0] = 105'hxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 105'h1aa3849a4cac468fbxxxxxxxx3c;
      expv[2] = 105'h1919cd1bec4057924xxxxxxxx70;
      expv[3] = 105'h02e7eec13b63544b8d505102103;
      expv[4] = 105'h089fa8108305710d01477a1c35e;
      expv[5] = 105'h0b9d14555ba1293fa7e08a3fc0a;
      expv[6] = 105'h0491dad66de60e8bef607467972;
      expv[7] = 105'h0d8c719ead638ddaeafb5d33150;
      expv[8] = 105'h029e186fe1185cee77e08a4047d;
      expv[9] = 105'h0c73a01a9a2e7a24fdbbcb3df0e;
      expv[10] = 105'h1070a77fda29bf122a4cc805f5c;
      expv[11] = 105'h06f5a6438835e6200bf2b8dcc31;
      expv[12] = 105'h029cec85b270bed89fae8bc1e05;
      expv[13] = 105'h06b053f2c8cfcd3f5fa1301ed0e;
      expv[14] = 105'h0de72bfd4e230ab92eb272e2454;
      expv[15] = 105'h0222d4386e5e0e16f16f99ab518;
      expv[16] = 105'h02b1c471c69de5f76c075b4613f;
      expv[17] = 105'h117ad033f4d93c8887b020eec1b;
      expv[18] = 105'h0a40b7ac7d1df7448e15cdf1c7f;
      expv[19] = 105'h18dff9f51a46c92e5795da84e32;
      expv[20] = 105'h03991758311bfd33c6519e67650;
      expv[21] = 105'h0c9af59048cbafced2ac37e160d;
      expv[22] = 105'h1b5dfbe412177e6cb8443226f13;
      expv[23] = 105'h00bec92608b207895bb00f9fe71;
      expv[24] = 105'h0a86ea8c7729ccfac53a99ed958;
      expv[25] = 105'h0c42311a235b25d4cf79889cc0a;
      expv[26] = 105'h10ec1a6d379a3d6f44eb540847b;
      expv[27] = 105'h0a6d2aca6bd745d39f1cb2d7e03;
      expv[28] = 105'h02c6514544ae2da3f8c3f5cf81f;
      expv[29] = 105'h0e95bd59dfcbd454e1d9c022223;
      expv[30] = 105'h0c28c56b58c474b7f2785408940;
      expv[31] = 105'h073d63e95f86e6d220debcb3822;
      expv[32] = 105'h0a5ac26a2ab65a96723d68a9d2b;
      expv[33] = 105'h027985b255a8ba2b6fc5086ce4b;
      expv[34] = 105'h0c7478f80762103b118b4738977;
      expv[35] = 105'h1c1ef25bc3da39f139de9bd4663;
      expv[36] = 105'h1ffb0e60aec8c2873603f311366;
      expv[37] = 105'h0674cb5676b92ea5730fd898338;
      expv[38] = 105'h0bab47c3ec0c7be8856dc6fa44a;
      expv[39] = 105'h0363a201959cbdb74f0359f622d;
      expv[40] = 105'h1105fa2f36687a07385d415a800;
      expv[41] = 105'h04e32ed1f6d282eb6ee3da19c78;
      expv[42] = 105'h0cf27c98f7d28cdec437a304b11;
      expv[43] = 105'h0d91e7be4d74c566b7f37b9bb52;
      expv[44] = 105'h06172f635a204843a8f1040384c;
      expv[45] = 105'h16ac22a7100797b5d0ca802ce7e;
      expv[46] = 105'h01d14b93f35f768d2db9c56db6a;
      expv[47] = 105'h157d7c7a6870e8017c1a07bdf79;
      expv[48] = 105'h09da3ca8cac566286153c50561e;
      expv[49] = 105'h09b7ca65f3d0271dd48c11a6f07;
      expv[50] = 105'h0b6ae8de1d693ae71910459de53;
      expv[51] = 105'h0dc1735153f02f143c46faa6856;
      expv[52] = 105'h196c37e1a16452745a2b375c96d;
      expv[53] = 105'h0d6ee0f095510c0b23dead8a221;
      expv[54] = 105'h1f222ac2471b1a2fad2fa372f00;
      expv[55] = 105'h17cd3df80a4a9044fc7650c0920;
      expv[56] = 105'h0b6ed3709591ecaeca3665e1340;
      expv[57] = 105'h16550b7eb915883cee3b11ff73c;
      expv[58] = 105'h0348321f373a6fdf7f3b7a3a45c;
      expv[59] = 105'h1c19d1cd0beab697436e7fc492a;
      expv[60] = 105'h0366068aaf3762c33c6fec6913a;
      expv[61] = 105'h0b6524a33a9ad95378aaca43677;
      expv[62] = 105'h19011427d07542c4f4397f37739;
      expv[63] = 105'h0239c7987c69ffc8bd8e66b8f6a;
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
