// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 212;
  localparam OW = 122;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03038 dut (
    .br_taken(in_vec[211:211]),
    .src_reg_used(in_vec[210:209]),
    .is_eret(in_vec[208:208]),
    .id_en(in_vec[207:207]),
    .id_rd_addr(in_vec[206:202]),
    .id_gpr_we_(in_vec[201:201]),
    .id_mem_op(in_vec[200:195]),
    .op(in_vec[194:189]),
    .rs1_addr(in_vec[188:184]),
    .rs2_addr(in_vec[183:179]),
    .id_rs1_addr(in_vec[178:174]),
    .id_rs2_addr(in_vec[173:169]),
    .ex_en(in_vec[168:168]),
    .ex_rd_addr(in_vec[167:163]),
    .ex_gpr_we_(in_vec[162:162]),
    .ex_mem_op(in_vec[161:156]),
    .mem_pc(in_vec[155:124]),
    .mem_en(in_vec[123:123]),
    .mem_exp_code(in_vec[122:118]),
    .mepc_i(in_vec[117:86]),
    .ic_busy(in_vec[85:85]),
    .dc_busy(in_vec[84:84]),
    .issue_id(in_vec[83:80]),
    .if_hart_id(in_vec[79:76]),
    .id_hart_id(in_vec[75:72]),
    .ex_hart_id(in_vec[71:68]),
    .hart_ic_stall(in_vec[67:67]),
    .hart_dc_stall(in_vec[66:66]),
    .hart_ic_flush(in_vec[65:65]),
    .hart_dc_flush(in_vec[64:64]),
    .if_pc(in_vec[63:32]),
    .ex_pc(in_vec[31:0]),
    .mepc_o(out_vec[121:90]),
    .exp_code(out_vec[89:85]),
    .save_exp(out_vec[84:84]),
    .restore_exp(out_vec[83:83]),
    .if_stall(out_vec[82:82]),
    .id_stall(out_vec[81:81]),
    .ex_stall(out_vec[80:80]),
    .mem_stall(out_vec[79:79]),
    .if_flush(out_vec[78:78]),
    .id_flush(out_vec[77:77]),
    .ex_flush(out_vec[76:76]),
    .mem_flush(out_vec[75:75]),
    .new_pc(out_vec[74:43]),
    .rs1_fwd_ctrl(out_vec[42:41]),
    .rs2_fwd_ctrl(out_vec[40:39]),
    .ex_rs1_fwd_en(out_vec[38:38]),
    .ex_rs2_fwd_en(out_vec[37:37]),
    .cache_miss(out_vec[36:36]),
    .cm_hart_id(out_vec[35:32]),
    .cm_addr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 212'hf4aa940d23c08456981e7b47eee117027bf9a2e4931d82f9d0b4c;
    stim[1] = 212'h53cf99ed1bec6c908b976de33b369239e150ec5d6e3ac6fd57685;
    stim[2] = 212'h1899783da5b68df2f90a402ebd558eaf4d10d5269dacb32dbd3b3;
    stim[3] = 212'hc5ae204c0b54d096f767258b1e864ac3d71ef320e75e25d45f1dc;
    stim[4] = 212'hfd2b80d6fb32fd675aeb9d0742e9050c75d2b211c46a20c755ba5;
    stim[5] = 212'hb6530d66a907aa0cee21d33c23adf48bd4c356dcb0ea4837ffdbc;
    stim[6] = 212'h6af2aa9167e67bb035f013407067258985127b47a51c58f342970;
    stim[7] = 212'h601a95faeace08e01a1eeaaea3fbe61299a503790d789421d1585;
    stim[8] = 212'hb8a6baaaff29b7d557bb92f3aa669fb16ba347688d08fbd61bcbf;
    stim[9] = 212'h46db5efd744f501e0d55aa5096be54fd654669d4a8640d5922119;
    stim[10] = 212'he28203ac1bc79c1a699d812316b10fb7fbf04f22d01ef454e11f9;
    stim[11] = 212'hfbcd184da7915f39acbf0d7f70f5a26bd19e0e3bb25c1619ce9be;
    stim[12] = 212'hc6ea7df747e225ed3f8f2a92cb5d7ca0923013ce27aa588e76074;
    stim[13] = 212'hf8d9f233743932ae9d135fcc6a215734146f6038e5b300fb28294;
    stim[14] = 212'had1a166a531bcd2773e8fe582f9353c81689775484cc1c468b171;
    stim[15] = 212'h502579aa75f8c5b11df92c90370b604b6dd6c6284b8cb2df3c01b;
    stim[16] = 212'hc6c347f2708d9e3e21d6f58b9d12c3a7c55accfb15740152e2ae4;
    stim[17] = 212'hc8daaf7d13bd9afc6c35e585be3739edea6845a1b427d7f0ba0b8;
    stim[18] = 212'hf5633cefbb0537a4976cd769b7f88ca43bec3990a26b1d84161e0;
    stim[19] = 212'h68bdbf9e7a656032c16026c71d5911c342a9aa6f7964e9a1fbade;
    stim[20] = 212'hcee3d478e926de9b6c190054613a3aecff2dabe20eacb642913d9;
    stim[21] = 212'h564a510a9b2e740f003af8fc1062d927436abf5a79e437d59efdb;
    stim[22] = 212'hbfc037eb0d977f6219a3817926e80de821c01b1755b23596d3d25;
    stim[23] = 212'hbd47bb5e4988e1dfdc866439060665414168018f6612f3996fd27;
    stim[24] = 212'h2f0a4118dfc819d3485cbb71d0c33f7f0c6afcccb1fe0e5a1fdbe;
    stim[25] = 212'ha1c0dd473b2ec47753b01dc5c44884d1602b4b67c10e72a37d1ad;
    stim[26] = 212'h23971a7aa20f9d59144ec7d393bb7c32c633945806ff18f49fa74;
    stim[27] = 212'h990f580f9b6d3fe545bfbb6bec8cda47ae3453c2d31b027c93109;
    stim[28] = 212'h52303d1a530fd403aa50cefd487a84cf559be8e4bccb49a1b256e;
    stim[29] = 212'hce2a707312212a0a7abe180952d3728d4dcd1ecda1c9c5385d447;
    stim[30] = 212'hcf9d341f34af65767dae0a5e01f7ce96e75501f4c452a8202b8fb;
    stim[31] = 212'hf4f28d1d76fafdcb2e8a4c6b28cfeb02ace30d41932a9e7ae6511;
    stim[32] = 212'h1da299f8ff16f3da9b2c4b75685cf40db3d037c1cec2d94f122fb;
    stim[33] = 212'h135ae11049995c106a4430f0bfbdc822ffc5c916839a0fc62a898;
    stim[34] = 212'h9db3dd27cddc794ebe89de847f77e4404e300512d59727f18b897;
    stim[35] = 212'h30c6bda7f4e50eec7d11b49bb3ffa82ffa06f5569d947df06990f;
    stim[36] = 212'h89e2a92182534b4fe6d64c3ac72cc5219931b342fce602084ada1;
    stim[37] = 212'h5a4dc3cb017889582eddcf58c92ace334a33c75b4e23c8c5cfc3d;
    stim[38] = 212'h3e2fee97abd3900604c0803c91cf71a66a993a18ab07a27c806b5;
    stim[39] = 212'h2638cbf9d4909129d98b5919c9b5baa59e1d0c7874812c92c2105;
    stim[40] = 212'h70bee9fcb604dbceb49c72df4ffcd9d419fe28cd4733c63720aa1;
    stim[41] = 212'he0416f5b8094957d9638c2ec82737a5d1ac6c8a6b406462ce94ff;
    stim[42] = 212'h672dff131ca6da9c1f959da31698b29c4eb6342308ef69d01ab31;
    stim[43] = 212'h67fa22dadc7998139122239588439514aac84630d29718fdf0a86;
    stim[44] = 212'h06202c7a1fbdd2092bfce758d72ea73ceabc4f86e0a1fceb8e3e4;
    stim[45] = 212'h6b718f9c0c639d80d539bbaf00d033e0644bed58b76fcfe663851;
    stim[46] = 212'h9749b4cd888feeb8c6ab6bdb66ab63b58b68c675d8097ba9eeb8b;
    stim[47] = 212'h3eba4bdbd72105cc6341a2ae6b98094d00e6c6eaeb9bc59099e9c;
    stim[48] = 212'hbafa296e8016d62cd74f1b3688d37ada5982cd9386fd2af722689;
    stim[49] = 212'h3fc8020114766ba00b4808930e652d37cf9b0dece5225710a244e;
    stim[50] = 212'h58d2d496f5dd069e923aeefd7ce7dec951400be07d88264fe5d3f;
    stim[51] = 212'h73a595f094262806a496a2606f702e9d160149d5f6400173a7574;
    stim[52] = 212'h63ed8e2e0b25ce4a2ef2d841b311d75df145f67955c4bdbfdf362;
    stim[53] = 212'h5c36003c017488b89dd9487faeb398a2ca61715b81bbe6b1c715a;
    stim[54] = 212'h47b4729271930e9477a0eebe658712c9868e572fdcded7306f845;
    stim[55] = 212'h175f07105d2d2be6b869fc2d1c3c68bc76d23eee87887f8b1c69e;
    stim[56] = 212'h98fe3022f6c70cda2d76b111ecd6afe158b7a5b9443235202376e;
    stim[57] = 212'h2316c618c4c67967a80b15ce306c48bf64832c8c99bad51d771b0;
    stim[58] = 212'h35dd803c7c54021746ac51373295de6a5f68c5e466913ad32af82;
    stim[59] = 212'haa69f9a2f04e811f97b4e7b8c9cd16a80a4dfdbe67d2f9cc283c2;
    stim[60] = 212'hdf0e67c43a844601ab9dffb9f7193d62fce663ad4f799571d66fa;
    stim[61] = 212'ha929fd5c6b47315c32320f330ef8408eba7b9ca3bf2777fd1625a;
    stim[62] = 212'h158c278cbd06c41a2d3db66b74ad2f34f1b21306712287b6b4ed8;
    stim[63] = 212'hea04b6c629a9934bf574a34fa3c1f56122cde1efd084eb13cd05d;
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
      expv[0] = 122'h000000000078000000000172e4931d8;
      expv[1] = 122'h2422e5db717f8000000801ec5d6e3ac;
      expv[2] = 122'h0000000000788000000001032dbd3b3;
      expv[3] = 122'h25bdd9c9457f8000000801e5d45f1dc;
      expv[4] = 122'h000000000000800000000120c755ba5;
      expv[5] = 122'h00000000007880000000013837ffdbc;
      expv[6] = 122'h000000000078800000000128f342970;
      expv[7] = 122'h380687ba977f8000000800000000000;
      expv[8] = 122'h3555eee4b97f8000000800000000000;
      expv[9] = 122'h000000000078800000000169d4a8640;
      expv[10] = 122'h0000000000788000000000000000000;
      expv[11] = 122'h0000000000780000000000000000000;
      expv[12] = 122'h3b4fe3ca89078000000801088e76074;
      expv[13] = 122'h2ba744d7e77780000008011038e5b30;
      expv[14] = 122'h00000000007080000000019c468b171;
      expv[15] = 122'h2c477e4b097f800000080166284b8cb;
      expv[16] = 122'h0f8875bd457f8000000801ccfb15740;
      expv[17] = 122'h3f1b0d79437f8000000800000000000;
      expv[18] = 122'h0000000000008000000001cd84161e0;
      expv[19] = 122'h0cb05809a37f80000008014a6f7964e;
      expv[20] = 122'h0000000000000000000001fbe20eacb;
      expv[21] = 122'h03c00ebe3f7f8000000801a7d59efdb;
      expv[22] = 122'h00000000000080000000010596d3d25;
      expv[23] = 122'h0000000000780000000000000000000;
      expv[24] = 122'h0000000000788000000001ae5a1fdbe;
      expv[25] = 122'h1dd4ec07637f8000000800000000000;
      expv[26] = 122'h164513b1e97f800000080138f49fa74;
      expv[27] = 122'h0000000000788000000001427c93109;
      expv[28] = 122'h00ea9433bf7f800000080158e4bccb4;
      expv[29] = 122'h00000000007a8000000001d5385d447;
      expv[30] = 122'h0000000000780000000000000000000;
      expv[31] = 122'h0000000000780000000000000000000;
      expv[32] = 122'h0000000000788000000001094f122fb;
      expv[33] = 122'h041a910c397f8000000801f916839a0;
      expv[34] = 122'h13afa27783078000000800000000000;
      expv[35] = 122'h3b1f446d0d7f80000008016df06990f;
      expv[36] = 122'h000000000078800000000112084ada1;
      expv[37] = 122'h0000000000788000000001475b4e23c;
      expv[38] = 122'h0000000000798000000001927c806b5;
      expv[39] = 122'h0000000000780000000000000000000;
      expv[40] = 122'h33ad271caf07800000080118cd4733c;
      expv[41] = 122'h1f658e30b77f800000080118a6b4064;
      expv[42] = 122'h2707e5675107800000080169d01ab31;
      expv[43] = 122'h04e44888cb778000000800000000000;
      expv[44] = 122'h0000000000708000000000000000000;
      expv[45] = 122'h20354e6ed77780000008016d58b76fc;
      expv[46] = 122'h2e31aadaed7f80000008018675d8097;
      expv[47] = 122'h3318d068977f800000080106eaeb9bc;
      expv[48] = 122'h00000000007880000000015d9386fd2;
      expv[49] = 122'h2802d202097f8000000800000000000;
      expv[50] = 122'h27a48ebbbf7f8000000800000000000;
      expv[51] = 122'h0000000000788000000000000000000;
      expv[52] = 122'h00000000007880000000015dbfdf362;
      expv[53] = 122'h000000000078800000000116b1c715a;
      expv[54] = 122'h251de83b9f7f8000000801e7306f845;
      expv[55] = 122'h00000000000080000000012f8b1c69e;
      expv[56] = 122'h000000000078000000000155b944323;
      expv[57] = 122'h19ea02c5677f80000008016c8c99bad;
      expv[58] = 122'h000000000078800000000155e466913;
      expv[59] = 122'h07e5ed39dd778000000801d9cc283c2;
      expv[60] = 122'h006ae77fdd7f8000000801f3ad4f799;
      expv[61] = 122'h0000000000788000000001b7fd1625a;
      expv[62] = 122'h000000000000800000000127b6b4ed8;
      expv[63] = 122'h000000000078800000000121efd084e;
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
