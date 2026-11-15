// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 82;
  localparam OW = 61;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00534 dut (
    .clk(clk),
    .rst(in_vec[81:81]),
    .flush_i(in_vec[80:80]),
    .adv_i(in_vec[79:79]),
    .start_i(in_vec[78:78]),
    .is_sub_i(in_vec[77:77]),
    .signa_i(in_vec[76:76]),
    .exp10a_i(in_vec[75:66]),
    .fract24a_i(in_vec[65:42]),
    .infa_i(in_vec[41:41]),
    .signb_i(in_vec[40:40]),
    .exp10b_i(in_vec[39:30]),
    .fract24b_i(in_vec[29:6]),
    .infb_i(in_vec[5:5]),
    .snan_i(in_vec[4:4]),
    .qnan_i(in_vec[3:3]),
    .anan_sign_i(in_vec[2:2]),
    .addsub_agtb_i(in_vec[1:1]),
    .addsub_aeqb_i(in_vec[0:0]),
    .add_rdy_o(out_vec[60:60]),
    .add_sign_o(out_vec[59:59]),
    .add_sub_0_o(out_vec[58:58]),
    .add_shl_o(out_vec[57:53]),
    .add_exp10shl_o(out_vec[52:43]),
    .add_exp10sh0_o(out_vec[42:33]),
    .add_fract28_o(out_vec[32:5]),
    .add_inv_o(out_vec[4:4]),
    .add_inf_o(out_vec[3:3]),
    .add_snan_o(out_vec[2:2]),
    .add_qnan_o(out_vec[1:1]),
    .add_anan_sign_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 82'h26508c4e9771bfc75cca5;
    stim[1] = 82'h3f180098be7a104a3d1e4;
    stim[2] = 82'h0e8b0f34f5cad11609f68;
    stim[3] = 82'h08e134942e3d602927d99;
    stim[4] = 82'h092aaf159c007a06d7291;
    stim[5] = 82'h072128147286cfe85cf4a;
    stim[6] = 82'h1fb8dd31cc7ff8feb244b;
    stim[7] = 82'h071c5ddd31f60429d7293;
    stim[8] = 82'h0fbb3ab9c59415b678b17;
    stim[9] = 82'h3d030f217317755f2a47d;
    stim[10] = 82'h0e7561ce7798ad9555fba;
    stim[11] = 82'h014432c170ede4b18e66b;
    stim[12] = 82'h1af15909eb2e157ee4000;
    stim[13] = 82'h135305b404403ecab144a;
    stim[14] = 82'h02ce98c2b0b49843d694a;
    stim[15] = 82'h1fc282a307f324a0fdb3f;
    stim[16] = 82'h03a301cbc52e9d30c23ad;
    stim[17] = 82'h0e3ddd29288be13d479ad;
    stim[18] = 82'h0fd1e02787be4736b4c04;
    stim[19] = 82'h0c01d82a4de82c17c85c2;
    stim[20] = 82'h0678d9b3cc3fbe443821b;
    stim[21] = 82'h15aa1a83ae4686411298b;
    stim[22] = 82'h067cf0e6bf71e36ba5ea9;
    stim[23] = 82'h1c179bd42be24baad9281;
    stim[24] = 82'h1950c0645ec82ab06e5f0;
    stim[25] = 82'h33a6d13d0ebdd2d302991;
    stim[26] = 82'h0e4b6b5b891d391c89f71;
    stim[27] = 82'h1b445c4d49cb6e0bd3fe3;
    stim[28] = 82'h15cca3ca88911248f2b6f;
    stim[29] = 82'h0082fcf2e727f1a012182;
    stim[30] = 82'h165c3a8d0e153a089124a;
    stim[31] = 82'h0bb643c383be01cf3a9b8;
    stim[32] = 82'h1ae1052cde68e36e7ccfe;
    stim[33] = 82'h07bfab56311ec385f0a92;
    stim[34] = 82'h05059883205c59ab58269;
    stim[35] = 82'h0e2bb0d28f4a1f4aae223;
    stim[36] = 82'h04a1ca1f41658ef537fc5;
    stim[37] = 82'h1adc013590349ebbdde49;
    stim[38] = 82'h098fcb61a51de2ab814e2;
    stim[39] = 82'h028f0cf0e47c5d80481e8;
    stim[40] = 82'h1b4156d20fe144a1bfe94;
    stim[41] = 82'h01e71f48c2c70fce3c638;
    stim[42] = 82'h093e180d379037df2731d;
    stim[43] = 82'h1bca728a16a21da88e24e;
    stim[44] = 82'h11742e2dc323f978e068d;
    stim[45] = 82'h0be28bf594fd75096db0b;
    stim[46] = 82'h1a659d97e2a8cc3f59eee;
    stim[47] = 82'h134e1c342f82d2c1a46ef;
    stim[48] = 82'h08c8477605eb7149df50a;
    stim[49] = 82'h17ce1566815a2a58d6837;
    stim[50] = 82'h09bd545d4b6b351ffb687;
    stim[51] = 82'h1f404820e49ec9f4f22f7;
    stim[52] = 82'h0c09f0bf02ba5d7ff5ce1;
    stim[53] = 82'h17a58b733a2835b85dcf6;
    stim[54] = 82'h1f21bf427dd46196c98f1;
    stim[55] = 82'h1a0f8b034fce7ff5a0049;
    stim[56] = 82'h16d22aaba3c6cd4640172;
    stim[57] = 82'h07953278fb4098606a200;
    stim[58] = 82'h014dacaa1ed648626fbdd;
    stim[59] = 82'h1e33a00df981e6a42f2f5;
    stim[60] = 82'h1fa6957a6a0784e97250c;
    stim[61] = 82'h14085f20e0f85bc7c8545;
    stim[62] = 82'h153765d4827d9457cb971;
    stim[63] = 82'h1b436572da42cf809fbf5;
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
      expv[0] = 61'h0xxxxxxxxxxxxxxx;
      expv[1] = 61'h0xxxxxxxxxxxxxxx;
      expv[2] = 61'h0xxxxxxxxxxxxxxx;
      expv[3] = 61'h0xxxxxxxxxxxxxxx;
      expv[4] = 61'h0014250800000019;
      expv[5] = 61'h1815a5680000000a;
      expv[6] = 61'h1815a5680000000a;
      expv[7] = 61'h0c1ac6b00000000e;
      expv[8] = 61'h0c1ac6b00000000e;
      expv[9] = 61'h0400f03c81b5c9e4;
      expv[10] = 61'h0c171dc60000000a;
      expv[11] = 61'h0c1765d8eae715e5;
      expv[12] = 61'h0c1765d8eae715e5;
      expv[13] = 61'h080eebba0000000f;
      expv[14] = 61'h080eebba0000000f;
      expv[15] = 61'h080eebba0000000f;
      expv[16] = 61'h000eabaa0000000e;
      expv[17] = 61'h000eabaa0000000e;
      expv[18] = 61'h081c2f0a00000008;
      expv[19] = 61'h0c1856140000001f;
      expv[20] = 61'h1c17c5f00000000b;
      expv[21] = 61'h1c17c5f00000000b;
      expv[22] = 61'h0c17c5f00000000b;
      expv[23] = 61'h0c17c5f00000000b;
      expv[24] = 61'h001c8f2200000009;
      expv[25] = 61'h0000380e00000008;
      expv[26] = 61'h0000380e00000008;
      expv[27] = 61'h0004912400000008;
      expv[28] = 61'h001054140000000c;
      expv[29] = 61'h001054140000000c;
      expv[30] = 61'h001054140000000c;
      expv[31] = 61'h001054140000000c;
      expv[32] = 61'h001a769c0000000c;
      expv[33] = 61'h08088a2200000008;
      expv[34] = 61'h08088a2200000008;
      expv[35] = 61'h08088a2200000008;
      expv[36] = 61'h001c07000000001e;
      expv[37] = 61'h001c07000000001e;
      expv[38] = 61'h001c27080000001f;
      expv[39] = 61'h0405715c00000008;
      expv[40] = 61'h0405715c00000008;
      expv[41] = 61'h00093a4e0000000a;
      expv[42] = 61'h00093a4e0000000a;
      expv[43] = 61'h0811fc7e00000008;
      expv[44] = 61'h080288a20000000d;
      expv[45] = 61'h080288a20000000d;
      expv[46] = 61'h0800681af7c9cc27;
      expv[47] = 61'h08194e520000000b;
      expv[48] = 61'h08194e520000000b;
      expv[49] = 61'h0c1c57140000000a;
      expv[50] = 61'h0c1c57140000000a;
      expv[51] = 61'h000cb32c0000001b;
      expv[52] = 61'h00190e420000000a;
      expv[53] = 61'h0c17adea00000009;
      expv[54] = 61'h0c17adea00000009;
      expv[55] = 61'h0c080a020000000d;
      expv[56] = 61'h0c14bd2e00000018;
      expv[57] = 61'h0c14bd2e00000018;
      expv[58] = 61'h0c14bd2e00000018;
      expv[59] = 61'h0c14bd2e00000018;
      expv[60] = 61'h0408c2300000000c;
      expv[61] = 61'h0c1cff3efd6800e2;
      expv[62] = 61'h0c1cff3efd6800e2;
      expv[63] = 61'h0c1cff3efd6800e2;
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
