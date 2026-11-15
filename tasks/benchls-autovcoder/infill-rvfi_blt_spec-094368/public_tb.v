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

  autovcoder_094368 dut (
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
    stim[0] = 161'h1e880ce9c089609a2d60534c1e6461132090dfbf8;
    stim[1] = 161'h194730beb33825c49435b2b94a6eb93cdf0e1cb68;
    stim[2] = 161'h0569db71dd413963266061b290817a24b6dacef59;
    stim[3] = 161'h10061690e01eca457af3a5e76bcfdeaf9f876362c;
    stim[4] = 161'h148720fab85880c9c5ad05ac46475e386669f0f63;
    stim[5] = 161'h0f7ecf76a0afa913bfa673513960aae4958f8ef9e;
    stim[6] = 161'h10f65bec3c72182707f04188f06e74f64632fc8ab;
    stim[7] = 161'h0ab6779135d01e4c2628d510349802e98485e5080;
    stim[8] = 161'h0600a4d7536d7bb4654df28ae194fd756988bfb5c;
    stim[9] = 161'h17b711e1f65277b1760df77cc7ab7ca00c29f265f;
    stim[10] = 161'h1d3f8cc14387b9cb14404a8158c5253438ca9f825;
    stim[11] = 161'h13899d2e0ecf47a11782bfc3034f947428e6a5a92;
    stim[12] = 161'h19825f1af6abda929d70a6d1ab287828d16e223c7;
    stim[13] = 161'h17568877cc2acc1e519c650f4abdd1b486ba6a31c;
    stim[14] = 161'h09104ece43534ed2567a90fa81ebfeafe5eae793a;
    stim[15] = 161'h04d511e1b3faa3faee1186177ae6d3c7456faa00c;
    stim[16] = 161'h1f5c68074320a9a0bc1322d8b81b7b62414cd1e94;
    stim[17] = 161'h103de78039eb0a2c1aceccf2cdbfeb2d2b49fb73e;
    stim[18] = 161'h0b11231c6e5277f3cb84b10c2e82d512db5f433e0;
    stim[19] = 161'h172f617f956ce77b98b6b5ba06b2adcc8fd108079;
    stim[20] = 161'h12d5e04764403cd4ee1024a5e040b6e9ad7df7c4e;
    stim[21] = 161'h029c404cfc5b7ff9d2d7423186c47afe942e03091;
    stim[22] = 161'h17de979fc8468f6a361ca6a40cd85aa8a63c8ec22;
    stim[23] = 161'h105612ea14ab47196b1146d0f11e1b457228d6518;
    stim[24] = 161'h1bc1dbd9a930a807d50b7238f8084edd0ab25bac6;
    stim[25] = 161'h088a243e99530284a446404c92a18001746f10cdc;
    stim[26] = 161'h18c9e6dddb1f2c5bdf818b9ad37129d5ba32ea2a4;
    stim[27] = 161'h1b82e78b7a395035125c2c4c4ab1cfd74da2fe8be;
    stim[28] = 161'h0a734d479e30dfaced377d9ba924d5d465ebc2301;
    stim[29] = 161'h00ed305beff07b20858a919f3a2288c211984c6ac;
    stim[30] = 161'h175566c2ea12f9c7125d384b4281eb77045810e55;
    stim[31] = 161'h09860e62e4a09b9c0d24377ef2eb8145ad82f2e45;
    stim[32] = 161'h0d47bed5558acdcc03c122f95a8ff690db27f4148;
    stim[33] = 161'h110074e79597726d727133e21d2f0187ca520e3de;
    stim[34] = 161'h1af40e837f98a2e6896acdc6f113ea0855778efac;
    stim[35] = 161'h0b68962ff4fa1098de6cf3f8374c9531bb3e5e1f8;
    stim[36] = 161'h10714beeaff174059f2957a8aac51585b610a83ff;
    stim[37] = 161'h0bc39f4dde3ba82efd020ef857da8b6a207c8a05f;
    stim[38] = 161'h0ef2dedc0d549400f71b66182495ee6495613e393;
    stim[39] = 161'h000620ce18a696fe857dae0fbb8d7c86f0bb54962;
    stim[40] = 161'h190a0225ad0c593ea8b93de89a84c466c0bfe693f;
    stim[41] = 161'h004ad8cc2ad878c75352adee87574e990708a87ee;
    stim[42] = 161'h106833901533041f880042f375440aeee069b9b54;
    stim[43] = 161'h0aed445931c275eafea2bb3742dfd2c5b341942d2;
    stim[44] = 161'h14acea45c390e764ec453bb6e6ed99f71c6772062;
    stim[45] = 161'h0881222e0e7b28517faebcbc235a88d24dbf36819;
    stim[46] = 161'h08f47d395f7cda4fcd0dc2b1f1953ef9420720c52;
    stim[47] = 161'h02c9bf877a012b147999ab9dbc8c6d760a6190afa;
    stim[48] = 161'h0e83c527beb4779d4b7141ebf2b373b68e3102a4e;
    stim[49] = 161'h01f40a4db2ac356f1ef03c41774531e9b9ca034e4;
    stim[50] = 161'h158b76ba17bf092b3df1e106bc27490ab50b3e986;
    stim[51] = 161'h0d11e831e3735920c739ca6b4910d7d8e0f0f4343;
    stim[52] = 161'h19415fdf995aacf2f749de6f57e08de6aa5051e42;
    stim[53] = 161'h0f99e64651fa64e56c5a5ead4672ed3fdfd319d5f;
    stim[54] = 161'h0894bed578f53af892e2d6e63086d88006627de5e;
    stim[55] = 161'h060917ce7c106c3050d0161b0ce39d7686a02a4df;
    stim[56] = 161'h1513b1f4b50f9181c4a2351532741c3f0bf79c233;
    stim[57] = 161'h16d7bc5c0217bb06c6471ff68f42a1a09e9c1a774;
    stim[58] = 161'h04915a80919585eb8c8539484216967cb399ff34a;
    stim[59] = 161'h093c4005692d994ecff4abc5dc96b29c942cb0a53;
    stim[60] = 161'h006cf1096a7f234995395da1eb7b9033d3fa8bbc5;
    stim[61] = 161'h1ffd024f9ae53c790832ae0179fce9c226bc0e574;
    stim[62] = 161'h17cf0bc622f860a01fb6a7dff85f81c4f0633a448;
    stim[63] = 161'h1a6e0260e823479001212494b07048fd07227f394;
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
      expv[0] = 153'h08500000000000896083e000000000000000000;
      expv[1] = 153'h098e00000000033825c4d000000000000000000;
      expv[2] = 153'h0ed2000000000d4139636000000000000000000;
      expv[3] = 153'h088c00000000001eca469000000000000000000;
      expv[4] = 153'h090e0000000008588193a000000000000000000;
      expv[5] = 153'h0e7c0000000000afa913f000000000000000000;
      expv[6] = 153'h02ec000000000c7218274000000000000000000;
      expv[7] = 153'h0bac0000000005d01e4c6000000000000000000;
      expv[8] = 153'h0d0000000000036d7bb4a000000000000000000;
      expv[9] = 153'h08ae000000000652782d3000000000000000000;
      expv[10] = 153'h0c7e000000000387b9cb5000000000000000000;
      expv[11] = 153'h0cd2000000000ecf47a15000000000000000000;
      expv[12] = 153'h0ac40000000006abda92d000000000000000000;
      expv[13] = 153'h0c6c000000000c2acc1e9000000000000000000;
      expv[14] = 153'h0a600000000003534ed29000000000000000000;
      expv[15] = 153'h08aa0000000003faa3fb2000000000000000000;
      expv[16] = 153'h0b78000000000320a9a0f000000000000000000;
      expv[17] = 153'h0f3a0000000009eb0a2f1000000000000000000;
      expv[18] = 153'h0922000000000e5277a3e000000000000000000;
      expv[19] = 153'h0b1e00000000056ce86e7000000000000000000;
      expv[20] = 153'h0f2a0000000004403d016000000000000000000;
      expv[21] = 153'h0a38000000000c5b80a25000000000000000000;
      expv[22] = 153'h0cbc0000000008468f6a7000000000000000000;
      expv[23] = 153'h08ac0000000004ab479f2000000000000000000;
      expv[24] = 153'h0ec2000000000930a8081000000000000000000;
      expv[25] = 153'h09140000000009530284e000000000000000000;
      expv[26] = 153'h0f12000000000b1f2be97000000000000000000;
      expv[27] = 153'h0f04000000000a3950355000000000000000000;
      expv[28] = 153'h0a66000000000e30dfad2000000000000000000;
      expv[29] = 153'h019a000000000ff07b20c000000000000000000;
      expv[30] = 153'h0b2a000000000a12fa3c9000000000000000000;
      expv[31] = 153'h004c0000000004a09ab4c000000000000000000;
      expv[32] = 153'h05ce00000000058acdcc4000000000000000000;
      expv[33] = 153'h0b80000000000597726db000000000000000000;
      expv[34] = 153'h0068000000000f98a2158000000000000000000;
      expv[35] = 153'h0c900000000004fa104f1000000000000000000;
      expv[36] = 153'h0a62000000000ff17405d000000000000000000;
      expv[37] = 153'h0cc6000000000e3ba7eb7000000000000000000;
      expv[38] = 153'h0ee4000000000d5494013000000000000000000;
      expv[39] = 153'h010c0000000008a696fec000000000000000000;
      expv[40] = 153'h0814000000000d0c584ee000000000000000000;
      expv[41] = 153'h0ed4000000000ad8794cd000000000000000000;
      expv[42] = 153'h09900000000005330426a000000000000000000;
      expv[43] = 153'h0a1a0000000001c275999000000000000000000;
      expv[44] = 153'h0f58000000000390e7af6000000000000000000;
      expv[45] = 153'h0902000000000e7b27d9b000000000000000000;
      expv[46] = 153'h0be8000000000f7cd9de2000000000000000000;
      expv[47] = 153'h0dd2000000000a012b417000000000000000000;
      expv[48] = 153'h0606000000000eb477058000000000000000000;
      expv[49] = 153'h08680000000002ac360d9000000000000000000;
      expv[50] = 153'h0b960000000007bf092b7000000000000000000;
      expv[51] = 153'h076200000000037359210000000000000000000;
      expv[52] = 153'h0ac200000000095aac889000000000000000000;
      expv[53] = 153'h0f320000000001fa645de000000000000000000;
      expv[54] = 153'h0de80000000008f53af8d000000000000000000;
      expv[55] = 153'h0892000000000c106c309000000000000000000;
      expv[56] = 153'h05a600000000050f91820000000000000000000;
      expv[57] = 153'h05ee000000000217bb070000000000000000000;
      expv[58] = 153'h02e200000000019586348000000000000000000;
      expv[59] = 153'h023800000000092d994f0000000000000000000;
      expv[60] = 153'h0f98000000000a7f2349d000000000000000000;
      expv[61] = 153'h003a000000000ae53c778000000000000000000;
      expv[62] = 153'h085e0000000002f860a05000000000000000000;
      expv[63] = 153'h001c00000000082347904000000000000000000;
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
