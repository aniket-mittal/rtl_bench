// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 219;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_119687 dut (
    .boardstate(in_vec[218:19]),
    .x(in_vec[18:9]),
    .y(in_vec[8:0]),
    .r(out_vec[23:16]),
    .g(out_vec[15:8]),
    .b(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 219'h46afa6059dcf5ee6a0558455af4fae47ce8f57d004f6632a4997e91;
    stim[1] = 219'h7c91f8d24de16086de3b06f08091baec4fd912a87c2281ffffa1810;
    stim[2] = 219'h6b742ca4a14bfba76fa36b360feb4fe320da357ccb587731cca19d4;
    stim[3] = 219'h4db08d4b7237654ffc4dc2d9c00d244ee4e95cc612f2900b2dd83a5;
    stim[4] = 219'h746a9b58dd94780ed9f109c1238a4abe053eeaea409d48f4d0a220f;
    stim[5] = 219'h212456eacfd9be1ad351143cd81ade110366d63089aec9af9cc8357;
    stim[6] = 219'h46465fae4c8faa8b05899014935f2584a20c973103a51b85c10ee69;
    stim[7] = 219'h6f4820c81ce811891863e0399b0dfef9a84bce98853ff169857cd65;
    stim[8] = 219'h7f308dac78073d70ba607ef9fff4d8032b9b8cfca1904afe7860582;
    stim[9] = 219'h04519997a1ea6d1d6366e4cf7d6f7d0d818bc55cb8da362d4f5b34e;
    stim[10] = 219'h0ca29dd74287adcced9e2b01eb19e3b5a8ee2f1dcf904035cd54fdb;
    stim[11] = 219'h07bef3b7776bc4888c3934971a297d9e0fd5f0ff66e5ae41118e9fd;
    stim[12] = 219'h50dc7ee2e373137980c3916986078e4040ab4d15cdddc1369d97052;
    stim[13] = 219'h584dda6c9df4a97224cb9cb6b3ec92a12395eabd7296a55deec6ca8;
    stim[14] = 219'h474a2f58f00a47ded2f623371bc40d75c84252121846df7c28a97bb;
    stim[15] = 219'h620dba0f36d05174ecbe4fb67930a01872c052526a69a9e745f6c9d;
    stim[16] = 219'h2b33776a151e745fd93e3b5a50b6de815e2f6cf8b7a761c769e2b18;
    stim[17] = 219'h53cd72a3ba2cf3e438ae1b613f97e22b8b9f1f4c2ae3f1bc9923cbc;
    stim[18] = 219'h6696cf812c75e3ff4fa47f7c36bcc7ec27f5b37a9dcba6591d04dd2;
    stim[19] = 219'h7b1da2df522b1d7ccff4c2a326620e7864e36ac09a0b4c5ade8dc19;
    stim[20] = 219'h013dba1a402303cccd452ff13d630f41a5a7a829c3db49c16fa4b22;
    stim[21] = 219'h13e49be1b303ebfa0a1f0efac7ffde4a94fb37203601d4ae066ded8;
    stim[22] = 219'h27a21f95d37e134558d0deaa714f7cc5ce645af25b6f24e2f126e53;
    stim[23] = 219'h71afda39b2e469e00c38431be886f9bde2800283fbd216d84c32bda;
    stim[24] = 219'h7d47219854fb055efcba6e19b05e25af1dc5d26142db242e20514ff;
    stim[25] = 219'h4fc7261acbb80fbf54e18956c3b8876375db6070c3a3e03d45b754e;
    stim[26] = 219'h35a625c53c181f090905854b3957e154228c1c65f73121e3b3eb3b9;
    stim[27] = 219'h75aecd762a84ececb5ff7265e548af8a9acc2463b6827bda30cc970;
    stim[28] = 219'h431b8a77a2dfe0895bba3325af28056fd16bc38929e17523e32ed66;
    stim[29] = 219'h2bc0a3b3f80d5bbb4cecf9f5c7101e6957206a0d9107ed5debcb1ff;
    stim[30] = 219'h6b86abf03cf802a78055081a528c259aa5e6340731664762d95550e;
    stim[31] = 219'h13d51638b416d187a0a74083e627ee80b730ca792d90fdf78cf6025;
    stim[32] = 219'h53ef7e6edcad78f57857b6b8f43f136a48a1b4d44bbbe1e2dc754ec;
    stim[33] = 219'h1735f728293c0ea3a64ba3a8864d815886132e563246ac9ec8e7743;
    stim[34] = 219'h7943ab939283dc0e283d6ab9f74aba573a940785a771cc1cce5a2a3;
    stim[35] = 219'h431c1d466aa9d1e17f9004531ce923f34cbac38df7014d0a4cee99a;
    stim[36] = 219'h4c4d3bcfa972d3adcfd340b0d36ee00fb005cfb0b4d84e72b0e19c8;
    stim[37] = 219'h32980e2cf8f51bd44b2f09b9a12cfb7a59b57eaeb9d1a1e620b556e;
    stim[38] = 219'h09e74356699d938a3e690cf2a804e9a662ec0cc4e9cabd91dc6b9ff;
    stim[39] = 219'h0f80c0dfa91cdf6013e18d93a00232f7e1523fdf2878d6683af0d3d;
    stim[40] = 219'h6e48c584bf6c940da44bd68187c4b120e0c4e2a60939767d43203af;
    stim[41] = 219'h74bc330130ab697d62f038f37edbce4000aa8564feaa9f0754156c1;
    stim[42] = 219'h79e35af9e68637073d916d66b4193550f15fd2442870f2c5bcd8e2f;
    stim[43] = 219'h62aef81f55a2343df3c73099852ff046f3a86d2c6f79c93abe6e294;
    stim[44] = 219'h0493b4615ace2079855a8fef21b4f42061c9cc43664d1a4b38af923;
    stim[45] = 219'h460ba9bc8b615e6f4af75f466eb1f640960b5e9112911ff22766629;
    stim[46] = 219'h080b75bb2373116b2d4b13a5c6e6f8deb19e0ca2690654a6de20125;
    stim[47] = 219'h379539a10c6bb97c38f56c5c3e5d9c1c06ea9d8948452990571209a;
    stim[48] = 219'h69bc5f229dae1df15e6778ff9ac46bb8b250bf587d00ae84ec5bcff;
    stim[49] = 219'h4a8a41c297ef3ef03fcd859b491c33afb2763a026c47bf4be86997a;
    stim[50] = 219'h0aaf00aace2d77b9c47cc3981fe7fe3ecd8298b5675a82db230b590;
    stim[51] = 219'h078d18e8aabf0239a9f0722bf2b1cf0827c247fe98481fd95aadab4;
    stim[52] = 219'h7134c3f809314e34f229ead213f06c0c0efb15231e449256d6b5347;
    stim[53] = 219'h1b2a13ef5303d5d63882dff83e06594cddf2fd51549ffc898551ebe;
    stim[54] = 219'h6ac865b18b4e888e3a6cb8d39750c0e575b7b6f0f0f987ccd1fb8b6;
    stim[55] = 219'h100becd0070f1cf0ef2b4d65dc4dc2c3ba0f0e0cfdc6a950a71edab;
    stim[56] = 219'h0fb99e35310f056dda614d31942841198285b7f24a414dc857a3c98;
    stim[57] = 219'h00e2f7649787081a824e280e0f98b7b9a6e8c08ff1a9697c99bb866;
    stim[58] = 219'h5d84ecf5a7616ea7efda05d3864f0b6cd1cfa5c4e7f7b23d05174d3;
    stim[59] = 219'h5714c30f3fd4bc6d28d03b579cdfa15b9fb6a7cd93c8d2700714156;
    stim[60] = 219'h098bb5a423dc2126a527dbfcef08f51d7a0aceffbf608df9c270ed0;
    stim[61] = 219'h7f05b8451fe64f60bd23cdbcf9d8492ad64b32d4b797695ebefc3ca;
    stim[62] = 219'h6d363971011f6c7c9b5a06a0cf6afd3533b8f979933c10ded684392;
    stim[63] = 219'h146107a72c701751db94af2ce6db293892e4f3c90d80dedbf02afad;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h000000;
      expv[4] = 24'h000000;
      expv[5] = 24'h000000;
      expv[6] = 24'h000000;
      expv[7] = 24'h000000;
      expv[8] = 24'h000000;
      expv[9] = 24'h000000;
      expv[10] = 24'h000000;
      expv[11] = 24'h000000;
      expv[12] = 24'hff0401;
      expv[13] = 24'h000000;
      expv[14] = 24'h000000;
      expv[15] = 24'h000000;
      expv[16] = 24'h000000;
      expv[17] = 24'h000000;
      expv[18] = 24'h000000;
      expv[19] = 24'h000000;
      expv[20] = 24'h000000;
      expv[21] = 24'h000000;
      expv[22] = 24'h000000;
      expv[23] = 24'h000000;
      expv[24] = 24'h000000;
      expv[25] = 24'h000000;
      expv[26] = 24'h000000;
      expv[27] = 24'h000000;
      expv[28] = 24'h000000;
      expv[29] = 24'h000000;
      expv[30] = 24'h000000;
      expv[31] = 24'h000000;
      expv[32] = 24'h000000;
      expv[33] = 24'h000000;
      expv[34] = 24'h000000;
      expv[35] = 24'h000000;
      expv[36] = 24'h000000;
      expv[37] = 24'h000000;
      expv[38] = 24'h000000;
      expv[39] = 24'h000000;
      expv[40] = 24'h000000;
      expv[41] = 24'h000000;
      expv[42] = 24'h000000;
      expv[43] = 24'h000000;
      expv[44] = 24'h000000;
      expv[45] = 24'h000000;
      expv[46] = 24'hff070c;
      expv[47] = 24'hff0205;
      expv[48] = 24'h000000;
      expv[49] = 24'h000000;
      expv[50] = 24'h000000;
      expv[51] = 24'h000000;
      expv[52] = 24'h000000;
      expv[53] = 24'h000000;
      expv[54] = 24'h000000;
      expv[55] = 24'h000000;
      expv[56] = 24'hff0905;
      expv[57] = 24'h000000;
      expv[58] = 24'hff0408;
      expv[59] = 24'h000000;
      expv[60] = 24'h000000;
      expv[61] = 24'h000000;
      expv[62] = 24'h000000;
      expv[63] = 24'h000000;
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
