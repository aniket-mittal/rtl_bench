// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 161;
  localparam OW = 153;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_094370 dut (
    .rvfi_valid(in_vec[160:160]),
    .rvfi_insn(in_vec[159:128]),
    .rvfi_pc_rdata(in_vec[127:96]),
    .rvfi_rs1_rdata(in_vec[95:64]),
    .rvfi_rs2_rdata(in_vec[63:32]),
    .rvfi_mem_rdata(in_vec[31:0]),
    .spec_valid(out_vec[152:152]),
    .spec_trap(out_vec[151:151]),
    .spec_rs1_addr(out_vec[150:146]),
    .spec_rs2_addr(out_vec[145:141]),
    .spec_rd_addr(out_vec[140:136]),
    .spec_rd_wdata(out_vec[135:104]),
    .spec_pc_wdata(out_vec[103:72]),
    .spec_mem_addr(out_vec[71:40]),
    .spec_mem_rmask(out_vec[39:36]),
    .spec_mem_wmask(out_vec[35:32]),
    .spec_mem_wdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 161'h089251e53e17309f76d8c60e80273c786db816c28;
    stim[1] = 161'h108ff895d9731166790d6d22abfbca3379b0ff6c3;
    stim[2] = 161'h1be113d1cc4b401afaca3cc3a8fafb5265cb86024;
    stim[3] = 161'h0e01362368734f287b23e831805538d75c308ec8b;
    stim[4] = 161'h086eab1d527cba9d6deb618b28df3e3ca9e139149;
    stim[5] = 161'h171f97f03415cb01af19a7b4ab9b509df5c2f78cf;
    stim[6] = 161'h1422c2a59a7df184276359a1a7dfe78c38f6c2e5b;
    stim[7] = 161'h0ce2a182017b7e2effd342288194264bff702605d;
    stim[8] = 161'h096dd9a479192afefe1827a42a12916dfb9b90a42;
    stim[9] = 161'h071f14d8cfbe46a62b786d394d225d23c67b146a8;
    stim[10] = 161'h02b6a195b88be9f38e43a02686cd106eb1bec1269;
    stim[11] = 161'h14110de9a24fbb32ccecc325f564c29f39a25103e;
    stim[12] = 161'h024f62cf0025072bce5676286b90ad0bd21658255;
    stim[13] = 161'h03a19fc716e32b1b1f3be543f9d602830bdb6ae65;
    stim[14] = 161'h09fc8956521bb6ad6b0ef32365142e57ce7a2e586;
    stim[15] = 161'h199b7e72c90c4dc35f34a066ed99da75277d5cfc1;
    stim[16] = 161'h07f96926e4b6afad5b0ccddc716beea6110ec9190;
    stim[17] = 161'h1f31112942d8087f5e5c15341e1b84137cc5b90cb;
    stim[18] = 161'h00d2a9289a45f1ae493e7bf261ba6e3604c509c66;
    stim[19] = 161'h01488c2a9711e7fa1b2a980a1d453b35ad9de2c04;
    stim[20] = 161'h0a0de7185d91e7c0167ef9a687748ee532cea7872;
    stim[21] = 161'h036df8cc847dc20df24ed7dcb8d830860afb2fc5d;
    stim[22] = 161'h0b4bed06ad2dfc474c8a88c0ea09c4b415626f58e;
    stim[23] = 161'h08d5b986a9b43af5e708f8f34f36cc77653140b14;
    stim[24] = 161'h183b4578c54850c729c30ec3d9a7918dcd7d41045;
    stim[25] = 161'h08f18ff86aa01584936422468611b5b16abac4eea;
    stim[26] = 161'h0a210bfd8f743134ff583363217ab907ce6c613a9;
    stim[27] = 161'h056bef2a23df902477a52fd80a91602f18bc259ea;
    stim[28] = 161'h1b119ed307ffda4caa9c7e4e2cd53c8418d7eced8;
    stim[29] = 161'h0d7edb26320dd216bc34413600f5bec1521093854;
    stim[30] = 161'h134c6377a8c3111b034c9dbdf33d1c14b990dd05c;
    stim[31] = 161'h090e6f16aa658f2b5050e16cf34b8e62195c2a33c;
    stim[32] = 161'h003abb680563794f57ac0d622337302e931052bc3;
    stim[33] = 161'h1b8a892413047fb0b78e9ef9bf7df090d0c877bdd;
    stim[34] = 161'h10f6641f119a0094cf82a6bc1a90b941af143f747;
    stim[35] = 161'h1ba49d7ef69f0392ec810199a6d73fa93fedf27c2;
    stim[36] = 161'h0cbfee0d67eddd9f2eafb2e15b87e77dfac8ac7cf;
    stim[37] = 161'h191a52aa387b1484f385ffabd4d344a0d340ae407;
    stim[38] = 161'h13e8253f7fb883cfd55286396ddbd1bc0fa2b0b57;
    stim[39] = 161'h1d259472d3434146daa0e8345b45474850841d2d3;
    stim[40] = 161'h0f974e10e2f77a799d5eb13f4eab77520a62ee99b;
    stim[41] = 161'h08f10a24e59d1978007cc2bae14fe896bd998948b;
    stim[42] = 161'h0da10f34d84aba35c3236113fcfbd598d6a0b39a3;
    stim[43] = 161'h086a1a02d690e7180b70c70faa76a6d8d7755b407;
    stim[44] = 161'h1df17fb581c9140305823c344f05037bcadc3ec28;
    stim[45] = 161'h06c96f92d81aa582d6a9d68804072ea11ef62ee2b;
    stim[46] = 161'h0b7404aca54846f021d3d32e1547950651b887f9a;
    stim[47] = 161'h1132e0ac9e65d87c868b4cbceb92cd2f3ce858c81;
    stim[48] = 161'h1aeba8e36663fe53dd975fa4e1dc0983e3c89daa5;
    stim[49] = 161'h03428f02ea218b71c4fd0b3823b3bada3c114e6ff;
    stim[50] = 161'h1c25c2b80c2806b01bc32c0cc424a9ed1e32e95a4;
    stim[51] = 161'h19c4772b1ad8cf4073c715c19f89ce6b4e59724b6;
    stim[52] = 161'h03cbce13b1715f2fcb40cd57976f7f5d04bc6db78;
    stim[53] = 161'h02742d41ed6bd712e12c87c063256d653e3e51b5c;
    stim[54] = 161'h181b87b96421f37240c939e293140de1b30213ffb;
    stim[55] = 161'h145638d0a95e02252ad1b9520033a24fbf3bb59cf;
    stim[56] = 161'h0c76936272850727ec4544fdefcbe681f9005d0bb;
    stim[57] = 161'h1abe9c461d6828dc8ce61256a00830cacd10b93f0;
    stim[58] = 161'h1e9bd7a78d5f44b316c33afbd9343d8c6939474ab;
    stim[59] = 161'h005e4a2e07c3ec2e55f90f1ecafc27317a5324ee0;
    stim[60] = 161'h081566cdcae7e6474ff907c29c282e90390fe08f6;
    stim[61] = 161'h0a6c972cf02f44878c9c2749ec8693eeb9c23204f;
    stim[62] = 161'h12ba0aa33bbfc44f5aad8b625b9571b28cef59118;
    stim[63] = 161'h1699b475c7e4b0402d90096ae652a8d5540b35c9d;
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
      expv[0] = 153'h0aa4000000000e172fa93000000000000000000;
      expv[1] = 153'h0fde000000000973116f9000000000000000000;
      expv[2] = 153'h0882000000000c4b3f5a9000000000000000000;
      expv[3] = 153'h09820000000008734e88b000000000000000000;
      expv[4] = 153'h055c00000000027cba238000000000000000000;
      expv[5] = 153'h04be000000000415cb738000000000000000000;
      expv[6] = 153'h0e04000000000a7df1c76000000000000000000;
      expv[7] = 153'h0d0400000000017b7d7df000000000000000000;
      expv[8] = 153'h0eda0000000009192a163000000000000000000;
      expv[9] = 153'h00be000000000fbe4797c000000000000000000;
      expv[10] = 153'h0d2c00000000088bea1ea000000000000000000;
      expv[11] = 153'h006200000000024fbbf48000000000000000000;
      expv[12] = 153'h031e00000000002507d14000000000000000000;
      expv[13] = 153'h0cc20000000006e32b569000000000000000000;
      expv[14] = 153'h047800000000021bb5cc0000000000000000000;
      expv[15] = 153'h0bf600000000090c4cdc3000000000000000000;
      expv[16] = 153'h0b720000000004b6b02b9000000000000000000;
      expv[17] = 153'h08a20000000002d808719000000000000000000;
      expv[18] = 153'h0564000000000a45f23a8000000000000000000;
      expv[19] = 153'h0c50000000000711e88e5000000000000000000;
      expv[20] = 153'h0f1a000000000d91e7603000000000000000000;
      expv[21] = 153'h0fda00000000047dc2c57000000000000000000;
      expv[22] = 153'h0756000000000d2dfb7b4000000000000000000;
      expv[23] = 153'h0dea0000000009b43a02e000000000000000000;
      expv[24] = 153'h0236000000000548504a0000000000000000000;
      expv[25] = 153'h0c62000000000aa015147000000000000000000;
      expv[26] = 153'h0842000000000f7430d8d000000000000000000;
      expv[27] = 153'h0f560000000003df90fab000000000000000000;
      expv[28] = 153'h04e20000000007ffd97e4000000000000000000;
      expv[29] = 153'h0efc00000000020dd16cf000000000000000000;
      expv[30] = 153'h0b180000000008c3114fe000000000000000000;
      expv[31] = 153'h0b5c000000000a658e3b7000000000000000000;
      expv[32] = 153'h0df400000000056379d21000000000000000000;
      expv[33] = 153'h0c540000000003047ee8f000000000000000000;
      expv[34] = 153'h0b2c00000000019a0122e000000000000000000;
      expv[35] = 153'h04c800000000069f034dc000000000000000000;
      expv[36] = 153'h0f7e0000000007eddd692000000000000000000;
      expv[37] = 153'h0ab400000000087b14163000000000000000000;
      expv[38] = 153'h0910000000000fb8848e3000000000000000000;
      expv[39] = 153'h0c8a0000000003434099b000000000000000000;
      expv[40] = 153'h0a6e0000000002f779f1b000000000000000000;
      expv[41] = 153'h006200000000059d18864000000000000000000;
      expv[42] = 153'h084200000000084ab9902000000000000000000;
      expv[43] = 153'h00d4000000000690e61e0000000000000000000;
      expv[44] = 153'h0be20000000001c913626000000000000000000;
      expv[45] = 153'h0b5200000000081aa5eff000000000000000000;
      expv[46] = 153'h082800000000054846a76000000000000000000;
      expv[47] = 153'h0724000000000e65d90fc000000000000000000;
      expv[48] = 153'h0d56000000000663fd839000000000000000000;
      expv[49] = 153'h0444000000000a218ba5c000000000000000000;
      expv[50] = 153'h0e0a000000000c2806737000000000000000000;
      expv[51] = 153'h0b88000000000ad8cedcb000000000000000000;
      expv[52] = 153'h0e560000000001715f6be000000000000000000;
      expv[53] = 153'h0968000000000d6bd7396000000000000000000;
      expv[54] = 153'h0c36000000000421f2f3a000000000000000000;
      expv[55] = 153'h01ec00000000095e026ac000000000000000000;
      expv[56] = 153'h0cac000000000285066ea000000000000000000;
      expv[57] = 153'h04fc000000000d6828070000000000000000000;
      expv[58] = 153'h0eb6000000000d5f441c5000000000000000000;
      expv[59] = 153'h0a7c0000000007c3ecb29000000000000000000;
      expv[60] = 153'h032a000000000ae7e5c8c000000000000000000;
      expv[61] = 153'h049800000000002f442dc000000000000000000;
      expv[62] = 153'h0874000000000bbfc47a9000000000000000000;
      expv[63] = 153'h05b20000000007e4b0a90000000000000000000;
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
