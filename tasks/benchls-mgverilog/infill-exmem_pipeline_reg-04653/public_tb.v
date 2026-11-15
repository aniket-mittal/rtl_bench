// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 95;
  localparam OW = 95;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04653 dut (
    .clk(clk),
    .s7_idex(in_vec[94:94]),
    .dmem_wen_idex(in_vec[93:93]),
    .rf_wen_idex(in_vec[92:92]),
    .branch2_idex(in_vec[91:91]),
    .mem2reg_idex(in_vec[90:90]),
    .aluout(in_vec[89:74]),
    .flag(in_vec[73:71]),
    .extended_16_idex(in_vec[70:55]),
    .rdata2_idex(in_vec[54:39]),
    .rf_waddr(in_vec[38:35]),
    .branch_target_final_muxout(in_vec[34:19]),
    .nop_lw_idex(in_vec[18:18]),
    .nop_sw_idex(in_vec[17:17]),
    .pc_added_idex(in_vec[16:1]),
    .jal_idex(in_vec[0:0]),
    .dmem_wen_exmem(out_vec[94:94]),
    .rf_wen_exmem(out_vec[93:93]),
    .branch2_exmem(out_vec[92:92]),
    .mem2reg_exmem(out_vec[91:91]),
    .aluout_exmem(out_vec[90:75]),
    .flag_exmem(out_vec[74:72]),
    .rdata2_exmem(out_vec[71:56]),
    .rf_waddr_exmem(out_vec[55:52]),
    .extended_exmem(out_vec[51:36]),
    .s7_exmem(out_vec[35:35]),
    .branch_target_exmem(out_vec[34:19]),
    .nop_lw_exmem(out_vec[18:18]),
    .nop_sw_exmem(out_vec[17:17]),
    .pc_added_exmem(out_vec[16:1]),
    .jal_exmem(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 95'h2ce9200091b19008cb512a0b;
    stim[1] = 95'h1f40328fc82c2b53a3bb67e6;
    stim[2] = 95'h598bd66868d20da819ff29e6;
    stim[3] = 95'h0f25a9afcd13d383f2e5e269;
    stim[4] = 95'h68720993a69046bbc6577292;
    stim[5] = 95'h60adb989981d38d4345c9e50;
    stim[6] = 95'h0c16e47c7a374e85c969dff8;
    stim[7] = 95'h10e6147a16c3d747056b6a08;
    stim[8] = 95'h2602cd1d4e17b5f5e1731fea;
    stim[9] = 95'h0ee9363108a100d3392c5e53;
    stim[10] = 95'h0b2bdac442d382447e5c24a6;
    stim[11] = 95'h73915397d61e8dbff6e2f21b;
    stim[12] = 95'h4f9d6c2ebca0247b786b1c4e;
    stim[13] = 95'h46d04ede6e332e42bde15fd8;
    stim[14] = 95'h25f62935fe723ed9520e7d4c;
    stim[15] = 95'h6ff97edbeff06b2c263435a8;
    stim[16] = 95'h2a8802604440423d6245a98c;
    stim[17] = 95'h715f464cad250670d72d87e6;
    stim[18] = 95'h4381cfa484952ef947d693d4;
    stim[19] = 95'h320234b856ed2af45cbcb135;
    stim[20] = 95'h68fd6a26e6dab209d88f4693;
    stim[21] = 95'h07fe612db6f84e68beb7b500;
    stim[22] = 95'h6ee5d0dbc1c303b746f3d222;
    stim[23] = 95'h5ebda26a94ed90a128929def;
    stim[24] = 95'h159fe7fdbafb845fa8693465;
    stim[25] = 95'h5cbea2fc14769434d1c03bda;
    stim[26] = 95'h5007c9251cd4316f41a80f80;
    stim[27] = 95'h56e4699faffe017faea0b889;
    stim[28] = 95'h4af46ca76f2d9990a67be07d;
    stim[29] = 95'h6dc6cd448954669c1a3ff9e6;
    stim[30] = 95'h3377e3696a74409a9f60d35d;
    stim[31] = 95'h197f46db017dc1eb41a52960;
    stim[32] = 95'h73b96ad85a2f5435dbf2d67d;
    stim[33] = 95'h4609398240ef4ba8bafc492e;
    stim[34] = 95'h4b580899b19e5dc41187b780;
    stim[35] = 95'h11ed69737b471ff5d817c089;
    stim[36] = 95'h05895c436ea4566d4cb5735f;
    stim[37] = 95'h0e1f3457bc15e30239151320;
    stim[38] = 95'h15e29bba74b3b718b60dddda;
    stim[39] = 95'h72c6f6803cd3c9311548828e;
    stim[40] = 95'h6b8d84bb5b658e83d7584c09;
    stim[41] = 95'h723f3e8d781fb183e6d177fc;
    stim[42] = 95'h497d26778a78677f76e435d8;
    stim[43] = 95'h3626691a8b59c9953155b424;
    stim[44] = 95'h7718dba42475b3d2f7baae8a;
    stim[45] = 95'h51670c827f352f6e8f2c1771;
    stim[46] = 95'h4dff9d26a5ff071d5ca59395;
    stim[47] = 95'h7c0eaa53f1e12fd1b2e24b3b;
    stim[48] = 95'h1b171c0e372ecbc37d559caf;
    stim[49] = 95'h17b328dd6cc63ae1b272781f;
    stim[50] = 95'h7b6a790a3efec68cbc35e860;
    stim[51] = 95'h3f674b224ddd6aca07e2ca45;
    stim[52] = 95'h5f34765aedf1f802b2c6c2ce;
    stim[53] = 95'h568ffd40940efecaacbfe33d;
    stim[54] = 95'h7ff5f7fb5294fcd2d47b3cd1;
    stim[55] = 95'h1d15ad961c8c92ca14836399;
    stim[56] = 95'h50a20dee63b313d778b567f1;
    stim[57] = 95'h34c504a62784796c074a4732;
    stim[58] = 95'h34aa853699130f1845e24742;
    stim[59] = 95'h75667785920b872d05cb8cc5;
    stim[60] = 95'h26132c966256d7a08d049d74;
    stim[61] = 95'h4560a7c5cc069f0bf44fc432;
    stim[62] = 95'h67e0bd3e32030b107a236d81;
    stim[63] = 95'h07be1e36e28b27e3b8b5a51d;
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
      expv[0] = 95'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 95'h59d2406320101230cb512a0b;
      expv[2] = 95'h3e80655856a1f903a3bb67e6;
      expv[3] = 95'h3317aca41b5d0d1819ff29e6;
      expv[4] = 95'h1e4b5327a705f9a3f2e5e269;
      expv[5] = 95'h50e413208d7274dbc6577292;
      expv[6] = 95'h415b733a71a1330c345c9e50;
      expv[7] = 95'h182dc86e9d0f8f45c969dff8;
      expv[8] = 95'h21cc2887ae8f42d7056b6a08;
      expv[9] = 95'h4c059a2f6be3a9c5e1731fea;
      expv[10] = 95'h1dd26c4201a62113392c5e53;
      expv[11] = 95'h1657b5a7048888547e5c24a6;
      expv[12] = 95'h6722a73d1b72facff6e2f21b;
      expv[13] = 95'h1f3ad84048f5d79b786b1c4e;
      expv[14] = 95'h0da09d665c8bcdcabde15fd8;
      expv[15] = 95'h4bec52e47db6bfc1520e7d4c;
      expv[16] = 95'h5ff2fde0d65b7dfc263435a8;
      expv[17] = 95'h55100480847c08856245a98c;
      expv[18] = 95'h62be8c4a0ce995a8d72d87e6;
      expv[19] = 95'h07039f2a5df4909947d693d4;
      expv[20] = 95'h640469da55e70ad45cbcb135;
      expv[21] = 95'h51fad4b56414dcd9d88f4693;
      expv[22] = 95'h0ffcc2f09cd5b6d0beb7b500;
      expv[23] = 95'h5dcba186076b783f46f3d222;
      expv[24] = 95'h3d7b44db214d529928929def;
      expv[25] = 95'h2b3fcff708bfb757a8693465;
      expv[26] = 95'h397d45ed286f828cd1c03bda;
      expv[27] = 95'h200f92a862d4a39f41a80f80;
      expv[28] = 95'h2dc8d3fc02f3f5ffaea0b889;
      expv[29] = 95'h15e8d95b3324ede8a67be07d;
      expv[30] = 95'h5b8d9aa8cd38912c1a3ff9e6;
      expv[31] = 95'h66efc6e8813d2d429f60d35d;
      expv[32] = 95'h32fe8dfb83db602341a52960;
      expv[33] = 95'h6772d55ea86b0b4ddbf2d67d;
      expv[34] = 95'h0c1273de97504818bafc492e;
      expv[35] = 95'h16b0113cbb83363c1187b780;
      expv[36] = 95'h23dad28e3fee6f65d817c089;
      expv[37] = 95'h0b12b848acd86dd54cb5735f;
      expv[38] = 95'h1c3e682bc60af78239151320;
      expv[39] = 95'h2bc537676e374e90b60dddda;
      expv[40] = 95'h658deda7926007991548828e;
      expv[41] = 95'h571b09cb1d076b6bd7584c09;
      expv[42] = 95'h647e7d3f6301af0be6d177fc;
      expv[43] = 95'h12fa4cf0cefef14f76e435d8;
      expv[44] = 95'h6c4cd2b3932351653155b424;
      expv[45] = 95'h6e31b7eb67a4848af7baae8a;
      expv[46] = 95'h22ce196a5ed04fee8f2c1771;
      expv[47] = 95'h1bff3afe0e34d4bd5ca59395;
      expv[48] = 95'h781d54c25faa7e39b2e24b3b;
      expv[49] = 95'h362e385d9781c6e37d559caf;
      expv[50] = 95'h2f66518c75cbad91b272781f;
      expv[51] = 95'h76d4f2fd8d1147dcbc35e860;
      expv[52] = 95'h7ece96bad59449b207e2ca45;
      expv[53] = 95'h3e68ece3f00b5dbab2c6c2ce;
      expv[54] = 95'h2d1ffa1dfd98128aacbfe33d;
      expv[55] = 95'h7febef29f9af6a5ad47b3cd1;
      expv[56] = 95'h3a2b5b192592c39214836399;
      expv[57] = 95'h21441b6627adcc7f78b567f1;
      expv[58] = 95'h698a0908f2d4c4f4074a4732;
      expv[59] = 95'h69550a261e36d32045e24742;
      expv[60] = 95'h6accef170e50b24d05cb8cc5;
      expv[61] = 95'h4c2659adaf42cc408d049d74;
      expv[62] = 95'h0ac14f0d3e18b98bf44fc432;
      expv[63] = 95'h4fc17a061627c6487a236d81;
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
