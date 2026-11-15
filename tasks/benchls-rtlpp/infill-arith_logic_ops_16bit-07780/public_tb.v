// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 145;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07780 dut (
    .CLK(clk),
    .A(in_vec[33:18]),
    .AVALID(in_vec[17:17]),
    .B(in_vec[16:1]),
    .BVALID(in_vec[0:0]),
    .AND_OUT(out_vec[144:129]),
    .D(out_vec[128:113]),
    .OR_OUT(out_vec[112:97]),
    .P(out_vec[96:65]),
    .Q(out_vec[64:33]),
    .QVALID(out_vec[32:32]),
    .S(out_vec[31:16]),
    .XOR_OUT(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h29542ad29;
    stim[1] = 34'h0c31ce91e;
    stim[2] = 34'h28d708431;
    stim[3] = 34'h2f879e9ff;
    stim[4] = 34'h251ee9665;
    stim[5] = 34'h0aa4ae85c;
    stim[6] = 34'h0b24cb998;
    stim[7] = 34'h23d608f75;
    stim[8] = 34'h1a6d5231f;
    stim[9] = 34'h064e76af1;
    stim[10] = 34'h346796d8e;
    stim[11] = 34'h071dd843b;
    stim[12] = 34'h26120fc8b;
    stim[13] = 34'h120644f36;
    stim[14] = 34'h274342ad9;
    stim[15] = 34'h3cdebfb0b;
    stim[16] = 34'h033f25648;
    stim[17] = 34'h34143ebc1;
    stim[18] = 34'h0469ca216;
    stim[19] = 34'h1212f113c;
    stim[20] = 34'h34a92dc94;
    stim[21] = 34'h182f4ca58;
    stim[22] = 34'h333eb0faa;
    stim[23] = 34'h126a4b870;
    stim[24] = 34'h23aba1938;
    stim[25] = 34'h0859b30bb;
    stim[26] = 34'h11f1beab1;
    stim[27] = 34'h08fc7c0b2;
    stim[28] = 34'h0824a146b;
    stim[29] = 34'h025b89729;
    stim[30] = 34'h12790cc41;
    stim[31] = 34'h18a28571d;
    stim[32] = 34'h07507210b;
    stim[33] = 34'h3f96befaa;
    stim[34] = 34'h0898f2693;
    stim[35] = 34'h129b44a42;
    stim[36] = 34'h2946bdfd0;
    stim[37] = 34'h16290d719;
    stim[38] = 34'h04f30c8e0;
    stim[39] = 34'h2c6fa2201;
    stim[40] = 34'h1ce7d04f4;
    stim[41] = 34'h1e1bfab04;
    stim[42] = 34'h2c61de92a;
    stim[43] = 34'h13f0d2bad;
    stim[44] = 34'h097b47dc4;
    stim[45] = 34'h3c3c81abd;
    stim[46] = 34'h0b2f6490c;
    stim[47] = 34'h01787f36e;
    stim[48] = 34'h0b511f1f4;
    stim[49] = 34'h06a203e7e;
    stim[50] = 34'h3d2beee54;
    stim[51] = 34'h152c7d150;
    stim[52] = 34'h1fc4353db;
    stim[53] = 34'h0da1a2ac0;
    stim[54] = 34'h3fae2a4de;
    stim[55] = 34'h39dfe155c;
    stim[56] = 34'h206923d1e;
    stim[57] = 34'h1a301274d;
    stim[58] = 34'h01ed65908;
    stim[59] = 34'h250d328c3;
    stim[60] = 34'h1a658caf5;
    stim[61] = 34'h1cae80071;
    stim[62] = 34'h16e24debc;
    stim[63] = 34'h34f5f2db9;
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
      expv[0] = 145'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 145'h008209d79efa86fd0e48000000001fbe4f3c4;
      expv[2] = 145'h0610f7870e99e2c6ad65200000000a5564448;
      expv[3] = 145'h00430c289c6b8545a114000000000e574e144;
      expv[4] = 145'h1683d923ffdff6be3efc400000000b31d4ae1;
      expv[5] = 145'h000649293bef6573a120c00000001dfaddf49;
      expv[6] = 145'h040056cc8fd7c26a39c78000000009ec05ebc;
      expv[7] = 145'h019019f8ef9be2050b24800000000895f705f;
      expv[8] = 145'h00e308f3d9ff450531be000000000d712c8e2;
      expv[9] = 145'h0030bb04df37e7835223600000000fb44f83a;
      expv[10] = 145'h02270c7837af223c23f7000000001ceb1ac41;
      expv[11] = 145'h1210c35afefbf2b528ba40000000288656759;
      expv[12] = 145'h0002ab4b5bcfe2b2acef600000000de94de6a;
      expv[13] = 145'h030803407fc9a9638f6d000000000168de60d;
      expv[14] = 145'h0003240fcdf36164eec46000000006fb46f82;
      expv[15] = 145'h02a190f433ada1a48a4f800000000b2798861;
      expv[16] = 145'h1e201ebebffffe23c20c400000001f0ff0eff;
      expv[17] = 145'h01049c3b05ff804604ee000000000382027d8;
      expv[18] = 145'h1a081b4e1ebe19025ac0000000001c63025b0;
      expv[19] = 145'h022078138a35e0b2d325a0000000062b240ac;
      expv[20] = 145'h010157f5b91be4d28ec9400000000d0e9c0d5;
      expv[21] = 145'h08400c8b5fddcb57eb6d00000000040eebcee;
      expv[22] = 145'h0c059f722cb7a4c7662f800000000c5e90591;
      expv[23] = 145'h109a08a4b9ffed984c4040000000054cf4b2f;
      expv[24] = 145'h09051dae2bb723511b1f000000000a5e11591;
      expv[25] = 145'h0191904251d7c0e0e3410000000009b4a8232;
      expv[26] = 145'h00089121372fe27c1641c00000001b9c3b93b;
      expv[27] = 145'h08a80a4ddefbc89925420000000013d1eb29e;
      expv[28] = 145'h040a28731c7f23efebd9200000000044ac3a8;
      expv[29] = 145'h000202cba556e0298e474000000012ac72aa7;
      expv[30] = 145'h012097bb497fc05915b3000000000550242fa;
      expv[31] = 145'h08041c788dfc83af4290000000000b0042fc4;
      expv[32] = 145'h045146df8d71c2187ad18000000008e184904;
      expv[33] = 145'h0200319793b8a2107858a00000001adc68dc4;
      expv[34] = 145'h1eca00d0bffbfec78edc400000002f62f098f;
      expv[35] = 145'h004831e3566d627914e7600000001b5acb12a;
      expv[36] = 145'h000424a98deda1596b21a000000046f8e6f4c;
      expv[37] = 145'h14a116a65dff53571cb200000000095024af2;
      expv[38] = 145'h09109da30f7584a7a0b6000000000c4303328;
      expv[39] = 145'h000815eb8eff80f88b28000000000783c77bc;
      expv[40] = 145'h02201417d637c179b3c0000000001c2bea0be;
      expv[41] = 145'h00435e24be7fe75dbaf8c00000000f619f1e5;
      expv[42] = 145'h0a00545dbfbdec8e306bc000000004df1aded;
      expv[43] = 145'h1610b79e5eb2f5337ff2600000000a61c4512;
      expv[44] = 145'h00b8573dbbfae5d5e580400000000e599da15;
      expv[45] = 145'h049c1ce167fde12a1c2740000000064cf1b0f;
      expv[46] = 145'h000a5c729fbfc192985b800000000fe50fdac;
      expv[47] = 145'h04908106e597e0cc3fddc000000005143083b;
      expv[48] = 145'h003421855fbee0b7819ae00000000ff98fc56;
      expv[49] = 145'h050806895fbfc580c28d000000000263ed5be;
      expv[50] = 145'h03411f6923f7e0679fef00000000039c705b7;
      expv[51] = 145'h0e854fb0bef5ee3cafb6c000000006bd98385;
      expv[52] = 145'h08140d813f97299eff850000000003d59bc19;
      expv[53] = 145'h05201aa47fffaa8ae63a00000000128fdd6fd;
      expv[54] = 145'h02800424c6fcc091ae080000000044be623e6;
      expv[55] = 145'h0a4515893fdfea40ac390000000005127acd7;
      expv[56] = 145'h0045db9a3dffe13509ca400000000f22dedd1;
      expv[57] = 145'h00108c62b3f5e1ef3453800000000a0339f2b;
      expv[58] = 145'h00101aa35f7cc78d4590000000000fc66fb66;
      expv[59] = 145'h00909b6625f6a02ae2aa80000000034392b31;
      expv[60] = 145'h12841ffa728eaabcc6f680000000128950055;
      expv[61] = 145'h0c2240838dbfc53b4fef800000002cf100cec;
      expv[62] = 145'h00070e504e574003231600000000072f27282;
      expv[63] = 145'h09611d856ffbe4fa4069c00000000cae734d7;
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
