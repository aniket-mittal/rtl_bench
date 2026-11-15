// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 149;
  localparam OW = 70;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02731 dut (
    .pc4(in_vec[148:117]),
    .register_rs(in_vec[116:85]),
    .register_rt(in_vec[84:53]),
    .function_opcode(in_vec[52:47]),
    .sign_extend(in_vec[46:15]),
    .wreg_rd(in_vec[14:10]),
    .wreg_rt(in_vec[9:5]),
    .aluop(in_vec[4:3]),
    .branch(in_vec[2:2]),
    .alusrc(in_vec[1:1]),
    .regdst(in_vec[0:0]),
    .alu_result(out_vec[69:38]),
    .branch_addr(out_vec[37:6]),
    .wreg_address(out_vec[5:1]),
    .do_branch(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 149'h1798565b52761a0fec366288312f79ea34aeb7;
    stim[1] = 149'h0cd2dcd28a2a8eb65592f30a79dbc014525f4d;
    stim[2] = 149'h1c48033658c8a41b066d5850927c4e179cc312;
    stim[3] = 149'h12c4272aee99ce7fabfb6733a98019b5e35c53;
    stim[4] = 149'h01480e79652e18d352ba76db4c98df2cdd6157;
    stim[5] = 149'h15783dd68595e7e5ed30ec6670a5228b4c2a31;
    stim[6] = 149'h14bc7eddcf7ac3107539ec8e09b5e0d6f321fc;
    stim[7] = 149'h01692311d0d0bba01ca06b5c8cf85db1860fa6;
    stim[8] = 149'h1c94045562f57160468e350f8a243ccc8ddfd5;
    stim[9] = 149'h02fdddd7deb9a0d7b57d646289ae32827880c5;
    stim[10] = 149'h0e921b83f53c2ee5f21e3f061c2e0eaa6f9de4;
    stim[11] = 149'h1a052bdff6ed00bad6486f13cbd2e0685eb26a;
    stim[12] = 149'h170bc0ee6d09df48bb8c18fed8576bc41cc461;
    stim[13] = 149'h0bf096c26ca3939f65ba63de48e16a34637084;
    stim[14] = 149'h03f2abdae6d98ce45d3f36328d641815c8e24f;
    stim[15] = 149'h13815733bf24bdcef667a5548a5d2dd1a3ab2d;
    stim[16] = 149'h1d8ffa2a5fca4fab7b9b786f02c0066e99bc84;
    stim[17] = 149'h11a61665d23c80697e4ac95f506b4ab6e8d579;
    stim[18] = 149'h1f56e17b2ab6867c16b55ad88efe3311cd940d;
    stim[19] = 149'h1c56ebeae64db555e5e9aaf2ef8c7485f45f48;
    stim[20] = 149'h13aa78d99c68a28b6df3964afc973be1cf6fee;
    stim[21] = 149'h0a20b7f04acf0a40ce755e94b219824b1bf6a8;
    stim[22] = 149'h1af03edf8eb7d1c757d63963cec5d772dca2a2;
    stim[23] = 149'h000d63816018e5ce61c1a2f4a2db46d633c683;
    stim[24] = 149'h157a78aaefdc5854fb1e81c9485a148e3900ff;
    stim[25] = 149'h0a4efb8ce83cce1df72f67dc0d5302e4c5dd20;
    stim[26] = 149'h06b312f2a6fe7995c2e10a9d4db33ff042ab97;
    stim[27] = 149'h1e85afee5b087b0dd64e9635156f1f85963468;
    stim[28] = 149'h0ed9f53f3a3ddf9b38a703ad4942d4cc0e399b;
    stim[29] = 149'h0e8383cbc654b5b200861acc81efa7b6e23d39;
    stim[30] = 149'h1de42dee60f09758c700fc7db393f3d8e78308;
    stim[31] = 149'h117b2dfec884098b8e6f1ecaae4f92d66b38e0;
    stim[32] = 149'h15440c49c3ae9e761f2288c32ee0aa0b2314b1;
    stim[33] = 149'h12f66565f75a6e26196c5ba952cac616928600;
    stim[34] = 149'h10cfcc4a81c24f5f5a51a7d79fed1ae5c4cb9e;
    stim[35] = 149'h17e80f936dc5a1f7817d9905fd677305cd530b;
    stim[36] = 149'h0c2647cf92f65e1e14d81d5b775ccd0de91691;
    stim[37] = 149'h0623401f307d92179a02d9c9fc8860b233e667;
    stim[38] = 149'h12d3cb262ec93eef75db2ebee41ff2d6465f69;
    stim[39] = 149'h1d55097cc858d0661e4051d8bcb6c340576e03;
    stim[40] = 149'h013bcc8278496aa502b682fcabcb493ec35ade;
    stim[41] = 149'h0eb7a4c4d7d1ac4716f2ee49f37c7f186a4e13;
    stim[42] = 149'h1a37fc35622afe909620958bb4034e1a358ef6;
    stim[43] = 149'h1ac2251db1d02fdee6a59cff61561dc85ba486;
    stim[44] = 149'h1c8dc53f4bbc614b044be9935d11c04181a941;
    stim[45] = 149'h0e5e042ec704808157dd75cdf1d0389b082be2;
    stim[46] = 149'h0dff494300a9d7566ea423c982b6d364af24f3;
    stim[47] = 149'h15558612ba0e494349fa6831f3e2ad69481188;
    stim[48] = 149'h154f73ae4af5371e474f1348b025464e5310da;
    stim[49] = 149'h06ab86e03c54ffcf24e3a5388a8d94d4b83907;
    stim[50] = 149'h05d4a4f9f9e7b7a62b62fa091795b35d998a48;
    stim[51] = 149'h1dab12a1cd0e288d2812dd1360d0875ccc590f;
    stim[52] = 149'h0c4cff7474b9384af8e889278fb821531d7072;
    stim[53] = 149'h1feeab68e679e4efecbe40f286f3433a7aa836;
    stim[54] = 149'h0d321befe1c652ca5fd46b581f0b552a71dc69;
    stim[55] = 149'h092da59f5b480d58f0528214478462a4aa1df9;
    stim[56] = 149'h0b089f250eb28adcaabb0493362c964a75d535;
    stim[57] = 149'h125c2e1df5205317cde4916fe0bfb9bdecf1de;
    stim[58] = 149'h1c600166b103e464aad7786d23dfc3dc050bb6;
    stim[59] = 149'h143dd8c023114a2e8d63c5bf918551bdaf8bba;
    stim[60] = 149'h112faf9eba7c19c966cf70e20f78a1db519410;
    stim[61] = 149'h0cbf07dedc78a5468d60173a759571def60742;
    stim[62] = 149'h113891dbd94dd79493344523edd8e0d9519375;
    stim[63] = 149'h0e31cc5da45b01cccc2016d9e52da0e6b7e073;
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
      expv[0] = 70'h0d2f3f058e24811f96;
      expv[1] = 70'h292f3757d125e2492e;
      expv[2] = 70'h30010806312c35a5b0;
      expv[3] = 70'hxxxxxxxxx5bbba1bee;
      expv[4] = 70'hxxxxxxxxx44e76acfx;
      expv[5] = 70'hxxxxxxxxx535924514;
      expv[6] = 70'hxxxxxxxxx53aaba19x;
      expv[7] = 70'h1dd05003338da92fba;
      expv[8] = 70'hxxxxxxxxx1a1a1c5ex;
      expv[9] = 70'h286e0a746260c0a080;
      expv[10] = 70'h0eb4dbd7f9418be6de;
      expv[11] = 70'h0469cd4659cb287ce6;
      expv[12] = 70'h112bf08edcef0a15e2;
      expv[13] = 70'h24bbeefb5ab5964ac8;
      expv[14] = 70'h1ba70ee450158346f0;
      expv[15] = 70'h117a30f4e15e51ae54;
      expv[16] = 70'h36cb9034fb2cd18788;
      expv[17] = 70'hxxxxxxxxx9e19a9caa;
      expv[18] = 70'h280257473b13e6914a;
      expv[19] = 70'h00c814c61196e3bdf4;
      expv[20] = 70'h2d33542f55ccb5513e;
      expv[21] = 70'h38b3575847460617aa;
      expv[22] = 70'h005b5cfcc18f63782a;
      expv[23] = 70'h2dd536b6b6a87369e2;
      expv[24] = 70'hxxxxxxxxxf1e0dc7cx;
      expv[25] = 70'h3ed86bf3faa3c0a4d2;
      expv[26] = 70'hxxxxxxxxx3e6066a5x;
      expv[27] = 70'h0973c9b19b4a6b0886;
      expv[28] = 70'hxxxxxxxxx35d829a5c;
      expv[29] = 70'hxxxxxxxxxc56755b9e;
      expv[30] = 70'h33df35b663b00dabf0;
      expv[31] = 70'h2de650ac421c08d38e;
      expv[32] = 70'hxxxxxxxxxbdc2ed98a;
      expv[33] = 70'h218d939ebb78f7f0e0;
      expv[34] = 70'hxxxxxxxxxbd5641e3x;
      expv[35] = 70'h27d1c108beb62ac0e8;
      expv[36] = 70'hxxxxxxxxx1e6ab710a;
      expv[37] = 70'h252b7d48dd07e4a572;
      expv[38] = 70'h31dc2061258d42d86e;
      expv[39] = 70'h2c1340f7a83093a7b6;
      expv[40] = 70'hxxxxxxxxx90a168aex;
      expv[41] = 70'hxxxxxxxxx66d7a5da6;
      expv[42] = 70'hxxxxxxxxxb0c2cd5ex;
      expv[43] = 70'h0eaf43eba1bfdaf248;
      expv[44] = 70'h201095bc9c9c0d8194;
      expv[45] = 70'h36254e86bd2d3e6dbe;
      expv[46] = 70'hxxxxxxxxx9a55be412;
      expv[47] = 70'h2027c222f005deb558;
      expv[48] = 70'hxxxxxxxxx52b84028c;
      expv[49] = 70'h3f7469fa6880b7305c;
      expv[50] = 70'h1d097b3a77100526e4;
      expv[51] = 70'h31d8a2b45c64dedbac;
      expv[52] = 70'hxxxxxxxxx8dca522c6;
      expv[53] = 70'hxxxxxxxxx663cbc6cx;
      expv[54] = 70'h03e3cee4b10e8cc2ee;
      expv[55] = 70'hxxxxxxxxxb2094928e;
      expv[56] = 70'hxxxxxxxxxf3dd3352x;
      expv[57] = 70'hxxxxxxxxx42bd814dx;
      expv[58] = 70'hxxxxxxxxx847bad77x;
      expv[59] = 70'hxxxxxxxxx31f2cdf7a;
      expv[60] = 70'hxxxxxxxxx3a315e040;
      expv[61] = 70'h03aa3a080461cda9b4;
      expv[62] = 70'hxxxxxxxxx432d65a8x;
      expv[63] = 70'hxxxxxxxxx7a5662a70;
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
