// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 133;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_082653 dut (
    .ACLK(clk),
    .ARESETN(in_vec[132:132]),
    .M_AXI_AWADDR(in_vec[131:100]),
    .M_AXI_AWLEN(in_vec[99:92]),
    .M_AXI_AWSIZE(in_vec[91:89]),
    .M_AXI_AWBURST(in_vec[88:87]),
    .M_AXI_AWVALID(in_vec[86:86]),
    .M_AXI_WDATA(in_vec[85:54]),
    .M_AXI_WSTRB(in_vec[53:50]),
    .M_AXI_WLAST(in_vec[49:49]),
    .M_AXI_WVALID(in_vec[48:48]),
    .M_AXI_BREADY(in_vec[47:47]),
    .M_AXI_ARADDR(in_vec[46:15]),
    .M_AXI_ARLEN(in_vec[14:7]),
    .M_AXI_ARSIZE(in_vec[6:4]),
    .M_AXI_ARBURST(in_vec[3:2]),
    .M_AXI_ARVALID(in_vec[1:1]),
    .M_AXI_RREADY(in_vec[0:0]),
    .M_AXI_AWREADY(out_vec[41:41]),
    .M_AXI_WREADY(out_vec[40:40]),
    .M_AXI_BRESP(out_vec[39:38]),
    .M_AXI_BVALID(out_vec[37:37]),
    .M_AXI_ARREADY(out_vec[36:36]),
    .M_AXI_RDATA(out_vec[35:4]),
    .M_AXI_RRESP(out_vec[3:2]),
    .M_AXI_RLAST(out_vec[1:1]),
    .M_AXI_RVALID(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 133'h02b4d18a73a9f1e583eb6d09f0a425c96b;
    stim[1] = 133'h0c140df30c3860d0274fddd43281d9d430;
    stim[2] = 133'h1a15d5f502d85b3c3e1eac7ac6894fd85a;
    stim[3] = 133'h110b237abc5f2d87cec91407ef4c962d47;
    stim[4] = 133'h1a0f93179718938e304d09a583f6628637;
    stim[5] = 133'h1daef3e3858231162d7b3f8f68bf841acc;
    stim[6] = 133'h16f0e399ec1c34e03e132a328a346d686b;
    stim[7] = 133'h1c12d100886ae0185fb5b016c0c4fe5e7e;
    stim[8] = 133'h17ee9ab4fad0d34640d313c4dce08e19a8;
    stim[9] = 133'h147f8d43cf1f329b2d2cacc80500a9b492;
    stim[10] = 133'h1a815f4c6c67afa54029fc839165099232;
    stim[11] = 133'h12ad97a4dd5775f1c940599300cdaddc9b;
    stim[12] = 133'h16baf2cb54bca12b10c52f33b1281b5367;
    stim[13] = 133'h187d7d6c77748b9fd0b9f2beecb2002ec2;
    stim[14] = 133'h17b4efff8fe1549d4ff4e62df46528dc18;
    stim[15] = 133'h17f48f1f26c4adeb8c26dd4e453f5c7c90;
    stim[16] = 133'h1b7f74a480e8eb8be168856ee7e13b598d;
    stim[17] = 133'h105e9df1f68f058897148f52a844619565;
    stim[18] = 133'h167421b741cffb9231886c3e1714cf7596;
    stim[19] = 133'h1b2fc7f8ea2e86e7099733760032095e21;
    stim[20] = 133'h12791a55bceb58e3b8cb950874798f53e6;
    stim[21] = 133'h1a941f675dba1aed3c6d125a7f20f57e34;
    stim[22] = 133'h10144cba0a4c46052c716e1b1b0d679ae5;
    stim[23] = 133'h16e5ed4211a0f5ee350fd6e8e8e6c4f7a2;
    stim[24] = 133'h11ed6ff0baee276feedda4a00475984da0;
    stim[25] = 133'h110631c468075370efb406fb50a59cdfc8;
    stim[26] = 133'h121381539469891063ba14fab6002955a8;
    stim[27] = 133'h17791a6da528b83c629384c41513077ea9;
    stim[28] = 133'h1d9d99651ebe8850ee837a98c5723a5015;
    stim[29] = 133'h107067e866171b514ceb0d4b107014b699;
    stim[30] = 133'h18c79f9cfd58897e4aebc212c9fb02f7dc;
    stim[31] = 133'h19064396f959e3668b1ff0a7ef28f364fc;
    stim[32] = 133'h10ddc33f21326b8869f76cb066bf7b9c93;
    stim[33] = 133'h1c251bab9a4471092c059f9a4026b05500;
    stim[34] = 133'h173ff8b12a5d9f229d6fb4ce400d25a7d1;
    stim[35] = 133'h1bd465577ea3f26a9dcfcb30fc8639f6e2;
    stim[36] = 133'h1ee40854be92181c87a85e4e8c6f9813c3;
    stim[37] = 133'h19ba826f43f661686401465ff035c6136f;
    stim[38] = 133'h1e6ce119a3cbe379299540c62adb0e9940;
    stim[39] = 133'h1504b886b9eadac806216683be6c942c75;
    stim[40] = 133'h11a541b1bea0a65fd345b8a7134a386a31;
    stim[41] = 133'h169238deb7f73272fb5eafe39db9c1cf70;
    stim[42] = 133'h1ff29c9142dd7a8176eb8e9b2bd09144f1;
    stim[43] = 133'h1135fe5514306c0a728a28ed6ecb5064fc;
    stim[44] = 133'h108f00fa343b5ddcd4a2e8e2fa159794e6;
    stim[45] = 133'h1bbc8d63ab21467f4e708379f7757cfc62;
    stim[46] = 133'h1e3b84d28ee322ba3f776243ec9744a23e;
    stim[47] = 133'h1c957bf15be70e49419c6c997019f8f7b8;
    stim[48] = 133'h178888253c0dc423761c774c8c9f7d5df7;
    stim[49] = 133'h17d9ef355a713c9097762d653d01be54cd;
    stim[50] = 133'h1b415ccf2c62fa96e8d450571895373f61;
    stim[51] = 133'h1abfda09ff92d02274c0aaba3ab9f753e7;
    stim[52] = 133'h176eaf9070eed5de96f99ed84e932d75ae;
    stim[53] = 133'h11983407fe9f08945c289b3a40598deaf9;
    stim[54] = 133'h199d4a051799681221fd5ee46bd03c4709;
    stim[55] = 133'h1d7fdb653cf7aba34707ad0671e1f8de41;
    stim[56] = 133'h129a0fb0babcf4c47f642282aba53e384f;
    stim[57] = 133'h175f0448f7887413a1199e9655a39a206b;
    stim[58] = 133'h1596fedd533aff8cbba7a355376838e4d9;
    stim[59] = 133'h11e72d99821a449d34ddd1fe41da46eccf;
    stim[60] = 133'h14c884e80dac6e239e69214a21d915a28b;
    stim[61] = 133'h14c72971fddf0d6255bf2850fb45216b5b;
    stim[62] = 133'h158a15f87a78b3ab0648f44da40271a246;
    stim[63] = 133'h1fe701c04af2f5ef0c2a486dfa85b76f6a;
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
      expv[0] = 42'h31xxxxxxxx0;
      expv[1] = 42'h31xxxxxxxx0;
      expv[2] = 42'h31xxxxxxxx0;
      expv[3] = 42'h31xxxxxxxx0;
      expv[4] = 42'h31000000001;
      expv[5] = 42'h31000000011;
      expv[6] = 42'h33000000021;
      expv[7] = 42'h33000000031;
      expv[8] = 42'h33000000041;
      expv[9] = 42'h31000000051;
      expv[10] = 42'h31000000061;
      expv[11] = 42'h31000000071;
      expv[12] = 42'h31000000081;
      expv[13] = 42'h33000000091;
      expv[14] = 42'h310000000a1;
      expv[15] = 42'h310000000b1;
      expv[16] = 42'h310000000c1;
      expv[17] = 42'h310000000d1;
      expv[18] = 42'h330000000e1;
      expv[19] = 42'h330000000f1;
      expv[20] = 42'h33000000101;
      expv[21] = 42'h33000000111;
      expv[22] = 42'h33000000121;
      expv[23] = 42'h33000000131;
      expv[24] = 42'h31000000141;
      expv[25] = 42'h31000000151;
      expv[26] = 42'h31000000161;
      expv[27] = 42'h31000000171;
      expv[28] = 42'h31000000181;
      expv[29] = 42'h31000000191;
      expv[30] = 42'h310000001a1;
      expv[31] = 42'h330000001b1;
      expv[32] = 42'h310000001c1;
      expv[33] = 42'h310000001d1;
      expv[34] = 42'h310000001e1;
      expv[35] = 42'h310000001f1;
      expv[36] = 42'h33000000201;
      expv[37] = 42'h33000000211;
      expv[38] = 42'h33000000221;
      expv[39] = 42'h31000000231;
      expv[40] = 42'h31000000241;
      expv[41] = 42'h31000000251;
      expv[42] = 42'h31000000261;
      expv[43] = 42'h33000000271;
      expv[44] = 42'h31000000281;
      expv[45] = 42'h31000000291;
      expv[46] = 42'h310000002a1;
      expv[47] = 42'h330000002b1;
      expv[48] = 42'h310000002c1;
      expv[49] = 42'h310000002d1;
      expv[50] = 42'h310000002e1;
      expv[51] = 42'h310000002f1;
      expv[52] = 42'h33000000301;
      expv[53] = 42'h31000000311;
      expv[54] = 42'h31000000321;
      expv[55] = 42'h33000000331;
      expv[56] = 42'h33000000341;
      expv[57] = 42'h31000000351;
      expv[58] = 42'h31000000361;
      expv[59] = 42'h31000000371;
      expv[60] = 42'h31000000381;
      expv[61] = 42'h31000000391;
      expv[62] = 42'h310000003a1;
      expv[63] = 42'h310000003b1;
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
