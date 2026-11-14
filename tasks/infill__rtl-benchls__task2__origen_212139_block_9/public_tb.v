// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 146;
  localparam OW = 105;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_212139 dut (
    .clk(clk),
    .rst(in_vec[145:145]),
    .DX_PC(in_vec[144:113]),
    .DX_Branch(in_vec[112:112]),
    .DX_MemWrite(in_vec[111:111]),
    .DX_MemToReg(in_vec[110:110]),
    .DX_RegWrite(in_vec[109:109]),
    .lhWrite(in_vec[108:108]),
    .lhRead(in_vec[107:107]),
    .mflo(in_vec[106:106]),
    .ALUSrc(in_vec[105:105]),
    .ALUCtr(in_vec[104:101]),
    .DX_RD(in_vec[100:96]),
    .A(in_vec[95:64]),
    .B(in_vec[63:32]),
    .Imm(in_vec[31:0]),
    .BAddr(out_vec[104:73]),
    .XF_Branch(out_vec[72:72]),
    .XM_MemWrite(out_vec[71:71]),
    .XM_MemToReg(out_vec[70:70]),
    .XM_RegWrite(out_vec[69:69]),
    .XM_RD(out_vec[68:64]),
    .XM_B(out_vec[63:32]),
    .ALUout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 146'h2a68ac8fc6221cae7ba73934886eea855f5a1;
    stim[1] = 146'h3807be7ce68224500b7ad99c8386b2cf06700;
    stim[2] = 146'h010b8ea7c50dbfa92a225ea78fd71f4573515;
    stim[3] = 146'h14caa26b1d6db78d82945433825554ba2c027;
    stim[4] = 146'h073eb69f7883da848db415f55d0f6114a53a5;
    stim[5] = 146'h12ab1aa08e10c92f56b03573c339d494c1a5b;
    stim[6] = 146'h1afcea62fab18ead9607dfb9f845fb6d9afdb;
    stim[7] = 146'h074a6a90dab16c831a853a841308e244b526e;
    stim[8] = 146'h0c32d0c610a4598bef10c13d9acc83365f825;
    stim[9] = 146'h12a46bca48bde00213ac835354d8e8731adcc;
    stim[10] = 146'h1b678386fe0865c4985e53612086ee609d73b;
    stim[11] = 146'h181b5339aba3f1f201ac762691bee9bad8548;
    stim[12] = 146'h1108de8aff6828fc2d1395a48504be6005da5;
    stim[13] = 146'h1d745d843a12472f1184eb6cba05bd894ee3a;
    stim[14] = 146'h076761d2e8080b391c9faa6a54d9a3d39bf35;
    stim[15] = 146'h12868fb5f5b1aba033a6d433d343ccae786b5;
    stim[16] = 146'h18292b91c1f7e5a5e792fe60094b3d82fcf14;
    stim[17] = 146'h014d83e044c8996ceb7085dda9042ddf64807;
    stim[18] = 146'h156c4b79fe79853d24d886e5c3d0e5cad59ae;
    stim[19] = 146'h0bcfbaa48f705c2fc41f5596be9f84b98a4c7;
    stim[20] = 146'h0bdcaaad134c24c960cb45e4551c6596907a7;
    stim[21] = 146'h1815b732a0bef6d5806458d76b964b1584073;
    stim[22] = 146'h156ddec5d6d96f80a9aa90b60799d73a34166;
    stim[23] = 146'h1d965d93171a5bd25fefa6c74ea46f0c681bb;
    stim[24] = 146'h1462545d01c5203a4f83bc3ff9c1b2398924b;
    stim[25] = 146'h11cfcc7c2317025dcdff31529b03c9f892c97;
    stim[26] = 146'h1342851f3a1a0a8fb2a198917a0095908db92;
    stim[27] = 146'h02e5ba31f3c699132df92190e3e8cd2e92a92;
    stim[28] = 146'h10bac84db234c6d08cc83b1c8d8facc8c8f3d;
    stim[29] = 146'h193a16ed3065f1ab47afbf3c516a1546ec238;
    stim[30] = 146'h1b27fec428bae5b8f616b24feb7dbc60251b7;
    stim[31] = 146'h05b85aa7f785d5b781babe4bc11b2b4ff06f1;
    stim[32] = 146'h0a91f1fe320682ed4030d531a3923ff353e37;
    stim[33] = 146'h1d1d306507d7d4ddc7d7e5949d14329ad2e5a;
    stim[34] = 146'h1ba94839e5ff150fc2ab2f103147ed2d3e2b4;
    stim[35] = 146'h10c8019f3bfecde9d8bda5ec773edf2f5bf50;
    stim[36] = 146'h026805ce3befffccfba775bbcbee9ea6936c3;
    stim[37] = 146'h10ce4de86a5c1130bae3879d54c376b502388;
    stim[38] = 146'h177d99cc61f4c156bb184cd8e8cdc2a2c114f;
    stim[39] = 146'h126759ef8fbd332e728c22c7eb8752eb6136f;
    stim[40] = 146'h14f238e5905a321a0b27b8709fa17b2cf3195;
    stim[41] = 146'h14f795bee8ade38b8fe45989a4ed339b73b3a;
    stim[42] = 146'h0b8c23d570a7795df44124f214173961c40ae;
    stim[43] = 146'h19c89dd22a212d1a86b01283ee92a73421618;
    stim[44] = 146'h095677153108af924083bebd8a3804f465549;
    stim[45] = 146'h0223b98b9f9345451dc172d7ba2ee8c9ee652;
    stim[46] = 146'h07519428d96b94068d7f5483c26034e343854;
    stim[47] = 146'h1001fc27d91e7145605bd341d0fdc91e00ba8;
    stim[48] = 146'h052b1e1623f10d51ac41647f2d4416a81b783;
    stim[49] = 146'h01523e9ac4633b1520bea33827c5008787c90;
    stim[50] = 146'h0b9ef3c4a086f082eff72cf40b20a5ba3fdb0;
    stim[51] = 146'h019376abe18e9da7849befa42d5dfa76b45f3;
    stim[52] = 146'h1d75eda7762d73834d19e5b4e06516eeb1839;
    stim[53] = 146'h11fa5bb06a3b11a51f6d043adbf265949579a;
    stim[54] = 146'h113539f4754565bb50c255892a7232847cbc1;
    stim[55] = 146'h1d9d19c757ae0ebaf47f07c727bd6154ffd15;
    stim[56] = 146'h177ecef8cf4f6a92b721a366d88ee5052855d;
    stim[57] = 146'h14eb06834289900e57c91d0744d54bb8242cb;
    stim[58] = 146'h0d394d6984e83c584fe9d900c62c1e65db3af;
    stim[59] = 146'h008856d6ebeb8f7becba9e0e5b91edce869d5;
    stim[60] = 146'h0c2dd03a7591af61ff6dfb7cea2ef6a1ff261;
    stim[61] = 146'h124095bd08402acbea7b5e6bdb282740f91b6;
    stim[62] = 146'h02cb4046d8a1a8cee54f66078abd2ceb0618f;
    stim[63] = 146'h05bd519a730cd72473756ae3ba78c521dd9d5;
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
      expv[0] = 105'h1e93a760461934886eexxxxxxxx;
      expv[1] = 105'h0e7ff1fce6299c8386bxxxxxxxx;
      expv[2] = 105'h1b37293245bea78fd71x0xxxxxx;
      expv[3] = 105'h1a9c027e8db43382555xxxxx0xx;
      expv[4] = 105'h0fe3e071e9d5f55d0f6xxxxxxxx;
      expv[5] = 105'h175127ce0ec573c339d00000000;
      expv[6] = 105'h1669c2506b8fb9f845fxxxxxxxx;
      expv[7] = 105'h197013c7cb6a841308exxxxxxxx;
      expv[8] = 105'h05e5ccd880513d9acc8x3xxxxx5;
      expv[9] = 105'h163d42b049e35354d8exx3xxxxx;
      expv[10] = 105'h0e6c6f246e63612086e00000000;
      expv[11] = 105'h05f215ddabf62691beexxxxx5xx;
      expv[12] = 105'h04090d5d6e25a48504bxx00xxxx;
      expv[13] = 105'h09bed4a12a4b6cba05b00000000;
      expv[14] = 105'h0604416d680a6a54d9a00000000;
      expv[15] = 105'h17fa531065a433d343cxaxxxxxx;
      expv[16] = 105'h0441131bc1ee60094b3xxxxxxxx;
      expv[17] = 105'h1048a7e3c495dda9042xxxxxxxx;
      expv[18] = 105'h03c2f850ef86e5c3d0exxxxxxxx;
      expv[19] = 105'h119c0d080e5596be9f8xxxxxxxx;
      expv[20] = 105'h18912e808225e4551c6xxx0xxxx;
      expv[21] = 105'h10c1d76c20f8d76b964xxxxxxxx;
      expv[22] = 105'h0f3f7f78c760b60799dxxxx0xxx;
      expv[23] = 105'h15f99e708656c74ea4600000000;
      expv[24] = 105'h062e9d82812c3ff9c1bxxxxxxxx;
      expv[25] = 105'h019462c7a301529b03c00000000;
      expv[26] = 105'h1fc6f2e82a08917a00900000000;
      expv[27] = 105'h0c5a4f7ae29190e3e8cxxxxxxxx;
      expv[28] = 105'h17010fec22cb1c8d8faxxxxxxxx;
      expv[29] = 105'h0371780921ff3c516a1xxxxxxxx;
      expv[30] = 105'h1e29279fa8e24feb7dbxx0xxxxx;
      expv[31] = 105'h0037de2067de4bc11b2xxxxxxxx;
      expv[32] = 105'h0a2c9119a28531a392300000000;
      expv[33] = 105'h11f3c79207d5949d143xxxxxxxx;
      expv[34] = 105'h05133993e51f103147exxdxxxxx;
      expv[35] = 105'h0a42e1472ac5ec773edxxfxxxxx;
      expv[36] = 105'h179ca12fabf5bbcbee9xxxxxxxx;
      expv[37] = 105'h06765fac6a179d54c3700000000;
      expv[38] = 105'h0c93a273e0ccd8e8cdcxxxxxxxx;
      expv[39] = 105'h09c263a70f32c7eb875xxxxxxxx;
      expv[40] = 105'h0e59d1b00038709fa1700000000;
      expv[41] = 105'h11d3335be9e989a4ed3xxxxxxxx;
      expv[42] = 105'h169a442c6174f214173xxxxxxxx;
      expv[43] = 105'h1369a8de2b2283ee92axxxxxxxx;
      expv[44] = 105'h10f9a1b9a0aebd8a38000000000;
      expv[45] = 105'h08732cb48f42d7ba2eexxxxxxx0;
      expv[46] = 105'h0e6bb052c99483c2603xxxxxxxx;
      expv[47] = 105'h18f201fbc87341d0fdc00000000;
      expv[48] = 105'h1a6bf9d7a3047f2d441xxxxxxxx;
      expv[49] = 105'h058e7ce2c5333827c500xxxxxx0;
      expv[50] = 105'h1970f29ca0fcf40b20axxxxxxxx;
      expv[51] = 105'h154919a5609fa42d5dfxxxxxxx1;
      expv[52] = 105'h14eb79c3e775b4e0651xxxxxxxx;
      expv[53] = 105'h1e9f077d6b143adbf26xxxxxxxx;
      expv[54] = 105'h05591fd4e565892a723xxxxxxxx;
      expv[55] = 105'h08451851c607c727bd6xxxxxxxx;
      expv[56] = 105'h1fa811a74f6366d88ee00000000;
      expv[57] = 105'h12ac27e8c39d0744d54xxxxxxxx;
      expv[58] = 105'h00682741043900c62c1xxxxxxxx;
      expv[59] = 105'h0efc8bc16b8e0e5b91exxxxxxxx;
      expv[60] = 105'h013dc96ae5ab7cea2efx0xxxxxx;
      expv[61] = 105'h0c485e98082e6bdb282xxxxxxx0;
      expv[62] = 105'h0a23710e49a6078abd2xxxxxxxf;
      expv[63] = 105'h0ecc3e84e2dae3ba78cxx0xxxxx;
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
